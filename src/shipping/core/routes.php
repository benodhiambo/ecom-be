<?php

declare(strict_types=1);

namespace Dreamax\Shipping\Core;
$shipping_controller = 'Dreamax\Shipping\Controllers\ShippingController';
$shipping_rules_controller = 'Dreamax\Shipping\Controllers\ShippingRuleController';

return [
    ['GET', '/a/shippings', [$shipping_controller, 'getShippings']],
    ['POST', '/a/shippings', [$shipping_controller, 'addShipping']],
    ['GET', '/a/shippings/{shipping_id:\d+}', [$shipping_controller, 'getShippingById']],
    ['PUT', '/a/shippings/{shipping_id:\d+}', [$shipping_controller, 'updateShipping']],
    ['DELETE', '/a/shippings/{shipping_id:\d+}', [$shipping_controller, 'deleteShipping']],

    ['GET', '/a/shippings/{shipping_id:\d+}/rules', [$shipping_rules_controller, 'getShippingsRules']],
    ['POST', '/a/shippings/{shipping_id:\d+}/rules', [$shipping_rules_controller, 'addShippingRule']],
    ['GET', '/a/shippings/{shipping_id:\d+}/rules/{rule_id:\d+}', [$shipping_rules_controller, 'getShippingRuleById']],
    ['PUT', '/a/shippings/{shipping_id:\d+}/rules/{rule_id:\d+}', [$shipping_rules_controller, 'updateShippingRule']],
    ['DELETE', '/a/shippings/{shipping_id:\d+}/rules/{rule_id:\d+}', [$shipping_rules_controller, 'deleteShippingRule']],
];