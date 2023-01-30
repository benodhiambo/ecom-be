<?php

declare(strict_types=1);

namespace Dreamax\Core\Classes;

use DateTime;
use Doctrine\DBAL\DriverManager;
use Exception;

class Model
{
    private $db;
    public $now;
    public $user_id;
    public $helper;

    public function __construct(Database $db,Helper $helper)
    {
        $this->db = $db->getDB();
        $this->now = date("Y-m-d H:i:s", time());
        $this->helper = $helper;
        $this->user_id = $this->helper->getUserId();
    }

    public function getDB()
    {
        return $this->db;
    }

    public function getAll($table): array
    {
        try {
            $sql = 'SELECT * FROM ' . $table;
            $all_items = $this->db->fetchAllAssociative($sql);
        } catch (Exception $e) {
            $err = '<h3>Unable to get all items - Database Exception</h3>';
            throw new Exception($err . $e->getMessage());
        }
        return $all_items;
    }

    /**
     * Searches by exact value specified
     */
    public function getByField(string $table, string $field, $value)
    {
        try {
            $sql = "SELECT * FROM " . $table . " WHERE " . $field . " = ?";
            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(1, $value);
            $result = $stmt->executeQuery()->fetchAllAssociative();
            if (isset($result)) {
                return $result;
            }
            return false;
        } catch (Exception $e) {
            $err = '<h3>Unable to get items - Database Exception</h3>';
            throw new Exception($err . $e->getMessage());
        }
    }

    /**
     * Searches using the SQL wild card character
     */
    public function searchByField(string $table, string $field, $value)
    {
        try {
            $sql = "SELECT * FROM " . $table . " WHERE " . $field . " LIKE '%".$value."%'";
            $stmt = $this->db->prepare($sql);
            $result = $stmt->executeQuery()->fetchAllAssociative();

            if (isset($result)) {
                return $result;
            }
            return false;
        } catch (Exception $e) {
            $err = '<h3>Unable to get items - Database Exception</h3>';
            throw new Exception($err . $e->getMessage());
        }
    }


    public function add(string $table, array $data)
    {
        try {
            $this->db->insert($table, $data);
            return true;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function update(string $table, array $data, string $id)
    {
        $update = new DateTime('now');
        $updated_at = $update->format('Y-m-d H:i:s.u P');

        try {

            $this->db->update(
                $table,
                $data,
                array($id => $data[$id])
            );
        } catch (Exception $e) {
            $err = '<h3>Unable to Update Item - Database Exception</h3>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function delete(string $table, string $id_col, string $id): int
    {
        try {
            $affected_rows = $this->db->delete($table, array($id_col => $id));
            return $affected_rows;
        } catch (Exception $e) {
            $err = '<h3>Unable to Delete Item - Database Exception</h3>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function deleteByParams(string $table, $conditions): int
    {
        try {
            $affected_rows = $this->db->delete($table, $conditions);
            return $affected_rows;
        } catch (Exception $e) {
            $err = '<h3>Unable to Delete Item - Database Exception</h3>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getByParams(string $table, array $params)
    {
        try {

            //DriverManager::getConnection()->setAttribute(\PDO::ATTR_EMULATE_PREPARES, false);

            $fields = [];
            $attributes = (isset($params['attributes'])) ? $params['attributes'] : "*";

            $sql = "SELECT $attributes FROM " . $table;

            foreach ($params['fields'] as $key => $value) {

                if ($value==null) {

                    $fields[] = $key . " IS NULL ";

                } else {

                    $fields[] = $key . " = :" . $key;

                }
            }

            if (!empty($fields)) {
                $sql .= " WHERE " . implode(" AND ", $fields);
            }

            if (isset($params['order'])) {
                foreach ($params['order'] as $key => $value) {
                    $sql .= " ORDER BY $key $value";
                }
            }          

            if (isset($params['limit'])) {
                $sql .= " LIMIT " . $params['limit'];
            }

            $stmt = $this->db->prepare($sql);

            foreach ($params['fields'] as $key => $value) {
                $stmt->bindValue($key, $value);
            }

            $result = $stmt->executeQuery()->fetchAllAssociative();
            if (isset($result)) {
                return $result;
            }
            return false;
        } catch (Exception $e) {
            $err = '<h3>Unable to get items - Database Exception</h3>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateByParams(string $table, array $update_data, array $condition_data)
    {
        $update = new DateTime('now');
        $updated_at = $update->format('Y-m-d H:i:s.u P');
        try {
            $this->db->update(
                $table,
                $update_data,
                $condition_data
            );
            return true;
        } catch (Exception $e) {
            $err = '<h3>Unable to Update Item - Database Exception</h3>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getBySql(string $sql, array $params)
    {
        try {

            $stmt = $this->db->prepare($sql);

            foreach ($params as $key => $value) {
                $stmt->bindValue($key, $value);
            }

            $result = $stmt->executeQuery()->fetchAllAssociative();
            if (isset($result)) {
                return $result;
            }
            return false;
        } catch (Exception $e) {
            $err = '<h3>Unable to get items - Database Exception</h3>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function prepareLoggerData($data, $fields)
    {

        $logged_data = [];

        foreach ($fields as $field) {

            if (isset($data[$field])) {

                $logged_data[$field] = $data[$field];
            }
        }

        return $logged_data;
    }
}
