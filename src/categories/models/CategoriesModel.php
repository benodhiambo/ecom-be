<?php

declare(strict_types=1);

namespace Dreamax\Categories\Models;

use Dreamax\Core\Classes\Model;
use Dreamax\Stores\Models\StoreModel;
use Exception;

/**
 * Handles Authentication
 */
class CategoriesModel
{
    private $model;
    private $store_model;

    private $main_tbl = 'categories';
    private $meta_tbl = 'meta_fields';

    // for use in timestamp fields
    private $now;

    public function __construct(Model $model, StoreModel $store_model)
    {
        $this->model = $model;
        $this->store_model = $store_model;
        $this->now = date("Y-m-d H:i:s", time());
    }

    public function getCategories($user_id): array
    {
        try {
            $results = [];
            $stores_list = [];
            $stores = $this->store_model->getStores($user_id);
            foreach ($stores as $store) {
                $stores_list[] = $store['store_id'];
            }

            if (!empty($stores_list)) {

                $stores_list = implode(",", $stores_list);
                $sql = "SELECT * FROM $this->main_tbl WHERE store_id IN ($stores_list)";

                $results = $this->model->getBySql($sql, ['stores_list' => $stores_list]);
            }

            foreach ($results as $result) {

                if (isset($result['position'])) {
                    $result['position'] = (int)$result['position'];
                }

                $params = [
                    'fields' => [
                        'category_id' => $result['category_id']
                    ]
                ];



                $result['meta'] = $this->model->getByParams($this->meta_tbl, $params);
            }


            return $results;
        } catch (Exception $e) {
            $err = '<h3>Unable to Get Categories - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getCategory($category_id): array
    {
        try {

            $params = [
                'fields' => [
                    'category_id' => $category_id,
                ]
            ];

            $category = $this->model->getByParams($this->main_tbl, $params);

            if ($category[0]['parent_id'] == '0') {
                $category[0]['parent_id'] = null;
            }

            if (isset($category[0]['position'])) {
                $category[0]['position'] = (int)$category[0]['position'];
            }


            $params = [
                'fields' => [
                    'category_id' => $category_id
                ]
            ];

            $category[0]['meta'] = [];
            $category[0]['meta'] = $this->model->getByParams($this->meta_tbl, $params);

            $category[0]['sub_categories'] = [];
            $category[0]['sub_categories'] = $this->getSubCategories($category_id);

            return $category;
        } catch (Exception $e) {
            $err = '<h3>Unable to get category - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    public function getSubCategories($category_id)
    {
        try {

            $params = [
                'fields' => [
                    'parent_id' => $category_id
                ]
            ];
            $sub_categories = $this->model->getByParams($this->main_tbl, $params);

            $sc = [];

            if (!empty($sub_categories)) {

                foreach ($sub_categories as $l1_cat) {

                    if (isset($l1_cat['position'])) {
                        $l1_cat['position'] = (int)$l1_cat['position'];
                    }


                    $l1_cat['meta'] = [];
                    $params = [
                        'fields' => [
                            'category_id' => $l1_cat['category_id']
                        ]
                    ];
                    $l1_cat['meta'] = $this->model->getByParams($this->meta_tbl, $params);

                    $l1_cat['sub_categories'] = [];

                    $l1_cat['sub_categories'] = $this->getL2SubCategories($l1_cat['category_id']);

                    $sc[] = $l1_cat;
                }
            }

            return $sc;

        } catch (Exception $e) {
            $err = '<h3>Unable to get sub category - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    public function getL2SubCategories($category_id)
    {
        try {

            $params = [
                'fields' => [
                    'parent_id' => $category_id
                ]
            ];
            $sub_categories = $this->model->getByParams($this->main_tbl, $params);

            $sc = [];

            if (!empty($sub_categories)) {
                foreach ($sub_categories as $l2_cat) {

                    if (isset($l2_cat['position'])) {
                        $l2_cat['position'] = (int)$l2_cat['position'];
                    }


                    $l2_cat['meta'] = [];
                    $params = [
                        'fields' => [
                            'category_id' => $l2_cat['category_id']
                        ]
                    ];
                    $l2_cat['meta'] = $this->model->getByParams($this->meta_tbl, $params);

                    $l2_cat['sub_categories'] = [];

                    $l2_cat['sub_categories'] = $this->getL3SubCategories($l2_cat['category_id']);

                    $sc[] = $l2_cat;
                }
            }

            return $sc;
        } catch (Exception $e) {
            $err = '<h3>Unable to get sub category - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getL3SubCategories($category_id)
    {

        try {

            $params = [
                'fields' => [
                    'parent_id' => $category_id
                ]
            ];
            $sub_categories = $this->model->getByParams($this->main_tbl, $params);

            $sc = [];

            if (!empty($sub_categories)) {
                foreach ($sub_categories as $l3_cat) {

                    if (isset($l3_cat['position'])) {
                        $l3_cat['position'] = (int)$l3_cat['position'];
                    }


                    $l3_cat['meta'] = [];
                    $params = [
                        'fields' => [
                            'category_id' => $l3_cat['category_id']
                        ]
                    ];
                    $l3_cat['meta'] = $this->model->getByParams($this->meta_tbl, $params);

                    $sc[] = $l3_cat;
                }
            }


            return $sc;
        } catch (Exception $e) {
            $err = '<h3>Unable to get sub category - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    public function getCategoryByName($category_name): array
    {
        try {

            $cat = [];

            $params = [
                'fields' => [
                    "name" => $category_name
                ]
            ];
            $category = $this->model->getByParams($this->main_tbl, $params);

            if (!empty($category)) {

                $params = [
                    'fields' => [
                        "category_id" => $category[0]['category_id']
                    ]
                ];

                $category[0]['meta'] = $this->model->getByParams($this->meta_tbl, $params);

                $category[0]['sub_categories'] = $this->getSubCategories($category[0]['category_id']);

                $cat = $category[0];
            }

            return $cat;
        } catch (Exception $e) {
            $err = '<h3>Unable to get category by name - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    public function getCategoryMetas($category_id): array
    {
        try {

            $params = [
                'fields' => [
                    'category_id' => $category_id
                ]
            ];
            return $this->model->getByParams($this->meta_tbl, $params);
        } catch (Exception $e) {
            $err = '<h3>Unable to Add Page - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    public function getCategoriesByStoreId($store_id): array
    {
        try {

            $categories = [];

            $params = [
                'fields' => [
                    'store_id' => $store_id
                ]
            ];
            $results = $this->model->getByParams($this->main_tbl, $params);

            foreach ($results as $result) {

                if (isset($result['position'])) {
                    $result['position'] = (int)$result['position'];
                }

                if ($result['parent_id'] == '0') {

                    $result['parent_id'] = null;
                }

                $params = [
                    'fields' => [
                        'category_id' => $result['category_id']
                    ]
                ];


                $result['meta'] = $this->model->getByParams($this->meta_tbl, $params);

                $categories[] = $result;
            }

            return $categories;
        } catch (Exception $e) {
            $err = '<h3>Unable to Get Category- Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function addCategory(int $store_id, array $data)
    {

        try {
            $cat_data = $data;

            unset($data['meta']);

            /**
             * Deal with main category information
             */
            $category = $this->categoriesDataToArray($data);


            $category['store_id'] = $store_id;

            unset($category['category_id']);

            if ($category['parent_id'] == '') {
                unset($category['parent_id']);
            }

            $category['user_id'] = $GLOBALS['sess']['user_id'];

            $this->model->add($this->main_tbl, $category);

            $params = [
                'fields' => [
                    'user_id' => $category['user_id'],
                    'store_id' => $category['store_id'],
                    'created_at' => $category['created_at'],
                    'updated_at' => $category['updated_at'],
                ],
            ];
            $new_cat = $this->model->getByParams($this->main_tbl, $params);

            /**
             * Deal with Category meta data
             */

            if (!empty($new_cat)) {

                $this->addCategoryMeta((int)$new_cat[0]['category_id'], $cat_data['meta']);

                $params = [
                    'fields' => [
                        'store_id' => $store_id
                    ],
                    'order' => [
                        'category_id' => "DESC"
                    ],
                    'limit' => 1
                ];

                return $this->getCategory($new_cat[0]['category_id']);
            }
        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    /**
     * add categories and its sub categories
     */
    public function addCategoryR(int $store_id, array $data)
    {

        try {
            /**
             * Deal with main category information
             */
            $category = $this->categoriesDataToArray($data);

            $category['store_id'] = $store_id;

            unset($category['category_id']);

            if ($category['parent_id'] == '') {
                unset($category['parent_id']);
            }

            $category['user_id'] = $GLOBALS['sess']['user_id'];

            $this->model->add($this->main_tbl, $category);

            $params = [
                'fields' => [
                    'user_id' => $category['user_id'],
                    'store_id' => $category['store_id'],
                    'created_at' => $category['created_at'],
                    'updated_at' => $category['updated_at'],
                ],
            ];

            if (isset($category['parent_id']) && $category['parent_id'] !== '0') {
                $params['fields']['parent_id'] = $category['parent_id'];
            }


            $new_cat = $this->model->getByParams($this->main_tbl, $params);

            /**
             * Deal with Category meta data
             */

            if (!empty($new_cat) && !empty($data['meta'])) {

                $this->addCategoryMeta((int)$new_cat[0]['category_id'], $data['meta']);

                $params = [
                    'fields' => [
                        'store_id' => $store_id
                    ],
                    'order' => [
                        'category_id' => "DESC"
                    ],
                    'limit' => 1
                ];
            }

            /**
             * Deal with subcategories recursively
             */
            if (!empty($new_cat) && !empty($data['sub_categories'])) {

                foreach ($data['sub_categories'] as $sub_cat) {

                    $sub_cat['parent_id'] = $new_cat[0]['category_id'];

                    $saved_category = $this->addCategoryR((int)$store_id, $sub_cat);
                }
            }

            return $this->getCategoryR($new_cat[0]['category_id']);
        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function addCategoryMeta(int $category_id, array $meta_data)
    {

        try {

            foreach ($meta_data as $m_data) {
                $meta = $this->metaDataToArray($m_data);

                $meta['category_id'] = $category_id;

                unset($meta['meta_id']);

                $this->model->add($this->meta_tbl, $meta);
            }
            return true;
        } catch (Exception $e) {

            print_r(['the meta' => $meta_data]);
            die;
            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateCategory($category_id, $store_id, array $data)
    {
        try {

            $cat_data = $data;

            if (isset($data['meta'])) {

                unset($data['meta']);
            }

            $category = $this->categoriesDataToArray($data);

            $conditions = [
                'category_id' => $category_id,
                'store_id' => $store_id
            ];

            $category['category_id'] = $category_id;
            $category['store_id'] = $store_id;
            $category['user_id'] = $GLOBALS['sess']['user_id'];

            if (empty($category['parent_id']) || $category['parent_id'] == '') {
                unset($category['parent_id']);
            }

            $this->model->updateByParams($this->main_tbl, $category, $conditions);

            /**
             * Deal with categories meta
             */
            if (isset($data['meta'])) {
                $meta_update = $cat_data['meta'];

                $this->updateCategoryMeta($category_id, $meta_update);
            }

            return $this->getCategory($category_id);
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updateCategoryMeta($category_id, array $new_metas)
    {
        try {
            $current_ids  = [];

            $current_metas = $this->getCategoryMetas($category_id);

            foreach ($current_metas as $meta) {
                $current_ids[] = $meta['meta_id'];
            }

            foreach ($new_metas as $n_meta) {

                if (isset($n_meta['meta_id'])) {

                    if (in_array($n_meta['meta_id'], $current_ids)) {
                        if (($key = array_search($n_meta['meta_id'], $current_ids)) !== false) {
                            unset($current_ids[$key]);
                        }
                    }

                    $meta_info = $this->metaDataToArray($n_meta);
                    $conditions = [
                        'meta_id' => $n_meta['meta_id']
                    ];

                    $this->model->updateByParams($this->meta_tbl, $meta_info, $conditions);
                } else {
                    $this->addCategoryMeta((int)$category_id, [$n_meta]);
                }
            }

            foreach ($current_ids as $id) {
                $this->model->delete($this->meta_tbl, 'meta_id', $id);
            }

            return true;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deleteCategory(int $category_id)
    {
        try {

            $this->deleteCategoryMetas((int)$category_id);

            $data = [
                'deleted' => 1
            ];
            $conditions = [
                'category_id' => $category_id,
            ];
            $this->model->updateByParams($this->main_tbl, $data, $conditions);

            return true;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deleteCategoryMetas(int $category_id)
    {
        try {
            $cat_metas = $this->getCategoryMetas($category_id);

            foreach ($cat_metas as $meta) {
                $this->model->delete($this->meta_tbl, 'meta_id', $meta['meta_id']);
            }

            return true;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    private function dataToArray($data)
    {
        return [
            'parent_id' => !$data['parent_id'] == '' ? $data['parent_id'] : 0,
            'store_id' => $data['store_id'],
            'user_id' => $data['user_id'],
            'name' => $data['name'],
            'description' => isset($data['description']) ? $data['description'] : null,
            'position' => isset($data['position']) ? $data['position'] : null,
            'status' => isset($data['status']) ? $data['status'] : 1,
            'deleted' => isset($data['deleted']) ? $data['deleted'] : 0,
            'created_at' => $this->now,
            'updated_at' => $this->now,
        ];
    }


    public function categoriesDataToArray(array $base)
    {

        $structure = $this->categoriesDataArray();

        foreach ($structure as $key => $value) {

            if (isset($base[$key])) {

                $structure[$key] = $base[$key];
            }
        }

        $structure['updated_at'] = $this->model->now;

        return $structure;
    }

    public function metaDataToArray(array $base)
    {

        $structure = $this->metaDataArray();

        foreach ($structure as $key => $value) {
            if (isset($base[$key])) {

                $structure[$key] = $base[$key];
            }
        }

        return $structure;
    }

    public function categoriesDataArray()
    {

        return [
            'category_id' => '',
            'parent_id' => null,
            'store_id' => '',
            'user_id' => '',
            'name' => '',
            'description' => '',
            'seo_title' => '',
            'seo_description' => '',
            'seo_keywords' => '',
            'seo_url' => '',
            'position' => '',
            'status' => '',
            'created_at' => $this->now,
            'updated_at' => $this->now,
        ];
    }

    public function metaDataArray()
    {
        return [
            'meta_id' => '',
            'category_id' => '',
            'type' => '1',
            'meta_key' => '',
            'value' => '',
        ];
    }
}
