<?php

declare(strict_types=1);

namespace Dreamax\Stores\Helpers;

use Dreamax\Core\Classes\Model;
use Exception;


class StoresHelper
{
    private $model;
    private $table = 'stores';
    private $table_settings = 'stores_settings';

    public function __construct(Model $model)
    {
        $this->model = $model;
    }
}