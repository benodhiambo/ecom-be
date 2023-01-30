<?php

declare(strict_types=1);

namespace Dreamax\Core\Classes;

use Doctrine\DBAL\DriverManager;

class Database
{
    protected $db;

    public function __construct()
    {
        $this->db = $this->setConn();
    }

    public function setConn()
    {
        try {
            $config = require __DIR__ . '/../config.php';
            return DriverManager::getConnection($config['db']);
        } catch (\Exception $e) {
            echo '<h3>Get Connection - Database Exception</h3><br><br>';
            print_r($e->getMessage());
        }
    }

    public function getDb()
    {
        return $this->db;
    }
}
