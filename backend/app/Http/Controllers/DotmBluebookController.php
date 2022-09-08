<?php

namespace App\Http\Controllers;

use App\Models\DotmBluebook;
use Illuminate\Http\Request;
use App\Http\Resources\DotmBluebookResource;

class DotmBluebookController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dotmbluebooks = DotmBluebook::all()->toArray();
        //dd($books);
        return new DotmBluebookResource($dotmbluebooks);
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
     * @param  \App\Models\DotmBluebook  $dotmBluebook
     * @return \Illuminate\Http\Response
     */
    public function show(DotmBluebook $dotmBluebook)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\DotmBluebook  $dotmBluebook
     * @return \Illuminate\Http\Response
     */
    public function edit(DotmBluebook $dotmBluebook)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\DotmBluebook  $dotmBluebook
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, DotmBluebook $dotmBluebook)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\DotmBluebook  $dotmBluebook
     * @return \Illuminate\Http\Response
     */
    public function destroy(DotmBluebook $dotmBluebook)
    {
        //
    }
}
