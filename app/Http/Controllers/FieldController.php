<?php

namespace App\Http\Controllers;

use App\Models\Field;
use App\Models\Action;
use Illuminate\Support\Collection;


class FieldController extends Controller
{

    public static function getFields(Collection $fieldIds)
    {
        return Field::getFields($fieldIds);
    }

    /**
     *Executes given action on given field
     *
     * @param Field $field
     * @param Action $action
     * @return \stdClass
     */
    public static function executeAction(Field $field, Action $action){
        $response = new \stdClass();
        $response->state = 'failed';
        $response->explanation = 'No action executed';

        //TODO implement.
        return $response;
    }
}
