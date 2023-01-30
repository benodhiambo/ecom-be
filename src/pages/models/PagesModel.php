<?php

declare(strict_types=1);

namespace Dreamax\Pages\Models;

use Dreamax\Core\Classes\Model;
use Dreamax\User\Models\UserModel;
use Dreamax\Stores\Models\StoreModel;
use Exception;

/**
 * Handles Authentication
 */
class PagesModel
{
    private $model;
    private $users_model;
    private $store_model;

    private $main_tbl = 'pages';
    private $meta_tbl = 'meta_fields';

    // for use in timestamp fields
    private $now;

    public function __construct(Model $model, UserModel $user_model, StoreModel $store_model)
    {
        $this->model = $model;
        $this->users_model = $user_model;
        $this->store_model = $store_model;
        $this->now = date("Y-m-d H:i:s", time());
    }

    public function getPages($store_id): array
    {
        try {

            $params = [
                'fields' => [
                    'store_id' => $store_id,
                ]
            ];
            $results = $this->model->getByParams($this->main_tbl, $params);

            return $results;
        } catch (Exception $e) {
            $err = '<h3>Unable to get Pages - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getPage($store_id, $page_id): array
    {
        try {

            $params = [
                'fields' => [
                    'store_id' => $store_id,
                    'page_id' => $page_id,
                    'deleted' => '0'
                ]
            ];
            $page = $this->model->getByParams($this->main_tbl, $params);

            if (!empty($page)) {
                $page[0]['meta'] = $this->getPageMetaFields($page_id);
            }

            return $page[0];
        } catch (Exception $e) {
            $err = '<h3>Unable to get Page - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    public function getPageMetaFields($page_id): array
    {
        try {

            $params = [
                'fields' => [
                    'page_id' => $page_id,
                ]
            ];

            return $this->model->getByParams($this->meta_tbl, $params);
        } catch (Exception $e) {
            $err = '<h3>Unable to get Page - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }



    public function addPage(int $store_id, array $data)
    {

        $page = $this->pagesDataToArray($data);

        $page['created_at'] = $this->model->now;
        $page['store_id'] = $store_id;

        try {

            unset($page['page_id']);

            $this->model->add($this->main_tbl, $page);

            $params = [
                'fields' => [
                    'store_id' => $store_id,
                    'created_at' => $page['created_at']
                ],
            ];

            $new_page = $this->model->getByParams($this->main_tbl, $params);

            foreach ($data['meta'] as $meta) {
                $this->addPageMetaFields($meta, $new_page[0]['page_id']);
            }

            return $this->getPage($store_id, $new_page[0]['page_id']);
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }


    public function addPageMetaFields(array $meta_fields, $page_id)
    {

        try {
            $page_meta = $this->pagesMetaDataToArray($meta_fields);


            $conditions = [
                'fields' => [
                    'type_name' => 'pages',
                ]
            ];

            $type_info = $this->model->getByParams('meta_field_types', $conditions);

            $page_meta['type'] = $type_info[0]['type_id'];
            $page_meta['page_id'] = $page_id;

            unset($page_meta['meta_id']);

            $this->model->add($this->meta_tbl, $page_meta);

            return true;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updatePage(int $store_id, int $page_id, array $data)
    {


        try {

            $conditions = [
                'fields' => [
                    'page_id' => $page_id,
                    'store_id' => $store_id,
                ]
            ];

            $page_data = $this->model->getByParams($this->main_tbl, $conditions);

            if (empty($page_data)) {

                throw new Exception('Page does not belong to store', 1);
            }


            $page = $this->pagesDataToArray($data);

            $conditions = [
                'page_id' => $page_id,
            ];

            unset($page['page_id']);

            $this->model->updateByParams($this->main_tbl, $page, $conditions);

            /**
             * update the page meta
             */
            $this->updatePageMeta($page_id, $data['meta']);

            return $this->getPage($store_id, $page_id);
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updatePageMeta(int $page_id, array $meta_fields)
    {

        try {

            $params = [
                'fields' => [
                    'page_id' => $page_id
                ]
            ];
            $current_meta_fields = $this->model->getByParams($this->meta_tbl, $params);

            $delete_ids = [];

            foreach ($current_meta_fields as $meta) {
                $delete_ids[] = $meta['meta_id'];
            }

            foreach ($meta_fields as $meta) {

                /**
                 * meta exists
                 */
                if (isset($meta['meta_id']) && $meta['meta_id'] !== '') {

                    /**
                     * If id is still available 
                     * remove it from the meta fields to delete
                     */
                    if (in_array($meta['meta_id'], $delete_ids)) {
                        if (($key = array_search($meta['meta_id'], $delete_ids)) !== false) {
                            unset($delete_ids[$key]);
                        }
                    }

                    /**
                     * Update the meta with the new info
                     */
                    $update_meta = $this->pagesMetaDataToArray($meta);

                    $condition = [
                        'meta_id' => $meta['meta_id']
                    ];

                    unset($update_meta['meta_id']);

                    $this->model->updateByParams($this->meta_tbl, $update_meta, $condition);
                } else {
                    /**
                     * new meta to add
                     */
                    $this->addPageMetaFields($meta, $page_id);
                }
            }            

            foreach ($delete_ids as $id) {
                $this->deletePageMeta((int)$id);
            }
            return true;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deletePage(int $store_id, int $page_id)
    {
        try {
            // get sore_user_id
            $params = [
                'fields' => [
                    'page_id' => $page_id,
                    'store_id' => $store_id,
                ],
                'order' => [
                    'page_id' => 'DESC'
                ],
                'limit' => 1
            ];
            $result = $this->model->getByParams($this->main_tbl, $params);

            if (!empty($result)) {
                $data = [
                    'deleted' => 1,
                ];
                $conditions = [
                    'page_id' => $page_id,
                ];
                $this->model->updateByParams($this->main_tbl, $data, $conditions);
                return true;
            } else {
                // false means the record does not exist
                return false;
            }
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deletePageMeta(int $meta_id)
    {
        try {
            $conditions = [
                'meta_id' => $meta_id
            ];
            $this->model->deleteByParams($this->meta_tbl, $conditions);

            return true;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }


    private function pagesDataToArray(array $base)
    {

        $structure = $this->pagesDataArray();

        foreach ($structure as $key => $value) {

            if (isset($base[$key])) {

                $structure[$key] = $base[$key];
            }
        }

        $structure['updated_at'] = $this->model->now;

        return $structure;
    }

    private function pagesMetaDataToArray(array $base)
    {

        $structure = $this->pagesMetaDataArray();

        foreach ($structure as $key => $value) {

            if (isset($base[$key])) {

                $structure[$key] = $base[$key];
            }
        }

        return $structure;
    }

    private function pagesDataArray()
    {

        return [
            'page_id' => '',
            'store_id' => '',
            'title' => '',
            'content' => '',
            'link' => '',
            'seo_description' => '',
            'seo_keywords' => '',
            'seo_title' => '',
            'seo_url' => '',
            'status' => '',
            'deleted' => '0',
        ];
    }

    private function pagesMetaDataArray()
    {

        return [
            'meta_id' => '',
            'type' => '',
            'meta_key' => '',
            'value' => '',
        ];
    }
}
