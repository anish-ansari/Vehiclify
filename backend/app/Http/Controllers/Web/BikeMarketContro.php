<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BikeMarket;
use App\Models\BikeCategory;


class BikeMarketContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $bikemarkets = BikeMarket::all();
        return view('bikemarket.index',compact('bikemarkets'));
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
        return view('bikemarket.create', compact('bikecategorys'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $bikemarket = new BikeMarket();
        $bikemarket->vbname =$request->input('vbname'); 
        $bikemarket->vbimage="";
        $bikemarket->vbcolor=$request->input('vbcolor');   
        $bikemarket->vbdisplacement=$request->input('vbdisplacement');  
        $bikemarket->vbpower=$request->input('vbpower');
        $bikemarket->vbtorque=$request->input('vbtorque');
        $bikemarket->vbtyre=$request->input('vbtyre');   
        $bikemarket->vbprice=$request->input('vbprice');                           
        $bikemarket->vbvarient=$request->input('vbvarient');
        $bikemarket->vbtransmission=$request->input('vbtransmission');                    
        $bikemarket->vbbooknow=$request->input('vbbooknow');         
        $bikemarket->bikemarcategory_id=$request->input('bikemarcategory');   
        if($bikemarket->save()){

            $vbimage = $request->file('vbimage');
            if($vbimage != null){
                $ext = $vbimage->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($vbimage->move(public_path(), $fileName)){
                        $bikemarket = BikeMarket::find($bikemarket->id);
                        $bikemarket->vbimage = url('/') . '/' . $fileName;
                        $bikemarket->save();
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
        $bikemarket = BikeMarket::find($id);
        $bikecategorys = BikeCategory::all();
        return view('bikemarket.edit', compact('bikemarket', 'bikecategorys'));
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
        $bikemarket = BikeMarket::find($id);
        $bikemarket->vbname =$request->input('vbname'); 
        $bikemarket->vbimage="";
        $bikemarket->vbcolor=$request->input('vbcolor');   
        $bikemarket->vbdisplacement=$request->input('vbdisplacement');  
        $bikemarket->vbpower=$request->input('vbpower');
        $bikemarket->vbtorque=$request->input('vbtorque');
        $bikemarket->vbtyre=$request->input('vbtyre');   
        $bikemarket->vbprice=$request->input('vbprice');                           
        $bikemarket->vbvarient=$request->input('vbvarient');
        $bikemarket->vbtransmission=$request->input('vbtransmission');                    
        $bikemarket->vbbooknow=$request->input('vbbooknow');         
        $bikemarket->bikemarcategory_id=$request->input('bikemarcategory');   
        if($bikemarket->save()){

            $vbimage = $request->file('vbimage');
            if($vbimage != null){
                $ext = $vbimage->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($vbimage->move(public_path(), $fileName)){
                        $bikemarket = BikeMarket::find($bikemarket->id);
                        $bikemarket->vbimage = url('/') . '/' . $fileName;
                        $bikemarket->save();
                    }
                }

            }
         

            return redirect()->back()->with('success','Updated Successfully');
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

        if(BikeMarket::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
