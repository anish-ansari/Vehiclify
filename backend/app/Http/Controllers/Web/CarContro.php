<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Car;

class CarContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cars = Car::all();
        return view('car.index',compact('cars'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('car.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $car = new Car();
        $car->ctitle=$request->input('ctitle');  
        $car->cdescription=$request->input('cdescription');
        $car->cimage="";
        if($car->save()){

            $cimage = $request->file('cimage');
            if($cimage != null){
                $ext = $cimage->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($cimage->move(public_path(), $fileName)){
                        $car = Car::find($car->id);
                        $car->cimage = url('/') . '/' . $fileName;
                        $car->save();
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
        $car = Car::find($id);
        return view('car.edit',compact('car'));
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
        $car= Car::find($id);
        $car->ctitle=$request->input('ctitle');  
        $car->cdescription=$request->input('cdescription');
        $car->cimage="";
        if($car->save()){
            $cimage = $request->file('cimage');
            if($cimage != null){
                $ext = $cimage->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($cimage->move(public_path(), $fileName)){
                        $car = Car::find($car->id);
                        $car->cimage = url('/') . '/' . $fileName;
                        $car->save();
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
        if(Car::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
