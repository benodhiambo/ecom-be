<?php

declare(strict_types=1);

namespace Dreamax\User\Core;

$user_controller = 'Dreamax\User\Controllers\UserController';
$adm_controller = 'Dreamax\User\Controllers\AdminController';

return [
    // user id must be a digit
    ['GET', '/users', [$user_controller, 'getUsers']],
    ['POST', '/users', [$user_controller, 'registerUser', 1]],
    ['PUT', '/a/account/profile', [$user_controller, 'updateAdminProfile', 1]],
    ['GET', '/users/{user_id:\d+}', [$user_controller, 'getUser']],
    ['POST', '/users/{user_id:\d+}', [$user_controller, 'editUser']],
    ['DELETE', '/users/{user_id:\d+}', [$user_controller, 'deleteUser']],
    // user id must be a digit



];