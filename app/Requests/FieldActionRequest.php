<?php
/**
 * Created by PhpStorm.
 * User: Peter
 * Date: 2019.08.08.
 * Time: 12:46
 */

namespace App\Requests;
use Illuminate\Foundation\Http\FormRequest;

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
class FieldActionRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'userId' => [
                'required',
                Rule::unique('users')->where(function ($query) {
                    $query->where('id', 1);
                })
            ],
            'fieldId' => [
                'required',
                Rule::unique('fields')->where(function ($query) {
                    $query->where('id', 1);
                })
            ],
            'actionId' => [
                'required',
                Rule::unique('actions')->where(function ($query) {
                    $query->where('id', 1);
                })
            ],
        ];
    }

}