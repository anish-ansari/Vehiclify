<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('dashboard');
});


Route::get('dashboard' ,'App\Http\Controllers\DashboardController@index');

Route::get('all-users','App\Http\Controllers\Web\UserContro@index');
Route::get('all-licenses','App\Http\Controllers\Web\UserContro@index1');
Route::get('all-bluebooks','App\Http\Controllers\Web\UserContro@index2');
Route::get('delete-user/{id}','App\Http\Controllers\Web\UserContro@destroy');
