<?php

declare(strict_types=1);

namespace Dreamax\Core\Classes;

class View
{
    public function __construct($templating)
    {
        $templating_engine = $templating;
        return $templating_engine;
    }
    
    protected function view($module, $view, $data = []) {
        if (file_exists($view.'.php')) {
            require_once $view.'.php';
        } else {
            die('View file '.$view.'.php'.' does not exist');
        }
    }
}