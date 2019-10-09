<?php

namespace App\Http\Controllers;

use App\Models\FieldType;

class FieldTypeController extends Controller
{
    public static function getAllTypes(){
        return FieldType::getAllTypes();
    }
}
