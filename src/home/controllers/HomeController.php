<?php

declare(strict_types=1);

namespace Dreamax\Home\Controllers;

use Dreamax\Core\Classes\Controller;

class HomeController
{
    private $controller;

    public function __construct(Controller $controller)
    {
        $this->controller = $controller;
    }

    public function index()
    {
        if (!$this->controller->checkLoggedIn()) {
            return  $this->controller->setRedirect('');
        }
        $data = ['name' => 'THE HOMEPAGE'];
        return  $this->controller->setResponse('home', $data);
    }

    public function one()
    {
        $data = [
            'name' => 'FIRST PAGE',
        ];
        return  $this->controller->setResponse('one', $data);
    }
}
