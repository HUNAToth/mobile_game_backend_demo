<?php
/**
 * Created by PhpStorm.
 * User: Peter
 * Date: 2019.08.07.
 * Time: 17:31
 */

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class FieldType extends Model
{
    public static function getAllTypes(){
        return FieldType::all();
    }

    public static function getFieldByType(int $type){
        return FieldType::whereId($type)->first();
    }
}