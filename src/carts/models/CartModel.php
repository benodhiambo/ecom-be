<?php

declare(strict_types=1);

namespace Dreamax\Carts\Models;

use Dreamax\Core\Classes\Model;
use Dreamax\Products\Models\ProductModel;
use Dreamax\User\Models\UserModel;
use Exception;


class CartModel
{
    private $model;
    private $user_model;
    private $product_model;

    private $carts_tbl = 'carts';
    private $carts_items_tbl = 'cart_items';
    private $now;

    public function __construct(Model $model, UserModel $user_model, ProductModel $product_model)
    {
        $this->model = $model;
        $this->user_model = $user_model;
        $this->product_model = $product_model;
        $this->now = date("Y-m-d H:i:s", time());
    }

    public function getStoreCarts($store_id)
    {
        try {
            $params = [
                'fields' => [
                    'store_id' => $store_id,
                    'order_status' => '1'
                ]
            ];

            return $this->model->getByParams($this->carts_tbl, $params);
        } catch (Exception $e) {
            $err = '<h3>Unable to get cart details - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getCartDetails(int $cart_id)
    {
        try {
            $params = [
                'fields' => [
                    'cart_id' => $cart_id
                ]
            ];
            $cart_detail = $this->model->getByParams($this->carts_tbl, $params);
            $cart_items = $this->getCartItems($cart_id);
            $cart = [];
            $cart['cart_details'] = $cart_detail;
            $cart['cart_items'] = $cart_items;
            return $cart;
        } catch (Exception $e) {
            $err = '<h3>Unable to get cart details - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    private function getNewCartId($params)
    {
        try {
            $results = $this->model->getByParams($this->carts_tbl, $params);
            return $results[0]['cart_id'];
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function getCartCustomer($cart_id)
    {
        try {
            $cart_details = $this->getCartDetails($cart_id);

            if (isset($cart_details[0]['user_id']) && $cart_details[0]['user_id'] !== '') {
                return $this->user_model->getUserDetails($cart_details[0]['user_id']);
            }
            return false;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    /**
     * Get all the active carts for this customer for this store
     */
    public function getCustomerCarts($user_id, $store_id)
    {
        try {
            $params = [
                'fields' => [
                    'user_id' => $user_id,
                    'store_id' => $store_id
                ],
                'order' => [
                    'created_at' => 'DESC'
                ]
            ];
            

            $all_carts = $this->model->getByParams($this->carts_tbl, $params);

            $cust_carts = [];

            if (!empty($all_carts)) {
                foreach ($all_carts as $cart) {

                    $cart['cart_items'] = $this->getCartItems((int)$cart['cart_id']);

                    $cust_carts[] = $cart;

                }
            }
            return $cust_carts;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function getCartItems(int $cart_id)
    {
        try {

            $params = [
                'fields' => [
                    'cart_id' => $cart_id,
                    'deleted' => '0'
                ],
                'order' => [
                    'created_at' => 'DESC'
                ],
                'limit' => 50
            ];

            return $this->model->getByParams($this->carts_items_tbl, $params);
        } catch (Exception $e) {
            $err = '<h3>Unable to get cart details - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getCartItemDetails(int $cart_id, $product_id)
    {
        try {
            $params = [
                'fields' => [
                    'cart_id' => $cart_id,
                    'product_id' => $product_id
                ]
            ];

            return $this->model->getByParams($this->carts_items_tbl, $params);
        } catch (Exception $e) {
            $err = '<h3>Unable to get cart item details - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function addCart($data)
    {

        try {
            $cart_details = $data['cart_details'][0];

            $cart_items = $data['cart_items'];

            $cart = $this->cartDataToArray($cart_details);

            if ($cart['user_id'] == '' ) {
                unset($cart['user_id']);
            }

            $this->model->add($this->carts_tbl, $cart);

            //get new cart
            $params = [
                'fields' => [
                    'store_id' => $cart['store_id'],
                    'created_at' => $cart['created_at'],
                ],
            ];

            if (isset($cart['user_id'])) {
                $params['fields']['user_id'] = $cart['user_id'];
            }


            $cart_id = $this->getNewCartId($params);

            foreach ($cart_items as $item) {
                $this->addItemToCart($item, $cart_id);
            }

            return $this->getCartDetails((int)$cart_id);
        } catch (Exception $e) {
            $err = '<h3>Unable to Add cart - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function addItemToCart(array $item_data, $cart_id): ?bool
    {
        //check if item exists in cart
        $cart_items = $this->getCartItems((int)$cart_id);

        if (!empty($cart_items)) {

            foreach ($cart_items as $item) {
                if ($item_data['product_id'] == $item['product_id']) {
                    /**
                     * if item is in cart then add quantity
                     */
                    $this->addCartItemQty($cart_id, $item_data['product_id'], $item_data['qty']);
                    return true;
                }
            }
        }

        $prod_details = $this->product_model->getProductById($item_data['product_id']);

        if (!empty($prod_details)) {
            $data = [
                'cart_id' => $cart_id,
                'product_id' => $item_data['product_id'],
                'name' => $prod_details['name'],
                'price' => $prod_details['price'],
                'sale_price' => $prod_details['sale_price'],
                'qty' => $item_data['qty'],
                'created_at' => $this->now,
                'updated_at' => $this->now,
            ];

            try {
                //add the new item
                $this->model->add($this->carts_items_tbl, $data);

                $this->updateCartTotal((int)$cart_id);
                return true;
            } catch (Exception $e) {
                throw new Exception($e->getMessage());
            }
        }
    }

    public function addCartItemQty($cart_id, $product_id, $qty = 1)
    {
        try {
            $cart_item_details = $this->getCartItemDetails((int)$cart_id, $product_id);
            $current_qty = $cart_item_details[0]['qty'];

            $data = [
                'qty' => $current_qty + $qty
            ];
            $conditions = [
                'product_id' => $product_id,
            ];
            $this->model->updateByParams($this->carts_items_tbl, $data, $conditions);
            return true;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updateCartItemQty($cart_id, $product_id, $qty = 1)
    {
        try {
            $data = [
                'qty' => $qty,
                'updated_at' => $this->now,
            ];
            $conditions = [
                'cart_id' => $cart_id,
                'product_id' => $product_id,
            ];
            $this->model->updateByParams($this->carts_items_tbl, $data, $conditions);

            return $this->getCartDetails((int)$cart_id);
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function removeItemFromCart($product_id, $cart_id)
    {
        try {
            // delete items from cart
            $data = [
                'deleted' => '1'
            ];
            $conditions = [
                'product_id' => $product_id,
            ];

            $this->model->updateByParams($this->carts_items_tbl, $data, $conditions);

            $this->updateCartSubtotal((int)$cart_id);

            return $this->getCartDetails((int)$cart_id);
        } catch (Exception $e) {
            $err = '<h3>Database Exception</h3><br>';
            throw new Exception($err . $e->getMessage());
        }
        return true;
    }

    public function updateCartSubtotal(int $cart_id)
    {
        try {
            $cart_items = (array)$this->getCartItems($cart_id);

            /**
             * a simple array
             * each item in this array represents the total price
             * for a product included in the cart
             */
            $line_totals = [];

            foreach ($cart_items as $item) {
                $item_total = $item['sale_price'] * $item['qty'];
                array_push($line_totals, $item_total);
            }

            return array_sum($line_totals);
        } catch (Exception $e) {
            $err = '<h3>Unable to get cart subtotal - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateCartTotal(int $cart_id)
    {
        try {
            $this->updateCartSubtotal($cart_id);

            $cart = $this->getCartDetails($cart_id);

            $vat_amount = 0;

            $details = $cart['cart_details'][0];


            if (!empty($details['vat'])) {
                //Calculate VAT
                $vat_amount = ($details['vat'] / 100) * $details['sub_total'];
            }

            $cart_totals = $details['sub_total'] + $vat_amount - $details['discount'];

            $data = [
                'sub_total' => $this->updateCartSubtotal((int)$cart_id),
                'total' => $cart_totals
            ];
            $conditions = [
                'cart_id' => (int)$cart_id,
            ];

            $this->model->updateByParams($this->carts_tbl, $data, $conditions);
            return true;
        } catch (Exception $e) {
            $err = '<h3>Unable to get cart totals - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateCartDetails($cart_data, $cart_id)
    {
        if (isset($cart_data))
            try {
                $cart_info = $cart_data[0]['cart_details'];

                $data = [
                    'currency_id' => isset($cart_info['currency_id']) ? $cart_info['currency_id'] : null,
                    'vat' => $cart_info['vat'] == '' ? '0' : $cart_info['vat'],
                    'discount' => $cart_info['discount'] == '' ? '0' : $cart_info['discount'],
                    'payment_gateway' => $cart_info['payment_gateway'] == '' ? '0' : $cart_info['payment_gateway'],
                    'updated_at' => $this->now
                ];

                $conditions = [
                    'cart_id' => $cart_id,
                ];

                $this->model->updateByParams($this->carts_tbl, $data, $conditions);

                $cart_items = $cart_data[1]['cart_items'];

                $this->updateCartItems($cart_items, $cart_id);

                return $this->getCartDetails((int)$cart_id);
            } catch (\Exception $e) {
                $err = '<h3>Database Exception</h3><br>';
                throw new Exception($err . $e->getMessage());
            }
    }

    public function updateCartItems($items, $cart_id)
    {
        try {
            $current_items = $this->getCartItems((int)$cart_id);

            $item_ids = [];

            foreach ($current_items as $c_item) {
                array_push($item_ids, $c_item['item_id']);
            }

            foreach ($items as $item) {

                if (isset($item['item_id']) && in_array($item['item_id'], $item_ids)) {
                    unset($item_ids[$item['item_id']]);
                }

                $item_data = $this->getCartItemDetails((int)$cart_id, $item['product_id']);

                if (!empty($item_data)) {
                    $this->updateCartItemQty($cart_id, $item['product_id'], $item['qty']);
                } else {
                    $this->addItemToCart($item, $cart_id);
                }
            }
            return $this->getCartItems((int)$cart_id);
        } catch (\Exception $e) {
            $err = '<h3>Database Exception</h3><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    public function cartDataToArray(array $base)
    {
        $structure = $this->cartDataArray();

        foreach ($structure as $key => $value) {
            if (isset($base[$key])) {
                $structure[$key] = $base[$key];
            }
        }


        $structure['vat'] = empty($base['vat']) ? 0 : $base['vat'];
        $structure['discount'] = empty($base['discount']) ? 0 : $base['discount'];
        $structure['payment_gateway'] = empty($base['payment_gateway']) ? 0 : $base['payment_gateway'];
        $structure['shipping_gateway'] = empty($base['shipping_gateway']) ? 0 : $base['shipping_gateway'];
        $structure['updated_at'] = $this->now;

        return $structure;
    }

    public function cartDataArray()
    {

        return [
            'store_id' => '',
            'user_id' => '',
            'currency_id' => '',
            'sub_total' => 0,
            'total' => 0,
            'vat' => 0,
            'discount' => 0,
            'payment_gateway' => '',
            'created_at' => $this->now,
            'updated_at' => $this->now
        ];
    }

    private function cartItemDataToArray(array $array_data): array
    {

        $data = array(
            'cart_id' => $array_data['cart_id'],
            'product_id' => $array_data['product_id'],
            'name' => isset($array_data['name']) ? $array_data['name'] : null,
            'price' => isset($array_data['price']) ? $array_data['price'] : null,
            'sale_price' => isset($array_data['sale_price']) ? $array_data['sale_price'] : null,
            'qty' => isset($array_data['qty']) ? $array_data['qty'] : null,
            'deleted' => isset($array_data['deleted']) ? $array_data['deleted'] : '0',
            'created_at' => $this->now,
            'updated_at' => $this->now
        );

        if (isset($array_data['item_id'])) {
            unset($data['created_at']);
        }

        return $data;
    }

    public function deleteCart($cart_id)
    {
        try {

            // delete items from cart
            $data = [
                'deleted' => '1'
            ];
            $conditions = [
                'cart_id' => $cart_id,
            ];
            $this->model->updateByParams($this->carts_items_tbl, $data, $conditions);

            $params = [
                'fields' => [
                    'name' => 'deleted',
                ]
            ];

            $status = $this->model->getByParams('cart_status', $params);

            $data = [
                'order_status' => $status[0]['status_id']
            ];
            // delete cart
            $this->model->updateByParams($this->carts_tbl, $data, $conditions);
            return true;
        } catch (Exception $e) {
            $err = '<h3>Database Exception</h3><br>';
            throw new Exception($err . $e->getMessage());
        }
        return true;
    }
}
