<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BikeDealer;
use App\Models\BikeCategory;


class BikeDealerContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $bikedealers = BikeDealer::all();
        return view('bikedealer.index',compact('bikedealers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        
        $bikecategorys = BikeCategory::all();
        return view('bikedealer.create', compact('bikecategorys'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $bikedealer = new BikeDealer();
        $bikedealer->bikedelname =$request->input('bikedelname'); 
        $bikedealer->bikedeladdress=$request->input('bikedeladdress');   
        $bikedealer->bikedellocation=$request->input('bikedellocation');   
        $bikedealer->bikedelphoneno=$request->input('bikedelphoneno');   
        $bikedealer->bikedelcategory_id=$request->input('bikedelcategory');   
        if($bikedealer->save()){

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
        $bikedealer = BikeDealer::find($id);
        $bikecategorys = BikeCategory::all();
        return view('bikedealer.edit', compact('bikedealer', 'bikecategorys'));
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
        //
        $bikedealer = BikeDealer::find($id);
        $bikedealer->bikedelname =$request->input('bikedelname'); 
        $bikedealer->bikedeladdress=$request->input('bikedeladdress');   
        $bikedealer->bikedellocation=$request->input('bikedellocation');   
        $bikedealer->bikedelphoneno=$request->input('bikedelphoneno');   
        $bikedealer->bikedelcategory_id=$request->input('bikedelcategory');   
        if($bikedealer->save()){

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
        //

        if(BikeDealer::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
