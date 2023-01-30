<?php

declare(strict_types=1);

namespace Dreamax\Carts\Controllers;

use Dreamax\Carts\Models\CartModel;
use Dreamax\Stores\Controllers\StoreController;
use Dreamax\Core\Classes\Controller;
use Exception;
use Psr\Http\Message\ResponseInterface;

class CartAdminController
{
    private $controller;
    private $storeController;
    private $model;
    private $now;

    public function __construct(Controller $controller, CartModel $model, StoreController $storeController)
    {
        $this->controller = $controller;
        $this->storeController = $storeController;

        // $is_owner = $this->storeController->verifyStoreOwner($GLOBALS['sess']['store_id']);
        // if ($is_owner !== true) {
        //     throw new Exception("Error Creating Store Controller: User is not store Admin", 1);
        // }

        $this->model = $model;
        $this->now = date("Y-m-d H:i:s", time());


    }

    public function getStoreCarts(array $id)
    {
        try {
            $carts = $this->model->getStoreCarts((int)$id['store_id']);
            
            $data = [
                'success' => "",
                'carts' => $carts
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Get All Carts Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function getCart(array $id)
    {
        try {
            $cart_details = $this->model->getCartDetails((int)$id['cart_id']);

            $data = [
                'success' => "",
                'carts' => [
                    $cart_details
                ]
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Update Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function createCart($cdata)
    {
        try {
            // get POST 
            $post_data = $this->controller->getRequest()->getBody()->getContents();
            $data = json_decode($post_data, true);

            $cart = $this->model->addCart($data[0], $cdata['store_id']);

            $data = [
                'success' => 'Cart Created successfully',
                'cart' => $cart
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Add Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function addItemToCart(array $cdata)
    {
        $post_data = $this->controller->getRequest()->getBody()->getContents();
        $cart_object = json_decode($post_data, true);

        $item_data = $cart_object['cart_items'][0];

        $data = [
            'cart_id' => $cdata['cart_id'],
            'product_id' => $item_data['product_id'],
            'qty' => $item_data['qty'],
            'updated_at' => $this->now,
        ];

        try {

            $cart = $this->model->addItemToCart($data, $data['cart_id']);
            
            $data = [
                'success' => 'Cart Item Added successfully',
                'carts' => $this->model->getCartDetails((int)$data['cart_id'])
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Add Item Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function updateCartItemQuantity(array $id)
    {
        // get POST 
        $post_data = $this->controller->getRequest()->getBody()->getContents();

        $cart_object = json_decode($post_data, true);

        $item_data = $cart_object[0]['cart_items'];

        $data = [
            'cart_id' => $id['cart_id'],
            'product_id' => $item_data['product_id'],
            'qty' => $item_data['qty'],
        ];

        try {
            $cart = $this->model->updateCartItemQty($id['cart_id'], $item_data['product_id'], $item_data['qty']);

            $data = [
                'success' => 'Item quantity updated successfully',
                'carts' => $cart
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Add Item Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function removeItemFromCart($cdata)
    {

        try {
            $cart = $this->model->removeItemFromCart((int)$cdata['cart_item_id'],(int)$cdata['cart_id']);

            $data = [
                'success' => 'Cart Item removed successfully',
                'carts' => [
                    $cart
                ]
            ];
            
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Remove Item Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
        return true;
    }


    public function getCartSubtotal(int $cart_id)
    {
        try {
            $cart_items = $this->model->getCartDetails($cart_id);
            return $cart_items['subtotal'];
        } catch (Exception $e) {
            $data = ['error' => 'Get Cart Subtotal Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function getCartTotal(int $cart_id)
    {
        try {
            $cart_items = $this->model->getCartDetails($cart_id);
            $data = ['cart_total' => $cart_items];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Get Cart Total Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function updateCartDetails(array $id)
    {
        try {
            // get POST 
            $post_data = $this->controller->getRequest()->getBody()->getContents();

            $cart_object = json_decode($post_data, true);

            $cart = $this->model->updateCartDetails($cart_object[0], $id['store_id']);

            $data = [
                'success' => 'Cart Details Updated successfully',
                'carts' => $cart
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Update Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function deleteCart(array $id)
    {
        try {
            $this->model->deleteCart((int)$id['cart_id']);
            $data = ['success' => 'Cart Deleted successfully'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Delete Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
        return true;
    }

    public function updateCart(array $id): ResponseInterface
    {
        try {
            // get POST 
            $post_data = $this->controller->getRequest()->getBody()->getContents();

            $cart_object = json_decode($post_data, true);
            $this->model->updateCartDetails($cart_object, $id['cart_id'][0]);

            $data = [
                'success' => 'Cart Details Updated successfully',
                'carts' =>[
                    $this->model->getCartDetails((int)$id['cart_id'])
                ]
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Update Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }
}
