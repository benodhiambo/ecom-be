<?php

declare(strict_types=1);

namespace Dreamax\User\Controllers;

use Dreamax\Core\Classes\Controller;
use Dreamax\User\Models\AdminModel;
use Exception;
use Psr\Http\Message\ResponseInterface;

class AdminController
{
    private $controller;
    private $model;

    public function __construct(Controller $controller, AdminModel $model)
    {
        $this->controller = $controller;
        $this->model = $model;
    }

    public function showAdminHomePage(): ResponseInterface
    {
        try {
            return $this->controller->setResponse('admin');
        } catch (Exception $e) {
            $data = ['error' => 'Cart Details Error - ' . $e->getMessage()];
            return $this->controller->setResponse('cart_details', $data);
        }
    }

    public function updateAdminProfile()
    {
        // get POST data
        $data = $this->controller->getRequest()->getParsedBody();

        try {
            $this->model->updateUserDetails($data);
            $data = ['success' => 'User Updated successfully'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'User Update Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

}
