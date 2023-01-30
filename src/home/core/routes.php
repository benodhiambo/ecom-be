<?php

declare(strict_types=1);

namespace Dreamax\Home\Core;

$home_controller = 'Dreamax\Home\Controllers\HomeController';

return [
    ['GET', '/home', [$home_controller, 'index']],
    // Dreamax ROUTES
    ['GET', '/home/one', [$home_controller, 'one']],
    ['GET', '/home/{id}', [$home_controller, 'getOneById']],
    ['POST', '/home/add', [$home_controller, 'addOne']],
];