<?php

declare(strict_types=1);

namespace Dreamax\Orders\Core;

$orders_controller = 'Dreamax\Orders\Controllers\OrdersController';
$orders_adm_controller = 'Dreamax\Orders\Controllers\OrdersAdminController';

return [
    // order endpoints
    ['POST', '/checkout', [$orders_controller, 'createOrder', 1]],
    ['PUT', '/checkout/update/save_address', [$orders_controller, 'updateCustomerOrder', 1]],
    ['PUT', '/checkout/save', [$orders_controller, 'updateCustomerOrder', 1]],

    ['GET', '/stores/{store_id:\d+}/orders', [$orders_controller, 'getCustomerOrders']],
    //['GET', '/checkout', [$orders_controller, 'getOrder']],
    ['DELETE', '/stores/{store_id:\d+}/orders/{order_id:\d+}', [$orders_controller, 'deleteCustomerOrder']],

    // orders admin routes 
    ['GET', '/a/stores/{store_id:\d+}/orders', [$orders_adm_controller, 'getStoresOrders']],
    ['GET', '/a/stores/{store_id:\d+}/orders/{order_id:\d+}', [$orders_adm_controller, 'getOrder']],
    ['PUT', '/a/stores/{store_id:\d+}/orders/{order_id:\d+}', [$orders_adm_controller, 'updateOrder']],
    ['PUT', '/a/stores/{store_id:\d+}/orders/{order_id:\d+}/cart', [$orders_adm_controller, 'convertToCart']],
    ['DELETE', '/a/stores/{store_id:\d+}/orders/{order_id:\d+}', [$orders_adm_controller, 'deleteOrder']],
];
