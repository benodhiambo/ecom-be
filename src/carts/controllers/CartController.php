<?php

declare(strict_types=1);

namespace Dreamax\Carts\Controllers;

use Dreamax\Carts\Models\CartModel;
use Dreamax\Core\Classes\Controller;
use Exception;
use Psr\Http\Message\ResponseInterface;

class CartController
{
    private $controller;
    private $model;
    private $now;

    public function __construct(Controller $controller, CartModel $model)
    {
        $this->controller = $controller;
        $this->model = $model;
        $this->now = date("Y-m-d H:i:s", time());
    }

    public function getCustomerCarts(array $id)
    {
        try {

            $post_data = $this->controller->getPostData();
            
            $store_id = $post_data['carts'][0]['store_id'];

            $carts = $this->model->getCustomerCarts($GLOBALS['sess']['user_id'], $store_id);
            
            $data = [
                'success' => "User carts retrieved successfully",
                'carts' => $carts
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Database Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function getCart()
    {
        try {
            $id = $this->controller->getPostData();

            $cart_details = $this->model->getCartDetails((int)$id['carts'][0]['cart_id']);

            $data = [
                'success' => "",
                'carts' => [
                    $cart_details
                ]
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Update Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function createCart()
    {
        try {
            // get POST 
            $data = $this->controller->getPostData();          

            $cart = $this->model->addCart($data['carts'][0]);

            $data = [
                'success' => 'Cart Created successfully',
                'cart' => $cart
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Add Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function addItemToCart(array $id)
    {
        $cart_object = $this->controller->getPostData();

        $data = [
            'cart_id' => $cart_object['carts'][0]['cart_id'],
            'product_id' => $id['product_id'],
            'qty' => '1'
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
            return $this->controller->setErrorResponse($data);
        }
    }

    public function updateCartItemQuantity(array $id)
    {

        $cart_object = $this->controller->getPostdata();

        $data = [
            'cart_id' => $cart_object['carts'][0]['cart_id'],
            'product_id' => $id['product_id'],
            'qty' => $cart_object['carts'][0]['qty'],
        ];

        try {
            $cart = $this->model->updateCartItemQty($data['cart_id'], $data['product_id'], $data['qty']);

            $data = [
                'success' => 'Item quantity updated successfully',
                'carts' => $cart
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Add Item Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function removeItemFromCart($id)
    {
        $cart_object = $this->controller->getPostData();

        $data = [
            'cart_id' => $cart_object['carts'][0]['cart_id'],
            'product_id' => $id['product_id']
        ];

        try {
            $cart = $this->model->removeItemFromCart((int)$id['product_id'],$data['cart_id']);

            $data = [
                'success' => 'Cart Item removed successfully',
                'carts' => [
                    $cart
                ]
            ];
            
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Remove Item Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
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
            return $this->controller->setErrorResponse($data);
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
            return $this->controller->setErrorResponse($data);
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
            return $this->controller->setErrorResponse($data);
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
            return $this->controller->setErrorResponse($data);
        }
        
    }

    public function updateCart(): ResponseInterface
    {
        try {
            $cart_object = $this->controller->getPostData();

            $cart_id = $cart_object['carts'][0]['cart_details']['cart_id'];

            $this->model->updateCartDetails($cart_object['carts'], $cart_id);

            $data = [
                'success' => 'Cart Details Updated successfully',
                'carts' =>[
                    $this->model->getCartDetails((int)$cart_id)
                ]
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Update Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }
}
