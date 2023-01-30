<?php

declare(strict_types=1);

namespace Dreamax\Stores\Core;

$cart_controller = 'Dreamax\Carts\Controllers\CartController';
$cart_adm_controller = 'Dreamax\Carts\Controllers\CartAdminController';


return [
    // cart endpoints
    ['POST', '/cart', [$cart_controller, 'getCart', 1]],
    ['POST', '/account/carts', [$cart_controller, 'getCustomerCarts']],
    ['POST', '/cart/create', [$cart_controller, 'createCart', 1]],
    ['PUT', '/cart/update', [$cart_controller, 'updateCart', 1]],
    ['DELETE', '/cart/{cart_id:\d+}', [$cart_controller, 'deleteCart', 1]],

    // cart items end points
    ['POST', '/cart/{product_id:\d+}/add', [$cart_controller, 'addItemToCart', 1]],
    ['PUT', '/cart/{product_id:\d+}/update', [$cart_controller, 'updateCartItemQuantity', 1]],
    ['POST', '/cart/{product_id:\d+}/remove', [$cart_controller, 'removeItemFromCart', 1]],

    // cart admin endpoints
    ['GET', '/a/stores/{store_id:\d+}/carts', [$cart_adm_controller, 'getStoreCarts']],
    ['DELETE', '/a/stores/{store_id:\d+}/carts/{cart_id:\d+}', [$cart_adm_controller, 'deleteCart']],

];
