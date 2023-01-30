<?php

declare(strict_types=1);

namespace Dreamax\Auth\Controllers;

use Dreamax\Auth\Models\AuthModel;
use Dreamax\Core\Classes\Controller;
use Exception;
use Firebase\JWT\JWT;
use Psr\Http\Message\ResponseInterface;

use function Dreamax\Core\authenticate;

use UnexpectedValueException;

/**
 * Handles Authentication
 */
class AuthController
{
    private $controller;
    private $model;

    public function __construct(Controller $controller, AuthModel $auth_model)
    {
        $this->controller = $controller;
        $this->model = $auth_model;
    }

    public function showLoginPage(): ResponseInterface
    {
        if ($this->controller->getRequest()->getMethod() === 'GET') {
            $data = ['name' => 'Login Form'];
            return $this->controller->setResponse($data);
        }
        $data = ['name' => 'Home Page'];
        return $this->controller->setRedirect('/user/' . $_SESSION['user_id'] . '/home');
    }

    public function loginUser(): ResponseInterface
    {
        if ($this->controller->getRequest()->getMethod() === 'POST') {
            //getting from input
            $login_data = $this->controller->getRequest()->getBody()->getContents();



            $decoded = (array)json_decode($login_data);


            if (empty($login_data)) {
                // getting from post
                $login_data = $this->controller->getRequest()->getParsedBody();
                $decoded = $login_data;
            }

            try {
                $user_details = $this->model->signInUser($decoded);

                if (!isset($user_details) || $user_details === false) {
                    $data = ['error' => 'Wrong Username/Password'];
                    return $this->controller->setResponse($data);
                }
                // $this->setSession($user_details);

                $token = $this->processToken($user_details);

                $data = [
                    "message" => "Successful login.",
                    "jwt" => $token['jwt'],
                    "user" => $token['user'],
                    "expire_at" => $token['info']['exp']
                ];

                return $this->controller->setResponse($data);
            } catch (Exception $e) {
                $data = ['error' => 'Login Errors' . $e->getMessage()];

                return $this->controller->setErrorResponse($data);
            }
        }
    }

    public function processToken($user_data)
    {
        try {
            $conf = $GLOBALS['config'];
            $secret_key = $conf['token']['key'];
            $issuer_claim = $conf['token']['issuer']; // this can be the servername
            $audience_claim = $conf['token']['audience'];
            $issuedat_claim = $conf['token']['issue_date']; // issued at
            $notbefore_claim = $issuedat_claim + 1; //not before in seconds
            $expire_claim = $issuedat_claim + $conf['token']['expire_after']; // expire time in seconds
            $token = array(
                "iss" => $issuer_claim,
                "aud" => $audience_claim,
                "iat" => $issuedat_claim,
                "nbf" => $notbefore_claim,
                "exp" => $expire_claim,
                "data" => array(
                    "id" => $user_data['user_id'],
                    "user_name" => $user_data['user_name'],
                )
            );

            $jwt = JWT::encode($token, $secret_key);

            $user = [
                'user_id' => $user_data['user_id'],
                'user_name' => $user_data['user_name'],
                'first_name' => $user_data['first_name'],
                'last_name' => $user_data['last_name'],
                'email' => $user_data['email'],
                'phone_number' => $user_data['phone_number'],
                'country' => $user_data['country'],
                'city' => $user_data['city'],
                'date_of_birth' => $user_data['date_of_birth'],
                'occupation' => $user_data['occupation'],
                'status' => $user_data['status'],
                'interests' => $user_data['interests'],
            ];

            $token_data = [
                'info' => $token,
                'jwt' => $jwt,
                'user' => $user
            ];
            return $token_data;
        } catch (Exception $e) {

            $data = ['error' => 'Token Errors'];

            return $this->controller->setErrorResponse($data);
        }
    }

    public function validateToken()
    {
        try {

            $header = $this->controller->getRequest()->getHeader('Authorization');

            if (!isset($header[0])) {
                $data = ['error' => 'Token Is Not Set in Header'];

                return $this->controller->setErrorResponse($data);
            }

            // remove postman bearer word
            if (strpos($header[0], 'Bearer') !== false) {
                $jwt = str_replace('Bearer ', '', $header[0]);
            } else {
                $jwt = $header[0];
            }

            $key = $GLOBALS['config']['token']['key'];

            //include __DIR__ . '/../../core/check_jwt.php';
            //include __DIR__ . '/core/check_jwt.php';

            $is_auth = $this->authenticate($jwt, $key);

            if ($is_auth === true) {

                $user_info = $this->model->getUserDetails($GLOBALS['sess']['user_id']);

                $data = [
                    'message' => 'Token Verified',
                    'jwt' => [$jwt],
                    'users' => [$user_info]
                ];

                return $this->controller->setResponse($data);
            } else {

                $data = ['error' => 'Token Is Invalid'];

                return $this->controller->setErrorResponse($data);
            }
        } catch (Exception $e) {
            $data = ['error' => 'Cannot validate token' . $e->getMessage()];

            return $this->controller->setResponse($data);
        }
    }

    public function authenticate($token, $key)
    {

        try {
            $decoded = JWT::decode($token, $key, array('HS256'));
            $decoded = (array)$decoded;

            if (isset($decoded['iss']) && $decoded['iss'] == 'dreamx_ecom') {
                $GLOBALS['sess']['user_id'] = $decoded['data']->id;
                $GLOBALS['sess']['store_id'] = isset($decoded['data']->store_id) ? $decoded['data']->store_id : '1';
                return true;
            }
            return false;
        } catch (UnexpectedValueException $e) {
            return array("status" => false, "Error" => $e->getMessage());
        }
    }

    public function changePassword()
    {
        try {
            $data = $this->controller->getPostData();

            // $this->controller->validate($data, [
            //     'current_password' => 'required',
            //     'new_password' => 'required'
            // ]);

            $this->model->changePassword($data, $this->controller->user_id);

            $data = [
                'success' => 'Password changed successfully'
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            return $this->controller->renderException($e);
        }
    }

    // private function setSession($user_data): void
    // {
    //     $_SESSION["id"] = session_id();
    //     $_SESSION["user_id"] = $user_data['user_id'];
    //     $_SESSION["is_logged_in"] = true;
    //     $_SESSION["user_name"] = $user_data['user_name'];
    //     $_SESSION["host_name"] = $GLOBALS['config']['host'];
    //     $_SESSION["uri"] = $GLOBALS['config']['uri'];
    //     return;
    // }

    private function deleteSession()
    {
        $_SESSION = array();
        session_destroy();
        return;
    }

    public function logoutUser()
    {
        $this->deleteSession();
        return $this->controller->setRedirect('/login');
    }
}
