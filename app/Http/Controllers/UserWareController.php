<?php

namespace App\Http\Controllers;

use App\Models\UserWare;

class UserWareController extends Controller
{
    public static function getWareOfUser($userId)
    {
        return UserWare::getWareOfUser($userId);
    }
}
