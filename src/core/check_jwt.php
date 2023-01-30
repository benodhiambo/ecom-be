<?php

declare(strict_types=1);

namespace Dreamax\Core;

use Firebase\JWT\JWT;
use UnexpectedValueException;

function authenticate($token, $key)
{

    try {
        $decoded = JWT::decode($token, $key, array('HS256'));
        $decoded = (array)$decoded;
        
        if (isset($decoded['iss']) && $decoded['iss'] == 'dreamx_ecom') {
            $GLOBALS['sess']['user_id'] = $decoded['data']->id;
            $GLOBALS['sess']['store_id'] = isset($decoded['data']->store_id) ? $decoded['data']->store_id : '1' ;
            return true;
        }
        return false;
    } catch (UnexpectedValueException $e) {
        return array("status" => false, "Error" => $e->getMessage());
    }
}
