<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Bike;

class BikeContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $bikes = Bike::all();
        return view('bike.index',compact('bikes'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('bike.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $bike = new Bike();
        $bike->btitle=$request->input('btitle');  
        $bike->bdescription=$request->input('bdescription');
        $bike->bimage="";
        if($bike->save()){

            $bimage = $request->file('bimage');
            if($bimage != null){
                $ext = $bimage->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($bimage->move(public_path(), $fileName)){
                        $bike = Bike::find($bike->id);
                        $bike->bimage = url('/') . '/' . $fileName;
                        $bike->save();
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
        $bike = Bike::find($id);
        return view('bike.edit',compact('bike'));
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
        $bike= Bike::find($id);
        $bike->btitle=$request->input('btitle');  
        $bike->bdescription=$request->input('bdescription');
        $bike->bimage="";
        if($bike->save()){
            $bimage = $request->file('bimage');
            if($bimage != null){
                $ext = $bimage->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($bimage->move(public_path(), $fileName)){
                        $bike= Bike::find($bike->id);
                        $bike->bimage = url('/') . '/' . $fileName;
                        $bike->save();
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
        if(Bike::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
