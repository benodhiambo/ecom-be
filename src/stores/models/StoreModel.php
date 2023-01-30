<?php

declare(strict_types=1);

namespace Dreamax\Stores\Models;

use Dreamax\Core\Classes\Model;
use Exception;


class StoreModel
{
    private $model;
    private $stores_tbl = 'stores';
    private $store_settings_tbl = 'stores_settings';
    private $store_currencies_tbl = 'stores_currency';

    private  $now;

    public function __construct(Model $model)
    {
        $this->model = $model;
        $this->now = date("Y-m-d H:i:s", time());
    }

    public function getStores($user_id)
    {

        try {

            $stores = $this->model->getByField($this->stores_tbl, 'user_id', $user_id);

            return $stores;

        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

    public function getStoresById($store_id, $user_id = '')
    {

        try {

            $params = [
                'fields' => array(
                    'store_id' => $store_id
                )
            ];

            if ($user_id != '') {

                $params['fields']['user_id'] = $user_id;

            }

            $stores = $this->model->getByParams($this->stores_tbl, $params);

            if (!empty($stores)) {
                $stores = $stores[0];
            }

            return $stores;

        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

    public function getStoresByParams($params = [])
    {

        try {
            $param = [
                'fields' => $params
            ];
            return $this->model->getByParams($this->stores_tbl, $param);

        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

    public function getStoreSettings($store_id)
    {

        try {

            $settings = $this->model->getByField($this->store_settings_tbl, 'store_id', $store_id);

            if (!empty($settings)) {
                $settings = $settings[0];
            }

            return $settings;

        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

    public function createStore(array $data)
    {
        try {
            $store = $this->storeDataToArray($data);
            $this->model->add($this->stores_tbl, $store);

            $new_store = $this->getStoresByParams($store);

            
            $store_settings = $this->settingsDataToArray($data);
            $store_settings['store_id'] = $new_store[0]['store_id'];
            
            $this->model->add($this->store_settings_tbl, $store_settings);

            // add store currencies
            $this->addStoreCurrencies($data, $new_store[0]['store_id']);
            
            return $new_store[0]['store_id'];
        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

    /**
     * Updates all store information
     * Updates table stores, stores_settings, & stores_currencies
     */
    public function updateStore(array $data, $id)
    {
        try {
            $store_info = $this->storeDataToArray($data);
            $conditions = [
                'store_id' => $id,
            ];

            $this->model->updateByParams($this->stores_tbl, $store_info, $conditions);

            $this->updateStoreSettings($data, $id);

            $delete_ids = [];

            $currencies = $this->getStoreCurrencies($id);

            foreach ($currencies as $currency) {
                $delete_ids[] = $currency['currency_id'];
            }

            foreach ($data['currencies'] as $currency) {

                if (!empty($currency['currency_id'])) {

                    if (in_array($currency['currency_id'], $delete_ids)) {
                        if (($key = array_search($currency['currency_id'], $delete_ids)) !== false) {
                            unset($delete_ids[$key]);
                        }
                    }

                    $this->updateStoreCurrency($currency, $currency['currency_id']);
                } else {
                    $data=[];
                    $data['currencies'][] = $currency;
                    $this->addStoreCurrencies($data, $id);
                }
            }

            foreach ($delete_ids as $id) {
                $data = [
                    'deleted' => '1'
                ];
                $conditions = [
                    'currency_id' => $id
                ];
                $this->model->updateByParams($this->store_currencies_tbl, $data, $conditions);
            }
            

            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

    /**
     * Updates only the settings portion of the store data
     * Upadtes table stores_settings only
     */
    public function updateStoreSettings(array $data, $store_id = null)
    {
        try {

            $store_settings = $this->settingsDataToArray($data);

            $conditions = [
                'store_id' => is_null($store_id) ? $data['settings']['store_id'] : $store_id,
            ];

            unset($store_settings['store_id']);


            $result = $this->model->updateByParams($this->store_settings_tbl, $store_settings, $conditions);

            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

    public function getStoreCurrencies($store_id)
    {
        try {
            
            $params = [
                'fields' => [
                    'store_id' => $store_id,
                    'deleted' => '0'
                ]
            ];

            return $this->model->getByParams($this->store_currencies_tbl, $params);
        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

    public function addStoreCurrencies(array $data, $store_id)
    {
        try {
            // add store currencies
            foreach ($data['currencies'] as $currency) {
                $store_currency = [
                    'store_id' => $store_id,
                    'name' => $currency['name'],
                    'rate' => $currency['rate'],
                    'status' => $currency['status'],
                    'deleted' => '0',
                ];
                $this->model->add($this->store_currencies_tbl, $store_currency);
            }
            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

    public function updateStoreCurrency(array $data)
    {
        try {
            $currency_info = [
                'store_id' => $data['store_id'],
                'name' => $data['name'],
                'rate' => $data['rate'],
                'status' => $data['status'],
                'updated_at' => $this->now,
                'deleted' => '0',
            ];

            if (isset($data['currency_id'])) {
                $conditions = [
                    'currency_id' => $data['currency_id']
                ];

                $this->model->updateByParams($this->store_currencies_tbl, $currency_info, $conditions);
            } else {                
                $this->model->add($this->store_currencies_tbl, $data);
            }
            
            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

    public function removeStoreCurrency($currency_id)
    {
        try {
            $data = [
                'deleted' => 1,
            ];
            $conditions = [
                'currency_id' => $currency_id,
            ];

            $this->model->updateByParams($this->store_currencies_tbl, $data, $conditions);
            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

    public function storeDataToArray(array $base)
    {

        $store = [
            'user_id' => $GLOBALS['sess']['user_id'],
            'name' => $base['store']['name'],
            'email' => $base['store']['email'],
            'noti_email' => $base['store']['noti_email'],
            'industry' => $base['store']['industry'],
            'status' => $base['store']['status'],
            'created_at' => $this->now,
            'updated_at' => $this->now,
        ];

        if (isset($base['store_id'])) {
            unset($store['created_at']);
        }

        return $store;
    }

    public function storeDataArray()
    {

        return [
            'user_id'=>'',
            'name' => '',
            'email' => '',
            'noti_email' => '',
            'industry' => '',
            'status' => 0,
        ];


    }

    public function settingsDataToArray(array $data)
    {

        return [
            'store_id' => isset( $new_store[0]['store_id']) ? $new_store[0]['store_id'] : null,
            'legal_name' => isset($data['settings']['legal_name']) ? $data['settings']['legal_name'] : null,
            'phone' => isset($data['settings']['phone']) ? $data['settings']['phone'] : null,
            'country' => isset($data['settings']['country']) ? $data['settings']['country'] : null,
            'city' => isset($data['settings']['city']) ? $data['settings']['city'] : null,
            'street' => isset($data['settings']['street']) ? $data['settings']['street'] : null,
            'house' => isset($data['settings']['house']) ? $data['settings']['house'] : null,
            'apartment' => isset($data['settings']['apartment']) ? $data['settings']['apartment'] : null,
            'zip' => isset($data['settings']['zip']) ? $data['settings']['zip'] : null,
            'timezone' => isset($data['settings']['timezone']) ? $data['settings']['timezone'] : null,
            'language' => isset($data['settings']['language']) ? $data['settings']['language'] : null,
            'unit_system' => isset($data['settings']['unit_system']) ? $data['settings']['unit_system'] : null,
            'weight_unit' => isset($data['settings']['weight_unit']) ? $data['settings']['weight_unit'] : null,
            'orders_prefix' => isset($data['settings']['orders_prefix']) ? $data['settings']['orders_prefix'] : null,
            'orders_suffix' => isset($data['settings']['orders_suffix']) ? $data['settings']['orders_suffix'] : null,
        ];


    }

    public function settingsDataArray()
    {

        return [
            'store_id'=>0,
            'legal_name' => '',
            'phone' => '',
            'country' => '',
            'city' => '',
            'street' => '',
            'house' => '',
            'apartment' => '',
            'zip' => '',
            'timezone' => '',
            'language' => '',
            'unit_system' => '',
            'weight_unit' => '',
            'orders_prefix' => '',
            'orders_suffix' => '',
            'currency' => 0,
        ];


    }
}
