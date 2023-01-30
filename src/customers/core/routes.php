<?php

declare(strict_types=1);

namespace Dreamax\Customers\Core;

$ctm_controller = 'Dreamax\Customers\Controllers\CustomerController';
$ctm_adm_controller = 'Dreamax\Customers\Controllers\CustomerAdminController';
$auth_controller = 'Dreamax\Auth\Controllers\AuthController';

return [
    ['GET', '/a/customers', [$ctm_controller, 'getCustomers']],
    ['GET', '/a/stores/{store_id:\d+}/customers', [$ctm_controller, 'getStoreCustomers']],
    ['GET', '/a/stores/{store_id:\d+}/customers/{customer_id:\d+}', [$ctm_controller, 'getStoreCustomersById']],
    ['POST', '/a/stores/{store_id:\d+}/customers', [$ctm_controller, 'addStoreCustomer']],
    ['PUT', '/a/stores/{store_id:\d+}/customers/{customer_id:\d+}', [$ctm_adm_controller, 'updateCustomer']],
    ['DELETE', '/a/stores/{store_id:\d+}/customers/{customer_id:\d+}', [$ctm_controller, 'deleteStoreCustomer']],
    
    ['POST', '/account/login', [$auth_controller, 'loginUser', 1]],
    // ['GET', '/account/address', [$ctm_controller, 'getCustomerAddress']],
    ['GET', '/account/profile', [$ctm_controller, 'getCustomerProfile']],
    ['PUT', '/account/profile', [$ctm_controller, 'updateCustomerProfile']],
    ['POST', '/account/register', [$ctm_controller, 'customerSignup', 1]],
    // ['POST', '/account/orders', [$ctm_controller, 'addStoreCustomer']],
    
    // customer profile
    ['GET', '/stores/{store_id:\d+}/customers/{customer_id:\d+}', [$ctm_controller, 'getStoreCustomersById']],
    ['POST', '/stores/{store_id:\d+}/customers', [$ctm_controller, 'customerSignup']],
    ['PUT', '/stores/{store_id:\d+}/customers/{customer_id:\d+}', [$ctm_controller, 'updateCustomerProfile']],
    ['DELETE', '/stores/{store_id:\d+}/customers/{customer_id:\d+}', [$ctm_controller, 'deleteCustomerProfile']],
];