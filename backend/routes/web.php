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


//fuel start
Route::get('create-fuel','App\Http\Controllers\Web\FuelpriceContro@create');
Route::post('post-fuel-form','App\Http\Controllers\Web\FuelpriceContro@store');
Route::get('all-fules','App\Http\Controllers\Web\FuelpriceContro@index');
Route::get('edit-fuel/{id}','App\Http\Controllers\Web\FuelpriceContro@edit');
Route::post('update-fuel/{id}','App\Http\Controllers\Web\FuelpriceContro@update');
Route::get('delete-fuel/{id}','App\Http\Controllers\Web\FuelpriceContro@destroy');
//fuel end


//insurance start
Route::get('create-insurance','App\Http\Controllers\Web\InsuranceContro@create');
Route::post('post-insurance-form','App\Http\Controllers\Web\InsuranceContro@store');
Route::get('all-insurances','App\Http\Controllers\Web\InsuranceContro@index');
Route::get('edit-insurance/{id}','App\Http\Controllers\Web\InsuranceContro@edit');
Route::post('update-insurance/{id}','App\Http\Controllers\Web\InsuranceContro@update');
Route::get('delete-insurance/{id}','App\Http\Controllers\Web\InsuranceContro@destroy');
//insurance end

// car accesorie

Route::get('create-caraccesorie','App\Http\Controllers\Web\CarAccesorieContro@create');
Route::post('post-caraccesorie-form','App\Http\Controllers\Web\CarAccesorieContro@store');
Route::get('all-caraccesories','App\Http\Controllers\Web\CarAccesorieContro@index');
Route::get('edit-caraccesorie/{id}','App\Http\Controllers\Web\CarAccesorieContro@edit');
Route::post('update-caraccesorie/{id}','App\Http\Controllers\Web\CarAccesorieContro@update');
Route::get('delete-caraccesorie/{id}','App\Http\Controllers\Web\CarAccesorieContro@destroy');
//car accesorie end

// car accesorie
Route::get('create-bikeaccesorie','App\Http\Controllers\Web\BikeAccesorieContro@create');
Route::post('post-bikeaccesorie-form','App\Http\Controllers\Web\BikeAccesorieContro@store');
Route::get('all-bikeaccesories','App\Http\Controllers\Web\BikeAccesorieContro@index');
Route::get('edit-bikeaccesorie/{id}','App\Http\Controllers\Web\BikeAccesorieContro@edit');
Route::post('update-bikeaccesorie/{id}','App\Http\Controllers\Web\BikeAccesorieContro@update');
Route::get('delete-bikeaccesorie/{id}','App\Http\Controllers\Web\BikeAccesorieContro@destroy');
//car accesorie end
