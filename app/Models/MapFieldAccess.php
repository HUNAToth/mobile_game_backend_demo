<?php
/**
 * Created by PhpStorm.
 * User: Peter
 * Date: 2019.08.07.
 * Time: 17:31
 */

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class MapFieldAccess extends Model
{

    public static function getFieldIdsOfMap($mapId)
    {
        return MapFieldAccess::select('id')->where('map_id', $mapId)->get();
    }
}