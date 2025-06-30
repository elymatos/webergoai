<?php

namespace App\Services;

use App\Data\LoginData;
use App\Data\TwoFactorData;
use App\Database\Criteria;
use App\Mail\WebToolMail;
use App\Repositories\User;
use Illuminate\Support\Facades\Mail;

class AuthUserService
{
    public function auth0Login($userInfo)
    {
        $userData = (object)[
            'auth0IdUser' => $userInfo['user_id'],
            'login' => $userInfo['email'],
            'email' => $userInfo['email'],
            'auth0CreatedAt' => $userInfo['created_at'],
            'name' => $userInfo['name'],
            'nick' => $userInfo['nickname']
        ];
        debug($userData);
        $user = Criteria::one("user", ['email', '=', $userData->email]);
        if (is_null($user)) {
            User::create($userData);
            return 'new';
        } else {
            $user = User::byId($user->idUser);
            if ($user->status == '0') {
                return 'pending';
            } else {
                User::registerLogin($user);
                $idLanguage = $user->idLanguage;
                if ($idLanguage == '') {
                    $idLanguage = config('webtool.defaultIdLanguage');
                }
                session(['user' => $user]);
                session(['idLanguage' => $idLanguage]);
                session(['userLevel' => User::getUserLevel($user)]);
                session(['isAdmin' => User::isMemberOf($user, 'ADMIN')]);
                session(['isMaster' => User::isMemberOf($user, 'MASTER')]);
                session(['isManager' => User::isMemberOf($user, 'MANAGER')]);
                session(['isAnno' => User::isMemberOf($user, 'ANNO')]);
                debug("[LOGIN] Authenticated {$user->login}");
                return 'logged';
            }
        }
    }

    public function md5Check(LoginData $userInfo)
    {
        $user = Criteria::one("user", ['login', '=', $userInfo->login]);
        if (is_null($user)) {
            User::create((object)[
                'login' => $userInfo->login,
                'passMD5' => $userInfo->password,
            ]);
            return 'new';
        } else {
            if ($user->status == '0') {
                return 'pending';
            } else {
                $user = User::byId($user->idUser);
                if ($user->passMD5 == $userInfo->password) {
                    $token = '';
                    for ($i = 0; $i < 6; $i++) {
                        $n = random_int(0, 9);
                        $token .= $n;
                    }
                    session(['mail_token' => $token]);
                    session(['twofactor_iduser' => $user->idUser]);
                    Mail::to($user->email)->send(new WebToolMail($token));
                    return 'checked';
                } else {
                    return 'failed';
                }
            }
        }
    }

    public function md5TwoFactor(TwoFactorData $data)
    {
        $token = session('mail_token');
        if ($token == $data->token) {
            $idUser = session('twofactor_iduser');
            $user = User::byId($idUser);
            User::registerLogin($user);
            $idLanguage = $user->idLanguage;
            if ($idLanguage == '') {
                $idLanguage = config('webtool.defaultIdLanguage');
            }
            session(['user' => $user]);
            session(['idLanguage' => $idLanguage]);
            session(['userLevel' => User::getUserLevel($user)]);
            session(['isAdmin' => User::isMemberOf($user, 'ADMIN')]);
            session(['isMaster' => User::isMemberOf($user, 'MASTER')]);
            session(['isManager' => User::isMemberOf($user, 'MANAGER')]);
            session(['isAnno' => User::isMemberOf($user, 'ANNO')]);
            debug("[LOGIN] Authenticated {$user->login}");

        }
    }

    public function md5Login(LoginData $userInfo)
    {
        $user = Criteria::one("user", ['login', '=', $userInfo->login]);
        if (is_null($user)) {
            User::create((object)[
                'login' => $userInfo->login,
                'passMD5' => $userInfo->password,
            ]);
            return 'new';
        } else {
            if ($user->status == '0') {
                return 'pending';
            } else {
                $user = User::byId($user->idUser);
                if ($user->passMD5 == $userInfo->password) {
                    User::registerLogin($user);
                    $idLanguage = $user->idLanguage;
                    if ($idLanguage == '') {
                        $idLanguage = config('webtool.defaultIdLanguage');
                    }
                    session(['user' => $user]);
                    session(['idLanguage' => $idLanguage]);
                    session(['userLevel' => User::getUserLevel($user)]);
                    session(['isAdmin' => User::isMemberOf($user, 'ADMIN')]);
                    session(['isMaster' => User::isMemberOf($user, 'MASTER')]);
                    session(['isManager' => User::isMemberOf($user, 'MANAGER')]);
                    session(['isAnno' => User::isMemberOf($user, 'ANNO')]);
                    debug("[LOGIN] Authenticated {$user->login}");
                    return 'logged';
                } else {
                    return 'failed';
                }
            }
        }
    }

    public function impersonate($user)
    {
        $idLanguage = $user->idLanguage;
        if ($idLanguage == '') {
            $idLanguage = config('webtool.defaultIdLanguage');
        }
        session(['user' => $user]);
        session(['idLanguage' => $idLanguage]);
        session(['userLevel' => User::getUserLevel($user)]);
        session(['isAdmin' => User::isMemberOf($user, 'ADMIN')]);
        session(['isMaster' => User::isMemberOf($user, 'MASTER')]);
        session(['isAnno' => User::isMemberOf($user, 'ANNO')]);
        debug("[LOGIN] Authenticated {$user->login}");
    }

}
