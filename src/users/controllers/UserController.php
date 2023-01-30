<?php

declare(strict_types=1);

namespace Dreamax\User\Controllers;

use Dreamax\Auth\Controllers\AuthController;
use Dreamax\User\Models\UserModel;
use Dreamax\Core\Classes\Controller;
use Exception;
use Psr\Http\Message\ResponseInterface;

class UserController
{
    private $controller;
    private $auth_controller;
    private $model;

    public function __construct(Controller $controller, AuthController $auth_controller, UserModel $model)
    {
        $this->controller = $controller;
        $this->model = $model;
        $this->auth_controller = $auth_controller;
    }

    public function getUser(array $id): ResponseInterface
    {
        try {
            $user_data = $this->model->getUserDetails($id['user_id']);
            $user_data['countries'] = $this->controller->helper->getCountries();
            $data = ['user' => $user_data];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    public function getUsers(): ResponseInterface
    {
        try {
            $user_data = $this->model->getAllUsers();
            $user_data['countries'] = $this->controller->helper->getCountries();
            $data = ['users' => $user_data];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    /**
     * Handles registration POST requests
     * - A 'POST' request takes the registration data from the
     * request and sends it to the authentication model 
     * for processing and persistence
     */
    public function registerUser(): ResponseInterface
    {
        // get POST data
        $reg_data = $this->controller->getRequest()->getBody()->getContents();
        $data = (array)json_decode($reg_data);

        try {
            $this->model->registerUser((array)$data);

            $info = (array)$data;
            $login_data = [
                'user_name' => $info['username'],
                'email' => $info['email']
            ];
            $user_info = $this->model->getUserByParams($login_data);

            $token = $this->auth_controller->processToken($user_info[0]);
            $data = [
                'success' => 'User added successfully',
                'jwt' => $token['jwt'],
                'user' => $token['user']
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Registration Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }

    /**
     * Handles updating of user records
     * @param string $user_id
     * @return \Psr\Http\Message\ResponseInterface
     */
    public function editUser(array $user_id): ResponseInterface
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

    /**
     * Handles deletion of user records
     * @param string $user_id
     * @return void
     */
    public function deleteUser($id)
    {
        // TODO ... check if the $user_id
        // is of the current logged in user
        if ($id['user_id'] === $GLOBALS['sess']['user_id']) {
            $data = ['error' => 'Cannot delete your own account'];
            return $this->controller->setResponse($data);
        }

        try {
            // TODO ... Check if any record was deleted
            $this->model->deleteUser($id['user_id']);
            $data = ['success' => 'User Deleted successfully'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'User Delete Error - ' . $e->getMessage()];
            return $this->controller->setResponse($data);
        }
    }
}
