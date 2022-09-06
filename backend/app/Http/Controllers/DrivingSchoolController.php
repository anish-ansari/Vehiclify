<?php

namespace App\Http\Controllers;

use App\Models\DrivingSchool;
use Illuminate\Http\Request;
use App\Http\Resources\DrivingSchoolResource;

class DrivingSchoolController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $drivingschools = DrivingSchool::all()->toArray();
        //dd($books);
        return new DrivingSchoolResource($drivingschools);
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
     * @param  \App\Models\DrivingSchool  $drivingSchool
     * @return \Illuminate\Http\Response
     */
    public function show(DrivingSchool $drivingSchool)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\DrivingSchool  $drivingSchool
     * @return \Illuminate\Http\Response
     */
    public function edit(DrivingSchool $drivingSchool)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\DrivingSchool  $drivingSchool
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, DrivingSchool $drivingSchool)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\DrivingSchool  $drivingSchool
     * @return \Illuminate\Http\Response
     */
    public function destroy(DrivingSchool $drivingSchool)
    {
        //
    }
}
