<?php

declare(strict_types=1);

namespace Dreamax\Shipping\Controllers;

use Dreamax\Core\Classes\Controller;

use Dreamax\Shipping\Models\ShippingModel;
use Dreamax\Shipping\Models\ShippingRulesModel;
use Dreamax\Stores\Models\StoreModel;
use Exception;
use Psr\Http\Message\ResponseInterface;

class ShippingRuleController extends ShippingController
{
    private $controller;
    private $model;
    private $shipping_model;

    public function __construct(Controller $controller, ShippingRulesModel $model , ShippingModel $shipping_model, StoreModel $storeModel)
    {
        $this->controller = $controller;
        $this->model = $model;
        $this->shipping_model = $shipping_model;

        parent::__construct($controller,$shipping_model,$storeModel);

    }


    public function checkShippingRuleOwnership($rule_id)
    {
        $validated = false;

        $rule = $this->model->getShippingRuleById($rule_id);


        if (isset($rule[0]))
        {

            $stores_ids = implode(",", $this->stores_list);

            $shippings = $this->shipping_model->getShippings($stores_ids);

            foreach($shippings as $shipping) {

                if ($shipping['shipping_id']==$rule['shipping_id']) {

                    $validated = true;

                }

            }

        }


        return $validated;



    }


    public function getShippingsRules(): ResponseInterface
    {

        $stores_ids = implode(",", $this->stores_list);

        $shippings = $this->shipping_model->getShippings($stores_ids);

        $shippings_list = [];

        foreach($shippings as $shipping) {

            $shippings_list[] = $shipping['shipping_id'];

        }

        $shippings_list = implode(",",$shippings_list);

        $shippings_rules = $this->model->getShippingsRules($shippings_list);

        $data = [
            'rules'=>$shippings_rules
        ];

        return $this->controller->setResponse($data);


    }

    public function getShippingRuleById($cdata): ResponseInterface
    {

        $validated = $this->checkShippingRuleOwnership($cdata['rule_id']);

        if ($validated==false)
        {
            $data = [
                'error' => 'Shipping Rule is not belong to account or Does not exist'
            ];

        } else {

            $rules = $this->model->getShippingRuleById($cdata['rule_id']);

            $data = [
                'rules' => $rules
            ];

        }


        return $this->controller->setResponse($data);


    }


    public function addShippingRule($cdata): ResponseInterface
    {
        try {


            $shipping = $this->shipping_model->getShippingById($cdata['shipping_id']);

            if (!in_array($shipping[0]['store_id'],$this->stores_list)) {

                $data = [
                    'error' => 'Store doest not belong to account',
                ];

            } else {

                $post_data = $this->controller->getRequest()->getBody()->getContents();
                $data = json_decode($post_data, true);
                $shipping = $this->model->addShippingRule($data['shipping'][0]);

                $data = [
                    'success' => 'Shipping added successfully',
                    'rules' => $shipping
                ];

            }

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }

    }

    public function updateShippingRule($cdata): ResponseInterface
    {
        try {

            $validated = $this->checkShippingRuleOwnership($cdata['rule_id']);

            if ($validated==false)
            {
                $data = [
                    'error' => 'Shipping Rule is not belong to account or Does not exist'
                ];

            } else {

                $post_data = $this->controller->getRequest()->getBody()->getContents();
                $data = json_decode($post_data, true);
                $rules = $this->model->updateShippingRule($data['shipping'][0]);

                $data = [
                    'success' => 'Shipping Rule updated successfully',
                    'rules' => $rules
                ];

            }

            return $this->controller->setResponse($data);

        } catch (Exception $e) {

            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }

    }


    public function deleteShippingRule(array $cdata)
    {
        try {
            $this->model->deleteShippingRule((int)$cdata['rule_id']);

            $data = ['success' => 'Shipping Rule Deleted successfully'];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Shipping Rule Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }
}
