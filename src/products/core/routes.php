<?php

declare(strict_types=1);

namespace Dreamax\Products\Core;

$prd_controller = 'Dreamax\Products\Controllers\ProductController';

return [
    // products
    ['GET', '/products/all', [$prd_controller, 'getAllProducts', 1]],
    ['GET', '/products', [$prd_controller, 'getProducts']],
    ['POST', '/products', [$prd_controller, 'saveProduct']],
    ['POST', '/products/images', [$prd_controller, 'saveProductImages', 1]],
    ['PUT', '/products/{product_id:\d+}', [$prd_controller, 'saveProduct']],
    ['GET', '/products/{product_id:\d+}', [$prd_controller, 'getProduct',1]],
    ['DELETE', '/products/{product_id:\d+}', [$prd_controller, 'removeProduct']],

    // product variants
    ['GET', '/products/{product_id:\d+}/variants', [$prd_controller, 'getProductVariants']],
    ['POST', '/products/{product_id:\d+}/variants', [$prd_controller, 'addProductVariants']],
    ['GET', '/products/{product_id:\d+}/variants/{variant_id:\d+}', [$prd_controller, 'getProductVariant']],
    ['PUT', '/products/{product_id:\d+}/variants/{variant_id:\d+}', [$prd_controller, 'updateProductVariantDetails']],
    ['DELETE', '/products/{product_id:\d+}/variants/{variant_id:\d+}', [$prd_controller, 'removeProductDetails']],

    // product categories
    ['GET', '/products/categories', [$prd_controller, 'getProductCategories']],
    ['POST', '/products/categories', [$prd_controller, 'addProductCategory']],
    ['GET', '/products/categories/{category_id:\d+}', [$prd_controller, 'getProductCategoryDetails']],
    ['PUT', '/products/categories/{category_id:\d+}', [$prd_controller, 'updateProductCategoryDetails']],
    ['DELETE', '/products/categories/{category_id:\d+}', [$prd_controller, 'removeProductCategory']],

    // product tags
    ['GET', '/products/tag/{tag_name}', [$prd_controller, 'getTag']],
];