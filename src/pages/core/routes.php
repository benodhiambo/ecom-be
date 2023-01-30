<?php

declare(strict_types=1);

namespace Dreamax\Pages\Core;

$ctm_controller = 'Dreamax\Pages\Controllers\PagesController';

return [
    ['GET', '/a/stores/{store_id:\d+}/pages', [$ctm_controller, 'getPages']],
    ['GET', '/a/stores/{store_id:\d+}/pages/{page_id:\d+}', [$ctm_controller, 'getPage']],
    ['POST', '/a/stores/{store_id:\d+}/pages', [$ctm_controller, 'addPage']],
    ['PUT', '/a/stores/{store_id:\d+}/pages/{page_id:\d+}', [$ctm_controller, 'updatePage']],
    ['DELETE', '/a/stores/{store_id:\d+}/pages/{page_id:\d+}', [$ctm_controller, 'deletePage']],
];