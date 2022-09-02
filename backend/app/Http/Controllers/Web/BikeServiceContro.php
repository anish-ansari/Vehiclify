<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BikeService;
use App\Models\BikeCategory;


class BikeServiceContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $bikeservices = BikeService::all();
        return view('bikeservice.index',compact('bikeservices'));
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
        return view('bikeservice.create', compact('bikecategorys'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $bikeservice = new BikeService();
        $bikeservice->bikesername =$request->input('bikesername'); 
        $bikeservice->bikeseraddress=$request->input('bikeseraddress');   
        $bikeservice->bikeserlocation=$request->input('bikeserlocation');   
        $bikeservice->bikeserphoneno=$request->input('bikeserphoneno');   
        $bikeservice->bikecategory_id=$request->input('bikecategory');   
        if($bikeservice->save()){

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
        $bikeservice = BikeService::find($id);
        $bikecategorys = BikeCategory::all();
        return view('bikeservice.edit', compact('bikeservice', 'bikecategorys'));
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
        $bikeservice = BikeService::find($id);
        $bikeservice->bikesername =$request->input('bikesername'); 
        $bikeservice->bikeseraddress=$request->input('bikeseraddress');   
        $bikeservice->bikeserlocation=$request->input('bikeserlocation');   
        $bikeservice->bikeserphoneno=$request->input('bikeserphoneno');   
        $bikeservice->bikecategory_id=$request->input('bikecategory');   
        if($bikeservice->save()){

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

        if(BikeService::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
