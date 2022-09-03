<?php

namespace App\Http\Controllers;

use App\Models\BikeMarket;
use Illuminate\Http\Request;
use App\Http\Resources\BikeMarketResource;

class BikeMarketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $bikemarkets = BikeMarket::all()->toArray();
        //dd($books);
        return new BikeMarketResource($bikemarkets);
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
     * @param  \App\Models\BikeMarket  $bikeMarket
     * @return \Illuminate\Http\Response
     */
    public function show(BikeMarket $bikeMarket)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\BikeMarket  $bikeMarket
     * @return \Illuminate\Http\Response
     */
    public function edit(BikeMarket $bikeMarket)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\BikeMarket  $bikeMarket
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, BikeMarket $bikeMarket)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\BikeMarket  $bikeMarket
     * @return \Illuminate\Http\Response
     */
    public function destroy(BikeMarket $bikeMarket)
    {
        //
    }

    public function getBikeMarketByCategoryId($categoryId){
        $productsByCategory = BikeMarket::where('bikemarcategory_id',$categoryId)->get();
         return BikeMarketResource::collection($productsByCategory);
     }
}
