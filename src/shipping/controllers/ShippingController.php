<?php

declare(strict_types=1);

namespace Dreamax\Shipping\Controllers;

use Dreamax\Core\Classes\Controller;
use Dreamax\Shipping\Models\ShippingModel;
use Dreamax\Stores\Models\StoreModel;
use Exception;
use Psr\Http\Message\ResponseInterface;

class ShippingController
{
    private $controller;
    private $model;
    protected $storesModel;
    protected $stores_list;

    public function __construct(Controller $controller, ShippingModel $model, StoreModel $storesModel)
    {
        $this->controller = $controller;
        $this->model = $model;
        $this->storesModel = $storesModel;


        $stores_list = [];
        $stores = $this->storesModel->getStores($this->controller->user_id);
        foreach ($stores as $store) {
            $stores_list[] = $store['store_id'];
        }

        $this->stores_list = $stores_list;


    }


    public function checkShippingOwnership($shipping_id)
    {
        $shipping = $this->model->getShippingById($shipping_id);


        if (empty($shipping) || !in_array($shipping[0]['store_id'], $this->stores_list)) {
            $validated = false;

        } else {

            $validated = true;

        }


        return $validated;


    }


    public function getShippings(): ResponseInterface
    {

        $stores_ids = implode(",", $this->stores_list);

        $shippings = $this->model->getShippings($stores_ids);
        $data = ['shippings' => $shippings];
        return $this->controller->setResponse($data);


    }

    public function getShippingById($cdata): ResponseInterface
    {

        $validated = $this->checkShippingOwnership($cdata['shipping_id']);

        if ($validated == false) {
            $data = [
                'error' => 'Shipping is not belong to account or Does not exist'
            ];

        } else {

            $data = [
                'shippings' => $this->model->getShippingById($cdata['shipping_id'])
            ];

        }


        return $this->controller->setResponse($data);


    }


    public function addShipping(): ResponseInterface
    {
        try {
            $post_data = $this->controller->getRequest()->getBody()->getContents();
            $data = json_decode($post_data, true);
            $shipping = $this->model->addShipping($data);

            $data = [
                'success' => 'Shipping added successfully',
                'shippings' => $shipping
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }

    }

    public function updateShipping($cdata): ResponseInterface
    {
        try {
            $validated = $this->checkShippingOwnership($cdata['shipping_id']);

            if ($validated == false) {
                $data = [
                    'error' => 'Shipping is not belong to account or Does not exist'
                ];

            } else {

                $post_data = $this->controller->getRequest()->getBody()->getContents();
                $data = json_decode($post_data, true);
                $shipping = $this->model->updateShipping($data);

                $data = [
                    'success' => 'Shipping updated successfully',
                    'shippings' => $shipping
                ];

            }

            return $this->controller->setResponse($data);

        } catch (Exception $e) {

            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }

    }


    public function deleteShipping(array $cdata)
    {
        try {


            $this->model->deleteShipping((int)$cdata['shipping_id']);

            $data = ['success' => 'Shipping Deleted successfully'];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Shipping Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }


}
