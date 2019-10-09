<?php
/**
 * Created by PhpStorm.
 * User: Peter
 * Date: 2019.08.07.
 * Time: 17:31
 */

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class UserWare extends Model
{
    public static function getWareOfUser($userId)
    {
        return UserWare::where('user_id',$userId)->first();
    }
}