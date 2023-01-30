<?php

declare(strict_types=1);

namespace Dreamax\Categories\Controllers;

use Dreamax\Core\Classes\Controller;
use Dreamax\Categories\Models\CategoriesModel;
use Dreamax\Stores\Controllers\StoreController;
use Exception;
use Psr\Http\Message\ResponseInterface;

class CategoriesController
{
    private $controller;
    private $model;
    private $storeController;

    public function __construct(Controller $controller, CategoriesModel $model , StoreController $storeController)
    {
        $this->controller = $controller;
        $this->model = $model;
        $this->storeController = $storeController;
    }

    public function getCategories(): ResponseInterface
    {
        try {
            $categories = $this->model->getCategories($this->controller->user_id);

            $cats = [];
            foreach ($categories as $category) {
                if ($category['parent_id'] == 0) {
                    $category['parent_id'] = null;
                }
                $cats[] = $category;
            }


            $data = ['categories' => $cats];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => __FUNCTION__. ' Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function getCategory(array $id): ResponseInterface
    {
        try {
            $category = $this->model->getCategory($id['category_id']);

            if ($category[0]['parent_id'] == 0) {
                $category[0]['parent_id'] = null;
            }

            $data = ['categories' => $category];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => __FUNCTION__. ' Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function getCategoriesByStoreId($cdata): ResponseInterface
    {
        try {

            $this->storeController->verifyStoreOwner($cdata['store_id']);

            $categories = $this->model->getCategoriesByStoreId((int)$cdata['store_id']);

            $data = [
                'categories' => $categories
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => __FUNCTION__. 'Pages Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }


    public function addCategory(array $cdata): ResponseInterface
    {
        try {

            $this->storeController->verifyStoreOwner($cdata['store_id']);
            
            $data = $this->controller->getPostData();
            
            $categories = $this->model->addCategory((int)$cdata['store_id'], $data['categories'][0]);
            $data = [
                'success' => 'Category Created successfully',
                'categories' => $categories
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function addCategoryR(array $cdata): ResponseInterface
    {
        try {

            // $this->storeController->verifyStoreOwner($cdata['store_id']);
            
            $data = $this->controller->getPostData();
            
            $categories = $this->model->addCategoryR((int)$cdata['store_id'], $data['categories'][0]);

            $data = [
                'success' => 'Category Created successfully',
                'categories' => $categories
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function updateCategory(array $cdata): ResponseInterface
    {
        try {


            // $post_data = $this->controller->helper->getRequestJSON($this->controller->getRequest());
            
            $post_data = $this->controller->getPostData();

            $category = $this->model->updateCategory($cdata['category_id'],$cdata['store_id'],(array)$post_data['categories'][0]);

            $data = [
                'success' => 'Category Updated successfully',
                'categories' => $category
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Page Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function deleteCategory(array $cdata) : ResponseInterface
    {
        try {

            $this->storeController->verifyStoreOwner($cdata['store_id']);

            $this->model->deleteCategory((int)$cdata['category_id']);

            $data = [
                'success' => 'Category Deleted successfully'
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Page Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }


    public function updateCategories(array $cdata): ResponseInterface
    {
        try {


            $post_data = $this->controller->helper->getRequestJSON($this->controller->getRequest());

            foreach($post_data as $data_value)
            {
                if (isset($data_value->category_id)) {
                    $this->model->updateCategory($data_value->category_id, $cdata['store_id'], (array)$data_value);
                }
            }

            $categories = $this->model->getCategoriesByStoreId((int)$cdata['store_id']);

            $data = [
                'success' => 'Categories Updated successfully',
                'categories' => $categories
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Page Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }







}
