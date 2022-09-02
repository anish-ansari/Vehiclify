<?php

namespace App\Http\Controllers;

use App\Models\BikeCategory;
use Illuminate\Http\Request;
use App\Http\Resources\BikeCategoryResource;

class BikeCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $bikecatgorys = BikeCategory::all()->toArray();
        //dd($books);
        return new BikeCategoryResource($bikecatgorys);
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
     * @param  \App\Models\BikeCategory  $bikeCategory
     * @return \Illuminate\Http\Response
     */
    public function show(BikeCategory $bikeCategory)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\BikeCategory  $bikeCategory
     * @return \Illuminate\Http\Response
     */
    public function edit(BikeCategory $bikeCategory)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\BikeCategory  $bikeCategory
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, BikeCategory $bikeCategory)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\BikeCategory  $bikeCategory
     * @return \Illuminate\Http\Response
     */
    public function destroy(BikeCategory $bikeCategory)
    {
        //
    }
}
