<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CarService;
use App\Models\CarCategory;

class CarServiceContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $carservices = CarService::all();
        return view('carservice.index',compact('carservices'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        
        $carcategorys = CarCategory::all();
        return view('carservice.create', compact('carcategorys'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $carservice = new CarService();
        $carservice->carsername =$request->input('carsername'); 
        $carservice->carseraddress=$request->input('carseraddress');   
        $carservice->carserlocation=$request->input('carserlocation');   
        $carservice->carserphoneno=$request->input('carserphoneno');   
        $carservice->carcategory_id=$request->input('carcategory');   
        if($carservice->save()){

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
        $carservice = CarService::find($id);
        $carcategorys = CarCategory::all();
        return view('carservice.edit', compact('carservice', 'carcategorys'));
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
        $carservice = CarService::find($id);
        $carservice->carsername =$request->input('carsername'); 
        $carservice->carseraddress=$request->input('carseraddress');   
        $carservice->carserlocation=$request->input('carserlocation');   
        $carservice->carserphoneno=$request->input('carserphoneno');   
        $carservice->carcategory_id=$request->input('carcategory');   
        if($carservice->save()){

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

        if(CarService::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
