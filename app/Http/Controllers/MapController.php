<?php

namespace App\Http\Controllers;

use App\Models\Map;

class MapController extends Controller
{
    public function index()
    {
        return Map::getAll();
    }

    public function show($id)
    {
        return Map::show($id);
    }

    /**
     * @param $userId
     * @return \Illuminate\Http\JsonResponse
     */
    public function getMapOfUser($userId)
    {
        $map = Map::getMapOfUser(1);
        $fieldAccesses = MapFieldAccessController::getFieldIdsOfMap($map->id);
        $map->fields = FieldController::getFields($fieldAccesses);
        $fieldTypes = FieldTypeController::getAllTypes();
        $map->fields->map(function ($field) use ($fieldTypes) {
            foreach ($fieldTypes as $fieldType) {
                if ($field->type_id == $fieldType->id) {
                    $field->type = $fieldType;
                }
            }
            if (!is_array($field->type->actions)) {
                $field->type->actions = explode(',', $field->type->actions);
            }
        });
        return response()->json($map);

    }

}
