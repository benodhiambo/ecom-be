<?php

declare(strict_types=1);

namespace Dreamax\Orders\Controllers;

use Dreamax\Orders\Models\OrdersModel;
use Dreamax\Stores\Controllers\StoreController;
use Dreamax\Core\Classes\Controller;
use Exception;
use Psr\Http\Message\ResponseInterface;

class OrdersAdminController
{
    private $controller;
    private $storeController;
    private $model;

    public function __construct(Controller $controller, OrdersModel $model, StoreController $storeController)
    {
        $this->controller = $controller;
        $this->storeController = $storeController;

        $this->model = $model;

        // $is_owner = $this->storeController->verifyStoreOwner($GLOBALS['sess']['store_id']);


        // if ($is_owner !== true) {
        //     throw new Exception("Error Creating Store Controller: User is not store Admin", 1);
        // }
    }

    public function getOrders(array $params = []): ResponseInterface
    {
        $params['user_id'] = $this->controller->user_id;

        try {
            $orders = $this->model->getOrders($params);
            $data = [
                'success' => 'Orders Retrieved successfully',
                'orders' => $orders,
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'getOrders Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function getOrder(array $id)
    {
        try {
            $order = $this->model->getOrder((int)$id['order_id']);

            $data = ['order' => $order];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {

            $data = ['error' => 'getOrder Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function deleteOrder(array $id)
    {
        try {
            $this->model->deleteOrder((int)$id['order_id']);
            $data = ['success' => 'Customer Added successfully'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {

            $data = ['error' => 'createOrder Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }
}
