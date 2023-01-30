<?php

declare(strict_types=1);

namespace Dreamax\Menus\Core;

$menus_controller = 'Dreamax\Menus\Controllers\MenusController';

return [
    ['GET', '/a/menus', [$menus_controller, 'getMenus']],
    ['GET', '/a/stores/{store_id:\d+}/menus', [$menus_controller, 'getMenusByStoreId']],
    ['GET', '/a/stores/{store_id:\d+}/menus/{menu_id:\d+}', [$menus_controller, 'getMenuById']],
    ['GET', '/stores/{store_id:\d+}/menus', [$menus_controller, 'getCustomerMenus']],
    ['POST', '/a/stores/{store_id:\d+}/menus', [$menus_controller, 'addMenu']],
    ['PUT', '/a/stores/{store_id:\d+}/menus/{menu_id:\d+}', [$menus_controller, 'updateMenu']],
    ['PUT', '/a/stores/{store_id:\d+}/menus', [$menus_controller, 'updateMenu']],
    ['DELETE', '/a/stores/{store_id:\d+}/menus/{menu_id:\d+}', [$menus_controller, 'deleteMenu']],
];