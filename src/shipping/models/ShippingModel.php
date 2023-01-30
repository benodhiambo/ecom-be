<?php

declare(strict_types=1);

namespace Dreamax\Shipping\Models;

use Dreamax\Core\Classes\Model;
use Exception;


class ShippingModel
{
    private $model;
    private $main_tbl = 'shipping';

    private  $now;

    public function __construct(Model $model)
    {
        $this->model = $model;
        $this->now = date("Y-m-d H:i:s", time());
    }

    public function getShippings($stores_ids)
    {

        try {

            if ($stores_ids!='') {

                $sql = "SELECT 
                        shipping_id,store_id,name,status 
                    FROM 
                        $this->main_tbl 
                    WHERE 
                      store_id in (:stores_ids)
                      AND 
                      deleted = 0
                      ";

                $shippings = $this->model->getBySql($sql, ['stores_ids' => $stores_ids]);

            } else {

                $shippings = [];

            }

            return $shippings;

        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

    public function getShippingById($shipping_id)
    {

        try {

            $params = [
                'fields' => array(
                    'shipping_id' => $shipping_id,
                    'deleted' => '0'
                )
            ];

            $shipping = $this->model->getByParams($this->main_tbl, $params);

            return $shipping;

        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }


    public function addShipping(array $data)
    {
        try {

            $shipping = $this->shippingDataToArray($data['shipping'][0]);


            $validation = $this->model->getByField($this->main_tbl,'name',$shipping['name']);

            if (empty($validation)) {

                unset($shipping['shipping_id']);

                $this->model->add($this->main_tbl, $shipping);

                $params = [
                    'fields' => [
                        'name' => $shipping['name']
                    ],
                    'order' => [
                        'shipping_id' => 'DESC'
                    ],
                    'limit' => 1
                ];

                return $this->model->getByParams($this->main_tbl,$params);

            }
            
            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }


    public function updateShipping(array $data)
    {
        try {

            $shipping = $this->shippingDataToArray($data['shipping'][0]);

            $conditions = [
                'shipping_id' => $shipping['shipping_id'],
                'deleted' => '0'
            ];


            $this->model->updateByParams($this->main_tbl,$shipping,$conditions);

            return $this->getShippingById($shipping['shipping_id']);


        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

        

    public function deleteShipping(int $shipping_id)
    {
        try {
            // get sore_user_id
            $params = [
                'fields' => [
                    'shipping_id' => $shipping_id,
                    
                ]
            ];
            $result = $this->model->getByParams($this->main_tbl, $params);

            if (!empty($result)) {
                $data = [
                    'deleted' => 2,
                ];
                $conditions = [
                    'shipping_id' => $result[0]['shipping_id'],
                ];
                $this->model->updateByParams($this->main_tbl, $data, $conditions);
                return true;
            } else {
                // false means the record does not exist
                return false;
            }
            
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function shippingDataToArray(array $base)
    {
        $structure = $this->shippingDataArray();

        foreach($structure as $key=>$value) {
            if (isset($base[$key])) {
                $structure[$key] = $base[$key];
            }

        }

        $structure['updated_at'] = $this->model->now;

        return $structure;
    }

    public function shippingDataArray()
    {

        return [
            'shipping_id'=>'',
            'store_id' => '',
            'name' => '',
            'status' => 0,
        ];


    }

}
