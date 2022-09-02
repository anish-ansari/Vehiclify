<?php

namespace App\Http\Controllers;

use App\Models\CarService;
use Illuminate\Http\Request;
use App\Http\Resources\CarServiceResource;

class CarServiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $carservices = CarService::all()->toArray();
        //dd($books);
        return new CarServiceResource($carservices);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CarService  $carService
     * @return \Illuminate\Http\Response
     */
    public function show(CarService $carService)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CarService  $carService
     * @return \Illuminate\Http\Response
     */
    public function edit(CarService $carService)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CarService  $carService
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CarService $carService)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CarService  $carService
     * @return \Illuminate\Http\Response
     */
    public function destroy(CarService $carService)
    {
        //
    }


    public function getCarServicesByCategoryId($categoryId){
        $productsByCategory = CarService::where('carcategory_id',$categoryId)->get();
         return CarServiceResource::collection($productsByCategory);
     }
}
