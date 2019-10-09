<?php
/**
 * Created by PhpStorm.
 * User: Peter
 * Date: 2019.08.08.
 * Time: 12:46
 */

namespace App\Requests;
use Illuminate\Foundation\Http\FormRequest;

class ActionRequest extends FormRequest
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