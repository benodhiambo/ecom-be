<?php

declare(strict_types=1);

namespace Dreamax\Auth\Core;

$auth_controller = 'Dreamax\Auth\Controllers\AuthController';
$user_controller = 'Dreamax\User\Controllers\UserController';

return [
    ['GET', '/', [$auth_controller, 'showLoginPage']],
    ['POST', '/login', [$auth_controller, 'loginUser', 1]],
    ['GET', '/logout', [$auth_controller, 'logoutUser']],
    ['POST', '/change_password', [$auth_controller, 'changePassword']],
    ['GET', '/remember', [$auth_controller, 'validateToken',1]],
];