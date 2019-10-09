<?php

namespace App\Http\Controllers;

use App\Models\Action;
use App\Models\Field;
use App\Models\User;
use App\Requests\ActionRequest;

class ActionController extends Controller
{
    /**
     * @param ActionRequest $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function executeAction(ActionRequest $request)
    {
        //TODO this entire section to ActionRequest
        $user = User::find($request->userId);
        $field = Field::find($request->fieldId);
        $action = Action::find($request->actionId);

        if ($user != null && $field != null & $action != null) {
            $userWare = UserWareController::getWareOfUser($user->id);
            $userModifiers = UserWareModifierController::getModifiersOfUserWare($user->id);
            $userAction = (object)$action->only(
                ['id',
                    'name',
                    'food_cost',
                    'wood_cost',
                    'pop_cost',
                    'user_food_mod',
                    'user_wood_mod',
                    'user_pop_mod'
                ]);
            $success = UserController::executeAction($userWare, $userModifiers, $userAction);
            if ($success->state) {
                $fieldAction = (object)$action->only(
                    ['id',
                        'name',
                        'food_cost',
                        'wood_cost',
                        'pop_cost',
                        'field_food_mod',
                        'field_wood_mod',
                        'field_pop_mod'
                    ]);
                $success = FieldController::executeAction($field, $fieldAction);
            }
            return response()->json('Action was ' . $success->state . ' ' . $success->explanation);
        }
    }
}
