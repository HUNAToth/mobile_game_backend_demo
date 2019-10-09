<?php
/**
 * Created by PhpStorm.
 * User: Peter
 * Date: 2019.08.07.
 * Time: 17:31
 */

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;

class Field extends Model
{
    public static function getFields( Collection $fieldIds)
    {
        return Field::whereIn('id', $fieldIds)->get();
    }
    public static function executeAction( Field $field, Action $action)
    {
       $state = true;
       $fieldType = FieldType::find($field->type_id);
       if(strpos($fieldType->actions,$action->id)>-1){
           //a mező típusra elvégezhető a művelet

       }else{
           return false;
       }
       return strpos($fieldType->actions,$action->id);
       return $fieldType;
       return $state;
    }
}