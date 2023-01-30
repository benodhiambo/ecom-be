<?php

declare(strict_types=1);

namespace Dreamax\Core\Classes;

interface Renderer
{
    public function render($template, $data = []) : string;
}