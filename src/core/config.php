<?php

declare(strict_types=1);

namespace Dreamax\Core;

return [
    'env' => 'dev',
    'host' => 'http://localhost',
    'base_path' => '/apps/dmx/dev/ecombackend/backend/',
    'app_headers' => [
        'Access-Control-Allow-Origin' => '*',
        'Access-Control-Allow-Headers' => '*',
        'Content-Type' => 'application/json; charset=UTF-8',
        'Access-Control-Allow-Methods' => 'OPTIONS,GET,POST,PUT,DELETE',
        'Access-Control-Allow-Headers' => 'Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With',
        'X-App-Name' => 'Dreamax Application'
    ],
    'token' => [
        'key' => "DREAMAX_KEY",
        'issuer' => "dreamx_ecom", // 
        'audience' => "THE_AUDIENCE",
        'issue_date' => time(), // issued at
        'expire_after' => 20000, // tokenexpiry time in seconds
        
    ],
    'api' => 'api/v1',
    'db' => [
        'dbname' => 'td_ecom',
        'user' => 'dev',
        'password' => '123',
        'host' => 'localhost',
        'port' => '3306',
        'driver' => 'pdo_mysql',
    ],
    'modules' => [
        'home', 
        'core', 
        'auth', 
        'users', 
        'products',
        'menus', 
        'orders',
        'pages', 
        'carts', 
        'stores',
        'customers', 
        'categories',
        'shipping',
        'domains'
    ],
    // App Timezone
    'tz' => 'Asia/Jerusalem'
];
