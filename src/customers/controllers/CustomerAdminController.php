<?php

declare(strict_types=1);

namespace Dreamax\Customers\Controllers;

use Dreamax\Core\Classes\Controller;
use Dreamax\Customers\Models\CustomerModel;
use Dreamax\Stores\Controllers\StoreController;
use Exception;
use Psr\Http\Message\ResponseInterface;

class CustomerAdminController
{
    private $controller;
    private $model;
    private $storeController;

    public function __construct(Controller $controller, CustomerModel $model, StoreController $storeController)
    {
        $this->controller = $controller;
        $this->model = $model;
        $this->storeController = $storeController;
    }

    public function getCustomers(): ResponseInterface
    {
        try {
            $customers = $this->model->getCustomersByUserId((int)$this->controller->user_id);
            $data = ['customers' => $customers];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Customer Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function getStoreCustomers($id): ResponseInterface
    {
        try {
            $customers = $this->model->getStoreCustomers((int)$id['store_id']);
            $data = ['customers' => $customers];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Customer Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function getStoreCustomersByStatus(): ResponseInterface
    {
        try {
            $post_data = $this->controller->getRequest()->getParsedBody();
            $store_id = $post_data['store_id'];
            $customer_status = $post_data['status'];
            $data = $this->model->getStoreCustomers($store_id, $customer_status);
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Customer Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function getStoreCustomersById(array $id): ResponseInterface
    {
        try {
            $is_owner = $this->storeController->verifyStoreOwner($id['store_id']);

            if ($is_owner ===  true) {
                $customer_info = $this->model->getCustomerDetails($id['customer_id']);
                $data = [
                    'success' => 'Customer Data retrieved successfully',
                    'customers' => $customer_info
                ];
                return $this->controller->setResponse($data);
            } else {
                $data = [
                    'error' => 'Customer Not Available for this store'
                ];
                return $this->controller->setResponse($data, '', 'application/json', '404');
            }
        } catch (Exception $e) {
            $data = ['error' => 'Customer Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function addStoreCustomer(array $id): ResponseInterface
    {
        try {
            // store admin doing registration
            $is_owner = $this->storeController->verifyStoreOwner($id['store_id']);

            if ($is_owner === true) {
                try {
                    return $this->addCustomer($id);
                } catch (Exception $e) {
                    $data = ['error' => 'Customer Error - ' . $e->getMessage()];
                    return $this->controller->setResponse($data);
                }
            } else {
                $data = [
                    'error' => 'Operation Forbidden: User is not the store owner'
                ];
                return $this->controller->setResponse($data, '', 'application/json', '403');
            }
        } catch (Exception $e) {
            $data = ['error' => 'Customer Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    private function addCustomer(array $id)
    {
        try {
            $post_data = $this->controller->getRequest()->getBody()->getContents();
            $data = json_decode($post_data, true);
            $result = $this->model->addStoreCustomer($data);
            $data = [
                'success' => 'Customer Added successfully',
                'customers' => [
                    $result
                ]
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function updateCustomer(array $id)
    {
        try {
            $post_data = $this->controller->getRequest()->getBody()->getContents();
                $data = json_decode($post_data, true);
                $result = $this->model->updateStoreCustomer($data['customers'][0]);
                $data = [
                    'success' => 'Customer Updated successfully',
                    'customers' => $result
                ];
                return $this->controller->setResponse($data);
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function deleteStoreCustomer(array $cdata)
    {
        try {

            $this->storeController->verifyStoreOwner($cdata['store_id']);

            $this->model->deleteStoreCustomer((int)$cdata['store_id'], (int)$cdata['customer_id']);

            $data = ['success' => 'Customer Deleted successfully'];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Customer Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }
}
