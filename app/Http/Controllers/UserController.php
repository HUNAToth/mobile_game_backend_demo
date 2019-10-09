<?php

namespace App\Http\Controllers;

use App\Models\Action;
use App\Models\User;
use App\Models\UserWare;
use App\Models\UserWareModifier;

use Illuminate\Support\Facades\Cache;

class UserController extends Controller
{
    //TODO user registration + user login


    public function index()
    {
        return User::getAll();
    }

    /**
     * getUserData
     *
     * returns data of user, authenticated with user token.
     *
     * @param int $token
     * @return \Illuminate\Http\JsonResponse
     */
    public function getUserData($token = 1)
    {
        $userId = User::select('id')->where('token', $token)->first();
        if ($userId == null) {
            return response()->json('invalid user');
        }

        $userId=$userId->id;
        $cachedUserData = Cache::get('UserData' . $userId);
        if ($cachedUserData === null) {
            $cachedUserData = Cache::remember('UserData' . $userId, 100, function () use ($userId) {
                $userData = User::getUserData($userId->id);
                $userData->wares = UserWareController::getWareOfUser($userId);
                return $userData;
            });
        }
        return response()->json($cachedUserData);
    }

    /**
     * Checks if user has enough wares to complete the action,
     * then modifies the wares+ ware modifiers based on the action
     *
     * @param UserWare $userWare
     * @param UserWareModifier $userWareModifiers
     * @param Action $action
     * @return \stdClass
     */
    public static function executeAction(UserWare $userWare, UserWareModifier $userWareModifiers, Action $action)
    {
        $response = new \stdClass();
        $response->state = 'failed';
        $response->explanation = 'No action executed';

        //before any action could happen, check resources
        $resourcesAvailable = true;
        if ($userWare->food < $action->food_cost) {
            $resourcesAvailable = false;
            $response->explanation = 'No food available';
        }
        if ($userWare->wood < $action->wood_cost) {
            $resourcesAvailable = false;
            $response->explanation = 'No wood available';
        }
        if ($userWare->pop < $action->pop_cost) {
            $resourcesAvailable = false;
            $response->explanation = 'No population available';
        }


        if ($resourcesAvailable) {
            $userWare->food -= $action->food_cost;
            $userWare->wood -= $action->wood_cost;
            $userWare->pop -= $action->pop_cost;
            $userWare->save();

            $userWareModifiers->food += $action->user_food_mod;
            $userWareModifiers->wood += $action->user_wood_mod;
            $userWareModifiers->pop += $action->user_pop_mod;
            $userWareModifiers->save();

            $response->state = 'success';
            $response->explanation = '';
        }
        return $response;
    }
}
