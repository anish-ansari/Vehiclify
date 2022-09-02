<?php

namespace App\Http\Controllers;

use App\Models\BikeService;
use Illuminate\Http\Request;
use App\Http\Resources\BikeServiceResource;

class BikeServiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $bikeservices = BikeService::all()->toArray();
        //dd($books);
        return new BikeServiceResource($bikeservices);
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
     * @param  \App\Models\BikeService  $bikeService
     * @return \Illuminate\Http\Response
     */
    public function show(BikeService $bikeService)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\BikeService  $bikeService
     * @return \Illuminate\Http\Response
     */
    public function edit(BikeService $bikeService)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\BikeService  $bikeService
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, BikeService $bikeService)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\BikeService  $bikeService
     * @return \Illuminate\Http\Response
     */
    public function destroy(BikeService $bikeService)
    {
        //
    }


    public function getBikeServicesByCategoryId($categoryId){
        $productsByCategory = BikeService::where('bikecategory_id',$categoryId)->get();
         return BikeServiceResource::collection($productsByCategory);
     }
}
