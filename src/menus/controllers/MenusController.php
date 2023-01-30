<?php

declare(strict_types=1);

namespace Dreamax\Menus\Controllers;

use Dreamax\Core\Classes\Controller;
use Dreamax\Menus\Models\MenusModel;
use Dreamax\Stores\Controllers\StoreController;
use Exception;
use Psr\Http\Message\ResponseInterface;

class MenusController
{
    private $controller;
    private $model;
    private $storeController;

    public function __construct(Controller $controller, MenusModel $model , StoreController $storeController)
    {
        $this->controller = $controller;
        $this->model = $model;
        $this->storeController = $storeController;

    }

    public function getMenus(): ResponseInterface
    {
        try {


            $menus = $this->model->getMenus($this->controller->user_id);

            $data = [
                'menus' => $menus
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => __FUNCTION__. ' Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function getCustomerMenus(array $id): ResponseInterface
    {
        try {

            $menus = $this->model->getMenusByStoreId($id['store_id']);

            foreach ($menus as $menu) {
                unset($menu['parent_id']);
                unset($menu['store_id']);
                unset($menu['deleted']);
                unset($menu['created_at']);
                unset($menu['updated_at']);
                unset($menu['status']);
            }

            $data = [
                'menus' => $menus
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => __FUNCTION__. ' Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function getMenuById($cdata): ResponseInterface
    {
        try {

            //$this->storeController->verifyStoreOwner($cdata['store_id']);

            $menus = $this->model->getMenuById((int)$cdata['menu_id']);
            $data = [
                'menus' => $menus
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => __FUNCTION__. 'Pages Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function getMenusByStoreId($cdata): ResponseInterface
    {
        try {

            $this->storeController->verifyStoreOwner($cdata['store_id']);

            $menus = $this->model->getMenusByStoreId((int)$cdata['store_id']);
            $data = [
                'menus' => $menus
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => __FUNCTION__. 'Pages Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }


    public function addMenu(array $cdata): ResponseInterface
    {
        try {

           $post_data = $this->controller->getPostData();

            $data = $post_data['menus'][0];
            $menus = $this->model->addMenu((int)$cdata['store_id'], $data);
            $data = [
                'success' => 'Menu Created successfully',
                'menus' => $menus
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function updateMenu(array $cdata): ResponseInterface
    {
        try {


            $post_data = $this->controller->getPostData();

            $data = $post_data;
            
            foreach ($data['menus'] as $menu) {
                $this->model->updateMenu($cdata['store_id'],$menu);
            }
            
            $store_menus = $this->model->getMenusByStoreId($cdata['store_id']);

            $data = [
                'success' => 'Menu Updated successfully',
                'menus' => $store_menus
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Page Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function deleteMenu(array $cdata) : ResponseInterface
    {
        try {


            $this->storeController->verifyStoreOwner($cdata['store_id']);

            $this->model->deleteMenu((int)$cdata['menu_id']);

            $data = [
                'success' => 'Menu Deleted successfully'
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Page Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }





}
