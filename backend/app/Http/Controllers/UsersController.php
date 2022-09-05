<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
//use App\Http\Controllers\User;
use App\Models\User;
use Auth;


class UsersController extends Controller
{
    public function login()
    {
        if (Auth::attempt(['email' => request('email'), 'password' => request('password')])) {
            $user = Auth::user();
            $success['token'] = $user->createToken('appToken')->accessToken;
           //After successfull authentication, notice how I return json parameters
            return response()->json([
              'success' => true,
              'token' => $success,
              'user' => $user
          ]);
        } else {
       //if authentication is unsuccessfull, notice how I return json parameters
          return response()->json([
            'success' => false,
            'message' => 'Invalid Email or Password',
        ], 401);
        }
    }
     /**
     * Register api.
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'phone' => 'required|unique:users|regex:/[0-9]{10}/',
            'dateofbirth' => 'required',
            'address' => 'required',
            'fathername' => 'required',
            'citizenshipno' => 'required|unique:users',
            'password' => 'required',
            'licenseno' => 'required|unique:users',
            'licenseoffice' => 'required',
            'dateofissue' => 'required',
            'dateofexpiry' => 'required',
            'category' => 'required',
            'companyname' => 'required',
            'model' => 'required',
            'cylinder' => 'required',
            'cc' => 'required',
            'chasisno' => 'required|unique:users',
            'engineno' => 'required|unique:users',
            'color' => 'required',
            'seatcapacity' => 'required',
            'fueltype' => 'required',
            'boughtfrom' => 'required',
            'use' => 'required',
            'drivingarea' => 'required',
            // 'image'=>'required',
            'renewdate' => 'required',

            
        ]);
        if ($validator->fails()) {
          return response()->json([
            'success' => false,
            'message' => $validator->errors(),
          ], 401);
        }
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['token'] = $user->createToken('appToken')->accessToken;
        
        return response()->json([
          'success' => true,
          'token' => $success,
          'user' => $user
      ]);
    }

    public function logout(Request $res)
    {
      if (Auth::user()) {
        $user = Auth::user()->token();
        $user->revoke();

        return response()->json([
          'success' => true,
          'message' => 'Logout successfully'
      ]);
      }else {
        return response()->json([
          'success' => false,
          'message' => 'Unable to Logout'
        ]);
      }
     }


     
}
