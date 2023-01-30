<?php

declare(strict_types=1);

namespace Dreamax\Orders\Controllers;

use Dreamax\Orders\Models\OrdersModel;
use Dreamax\Stores\Controllers\StoreController;
use Dreamax\Core\Classes\Controller;
use Exception;
use Psr\Http\Message\ResponseInterface;

class OrdersController
{
    private $controller;
    private $model;

    public function __construct(Controller $controller, OrdersModel $model)
    {
        $this->controller = $controller;
        $this->model = $model;
    }

    /**
     * Orders for a logged in customer
     */
    public function getCustomerOrders($id)
    {
        try {
            if (isset($GLOBALS['sess']['user_id'])) {
                $orders = $this->model->getCustomerOrders($id);
                $data = [
                    'success' => 'Orders Retrieved successfully',
                    'orders' => $orders,
                ];

                return $this->controller->setResponse($data);
            }
            $data = [
                'Denied' => 'Cannot get Orders for anonymous user'
            ];

            return $this->controller->setResponse($data, '', 'application/json', '404');
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

    public function createOrder()
    {
        try {
            $data = $this->controller->getPostData();

            $order = $this->model->createOrder($data['orders'][0]);

            $data = [
                'success' => 'Order created successfully',
                'carts' => $order
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'create Order Error - ' . $e->getMessage()];

            return $this->controller->setResponse($data);
        }
    }

    public function updateCustomerOrder()
    {
        try {
            
            $data = $this->controller->getPostData();

            $result = $this->model->updateOrder($data['carts'][0]);

            $data = [
                'success' => 'Order updated successfully',
                'carts' => [
                    $result
                ]
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {

            $data = ['error' => 'update Order Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function convertToCart(array $id)
    {
        try {
            $this->model->closeOrder($id['order_id']);

            $data = ['success' => 'Order converted to Cart successfully'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {

            $data = ['error' => 'createOrder Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function closeOrder(array $id)
    {
        try {
            $this->model->closeOrder($id['order_id']);

            $data = ['success' => 'Order closed successfully'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {

            $data = ['error' => 'closeOrder Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function deleteOrder(array $id)
    {
        try {
            $this->model->deleteOrder((int)$id['order_id']);
            $data = ['success' => 'Customer deleted successfully'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {

            $data = ['error' => 'createOrder Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }
}
