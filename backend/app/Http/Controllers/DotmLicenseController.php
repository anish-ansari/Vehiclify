<?php

namespace App\Http\Controllers;

use App\Models\DotmLicense;
use Illuminate\Http\Request;
use App\Http\Resources\DotmLicenseResource;

class DotmLicenseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dotmlicenses = DotmLicense::all()->toArray();
        //dd($books);
        return new DotmLicenseResource($dotmlicenses);
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
     * @param  \App\Models\DotmLicense  $dotmLicense
     * @return \Illuminate\Http\Response
     */
    public function show(DotmLicense $dotmLicense)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\DotmLicense  $dotmLicense
     * @return \Illuminate\Http\Response
     */
    public function edit(DotmLicense $dotmLicense)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\DotmLicense  $dotmLicense
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, DotmLicense $dotmLicense)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\DotmLicense  $dotmLicense
     * @return \Illuminate\Http\Response
     */
    public function destroy(DotmLicense $dotmLicense)
    {
        //
    }
}
