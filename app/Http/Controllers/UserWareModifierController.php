<?php

namespace App\Http\Controllers;

use App\Models\UserWareModifier;

class UserWareModifierController extends Controller
{
    public static function getModifiersOfUserWare($userId)
    {
        return UserWareModifier::getWareModifierOfUser($userId);
    }
}
