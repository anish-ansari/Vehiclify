<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DrivingSchool;

class DrivingSchoolContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $drivingschools = DrivingSchool::all();
        return view('drivingschool.index',compact('drivingschools'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('drivingschool.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $drivingschool = new DrivingSchool();
        $drivingschool->drivingschoolname =$request->input('drivingschoolname'); 
        $drivingschool->drivingschooladdress=$request->input('drivingschooladdress');   
        $drivingschool->drivingschoollocation=$request->input('drivingschoollocation');   
        $drivingschool->drivingschoolphoneno=$request->input('drivingschoolphoneno');   
        if($drivingschool->save()){

            return redirect()->back()->with('success','Save Successfully');
        }
        return redirect()->back()->with('failed','Could not save');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $drivingschool = DrivingSchool::find($id);
        return view('drivingschool.edit',compact('drivingschool'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $drivingschool = DrivingSchool::find($id);
        $drivingschool->drivingschoolname =$request->input('drivingschoolname'); 
        $drivingschool->drivingschooladdress=$request->input('drivingschooladdress');   
        $drivingschool->drivingschoollocation=$request->input('drivingschoollocation');   
        $drivingschool->drivingschoolphoneno=$request->input('drivingschoolphoneno');   
        if($drivingschool->save()){

            return redirect()->back()->with('success','Update Successfully');
        }
        return redirect()->back()->with('failed','Could not update');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if(DrivingSchool::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
