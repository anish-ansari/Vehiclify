<?php

namespace App\Http\Controllers;

use App\Models\BikeAccesorie;
use Illuminate\Http\Request;
use App\Http\Resources\BikeAccesorieResource;

class BikeAccesorieController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $bikeaccesories = BikeAccesorie::all()->toArray();
        //dd($books);
        return new BikeAccesorieResource($bikeaccesories);
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
     * @param  \App\Models\BikeAccesorie  $bikeAccesorie
     * @return \Illuminate\Http\Response
     */
    public function show(BikeAccesorie $bikeAccesorie)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\BikeAccesorie  $bikeAccesorie
     * @return \Illuminate\Http\Response
     */
    public function edit(BikeAccesorie $bikeAccesorie)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\BikeAccesorie  $bikeAccesorie
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, BikeAccesorie $bikeAccesorie)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\BikeAccesorie  $bikeAccesorie
     * @return \Illuminate\Http\Response
     */
    public function destroy(BikeAccesorie $bikeAccesorie)
    {
        //
    }
}
