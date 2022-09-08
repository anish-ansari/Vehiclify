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

// bike accesorie
Route::get('create-bikeaccesorie','App\Http\Controllers\Web\BikeAccesorieContro@create');
Route::post('post-bikeaccesorie-form','App\Http\Controllers\Web\BikeAccesorieContro@store');
Route::get('all-bikeaccesories','App\Http\Controllers\Web\BikeAccesorieContro@index');
Route::get('edit-bikeaccesorie/{id}','App\Http\Controllers\Web\BikeAccesorieContro@edit');
Route::post('update-bikeaccesorie/{id}','App\Http\Controllers\Web\BikeAccesorieContro@update');
Route::get('delete-bikeaccesorie/{id}','App\Http\Controllers\Web\BikeAccesorieContro@destroy');
//bike accesorie end

//dotm news

Route::get('create-dotm','App\Http\Controllers\Web\DotmContro@create');
Route::post('post-dotm-form','App\Http\Controllers\Web\DotmContro@store');
Route::get('all-dotms','App\Http\Controllers\Web\DotmContro@index');
Route::get('edit-dotm/{id}','App\Http\Controllers\Web\DotmContro@edit');
Route::post('update-dotm/{id}','App\Http\Controllers\Web\DotmContro@update');
Route::get('delete-dotm/{id}','App\Http\Controllers\Web\DotmContro@destroy');
//dotm news end

// car news
Route::get('create-car','App\Http\Controllers\Web\CarContro@create');
Route::post('post-car-form','App\Http\Controllers\Web\CarContro@store');
Route::get('all-cars','App\Http\Controllers\Web\CarContro@index');
Route::get('edit-car/{id}','App\Http\Controllers\Web\CarContro@edit');
Route::post('update-car/{id}','App\Http\Controllers\Web\CarContro@update');
Route::get('delete-car/{id}','App\Http\Controllers\Web\CarContro@destroy');
//car news end

//bike news
Route::get('create-bike','App\Http\Controllers\Web\BikeContro@create');
Route::post('post-bike-form','App\Http\Controllers\Web\BikeContro@store');
Route::get('all-bikes','App\Http\Controllers\Web\BikeContro@index');
Route::get('edit-bike/{id}','App\Http\Controllers\Web\BikeContro@edit');
Route::post('update-bike/{id}','App\Http\Controllers\Web\BikeContro@update');
Route::get('delete-bike/{id}','App\Http\Controllers\Web\BikeContro@destroy');
//bike news end

//car category
Route::get('create-carcategory','App\Http\Controllers\Web\CarCategoryContro@create');
Route::post('post-carcategory-form','App\Http\Controllers\Web\CarCategoryContro@store');
Route::get('all-carcategorys','App\Http\Controllers\Web\CarCategoryContro@index');
Route::get('edit-carcategory/{id}','App\Http\Controllers\Web\CarCategoryContro@edit');
Route::post('update-carcategory/{id}','App\Http\Controllers\Web\CarCategoryContro@update');
Route::get('delete-carcategory/{id}','App\Http\Controllers\Web\CarCategoryContro@destroy');
//car  category end 


//car service
Route::get('create-carservice','App\Http\Controllers\Web\CarServiceContro@create');
Route::post('post-carservice-form','App\Http\Controllers\Web\CarServiceContro@store');
Route::get('all-carservices','App\Http\Controllers\Web\CarServiceContro@index');
Route::get('edit-carservice/{id}','App\Http\Controllers\Web\CarServiceContro@edit');
Route::post('update-carservice/{id}','App\Http\Controllers\Web\CarServiceContro@update');
Route::get('delete-carservice/{id}','App\Http\Controllers\Web\CarServiceContro@destroy');
//car  service end 

//bike category
Route::get('create-bikecategory','App\Http\Controllers\Web\BikeCategoryContro@create');
Route::post('post-bikecategory-form','App\Http\Controllers\Web\BikeCategoryContro@store');
Route::get('all-bikecategorys','App\Http\Controllers\Web\BikeCategoryContro@index');
Route::get('edit-bikecategory/{id}','App\Http\Controllers\Web\BikeCategoryContro@edit');
Route::post('update-bikecategory/{id}','App\Http\Controllers\Web\BikeCategoryContro@update');
Route::get('delete-bikecategory/{id}','App\Http\Controllers\Web\BikeCategoryContro@destroy');
//bike category end 

//bike service
Route::get('create-bikeservice','App\Http\Controllers\Web\BikeServiceContro@create');
Route::post('post-bikeservice-form','App\Http\Controllers\Web\BikeServiceContro@store');
Route::get('all-bikeservices','App\Http\Controllers\Web\BikeServiceContro@index');
Route::get('edit-bikeservice/{id}','App\Http\Controllers\Web\BikeServiceContro@edit');
Route::post('update-bikeservice/{id}','App\Http\Controllers\Web\BikeServiceContro@update');
Route::get('delete-bikeservice/{id}','App\Http\Controllers\Web\BikeServiceContro@destroy');
//bike  service end 


