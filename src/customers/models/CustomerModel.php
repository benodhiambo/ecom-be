<?php

declare(strict_types=1);

namespace Dreamax\Customers\Models;

use Dreamax\Core\Classes\Model;
use Dreamax\User\Models\UserModel;
use Dreamax\Stores\Models\StoreModel;
use Exception;

/**
 * Handles Authentication
 */
class CustomerModel
{
    private $model;
    private $users_model;
    private $store_model;

    private $customers_tbl = 'users';
    private $store_customers_tbl = 'store_customers';
    private $cart_address = 'cart_address';

    // for use in timestamp fields
    private $now;

    public function __construct(Model $model, UserModel $user_model,StoreModel $store_model)
    {
        $this->model = $model;
        $this->users_model = $user_model;
        $this->store_model = $store_model;
        $this->now = date("Y-m-d H:i:s", time());
    }

    public function getAllCustomers(): array
    {
        try {

            return $this->model->getAll($this->store_customers_tbl);
        } catch (Exception $e) {
            $err = '<h3>Unable to Add User - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    /**
     * Get all the customers of a store
     */
    public function getStoreCustomers(int $store_id): array
    {
        try {
            $store_customers_ids = $this->getIdsOfStoreCustomers($store_id);

            $details = [];

            foreach ($store_customers_ids as $id) {
                $customer_data = $this->users_model->getUserDetails($id);
                array_push($details, $customer_data[0]);
            }

            return $details;
            
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    private function getIdsOfStoreCustomers(int $store_id)
    {
        try {
            $params = [
                'fields' => [
                    'store_id' => $store_id,
                ]
            ];
            $results = $this->model->getByParams($this->store_customers_tbl, $params);

            $id_array = [];

            foreach ($results as $result) {
                array_push($id_array, $result['customer_id']);
            }
            return $id_array;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function getCustomerDetails(string $customer_id)
    {
        try {
            $customer = $this->users_model->getUserDetails($customer_id);
            $stores_info = $this->getCustomerStores($customer_id);

            foreach ($stores_info as $store) {
                // $customer[0]['store_id'][] = $store['store_id'];
                $customer[0]['store_id'] = $store['store_id'];
            }
            
            return $customer;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function getCustomerStores(string $customer_id)
    {
        try {
            $params = [
                'fields' => [
                    'customer_id' => $customer_id,
                ]
            ];
            return $this->model->getByParams($this->store_customers_tbl, $params);
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function addStoreCustomer(array $cust_data)
    {
        $cust_data = $cust_data['customers'][0];

        $structure = $this->get_customer_structure();
        //unset($structure['user_id'],$structure['created_at'],$structure['password']);
        unset($structure['user_id'],$structure['created_at']);

        foreach($structure as $key=>$value) {

            if (isset($cust_data[$key])) {
                $structure[$key] = $cust_data[$key];
            }

        }

        $structure['create_id'] = $cust_data['store_id'];
        $structure['password'] = password_hash($structure['password'], PASSWORD_DEFAULT);

        try {

            $this->model->add($this->customers_tbl,$structure);

            $conditions = [
                'fields' => [
                    'create_id' => $cust_data['store_id'],
                ],
                'limit' => 1,
                'order' => [
                    'user_id' => 'DESC'
                ]
            ];

            $customer_id = $this->model->getByParams($this->customers_tbl,$conditions);

            $store_customer_data = [
                'store_id' => $cust_data['store_id'],
                'customer_id' => $customer_id[0]['user_id'],
            ];

            $this->model->add($this->store_customers_tbl, $store_customer_data);

            $customer_id[0]['store_id'] = $cust_data['store_id'];

            return $customer_id[0];
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updateStoreCustomer(array $cust_data)
    {
        try
        {

            $params = [
                'fields' => [
                    'customer_id' => $cust_data['user_id'],
                    'store_id' => $cust_data['store_id']
                ],
            ];

            $store_user_data = $this->model->getByParams($this->store_customers_tbl, $params);

            if (empty($store_user_data)) {

                return new Exception('User is not belong to store', 1);

            }

            $structure = $this->get_customer_structure();

            unset($structure['user_id'],$structure['created_at'],$structure['password']);

            foreach($structure as $key=>$value) {

                if (isset($cust_data[$key])) {
                    $structure[$key] = $cust_data[$key];
                } elseif($value == '') {
                    /**
                     * empty fields do not require update
                     */
                    unset($structure[$key]);
                }

            }


            $structure['create_id'] = $cust_data['store_id'];


            // print_r($cust_data); die;

            $this->model->updateByParams($this->customers_tbl,$structure,[
                'user_id' => $cust_data['user_id'],
            ]);

            return $this->getCustomerDetails($cust_data['user_id']);

        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }


    }

    public function deleteStoreCustomer(int $store_id, int $customer_id)
    {
        try {
            // get sore_user_id
            $params = [
                'fields' => [
                    'customer_id' => $customer_id,
                    'store_id' => $store_id,
                ],
                'order' => [
                    'created_at' => 'ASC'
                ],
                'limit' => 50
            ];
            $result = $this->model->getByParams($this->store_customers_tbl, $params);

            if (!empty($result)) {
                $data = [
                    'store_account_status' => 2,
                ];
                $conditions = [
                    'store_user_id' => $result[0]['store_user_id'],
                ];
                $this->model->updateByParams($this->store_customers_tbl, $data, $conditions);
                return true;
            } else {
                // false means the record does not exist
                return false;
            }
            
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function getCustomersByUserId(int $user_id)
    {

        $stores_list = [];
        $stores = $this->store_model->getStores($user_id);
        foreach ($stores as $store) {
            $stores_list[] = $store['store_id'];
        }

        if (!empty($stores_list)) {

            $sql = "SELECT {$this->customers_tbl}.*
                        FROM {$this->customers_tbl}
                    JOIN {$this->store_customers_tbl} ON 
                      {$this->store_customers_tbl}.store_id in (" . implode(",", $stores_list) . ")
                      AND 
                      {$this->store_customers_tbl}.store_account_status != 2";

            $params = [];

            return $this->model->getBySql($sql, $params);

        } else {

            return [];

        }


    }

    public function get_customer_structure(){

        return [
            'user_id' => '',
            'user_name' => '',
            'first_name' => '',
            'last_name' => '',
            'details' => '',
            'website' => '',
            'country' =>'',
            'city' => '',
            'date_of_birth' => $this->model->now,
            'occupation'  => '',
            'status'  => '',
            'birthplace'  => '',
            'interests'  => '',
            'recovery_email'  => '',
            'sec_qtn_1'  => '',
            'sec_qtn_2'  => '',
            'sec_qtn_3'  => '',
            'password'  => '',
            'email'  => '',
            'phone_number'  => '',
            'created_at'  => $this->model->now,
            'updated_at'  => $this->model->now,
            'profile'  => '',
            'cover'  => '',
            'tag'  => '',
            'create_id' => ''
        ];

    }
}