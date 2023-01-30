<?php

declare(strict_types=1);

use Twig\Environment;
use Twig\Extension\DebugExtension;
use Twig\Loader\FilesystemLoader;

$injector->share($request);
$injector->alias('Psr\Http\Message\ResponseInterface', 'GuzzleHttp\Psr7\Response');
$injector->alias('Dreamax\Core\Classes\Renderer', 'Dreamax\Core\Classes\TwigRenderer');

/**
 * the GuzzleHttp\Psr7\UploadedFile class requires 
 * initial values. The define method here is used to setup
 * these initial values.
 */
$injector->define('GuzzleHttp\Psr7\UploadedFile', [':streamOrFile' => 'default', ':size' => 0, ':errorStatus' => 0]);
$injector->alias('Psr\Http\Message\UploadedFileInterface', 'GuzzleHttp\Psr7\UploadedFile');

/**
 * this injector delegates the creation of the templating engine to 
 * the anonymous function to reduce complexity
 */
$injector->delegate('Twig\Environment', function () use ($injector) {

    $modules = $GLOBALS['config']['modules'];
    $templates = [dirname(__DIR__) . '/carts/views'];

    /**
     * for each module installed get the 
     * path for the view folder and 
     * add it as a template location
     */
    // foreach ($modules as $module) {
    //     $dir = dirname(__DIR__) . '/' . $module . '/views';
    //     array_push($templates, $dir);
    // }

    try {
        $loader = new FilesystemLoader($templates);
        $twig = new Environment($loader, ['debug' => true, 'charset' => 'utf-8', 'strict_variables' => true]);
        $twig->addGlobal('base_path', $GLOBALS['config']['base_path']);
        // $twig->addGlobal('session', $_SESSION);
        $twig->addExtension(new DebugExtension);
        return $twig;
    } catch (Exception $e) {
        $err = '<h3>Twig Exception</h3><br><br>';
        throw new Exception($err . $e->getMessage());
    }
});


/*
 * Translations
 * Twig i8no
 */

