<?php

declare(strict_types=1);

namespace Dreamax\Categories\Core;

$cat_controller = 'Dreamax\Categories\Controllers\CategoriesController';
$prod_controller = 'Dreamax\Products\Controllers\ProductController';

return [
    ['GET', '/a/categories', [$cat_controller, 'getCategories']],
    ['POST', '/categories/products', [$prod_controller, 'getProductsByCategories',1]],
    ['POST', '/categories/products/filter', [$prod_controller, 'getFilteredProducts',1]],
    ['GET', '/a/stores/{store_id:\d+}/categories', [$cat_controller, 'getCategoriesByStoreId']],
    ['POST', '/a/stores/{store_id:\d+}/categories', [$cat_controller, 'addCategory']],
    ['POST', '/a/stores/{store_id:\d+}/categories/r', [$cat_controller, 'addCategoryR']],
    ['PUT', '/a/stores/{store_id:\d+}/categories', [$cat_controller, 'updateCategories']],
    ['GET', '/a/stores/{store_id:\d+}/categories/{category_id:\d+}', [$cat_controller, 'getCategory',1]],
    ['PUT', '/a/stores/{store_id:\d+}/categories/{category_id:\d+}', [$cat_controller, 'updateCategory']],
    ['DELETE', '/a/stores/{store_id:\d+}/categories/{category_id:\d+}', [$cat_controller, 'deleteCategory']],

];