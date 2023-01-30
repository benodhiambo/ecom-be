<?php

declare(strict_types=1);

namespace Dreamax\Stores\Core;

$domains_controller = 'Dreamax\Domains\Controllers\DomainsController';

return [
    ['GET', '/a/domains', [$domains_controller, 'getDomains']],
    ['POST', '/a/domains', [$domains_controller, 'addDomain']],
    ['GET', '/a/domains/{domain_id:\d+}', [$domains_controller, 'getDomainById']],
    ['PUT', '/a/domains/{domain_id:\d+}', [$domains_controller, 'updateDomain']],
    ['DELETE', '/a/domains/{domain_id:\d+}', [$domains_controller, 'deleteDomain']],
    ['GET', '/a/domains/{domain_id:\d+}/validate', [$domains_controller, 'validateDomainDNS']],

];