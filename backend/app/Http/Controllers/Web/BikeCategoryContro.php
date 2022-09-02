<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BikeCategory;

class BikeCategoryContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $bikecategorys = BikeCategory::all();
        return view('bikecategory.index',compact('bikecategorys'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('bikecategory.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $bikecategory = new BikeCategory();
        $bikecategory->bikecatname=$request->input('bikecatname');  
        $bikecategory->bikecaticon="";
        if($bikecategory->save()){

            $bikecaticon = $request->file('bikecaticon');
            if($bikecaticon != null){
                $ext = $bikecaticon->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($bikecaticon->move(public_path(), $fileName)){
                        $bikecategory = BikeCategory::find($bikecategory->id);
                        $bikecategory->bikecaticon = url('/') . '/' . $fileName;
                        $bikecategory->save();
                    }
                }

            }
         

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
        $bikecategory = BikeCategory::find($id);
        return view('bikecategory.edit',compact('bikecategory'));
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
        $bikecategory= BikeCategory::find($id);
        $bikecategory->bikecatname=$request->input('bikecatname');  
        $bikecategory->bikecaticon="";
        if($bikecategory->save()){
            $bikecaticon = $request->file('bikecaticon');
            if($bikecaticon != null){
                $ext = $bikecaticon->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($bikecaticon->move(public_path(), $fileName)){
                        $bikecategory = BikeCategory::find($bikecategory->id);
                        $bikecategory->bikecaticon = url('/') . '/' . $fileName;
                        $bikecategory->save();
                    }
                }

            }

            return redirect()->back()->with('success','Upadte Successfully');
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
        if(BikeCategory::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
