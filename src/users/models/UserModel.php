<?php

declare(strict_types=1);

namespace Dreamax\User\Models;

use Dreamax\Core\Classes\Model;
use Exception;

/**
 * Handles Authentication
 */
class UserModel
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

    public function getUserByParams(array $user_data)
    {
        try {
            $param = [
                'fields' => $user_data
            ];
            return $this->model->getByParams($this->table, $param);
        } catch (Exception $e) {
            $err = '<h3>Unable to Get User - Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    /**
     * New user Registration
     */
    public function registerUser($user_data): ?bool
    {
        $user_data = $this->userDataToArray($user_data);

        foreach ($user_data as $key => $value) {
            if (empty($value) || $value === '') {
                unset($user_data[$key]);
            }
        }
        
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
        //$dob = date("Y-m-d", strtotime($user_data['date_of_birth']));        
        $updated = date("Y-m-d H:i:s", time());
        
        $user = array(
            'first_name' => isset($user_data['first_name']) ? $user_data['first_name'] : null,
            'last_name' => isset($user_data['last_name']) ? $user_data['last_name'] : null,
            'user_name' => $user_data['username'],
            'email' => $user_data['email'],
            'password' => password_hash($user_data['password'], PASSWORD_DEFAULT),
            'phone_number' => isset($user_data['phone_number']) ? $user_data['phone_number'] : null,
            'details' => isset($user_data['details']) ? $user_data['details'] : null,
            'date_of_birth' => isset($dob) ? $dob : null,
            'website' => isset($user_data['website']) ? $user_data['website'] : null,
            'country' => isset($user_data['country']) ? $user_data['country'] : null,
            'city' => isset($user_data['city']) ? $user_data['city'] : null,
            'occupation' => isset($user_data['occupation']) ? $user_data['occupation'] : null,
            'status' => isset($user_data['status']) ? $user_data['status'] : null,
            'birthplace' => isset($user_data['birthplace']) ? $user_data['birthplace'] : null,
            'interests' => isset($user_data['interests']) ? $user_data['interests'] : null,
            'recovery_email' => isset($user_data['recovery_email']) ? $user_data['city'] : null,
            'recovery_phone' => isset($user_data['recovery_phone']) ? $user_data['occupation'] : null,
            'sec_qtn_1' => isset($user_data['sec_qtn_1']) ? $user_data['sec_qtn_1'] : null,
            'sec_qtn_2' => isset($user_data['sec_qtn_2']) ? $user_data['sec_qtn_2'] : null,
            'sec_qtn_3' => isset($user_data['sec_qtn_3']) ? $user_data['sec_qtn_3'] : null,
            'postal_code' => isset($user_data['postal_code']) ? $user_data['postal_code'] : null,
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