<?php

namespace App\Http\Controllers;

use App\Models\Dotm;
use Illuminate\Http\Request;
use App\Http\Resources\DotmResource;

class DotmController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dotms = Dotm::all()->toArray();
        //dd($books);
        return new DotmResource($dotms);
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
     * @param  \App\Models\Dotm  $dotm
     * @return \Illuminate\Http\Response
     */
    public function show(Dotm $dotm)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Dotm  $dotm
     * @return \Illuminate\Http\Response
     */
    public function edit(Dotm $dotm)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Dotm  $dotm
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Dotm $dotm)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Dotm  $dotm
     * @return \Illuminate\Http\Response
     */
    public function destroy(Dotm $dotm)
    {
        //
    }
}
