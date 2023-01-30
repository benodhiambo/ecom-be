<?php

declare(strict_types=1);

namespace Dreamax\Pages\Controllers;

use Dreamax\Core\Classes\Controller;
use Dreamax\Pages\Models\PagesModel;
use Dreamax\Stores\Controllers\StoreController;
use Exception;
use Psr\Http\Message\ResponseInterface;

class PagesController
{
    private $controller;
    private $model;
    private $storeController;

    public function __construct(Controller $controller, PagesModel $model , StoreController $storeController)
    {
        $this->controller = $controller;
        $this->model = $model;
        $this->storeController = $storeController;
    }


    public function getPages($cdata): ResponseInterface
    {
        try {

            $pages = $this->model->getPages((int)$cdata['store_id']);

            $data = [
                'success' => "GET Successful",
                'pages' => $pages
            ];
            
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Pages Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function getPage($cdata): ResponseInterface
    {
        try {

            $page = $this->model->getPage((int)$cdata['store_id'], (int)$cdata['page_id']);

            $data = [
                'success' => "GET Successful",
                'pages' => [$page]
            ];
            
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Pages Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }


    public function addPage(array $cdata): ResponseInterface
    {
        try {

            $this->storeController->verifyStoreOwner($cdata['store_id']);

            // $post_data = $this->controller->helper->getRequestJSON($this->controller->getRequest());
            $post_data = $this->controller->getPostData();

            $new_page = $post_data['pages'][0];

            $page = $this->model->addPage((int)$cdata['store_id'],$new_page);

            $data = [
                'success' => 'Page Added successfully',
                'pages' => [$page],
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Page Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function updatePage(array $cdata): ResponseInterface
    {
        try {

            $this->storeController->verifyStoreOwner($cdata['store_id']);

            // $post_data = $this->controller->helper->getRequestJSON($this->controller->getRequest());
            $post_data = $this->controller->getPostData();

            $update_page = $post_data['pages'][0];

            $pages = $this->model->updatePage((int)$cdata['store_id'],(int)$cdata['page_id'],$update_page);
            $data = [
                'success' => 'Page Updated successfully',
                'pages' => [$pages]
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Page Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function deletePage(array $cdata) : ResponseInterface
    {
        try {

            $this->storeController->verifyStoreOwner($cdata['store_id']);

            $result = $this->model->deletePage((int)$cdata['store_id'],(int)$cdata['page_id']);

            if ($result === true) {
                $data = [
                    'success' => 'Page Deleted successfully'
                ];
            } else {
                $data = [
                    'success' => 'Page not Found'
                ];
            }
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Page Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }


}
