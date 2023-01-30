<?php

declare(strict_types=1);

namespace Dreamax\Auth\Models;

use Dreamax\Core\Classes\Model;
use Exception;

/**
 * Handles Authentication
 */
class AuthModel
{
    private $model;
    private $table = 'users';

    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    public function signInUser($credentials)
    {
        try {
            $user_details = $this->model->getByField($this->table, 'user_name', $credentials['username']);
            if (password_verify($credentials['password'], $user_details[0]['password'])) {
                /* The password is correct. */
                return $user_details[0];
            }
            return false;
        } catch (Exception $e) {
            $err = '<h3>Unable to Sign User - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getUserDetails($user_id)
    {
        try {
            $user_details = $this->model->getByField($this->table, 'user_id', $user_id);
            return $user_details[0];
        } catch (Exception $e) {
            $err = '<h3>Unable to get user details - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function changePassword($data, $user_id)
    {
        $details = $this->model->getByField($this->table, 'user_id', $user_id);

        if (!password_verify($data['current_password'], $details[0]['password'])) {
            throw new Exception("Password do not match");
        }

        $updateData = [
            'password' => password_hash($data['new_password'], PASSWORD_DEFAULT)
        ];

        return $this->model->updateByParams($this->table, $updateData, [
            'user_id' => $user_id
        ]);
    }
}
