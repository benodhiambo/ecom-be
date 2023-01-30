<?php

declare(strict_types=1);

namespace Dreamax\Core;

function getRoutes()
{
    $config = require __DIR__ . '/config.php';
    $modules = $config['modules'];
    $module_routes = [];
    foreach ($modules as $module) {
        // exclude the core module
        if (strpos($module, 'core') === false) {
            $routes = require __DIR__ . '/../' . $module . '/core/routes.php';

            $api_routes = [];

            foreach ($routes as $route) {
                $api_route[0] = $route[0];
                $api_route[1] = $config['api'].$route[1];
                $api_route[2] = $route[2];
                array_push($api_routes, $api_route);
                //print_r($api_route[1]); echo "\n";
            }

            array_push($module_routes, $api_routes);
        }
    }
    //die;
    return $module_routes;
}

return getRoutes();
