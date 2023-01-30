<?php

declare(strict_types=1);

namespace Dreamax\Core\Classes;

use Exception;
use SessionHandlerInterface;

class SessionHandler implements SessionHandlerInterface
{
    /**
     * Provides the abstraction for basic
     * CRUD database operations
     */
    private $model = null;

    /**
     * The database table used 
     * to save session data
     */
    private $table = 'sessions';

    /**
     * the name of the id column or 
     * primary key in the session table
     */
    private $id = 'session_id';

    public function __construct(Model $model)
    {
        try {
            $this->model = $model;
        } catch (Exception $e) {
            $err = '<h3>Unable to Open Session Database Connection - Database Exception</h3><br><br>';
            return $err . $e->getMessage();
        }
    }

    public function open($savePath, $sessionName)
    {
        if (!is_null($this->model)) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function read($session_id)
    {
        try {
            $sess_id = $this->model->getByField($this->table, $this->id, $session_id);
            if (isset($sess_id[0])) {
                return $sess_id[0]['session_data'];
            }
            return '';
        } catch (\Exception $e) {
            $err = '<h3>Session Database Exception</h3><br>';
            return $err . $e->getMessage();
        }
    }

    public function write($session_id, $session_data)
    {
        $now = date("Y-m-d H:i:s", time());
        try {
            $sess_data = array(
                'session_id' => $session_id,
                'session_data' => $session_data,
                'created_at' => $now
            );

            /**
             * Retrieve an old session
             */
            $old_sess = $this->model->getByField($this->table, $this->id, $session_id);

            /**
             * check if an old session exists
             */
            if (isset($old_sess) && is_iterable($old_sess)) {
                // if session exists, destroy it
                $this->destroy($session_id);
            } 
            $result = $this->model->add($this->table, $sess_data);
            return TRUE;
        } catch (Exception $e) {
            $err = '<h3>Session Database Exception</h3><br>';
            throw new Exception($err . $e->getMessage().'<br><br><br><br>'.$old_sess['session_id']);
        }
    }

    public function destroy($session_id)
    {
        try {
            $affected_rows = $this->model->delete($this->table, $this->id, $session_id);
            return TRUE;
        } catch (\Exception $e) {
            return FALSE;
        }
    }

    public function gc($maxlifetime)
    {
        $conn = $this->model->getDB();
        $past = time() - $maxlifetime;

        try {
            $sql = "DELETE FROM $this->table WHERE `created_at` < ?";
            $stmt = $conn->prepare($sql);
            $stmt->bindValue(1, $past);
            $result = $stmt->executeQuery();
            return TRUE;
        } catch (\Exception $e) {
            return FALSE;
        }
        return true;
    }

    public function close()
    {
        return TRUE;
    }
}
