<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:api')->get('/','UserController@index');

Route::resource('users','UserController');
Route::post('userdata','UserController@getUserData');
Route::get('map','MapController@getMapOfUser');
Route::post('action','ActionController@executeAction');

