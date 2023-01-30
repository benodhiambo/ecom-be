<?php

declare(strict_types=1);

namespace Dreamax\Domains\Controllers;

use Dreamax\Core\Classes\Controller;
use Dreamax\Domains\Models\DomainsModel;
use Dreamax\Stores\Models\StoreModel;
use Exception;
use Psr\Http\Message\ResponseInterface;

class DomainsController
{
    private $controller;
    private $model;
    private $storesModel;
    private $stores_list;

    public function __construct(Controller $controller, DomainsModel $model , StoreModel $storesModel)
    {
        $this->controller = $controller;
        $this->model = $model;
        $this->storesModel = $storesModel;


        $stores_list = [];
        $stores = $this->storesModel->getStores($this->controller->user_id);
        foreach($stores as $store) {
            $stores_list[] = $store['store_id'];
        }

        $this->stores_list = $stores_list;


    }



    public function getDomains(): ResponseInterface
    {


        $domains = $this->model->getDomains($this->stores_list);
        $data = ['domains'=>$domains];
        return $this->controller->setResponse($data);


    }

    public function getDomainById($cdata): ResponseInterface
    {

        $validated = $this->checkDomainOwnership($cdata['domain_id']);

        if ($validated==false)
        {
            $data = [
                'error' => 'Domain is not belong to user or Does not exist'
            ];

        } else {

            $data = [
                'domains'=>$this->model->getDomainById($cdata['domain_id'])
            ];

        }


        return $this->controller->setResponse($data);


    }

    public function checkDomainOwnership($domain_id)
    {

        $domain = $this->model->getDomainById($domain_id);

        if (empty($domain) || !in_array($domain['store_id'],$this->stores_list))
        {
            $validated = false;

        } else {

            $validated = true;

        }


        return $validated;



    }

    public function addDomain(): ResponseInterface
    {
        try {


            $post_data = $this->controller->helper->getRequestJSON($this->controller->getRequest());
            $domain = $this->model->addDomain((array)$post_data);

            $data = [
                'success' => 'Domain added successfully',
                'domains'=> $domain
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }

    }

    public function updateDomain($cdata): ResponseInterface
    {
        try {

            $validated = $this->checkDomainOwnership($cdata['domain_id']);

            if ($validated==false)
            {
                $data = [
                    'error' => 'Domain is not belong to user or Does not exist'
                ];

            } else {

                $post_data = $this->controller->helper->getRequestJSON($this->controller->getRequest());
                $domain = $this->model->updateDomain((array)$post_data);

                $data = [
                    'success' => 'Domain updated successfully',
                    'domains' => $domain
                ];

            }

            return $this->controller->setResponse($data);

        } catch (Exception $e) {

            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }

    }

    public function validateDomainDNS($cdata) : ResponseInterface
    {
        return $this->updateDomain($cdata);

    }







}