//car dealer
Route::get('create-cardealer','App\Http\Controllers\Web\CarDealerContro@create');
Route::post('post-cardealer-form','App\Http\Controllers\Web\CarDealerContro@store');
Route::get('all-cardealers','App\Http\Controllers\Web\CarDealerContro@index');
Route::get('edit-cardealer/{id}','App\Http\Controllers\Web\CarDealerContro@edit');
Route::post('update-cardealer/{id}','App\Http\Controllers\Web\CarDealerContro@update');
Route::get('delete-cardealer/{id}','App\Http\Controllers\Web\CarDealerContro@destroy');
//car  dealer end 


//bike dealer
Route::get('create-bikedealer','App\Http\Controllers\Web\BikeDealerContro@create');
Route::post('post-bikedealer-form','App\Http\Controllers\Web\BikeDealerContro@store');
Route::get('all-bikedealers','App\Http\Controllers\Web\BikeDealerContro@index');
Route::get('edit-bikedealer/{id}','App\Http\Controllers\Web\BikeDealerContro@edit');
Route::post('update-bikedealer/{id}','App\Http\Controllers\Web\BikeDealerContro@update');
Route::get('delete-bikedealer/{id}','App\Http\Controllers\Web\BikeDealerContro@destroy');
//car dealer end 


//car market
Route::get('create-carmarket','App\Http\Controllers\Web\CarMarketContro@create');
Route::post('post-carmarket-form','App\Http\Controllers\Web\CarMarketContro@store');
Route::get('all-carmarkets','App\Http\Controllers\Web\CarMarketContro@index');
Route::get('edit-carmarket/{id}','App\Http\Controllers\Web\CarMarketContro@edit');
Route::post('update-carmarket/{id}','App\Http\Controllers\Web\CarMarketContro@update');
Route::get('delete-carmarket/{id}','App\Http\Controllers\Web\CarMarketContro@destroy');
//car  market end 

//bike market
Route::get('create-bikemarket','App\Http\Controllers\Web\BikeMarketContro@create');
Route::post('post-bikemarket-form','App\Http\Controllers\Web\BikeMarketContro@store');
Route::get('all-bikemarkets','App\Http\Controllers\Web\BikeMarketContro@index');
Route::get('edit-bikemarket/{id}','App\Http\Controllers\Web\BikeMarketContro@edit');
Route::post('update-bikemarket/{id}','App\Http\Controllers\Web\BikeMarketContro@update');
Route::get('delete-bikemarket/{id}','App\Http\Controllers\Web\BikeMarketContro@destroy');
//bike market end 

//nearby
Route::get('create-nearby','App\Http\Controllers\Web\NearbyContro@create');
Route::post('post-nearby-form','App\Http\Controllers\Web\NearbyContro@store');
Route::get('all-nearbys','App\Http\Controllers\Web\NearbyContro@index');
Route::get('edit-nearby/{id}','App\Http\Controllers\Web\NearbyContro@edit');
Route::post('update-nearby/{id}','App\Http\Controllers\Web\NearbyContro@update');
Route::get('delete-nearby/{id}','App\Http\Controllers\Web\NearbyContro@destroy');
//nearby


//driving school
Route::get('create-drivingschool','App\Http\Controllers\Web\DrivingSchoolContro@create');
Route::post('post-drivingschool-form','App\Http\Controllers\Web\DrivingSchoolContro@store');
Route::get('all-drivingschools','App\Http\Controllers\Web\DrivingSchoolContro@index');
Route::get('edit-drivingschool/{id}','App\Http\Controllers\Web\DrivingSchoolContro@edit');
Route::post('update-drivingschool/{id}','App\Http\Controllers\Web\DrivingSchoolContro@update');
Route::get('delete-drivingschool/{id}','App\Http\Controllers\Web\DrivingSchoolContro@destroy');
//driving school end 


//dotm bluebook 
Route::get('create-dotmbluebook','App\Http\Controllers\Web\DotmBluebookContro@create');
Route::post('post-dotmbluebook-form','App\Http\Controllers\Web\DotmBluebookContro@store');
Route::get('all-dotmbluebooks','App\Http\Controllers\Web\DotmBluebookContro@index');
Route::get('edit-dotmbluebook/{id}','App\Http\Controllers\Web\DotmBluebookContro@edit');
Route::post('update-dotmbluebook/{id}','App\Http\Controllers\Web\DotmBluebookContro@update');
Route::get('delete-dotmbluebook/{id}','App\Http\Controllers\Web\DotmBluebookContro@destroy');
//dotm bluebook
