<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CarMarket;
use App\Models\CarCategory;


class CarMarketContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $carmarkets = CarMarket::all();
        return view('carmarket.index',compact('carmarkets'));
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
        return view('carmarket.create', compact('carcategorys'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $carmarket = new CarMarket();
        $carmarket->vcname =$request->input('vcname'); 
        $carmarket->vcimage="";
        $carmarket->vccolor=$request->input('vccolor');   
        $carmarket->vcdisplacement=$request->input('vcdisplacement');  
        $carmarket->vcpower=$request->input('vcpower');
        $carmarket->vctorque=$request->input('vctorque');
        $carmarket->vctyre=$request->input('vctyre');   
        $carmarket->vcprice=$request->input('vcprice');                           
        $carmarket->vcvarient=$request->input('vcvarient');
        $carmarket->vctransmission=$request->input('vctransmission');                    
        $carmarket->vcdimension=$request->input('vcdimension');
        $carmarket->vcbooknow=$request->input('vcbooknow');         
        $carmarket->carmarcategory_id=$request->input('carmarcategory');   
        if($carmarket->save()){

            $vcimage = $request->file('vcimage');
            if($vcimage != null){
                $ext = $vcimage->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($vcimage->move(public_path(), $fileName)){
                        $carmarket = CarMarket::find($carmarket->id);
                        $carmarket->vcimage = url('/') . '/' . $fileName;
                        $carmarket->save();
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
        $carmarket = CarMarket::find($id);
        $carcategorys = CarCategory::all();
        return view('carmarket.edit', compact('carmarket', 'carcategorys'));
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
        $carmarket = CarMarket::find($id);
        $carmarket->vcname =$request->input('vcname'); 
        $carmarket->vcimage="";
        $carmarket->vccolor=$request->input('vccolor');   
        $carmarket->vcdisplacement=$request->input('vcdisplacement');  
        $carmarket->vcpower=$request->input('vcpower');
        $carmarket->vctorque=$request->input('vctorque');
        $carmarket->vctyre=$request->input('vctyre');
        $carmarket->vcprice=$request->input('vcprice');                    
        $carmarket->vcvarient=$request->input('vcvarient');
        $carmarket->vctransmission=$request->input('vctransmission');                    
        $carmarket->vcdimension=$request->input('vcdimension');
        $carmarket->vcbooknow=$request->input('vcbooknow');         
        $carmarket->carmarcategory_id=$request->input('carmarcategory');   
        if($carmarket->save()){

            $vcimage = $request->file('vcimage');
            if($vcimage != null){
                $ext = $vcimage->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($vcimage->move(public_path(), $fileName)){
                        $carmarket = CarMarket::find($carmarket->id);
                        $carmarket->vcimage = url('/') . '/' . $fileName;
                        $carmarket->save();
                    }
                }

            }
         

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

        if(CarMarket::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
