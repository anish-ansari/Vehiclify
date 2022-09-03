<?php

namespace App\Http\Controllers;

use App\Models\BikeDealer;
use Illuminate\Http\Request;
use App\Http\Resources\BikeDealerResource;


class BikeDealerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $bikedealers = BikeDealer::all()->toArray();
        //dd($books);
        return new BikeDealerResource($bikedealers);
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
     * @param  \App\Models\BikeDealer  $bikeDealer
     * @return \Illuminate\Http\Response
     */
    public function show(BikeDealer $bikeDealer)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\BikeDealer  $bikeDealer
     * @return \Illuminate\Http\Response
     */
    public function edit(BikeDealer $bikeDealer)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\BikeDealer  $bikeDealer
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, BikeDealer $bikeDealer)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\BikeDealer  $bikeDealer
     * @return \Illuminate\Http\Response
     */
    public function destroy(BikeDealer $bikeDealer)
    {
        //
    }

    public function getBikeDealerByCategoryId($categoryId){
        $productsByCategory = BikeDealer::where('bikedelcategory_id',$categoryId)->get();
         return BikeDealerResource::collection($productsByCategory);
     }
}
