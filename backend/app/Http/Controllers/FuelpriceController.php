<?php

namespace App\Http\Controllers;

use App\Models\fuelprice;
use Illuminate\Http\Request;
use App\Http\Resources\FuelpriceResource;

class FuelpriceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $fules = fuelprice::all()->toArray();
        //dd($books);
        return new FuelpriceResource($fules);
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
     * @param  \App\Models\fuelprice  $fuelprice
     * @return \Illuminate\Http\Response
     */
    public function show(fuelprice $fuelprice)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\fuelprice  $fuelprice
     * @return \Illuminate\Http\Response
     */
    public function edit(fuelprice $fuelprice)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\fuelprice  $fuelprice
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, fuelprice $fuelprice)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\fuelprice  $fuelprice
     * @return \Illuminate\Http\Response
     */
    public function destroy(fuelprice $fuelprice)
    {
        //
    }
}
