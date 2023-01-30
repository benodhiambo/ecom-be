<?php

declare(strict_types=1);

namespace Dreamax\Domains\Models;

use Dreamax\Core\Classes\Model;
use Exception;


class DomainsModel
{
    private $model;
    private $main_tbl = 'domains';

    private  $now;

    public function __construct(Model $model)
    {
        $this->model = $model;
        $this->now = date("Y-m-d H:i:s", time());
    }

    public function getDomains($stores_ids)
    {

        try {

            $sql = "SELECT 
                        domain_id,store_id,url,name,verified 
                    FROM 
                        $this->main_tbl 
                    WHERE 
                      store_id in (".implode(",",$stores_ids).")
                      AND 
                      deleted = 0
                      ";

            $domains = $this->model->getBySql($sql,[]);

            return $domains;

        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }

    public function getDomainById($domain_id)
    {

        try {

            $params = [
                'fields' => array(
                    'domain_id' => $domain_id,
                    'deleted' => 0
                )
            ];

            $domain = $this->model->getByParams($this->main_tbl, $params);

            return $domain;

        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }


    public function addDomain(array $data)
    {
        try {

            $domain = $this->domainDataToArray($data);

            $validation = $this->model->getByField($this->main_tbl,'name',$domain['name']);

            if (empty($validation)) {

                unset($domain['domain_id']);

                $domain_validation = $this->validateDNS($domain['url']);
                $domain['verified'] = $domain_validation;

                $this->model->add($this->main_tbl, $domain);

                $params = [
                    'fields' => [
                        'name' => $domain['name']
                    ],
                    'order' => [
                        'domain_id' => 'DESC'
                    ],
                    'limit' => 1
                ];

                return $this->model->getByParams($this->main_tbl,$params);

            }
            
            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }


    public function updateDomain(array $data)
    {
        try {

            $domain = $this->domainDataToArray($data);

            $domain_validation = $this->validateDNS($domain['url']);
            $domain['verified'] = $domain_validation;


            $conditions = [
                'domain_id' => $domain['domain_id'],
                'deleted' => 0
            ];


            $this->model->updateByParams($this->main_tbl,$domain,$conditions);

            return $this->getDomainById($domain['domain_id']);


        } catch (Exception $e) {

            $err = '<h3>Database Exception</h3><br><br>';
            throw new Exception($err . $e->getMessage());

        }
    }



    public function domainDataToArray(array $base)
    {

        $structure = $this->domainDataArray();
        foreach($structure as $key=>$value) {

            if (isset($base[$key])) {

                $structure[$key] = $base[$key];

            }

        }

        $structure['updated_at'] = $this->model->now;

        return $structure;
    }

    public function domainDataArray()
    {

        return [
            'domain_id'=>'',
            'store_id' => '',
            'url' => '',
            'name' => '',
        ];


    }

    public function validateDNS($domain)
    {

        $server_ip = '10.0.0.0';

        $validate = false;

        $result = dns_get_record($domain);

        foreach($result as $value) {

            if ($value['type']=='A' && $value['ip']==$server_ip) {

                $validate = true;


            }

        }

        return $validate;

    }

}
