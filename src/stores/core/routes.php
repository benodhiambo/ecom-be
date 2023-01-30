<?php

declare(strict_types=1);

namespace Dreamax\Stores\Core;

$stores_controller = 'Dreamax\Stores\Controllers\StoreController';
$products_controller = 'Dreamax\Products\Controllers\ProductController';

return [
    ['GET', '/stores', [$stores_controller, 'getStores']],
    ['POST', '/stores', [$stores_controller, 'createStore']],
    ['GET', '/stores/{store_id:\d+}', [$stores_controller, 'getStore']],
    ['PUT', '/stores/{store_id:\d+}', [$stores_controller, 'updateStore']],
    ['DELETE', '/stores/{store_id:\d+}', [$stores_controller, 'deleteStore']],

    // store settings
    ['GET', '/stores/{store_id:\d+}/settings', [$stores_controller, 'getStoreSettings']],
    ['PUT', '/stores/{store_id:\d+}/settings/{store_setting_id:\d+}', [$stores_controller, 'updateStoreSettings']],

    // store currencies
    ['GET', '/stores/currencies', [$stores_controller, 'getCurrencies']],
    ['GET', '/stores/languages', [$stores_controller, 'getLanguages']],
    ['GET', '/stores/countries', [$stores_controller, 'getCountries']],
    ['GET', '/stores/timezones', [$stores_controller, 'getTimezones']],

    ['GET', '/stores/{store_id:\d+}/currencies', [$stores_controller, 'getStoreCurrencies',1]],
    ['GET', '/stores/{store_id:\d+}/products', [$products_controller, 'getStoreProducts']],
    ['POST', '/stores/{store_id:\d+}/currencies', [$stores_controller, 'addStoreCurrencies']],
    ['PUT', '/stores/{store_id:\d+}/currencies/{currency_id:\d+}', [$stores_controller, 'updateStoreCurrency']],
    ['DELETE', '/stores/{store_id:\d+}/currencies/{currency_id:\d+}', [$stores_controller, 'removeStoreCurrency']],

];