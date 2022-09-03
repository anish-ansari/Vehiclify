<?php

namespace App\Http\Controllers;

use App\Models\CarDealer;
use Illuminate\Http\Request;
use App\Http\Resources\CarDealerResource;

class CarDealerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cardealers = CarDealer::all()->toArray();
        //dd($books);
        return new CarDealerResource($cardealers);
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
     * @param  \App\Models\CarDealer  $carDealer
     * @return \Illuminate\Http\Response
     */
    public function show(CarDealer $carDealer)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CarDealer  $carDealer
     * @return \Illuminate\Http\Response
     */
    public function edit(CarDealer $carDealer)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CarDealer  $carDealer
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CarDealer $carDealer)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CarDealer  $carDealer
     * @return \Illuminate\Http\Response
     */
    public function destroy(CarDealer $carDealer)
    {
        //
    }

    public function getCarDealerByCategoryId($categoryId){
        $productsByCategory = CarDealer::where('cardelcategory_id',$categoryId)->get();
         return CarDealerResource::collection($productsByCategory);
     }
}
