<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CarDealer;
use App\Models\CarCategory;


class CarDealerContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $cardealers = CarDealer::all();
        return view('cardealer.index',compact('cardealers'));
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
        return view('cardealer.create', compact('carcategorys'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $cardealer = new CarDealer();
        $cardealer->cardelname =$request->input('cardelname'); 
        $cardealer->cardeladdress=$request->input('cardeladdress');   
        $cardealer->cardellocation=$request->input('cardellocation');   
        $cardealer->cardelphoneno=$request->input('cardelphoneno');   
        $cardealer->cardelcategory_id=$request->input('cardelcategory');   
        if($cardealer->save()){

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
        $cardealer = CarDealer::find($id);
        $carcategorys = CarCategory::all();
        return view('cardealer.edit', compact('cardealer', 'carcategorys'));
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
        $cardealer = CarDealer::find($id);
        $cardealer->cardelname =$request->input('cardelname'); 
        $cardealer->cardeladdress=$request->input('cardeladdress');   
        $cardealer->cardellocation=$request->input('cardellocation');   
        $cardealer->cardelphoneno=$request->input('cardelphoneno');   
        $cardealer->cardelcategory_id=$request->input('cardelcategory');   
        if($cardealer->save()){

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

        if(CarDealer::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
