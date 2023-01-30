<?php

declare(strict_types=1);

namespace Dreamax;

use Auryn\Injector;
use Exception;
use FastRoute\Dispatcher;
use FastRoute\RouteCollector;
use GuzzleHttp\Psr7\Response;
use GuzzleHttp\Psr7\ServerRequest;
use Narrowspark\HttpEmitter\SapiEmitter;
use Whoops\Handler\PrettyPageHandler;
use Whoops\Run;

use function Dreamax\Core\authenticate;
use function Dreamax\Core\getRoutes;
use function FastRoute\simpleDispatcher;

require __DIR__ . '/../vendor/autoload.php';

$sess = [];
$config = require __DIR__ . '/core/config.php';

$request = ServerRequest::fromGlobals();
//print_r(['MegaStore Request Headers - ' => getallheaders()]); die;

$injector = new Injector();
require __DIR__ . '/core/dependencies.php';

date_default_timezone_set($config['tz']);
error_reporting(E_ALL);

$whoops = new Run();
if ($config['env'] !== 'prod') {
    $whoops->pushHandler(new PrettyPageHandler);
} else {
    $whoops->pushHandler(function ($e) {
        echo 'Todo: Friendly error page and send an email to the developer';
    });
}

$whoops->register();

// header("Access-Control-Allow-Origin: *");
// header("Content-Type: application/json; charset=UTF-8");   
// header("Access-Control-Allow-Methods: POST, GET, DELETE, PUT, PATCH, OPTIONS");
// header("Access-Control-Max-Age: 3600");
// header("Access-Control-Allow-Headers: *");

//header("Access-Control-Allow-Origin: *");
//header("Content-Type: application/json; charset=UTF-8");
//header("Access-Control-Allow-Methods: POST, GET, DELETE, PUT, PATCH, OPTIONS");
//header("Access-Control-Max-Age: 3600");
//header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$emitter = new SapiEmitter();

if ($request->getMethod() === 'OPTIONS') {

    $response = new Response();

    $response = $response
        ->withAddedHeader('Access-Control-Allow-Headers', '*')
        //->withAddedHeader('Access-Control-Allow-Origin', '*')
    ;

    $emitter->emit($response);


    exit;
}

//$response = new Response();
//$response->getBody()->write('Not authorised to access this resource');
//$response = $response
//    ->withAddedHeader('Access-Control-Allow-Origin', '*')
//    ->withAddedHeader('Access-Control-Allow-Headers', '*');
//$emitter->emit($response); die;

$request_path = $request->getUri()->getPath();

$base_path = $config['base_path'];

if (strcmp($request_path, $base_path) !== 0) {

    $path = str_replace($base_path, '', $request_path);
    //append API
    //$path .= $GLOBALS['config']['api_v1'].$path;
} else {
    // $path = $GLOBALS['config']['api_v1'].'';

    $path = '';
}


include __DIR__ . '/core/routes.php';
$allRoutes = getRoutes();

# print_r(['path' => $path, 'req' => $request_path]); die;

//echo '<pre>';
//print_r($allRoutes); die;
//echo '</pre>';
//print_r($allRoutes); die;
$routeDefinitionCallback = function (RouteCollector $r) {
    $routesArray = $GLOBALS['allRoutes'];
    foreach ($routesArray as $routes) {
        foreach ($routes as $route) {
            $r->addRoute($route[0], $route[1], $route[2]);
        }
    }
};




$dispatcher = simpleDispatcher($routeDefinitionCallback);

# print_r(['path' => $path, 'allr' => $allRoutes]); die;
# print_r($path); die;

$routeInfo = $dispatcher->dispatch($request->getMethod(), $path);


# print_r(['routeDefinitionCallback' => $routeDefinitionCallback]); die;

$response = new Response();

switch ($routeInfo[0]) {
    case Dispatcher::NOT_FOUND:
        $response = new Response();
        $response->getBody()->write('Route not found');
        $response = $response->withStatus(404);
        
        break;

    case Dispatcher::METHOD_NOT_ALLOWED:
        $response = new Response();
        $response->getBody()->write('Method not allowed');
        $response = $response->withStatus(404);

        break;

    case Dispatcher::FOUND:

        $className = $routeInfo[1][0];
        $method = $routeInfo[1][1];
        $vars = $routeInfo[2];

        // $objSessionHandler = $injector->make('Dreamax\Core\Classes\SessionHandler');
        // session_set_save_handler($objSessionHandler, true);
        // session_start();

        // check if no authentication is allowed
        if (isset($routeInfo[1][2])) {
            $class = $injector->make($className);
            $response = $class->$method($vars);
        } else {
            $header = $request->getHeader('Authorization');

            if (isset($header[0])) {

                // remove postman bearer word
                if (strpos($header[0], 'Bearer') !== false) {
                    $jwt = str_replace('Bearer ', '', $header[0]);
                } else {
                    $jwt = $header[0];
                }

                include __DIR__ . '/core/check_jwt.php';

                try {

                    $is_auth = authenticate($jwt, $config['token']['key']);

                    if ($is_auth === true) {
                        $class = $injector->make($className);
                        $response = $class->$method($vars);
                    } else {
                        $response = new Response();
                        $response->getBody()->write('Token Invalid');
                        $response = $response->withStatus(404);
                    }
                } catch (Exception $e) {
                    $response = new Response();
                    $response->getBody()->write('Token Invalid');
                    $response = $response->withStatus(404);
                }
            } else {
                $response = new Response();
                $response->getBody()->write('Not authorised to access this resource');
                $response = $response->withStatus(404);
            }
        }

        break;
}


$response = $response
    ->withAddedHeader('Access-Control-Allow-Headers', '*')
    //->withAddedHeader('Access-Control-Allow-Origin', '*')
;


$emitter->emit($response);
