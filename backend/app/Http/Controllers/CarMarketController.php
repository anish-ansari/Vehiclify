<?php

namespace App\Http\Controllers;

use App\Models\CarMarket;
use Illuminate\Http\Request;
use App\Http\Resources\CarMarketResource;

class CarMarketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $carmarkets = CarMarket::all()->toArray();
        //dd($books);
        return new CarMarketResource($carmarkets);
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
     * @param  \App\Models\CarMarket  $carMarket
     * @return \Illuminate\Http\Response
     */
    public function show(CarMarket $carMarket)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CarMarket  $carMarket
     * @return \Illuminate\Http\Response
     */
    public function edit(CarMarket $carMarket)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CarMarket  $carMarket
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CarMarket $carMarket)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CarMarket  $carMarket
     * @return \Illuminate\Http\Response
     */
    public function destroy(CarMarket $carMarket)
    {
        //
    }

    public function getCarMarketByCategoryId($categoryId){
        $productsByCategory = CarMarket::where('carmarcategory_id',$categoryId)->get();
         return CarMarketResource::collection($productsByCategory);
     }
}
