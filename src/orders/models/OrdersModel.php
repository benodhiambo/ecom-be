<?php

declare(strict_types=1);

namespace Dreamax\Orders\Models;

use Dreamax\Carts\Models\CartModel;
use Dreamax\Core\Classes\Model;
use Exception;


class OrdersModel
{
    private $model;
    private $cart_model;
    // private $orders_tbl = 'orders';

    private $carts_tbl = 'carts';
    private $carts_status_tbl = 'cart_status';
    private $cart_address_tbl = 'carts_address';
    private $now;

    public function __construct(Model $model, CartModel $cart_model)
    {
        $this->model = $model;
        $this->cart_model = $cart_model;
        $this->now = date("Y-m-d H:i:s", time());
    }

    public function getOrders(array $params)
    {
        try {

            $param = [
                'fields' => [
                    'user_id' => $GLOBALS['sess']['user_id'],
                    'order_status' => 'order'
                ],
                'order' => [
                    'created_at' => 'DESC'
                ],
                //'limit' => ($params['page'] ? (($params['page'] - 1) * 50) : '0') . ',50'
            ];

            return $this->model->getByParams($this->carts_tbl, $param);
        } catch (Exception $e) {
            $err = '<h3>Unable to get orders ' . $this->carts_tbl . ' - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getStoreOrders(array $params)
    {
        try {

            $params = [
                'fields' => [
                    'store_id' => $params['store_id'],
                    'order_status' => '1'
                ],
                'order' => [
                    'created_at' => 'DESC'
                ],
                'limit' => ($params['page'] ? (($params['page'] - 1) * 50) : '0') . ',50'
            ];

            return $this->model->getByParams($this->carts_tbl, $params);
        } catch (Exception $e) {
            $err = '<h3>Unable to get orders ' . $this->carts_tbl . ' - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getCustomerOrders(array $params)
    {
        try {

            $params = [
                'fields' => [
                    'user_id' => $GLOBALS['sess']['user_id'],
                    'order_status' => '2'
                ],
                'order' => [
                    'created_at' => 'DESC'
                ],
                // 'limit' => ($params['page'] ? (($params['page'] - 1) * 50) : '0') . ',50'
            ];

            return $this->model->getByParams($this->carts_tbl, $params);
        } catch (Exception $e) {
            $err = '<h3>Unable to get ' . $this->carts_tbl . ' - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getOrder(int $cart_id)
    {
        try {
            $params = [
                'fields' => [
                    'cart_id' => $cart_id,
                ]
            ];
            return [
                'order_details' => $this->model->getByParams($this->carts_tbl, $params),
                'order_items' => $this->getOrderItems($cart_id),
                'order_billing' => $this->getOrderAddress($cart_id, false),
                'order_shipping' => $this->getOrderAddress($cart_id)
            ];
        } catch (Exception $e) {
            $err = '<h3>Unable to get cart details - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getOrderItems($cart_id)
    {
        try {
            return $this->cart_model->getCartItems($cart_id);
        } catch (Exception $e) {
            $err = '<h3>Unable to get order item details - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getOrderAddress($cart_id, $ship = true)
    {
        try {

            $params = [
                'fields' => [
                    'cart_id' => $cart_id,
                    'use_for_shipping' => ($ship) ? 1 : '0',
                ]
            ];

            return $this->model->getByParams($this->cart_address_tbl, $params);
        } catch (Exception $e) {
            $err = '<h3>Unable to get order address details - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    /**
     * Creating an order involves 
     * translating a cart into an order
     * 1 - Checking customer for the cart is set 
     * 2 - Verifying billing and shipping info
     * 3 - Setting the cart to indicate it is an order
     */
    public function createOrder($cart)
    {
        try {
            $order = $cart['order_details'];

            if ($this->isOrder($order['cart_id'])) {
                return $this->getOrder((int) $order['cart_id']);
            }

            //check if is anonymous purchase
            if (isset($cart['order_billing']) && !empty($cart['order_billing'])) {

                $bill = $cart['order_billing'];
                //add billing info
                $bill_info = [
                    'cart_id' => $order['cart_id'],
                    'firstname' => $bill['firstname'],
                    'lastname' => $bill['lastname'],
                    'country' => $bill['country'],
                    'city' => $bill['city'],
                    'street' => $bill['street'],
                    'house' => $bill['house'],
                    'apartment' => $bill['apartment'],
                    'phone' => $bill['phone'],
                    'email' => $bill['email'],
                    'use_for_shipping' => $bill['use_for_shipping'],
                    'newsletter' => $bill['newsletter']
                ];

                $this->model->add($this->cart_address_tbl, $bill_info);

                //add shipping info
                $ship_info = $cart['order_shipping'];
                $ship_info = [
                    'cart_id' => $order['cart_id'],
                    'firstname' => $ship_info['firstname'],
                    'lastname' => $ship_info['lastname'],
                    'country' => $ship_info['country'],
                    'city' => $ship_info['city'],
                    'street' => $ship_info['street'],
                    'house' => $ship_info['house'],
                    'apartment' => $ship_info['apartment'],
                    'phone' => $ship_info['phone'],
                    'email' => $ship_info['email'],
                    'use_for_shipping' => $ship_info['use_for_shipping'],
                    'newsletter' => $ship_info['newsletter']
                ];
                $this->model->add($this->cart_address_tbl, $ship_info);
            } else {
                // check if cart has customer
                $cart_customer = $this->cart_model->getCartCustomer((int)$order['cart_id']);
                if ($cart_customer === false) {
                    throw new Exception('Order does not have a customer');
                }
            }

            // set cart to show its an order
            $params = [
                'fields' => [
                    'name' => 'order',
                ]
            ];

            $status = $this->model->getByParams($this->carts_status_tbl, $params);

            $data = [
                'order_status' => $status[0]['status_id'],
                'currency_id' => $order['currency_id'],
                'payment_gateway' => $order['payment_gateway'] == '' ? '1': $order['payment_gateway'],
                'shipping_gateway' => $order['shipping_gateway'] == '' ? '1': $order['shipping_gateway'],
                'updated_at' => $this->now,
            ];
            $conditions = [
                'cart_id' => $order['cart_id'],
            ];
            $this->model->updateByParams($this->carts_tbl, $data, $conditions);

            return $this->getOrder((int)$order['cart_id']);
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function isOrder($cart_id)
    {
        try {
            $params = [
                'fields' => [
                    'name' => 'order',
                ]
            ];

            $status = $this->model->getByParams($this->carts_status_tbl, $params);

            $params = [
                'fields' => [
                    'cart_id' => $cart_id,
                    'order_status' => $status[0]['status_id'],
                ]
            ];
            $order = $this->model->getByParams($this->carts_tbl, $params);

            return !empty($order);
        } catch (Exception $e) {
            $err = '<h3>Database Exception</h3><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateOrder(array $order)
    {
        try {

            if (isset($order['order_billing'])) {
                $bill = $order['order_billing'];
                $bill_update_result = $this->updateBillingAddress($bill, $order['order_details']['cart_id']);
                if ($bill_update_result !== true) {
                    die('could not update billing info');
                }
            }

            if (isset($order['order_shipping'])) {
                $ship = $order['order_shipping'];
                $ship_update_result = $this->updateShippingAddress($ship, $order['order_details']['cart_id']);
                if ($ship_update_result !== true) {
                    die('could not update billing info');
                }
            }

            $conditions = [
                'cart_id' => $order['order_details']['cart_id'],
            ];

            $this->model->updateByParams($this->carts_tbl, $order['order_details'], $conditions);

            return $this->getOrder((int) $order['order_details']['cart_id']);
        } catch (Exception $e) {
            $err = '<h3>Database Exception</h3><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateBillingAddress(array $address, $order_id)
    {
        try {
            $bill_info = [
                'cart_id' => $order_id,
                'firstname' => $address['firstname'],
                'lastname' => $address['lastname'],
                'country' => $address['country'],
                'city' => $address['city'],
                'street' => $address['street'],
                'house' => $address['house'],
                'apartment' => $address['apartment'],
                'phone' => $address['phone'],
                'email' => $address['email'],
                'use_for_shipping' => $address['use_for_shipping'],
                'newsletter' => $address['newsletter']
            ];
            $conditions = [
                'id' => $address['id'],
            ];
            $this->model->updateByParams($this->cart_address_tbl, $bill_info, $conditions);
            return true;
        } catch (Exception $e) {
            $err = '<h3>Database Exception</h3><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateShippingAddress(array $address, $order_id)
    {
        try {
            $ship_info = [
                'cart_id' => $order_id,
                'firstname' => $address['firstname'],
                'lastname' => $address['lastname'],
                'country' => $address['country'],
                'city' => $address['city'],
                'street' => $address['street'],
                'house' => $address['house'],
                'apartment' => $address['apartment'],
                'phone' => $address['phone'],
                'email' => $address['email'],
                'use_for_shipping' => $address['use_for_shipping'],
                'newsletter' => $address['newsletter']
            ];
            $conditions = [
                'id' => $address['id'],
            ];
            $this->model->updateByParams($this->cart_address_tbl, $ship_info, $conditions);
            return true;
        } catch (Exception $e) {
            $err = '<h3>Database Exception</h3><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    /**
     * Order is completed and paid for
     */
    public function closeOrder($order_id)
    {
        try {
            $data = [
                'order_status' => 'closed'
            ];
            $conditions = [
                'cart_id' => $order_id,
            ];

            $this->model->updateByParams($this->carts_tbl, $data, $conditions);
            return true;
        } catch (Exception $e) {
            $err = '<h3>Database Exception</h3><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    /**
     * Adding Items to cart
     */
    public function convertToCart(array $order_id)
    {
        try {
            $data = [
                'order_status' => 'cart'
            ];
            $conditions = [
                'cart_id' => $order_id,
            ];

            $this->model->updateByParams($this->carts_tbl, $data, $conditions);
            return true;
        } catch (Exception $e) {
            $err = '<h3>Database Exception</h3><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function deleteOrder($order_id)
    {
        try {
            $data = [
                'order_status' => 'deleted'
            ];
            $conditions = [
                'cart_id' => $order_id,
            ];

            // delete cart
            $this->model->updateByParams($this->carts_tbl, $data, $conditions);
            return true;
        } catch (Exception $e) {
            $err = '<h3>Database Exception</h3><br>';
            throw new Exception($err . $e->getMessage());
        }
    }
}
