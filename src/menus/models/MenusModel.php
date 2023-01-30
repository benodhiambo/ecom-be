<?php

declare(strict_types=1);

namespace Dreamax\Menus\Models;

use Dreamax\Core\Classes\Model;
use Dreamax\Stores\Models\StoreModel;
use Exception;

/**
 * Handles Authentication
 */
class MenusModel
{
    private $model;
    private $store_model;

    private $main_tbl = 'menus';

    // for use in timestamp fields
    private $now;

    private $stores_list;

    public function __construct(Model $model, StoreModel $store_model)
    {
        $this->model = $model;
        $this->store_model = $store_model;
        $this->now = date("Y-m-d H:i:s", time());

        $stores_list = [];
        $stores = $this->store_model->getStores((int)$GLOBALS['sess']['user_id']);
        foreach ($stores as $store) {
            $stores_list[] = $store['store_id'];
        }

        $this->stores_list = $stores_list;
    }

    public function getMenus($user_id): array
    {
        try {

            if (!empty($this->stores_list)) {

                $stores_list = implode(",", $this->stores_list);

                $sql = "SELECT * FROM $this->main_tbl WHERE deleted = '0' AND store_id IN (:stores_list)";

                $results = $this->model->getBySql($sql, ['stores_list' => $stores_list]);
            } else {

                $results = [];
            }

            return $results;
        } catch (Exception $e) {
            $err = '<h3>Unable to Menus - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getMenusByStoreId($store_id): array
    {
        try {

            $params = [
                'fields' => [
                    'store_id' => $store_id,
                    'deleted' => '0'
                ]
            ];

            $results = $this->model->getByParams($this->main_tbl, $params);

            $menus = [];

            foreach ($results as $result) {

                if ($result['parent_id'] == '0') {
                    $result['parent_id'] = null;
                }
    
                if (isset($result['position'])) {
                    $result['position'] = (int)$result['position'];
                }

                $menus[] = $result;
            }

            return $menus;
        } catch (Exception $e) {
            $err = '<h3>Unable to Add Page - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getMenuById($menu_id): array
    {
        try {

            $params = [
                'fields' => [
                    'menu_id' => $menu_id
                ]
            ];

            $menu = $this->model->getByParams($this->main_tbl, $params);

            if ($menu[0]['parent_id'] == '0') {
                $menu[0]['parent_id'] = null;
            }

            if ($menu[0]['type'] == '0') {
                $menu[0]['type'] = null;
            } else {
                $menu[0]['type'] = (int)$menu[0]['type'];
            }

            if (isset($menu[0]['position'])) {
                $menu[0]['position'] = (int)$menu[0]['position'];
            }

            $menu[0]['sub_menus'] = [];

            $child_ids = $this->getChildIds($menu_id);

            if (!empty($child_ids)) {

                foreach ($child_ids as $id) {
                    $menu[0]['sub_menus'] = $this->getMenuById($id);
                }
            }

            return $menu;
        } catch (Exception $e) {
            $err = '<h3>Unable to Get Menu By Id - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function addMenu(int $store_id, array $data)
    {

        try {

            /**
             * parent level
             */
            $level_one = $this->menuDataToArray($data);

            $this->saveMenu((int)$store_id, $level_one);

            if (!empty($data['sub_menus'])) {

                /**
                 * Child level
                 */
                foreach ($data['sub_menus'] as $menu_child) {

                    $level_two = $this->menuDataToArray($menu_child);

                    $this->saveMenu((int)$store_id, $level_two);

                    if (!empty($menu_child['sub_menus'])) {

                        /**
                         * Grand child level
                         */
                        foreach ($menu_child['sub_menus'] as $menu_g_child) {

                            $level_three = $this->menuDataToArray($menu_g_child);

                            $this->saveMenu((int)$store_id, $level_three);

                            if (!empty($menu_g_child['sub_menus'])) {

                                /**
                                 * Great grand child level
                                 */
                                foreach ($menu_g_child['sub_menus'] as $menu_gg_child) {

                                    $level_four = $this->menuDataToArray($menu_gg_child);

                                    $this->saveMenu((int)$store_id, $level_four);
                                }
                            }
                        }
                    }
                }
            }

            $params = [
                'fields' => [
                    'link' => $level_one['link'],
                    'updated_at' => $level_one['updated_at']
                ]
            ];

            $results = $this->model->getByParams($this->main_tbl, $params);

            return $this->getMenuById($results[0]['menu_id']);
        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function saveMenu(int $store_id, array $menu)
    {
        try {
            $menu['store_id'] = $store_id;
            $menu['created_at'] = $this->model->now;

            unset($menu['menu_id']);

            if ($menu['parent_id'] == '') {
                $menu['parent_id'] = 0;
            }

            if ($menu['type'] == '') {
                $menu['type'] = 0;
            }

            $this->model->add($this->main_tbl, $menu);

            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function saveUpdatedMenu(int $menu_id, int $store_id, array $menu)
    {
        try {
            $conditions = [
                'menu_id' => $menu_id,
                'store_id' => $store_id
            ];

            $menu['menu_id'] = $menu_id;
            $menu['store_id'] = $store_id;

            if (empty($menu['parent_id']) || $menu['parent_id'] == '') {
                unset($menu['parent_id']);
            }

            if (empty($menu['type']) || $menu['type'] == '') {
                unset($menu['type']);
            }

            $this->model->updateByParams($this->main_tbl, $menu, $conditions);

            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateMenu($store_id, array $data)
    {
        try {

            $menu = $this->menuDataToArray($data);

            $menu_id = $data['menu_id'];

            $this->saveUpdatedMenu((int)$menu_id, (int)$store_id, $menu);


            if (!empty($data['sub_menus'])) {

                $level_one_delete_ids = $this->getChildIds($menu_id);

                /**
                 * Child level
                 */
                foreach ($data['sub_menus'] as $menu_child) {

                    if (isset($menu_child['menu_id'])) {

                        /**
                         * menu still exists
                         */
                        if (in_array($menu_child['menu_id'], $level_one_delete_ids)) {
                            if (($key = array_search($menu_child['menu_id'], $level_one_delete_ids)) !== false) {
                                unset($level_one_delete_ids[$key]);
                            }
                        }

                        $level_two = $this->menuDataToArray($menu_child);

                        $this->saveUpdatedMenu((int)$menu_child['menu_id'], (int)$store_id, $level_two);


                        if (!empty($menu_child['sub_menus'])) {


                            $level_two_delete_ids = $this->getChildIds($menu_child['menu_id']);

                            /**
                             * Grand child level
                             */
                            foreach ($menu_child['sub_menus'] as $menu_g_child) {

                                if (isset($menu_g_child['menu_id'])) {

                                    /**
                                     * menu still exists
                                     */
                                    if (in_array($menu_g_child['menu_id'], $level_two_delete_ids)) {
                                        if (($key = array_search($menu_g_child['menu_id'], $level_two_delete_ids)) !== false) {
                                            unset($level_two_delete_ids[$key]);
                                        }
                                    }

                                    $level_three = $this->menuDataToArray($menu_g_child);

                                    $this->saveUpdatedMenu((int)$menu_g_child['menu_id'], (int)$store_id, $level_three);


                                    if (!empty($menu_g_child['sub_menus'])) {


                                        $level_three_delete_ids = $this->getChildIds($menu_g_child['menu_id']);

                                        /**
                                         * Great Grand child level
                                         */
                                        foreach ($menu_g_child['sub_menus'] as $menu_gg_child) {

                                            if (isset($menu_gg_child['menu_id'])) {

                                                /**
                                                 * menu still exists
                                                 */
                                                if (in_array($menu_gg_child['menu_id'], $level_three_delete_ids)) {
                                                    if (($key = array_search($menu_gg_child['menu_id'], $level_three_delete_ids)) !== false) {
                                                        unset($level_three_delete_ids[$key]);
                                                    }
                                                }

                                                $level_four = $this->menuDataToArray($menu_gg_child);

                                                $this->saveUpdatedMenu((int)$menu_gg_child['menu_id'], (int)$store_id, $level_four);
                                            } else {
                                                /**
                                                 * new menu to add to parent
                                                 */
                                                $level_four = $this->menuDataToArray($menu_child);

                                                $this->saveMenu((int)$store_id, $level_four);
                                            }
                                        }

                                        foreach ($level_three_delete_ids as $id) {
                                            $this->deleteMenu((int)$id);
                                        }
                                    }
                                } else {
                                    /**
                                     * new menu to add to parent
                                     */
                                    $level_two = $this->menuDataToArray($menu_child);

                                    $this->saveMenu((int)$store_id, $level_two);
                                }
                            }

                            foreach ($level_two_delete_ids as $id) {
                                $this->deleteMenu((int)$id);
                            }
                        }
                    } else {
                        /**
                         * new menu to add to parent
                         */
                        $level_two = $this->menuDataToArray($menu_child);

                        $this->saveMenu((int)$store_id, $level_two);
                    }
                }

                foreach ($level_one_delete_ids as $id) {
                    $this->deleteMenu((int)$id);
                }
            }
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function getChildIds($menu_id)
    {
        try {
            $params = [
                'fields' => [
                    'parent_id' => $menu_id
                ]
            ];

            $children = $this->model->getByParams($this->main_tbl, $params);

            $ids = [];

            foreach ($children as $child) {
                $ids[] = $child['menu_id'];
            }

            return $ids;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deleteMenu(int $menu_id)
    {
        try {
            $data = [
                'deleted' => 1
            ];
            $conditions = [
                'menu_id' => $menu_id,
            ];
            $this->model->updateByParams($this->main_tbl, $data, $conditions);

            return true;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }



    public function menuDataToArray(array $base)
    {

        $structure = $this->menuDataArray();
        foreach ($structure as $key => $value) {

            if (isset($base[$key])) {

                $structure[$key] = $base[$key];
            }
        }

        $structure['updated_at'] = $this->model->now;

        return $structure;
    }

    public function menuDataArray()
    {

        return [
            'menu_id' => '',
            'parent_id' => '',
            'store_id' => '',
            'name' => '',
            'link' => '',
            'position' => '',
            'status' => '',
            'type' => '',
        ];
    }
}
