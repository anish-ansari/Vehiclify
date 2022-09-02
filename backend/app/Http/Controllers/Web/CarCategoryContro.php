<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CarCategory;

class CarCategoryContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $carcategorys = CarCategory::all();
        return view('carcategory.index',compact('carcategorys'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('carcategory.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $carcategory = new CarCategory();
        $carcategory->carcatname=$request->input('carcatname');  
        $carcategory->carcaticon="";
        if($carcategory->save()){

            $carcaticon = $request->file('carcaticon');
            if($carcaticon != null){
                $ext = $carcaticon->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($carcaticon->move(public_path(), $fileName)){
                        $carcategory = CarCategory::find($carcategory->id);
                        $carcategory->carcaticon = url('/') . '/' . $fileName;
                        $carcategory->save();
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
        $carcategory = CarCategory::find($id);
        return view('carcategory.edit',compact('carcategory'));
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
        $carcategory= CarCategory::find($id);
        $carcategory->carcatname=$request->input('carcatname');  
        $carcategory->carcaticon="";
        if($carcategory->save()){
            $carcaticon = $request->file('carcaticon');
            if($carcaticon != null){
                $ext = $carcaticon->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($carcaticon->move(public_path(), $fileName)){
                        $carcategory = CarCategory::find($carcategory->id);
                        $carcategory->carcaticon = url('/') . '/' . $fileName;
                        $carcategory->save();
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
        if(CarCategory::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
