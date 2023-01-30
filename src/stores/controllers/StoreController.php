<?php

declare(strict_types=1);

namespace Dreamax\Stores\Controllers;

use Dreamax\Core\Classes\Controller;
use Dreamax\Stores\Models\StoreModel;
use Exception;
use Psr\Http\Message\ResponseInterface;

class StoreController
{
    private $controller;
    private $model;

    public function __construct(Controller $controller, StoreModel $model)
    {
        $this->controller = $controller;
        $this->model = $model;

//        $cities = '../../../../../../cur.csv';
//        $counter = 0;
//        if (($handle = fopen($cities, "r")) !== FALSE) {
//            while (($dataRow = fgetcsv($handle, 1000, "\t")) !== FALSE) {
//
//                if ($counter == 0) {
//                    $counter++;
//                    continue;
//                }
//
//                var_dump($dataRow);
//
//            }
//        }

    }



    public function getStores(): ResponseInterface
    {

        $stores = $this->model->getStores($this->controller->user_id);
        $data = ['stores'=>$stores];
        return $this->controller->setResponse($data);


    }

    public function getStore($storeArray = array()): ResponseInterface
    {

        return $this->controller->setResponse(['stores'=>$this->getStoreInfo($storeArray)]);



    }

    public function getStoreInfo($storeArray = array())
    {
        $store = $this->model->getStoresById($storeArray['store_id'],$this->controller->user_id);


        if (empty($store) || $store['user_id']!=$this->controller->user_id)
        {
            $data = [
                'error' => 'Store does not exist!'
            ];

        } else {

            $settings  = $this->model->getStoreSettings($storeArray['store_id']);

            if (empty($settings))
            {
                $settings = $this->model->settingsDataArray();
            }


            return [
                'store'=>$store,
                'settings'=>$settings,
                'currencies'=> $this->model->getStoreCurrencies($storeArray['store_id']),
            ];

        }
    }

    public function createStore(): ResponseInterface
    {
        try {

            $post_data = $this->controller->getPostData();
            $id = $this->model->createStore($post_data['stores'][0]);

            $new_store = $this->getStoreInfo(['store_id' => $id]);

            $data = ['success' => 'Store Created successfully', 'stores'=>$new_store];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }

    }

    public function updateStore(array $id) : ResponseInterface
    {
        try {
            $post_data = $this->controller->getPostData();

            $this->model->updateStore($post_data['stores'][0], $id['store_id']);
            

            $store = $this->getStoreInfo(['store_id' => $id['store_id']]);

            $data = ['success' => 'Store updated successfully', 'stores'=>$store];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function getStoreSettings(array $id)
    {
        try {
            $settings = $this->model->getStoreSettings($id['store_id']);
            $data = [
                'settings' => $settings
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function updateStoreSettings(array $id)
    {
        try {
            // get data from php://input
            $post_data = json_decode(
                $this->controller->getRequest()->getBody()->getContents(),
                true
            );
            if (empty($post_data)) {
                //get data from post
                $post_data = $this->controller->getRequest()->getParsedBody();
            } 

            $data = (array)$post_data;
            $data['settings']['store_id'] = $id['store_id'];
            $this->model->updateStoreSettings($data, $id['store_setting_id']);
            
            $data = ['success' => 'Store Settings updated successfully'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function getCurrencies()
    {
        try {
            $currencies = $this->controller->helper->getCurrencies();

            $list = [];

            foreach ($currencies as $code => $name) {
                $curr = [
                    'code' => $code,
                    'name' => $name
                ];

                $list[] = $curr;
            }
            $data = ['currencies' => $list];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function getCountries()
    {
        try {
            $countries = $this->controller->helper->getCountries();
            $data = ['countries' => $countries];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function getLanguages()
    {
        try {
            $languages = $this->controller->helper->getLanguages();

            $list = [];
            foreach ($languages as $lang_code => $lang_name) {
                $lang = [
                    'lang_code' => $lang_code,
                    'lang_name' => $lang_name
                ];

                $list[] = $lang;

            }
            $data = ['languages' => $list];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function getTimezones()
    {
        try {
            $timezones = $this->controller->helper->getTimezones();

            $list = [];
            foreach ($timezones as $zone_code => $zone_name) {
                $zone = [
                    'zone_code' => $zone_code,
                    'zone_name' => $zone_name
                ];

                $list[] = $zone;

            }
            $data = ['timezones' => $list];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function getStoreCurrencies(array $id)
    {
        try {
            $currencies = $this->model->getStoreCurrencies($id['store_id']);
            $data = ['currencies' => $currencies];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function addStoreCurrencies(array $id)
    {
        try {
            // get data from php://input
            $post_data = json_decode(
                $this->controller->getRequest()->getBody()->getContents(),
                true
            );
            if (empty($post_data)) {
                //get data from post
                $post_data = $this->controller->getRequest()->getParsedBody();
            } 
            $this->model->addStoreCurrencies((array)$post_data, $id['store_id']);

            $data = ['success' => 'Store Currency added successfully'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function updateStoreCurrency(array $id)
    {
        try {
            // get data from php://input
            $post_data = json_decode(
                $this->controller->getRequest()->getBody()->getContents(),
                true
            );
            if (empty($post_data)) {
                //get data from post
                $post_data = $this->controller->getRequest()->getParsedBody();
            } 

            $this->model->updateStoreCurrency((array)$post_data['currencies'][0], $id['currency_id']);

            $data = ['success' => 'Store Currency updated successfully'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function removeStoreCurrency(array $id)
    {
        try {
            // get data from php://input
            $this->model->removeStoreCurrency($id['currency_id']);

            $data = ['success' => 'Store Currency removed successfully'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function verifyStoreOwner($store_id) {

        $store = $this->model->getStoresById($store_id,$this->controller->user_id);


        if (empty($store) || $store['user_id']!=$this->controller->user_id)
        {
            return new Exception('Store is not exist', 1);

        } else {

            return true;
        }

    }



}
