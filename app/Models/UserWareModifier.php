<?php
/**
 * Created by PhpStorm.
 * User: Peter
 * Date: 2019.08.07.
 * Time: 17:31
 */

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class UserWareModifier extends Model
{
    public static function getWareModifierOfUser($userId)
    {
        return UserWareModifier::where('user_id',$userId)->first();
    }
}