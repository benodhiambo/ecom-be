<?php

declare(strict_types=1);

namespace Dreamax\Shipping\Models;

use Dreamax\Core\Classes\Model;
use Exception;


class ShippingRulesModel
{
    private $model;
    private $main_tbl = 'shipping_rules';

    private  $now;

    public function __construct(Model $model)
    {
        $this->model = $model;
        $this->now = date("Y-m-d H:i:s", time());
    }

    public function getShippingsRules($shipping_ids)
    {

        try {

            if ($shipping_ids!='') {

                $sql = "SELECT 
                        * 
                    FROM 
                        $this->main_tbl 
                    WHERE 
                      shipping_id in (:shipping_ids)
                      AND 
                      deleted = 0
                      ";

                $rules = $this->model->getBySql($sql, ['shipping_ids' => $shipping_ids]);

                foreach($rules as $key=>$value) {

                    unset(
                        $rules[$key]['created_at'],
                        $rules[$key]['deleted']
                    );

                }

            } else {

                $rules = [];

            }

            return $rules;

        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

    public function getShippingRuleById($rule_id)
    {

        try {

            $params = [
                'fields' => array(
                    'rule_id' => $rule_id,
                    'deleted' => "0"
                )
            ];

            $rules = $this->model->getByParams($this->main_tbl, $params);

            return $rules;

        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }


    public function addShippingRule(array $data)
    {
        try {

            $rule = $this->shippingRuleDataToArray($data);

            $validation = $this->model->getByField($this->main_tbl,'name',$rule['name']);

            if (empty($validation)) {

                unset($rule['rule_id']);

                $this->model->add($this->main_tbl, $rule);

                $params = [
                    'fields' => [
                        'name' => $rule['name']
                    ],
                    'order' => [
                        'rule_id' => 'DESC'
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


    public function updateShippingRule(array $data)
    {
        try {

            $rule = $this->shippingRuleDataToArray($data);

            $conditions = [
                'rule_id' => $rule['rule_id'],
                'deleted' => '0'
            ];


            $this->model->updateByParams($this->main_tbl,$rule,$conditions);

            return $this->getShippingRuleById($rule['rule_id']);


        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }



    public function shippingRuleDataToArray(array $base)
    {

        $structure = $this->shippingRuleDataArray();
        foreach($structure as $key=>$value) {

            if (isset($base[$key])) {

                $structure[$key] = $base[$key];

            }

        }

        $structure['updated_at'] = $this->model->now;

        return $structure;
    }

    public function shippingRuleDataArray()
    {

        return [
            'rule_id' => '',
            'name' => '',
            'shipping_id' => '',
            'country'=>'',
            'description'=>'',
            'price'=>'',
            'free_from'=>'',
            'deleted'=>'',
            'status' => 0,
        ];


    }

    public function deleteShippingRule(int $rule_id)
    {
        try {
            // get sore_user_id
            $params = [
                'fields' => [
                    'rule_id' => $rule_id,
                ]
            ];
            $result = $this->model->getByParams($this->main_tbl, $params);

            if (!empty($result)) {
                $data = [
                    'deleted' => 2,
                ];
                $conditions = [
                    'rule_id' => $result[0]['rule_id'],
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

}
