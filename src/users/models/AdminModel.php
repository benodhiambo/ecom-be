<?php

declare(strict_types=1);

namespace Dreamax\User\Models;

use Dreamax\Core\Classes\Model;
use Exception;

/**
 * Handles Authentication
 */
class AdminModel
{
    private $model;
    private $table = 'users';

    /**
     * the column name of 
     * the id column
     */
    private $id = 'user_id';

    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    public function getAllUsers(): array
    {
        try {
            return $this->model->getAll($this->table);
        } catch (Exception $e) {
            $err = '<h3>Unable to Add User - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getUserDetails(string $user_id)
    {
        try {
            return $this->model->getByField($this->table, 'user_id', $user_id);
        } catch (Exception $e) {
            $err = '<h3>Unable to Add Customer - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    /**
     * New user Registration
     */
    public function registerUser($user_data): ?bool
    {
        $user_data = $this->userDataToArray($user_data);
        
        try {
            $this->model->add($this->table, $user_data);
            return true;
        } catch (Exception $e) {
            $err = '<h3>Unable to Add User - Database Exception</h3><br><br>';
            print_r($err . $e->getMessage()); die;
            throw new Exception($err . $e->getMessage());
        }
    }

    /**
     * handles the update of 
     * customer registration details
     */
    public function updateUserDetails($user_data)
    {
        $data = $this->userDataToArray($user_data);
        
        try {
            $this->model->update($this->table, $data, $this->id);
            return true;
        } catch (\Exception $e) {
            $err = '<h3>Unable to Update Customer Details - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    /**
     * This method converts the data array into one 
     * that matches the columns in the database
     */
    private function userDataToArray(array $user_data): array
    {
        $dob = date("Y-m-d", strtotime($user_data['date_of_birth']));        
        $updated = date("Y-m-d H:i:s", time());
        
        $user = array(
            'first_name' => $user_data['firstname'],
            'last_name' => $user_data['lastname'],
            'user_name' => $user_data['username'],
            'email' => $user_data['email'],
            'password' => password_hash($user_data['password'], PASSWORD_DEFAULT),
            'phone_number' => $user_data['phonenumber'],
            'details' => $user_data['details'],
            'date_of_birth' => $dob,
            'website' => $user_data['website'],
            'country' => $user_data['country'],
            'city' => $user_data['city'],
            'occupation' => $user_data['occupation'],
            'status' => $user_data['status'],
            'birthplace' => $user_data['birthplace'],
            'interests' => $user_data['interests'],
            'updated_at' => $updated
        );

        if (!isset($user_data['user_id'])) {
            // new database entry
            $created = date("Y-m-d H:i:s", time());
            $user['created_at'] = $created;
        } else {
            // updating user details
            $user['user_id'] = $user_data['user_id'];
            unset($user['password']);
        }
        return $user;
    }

    public function deleteUser($user_id): int
    {
        try {
            $affected_rows = $this->model->delete($this->table, $this->id, $user_id);
            return $affected_rows;
        } catch (\Exception $e) {
            $err = '<h3>Database Exception</h3><br>';
            throw new Exception($err . $e->getMessage());
        }
        return true;
    }

    public function customerExists($user_data): bool
    {
        $field = 'user_name';
        $value = $user_data['username'];
        try {
            $cust = $this->model->getByField($this->table, $field, $value);
        } catch (\Exception $e) {
            $err = '<h3>Database Exception</h3><br>';
            throw new Exception($err . $e->getMessage());
        }
        return true;
    }
}