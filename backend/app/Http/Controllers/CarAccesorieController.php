<?php

namespace App\Http\Controllers;

use App\Models\CarAccesorie;
use Illuminate\Http\Request;
use App\Http\Resources\CarAccesorieResource;

class CarAccesorieController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $caraccesories = CarAccesorie::all()->toArray();
        //dd($books);
        return new CarAccesorieResource($caraccesories);
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
     * @param  \App\Models\CarAccesorie  $carAccesorie
     * @return \Illuminate\Http\Response
     */
    public function show(CarAccesorie $carAccesorie)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CarAccesorie  $carAccesorie
     * @return \Illuminate\Http\Response
     */
    public function edit(CarAccesorie $carAccesorie)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CarAccesorie  $carAccesorie
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CarAccesorie $carAccesorie)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CarAccesorie  $carAccesorie
     * @return \Illuminate\Http\Response
     */
    public function destroy(CarAccesorie $carAccesorie)
    {
        //
    }
}
