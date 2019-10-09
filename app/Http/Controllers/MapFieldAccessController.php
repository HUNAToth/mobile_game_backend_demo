<?php
/**
 * Created by PhpStorm.
 * User: Peter
 * Date: 2019.08.07.
 * Time: 17:34
 */


namespace App\Http\Controllers;

use App\Models\MapFieldAccess;

class MapFieldAccessController extends Controller
{
    public static function getFieldAccessesOfMap($mapId)
    {
        return MapFieldAccess::where('map_id', $mapId)->get();
    }

    public static function getFieldIdsOfMap($mapId)
    {
        return MapFieldAccess::getFieldIdsOfMap($mapId);
    }
}
