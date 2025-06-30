<?php

namespace App\Http\Middleware;

use App\Exceptions\AuthenticateException;
use Illuminate\Http\Request;
use Orkester\Security\MAuth;
use Orkester\Manager;
use Symfony\Component\HttpFoundation\Response;
use Closure;

class AuthenticateAdmin
{
    public function handle(Request $request, Closure $next): Response
    {
        $this->authenticate($request);
        return $next($request);
    }

    protected function authenticate($request)
    {
        if (MAuth::isLogged()) {
            if (session('isAdmin')) {
                return true;
            } else {
                $this->unauthorizated($request);
            }
        }
        $this->unauthenticated($request);
    }

    protected function unauthenticated($request)
    {
        throw new AuthenticateException('User is not authenticated. Please, login to access this page.', 401);
    }

    protected function unauthorizated($request)
    {
        throw new AuthenticateException("You don`t have access to this page. Please, login again.", 401);
    }
}
