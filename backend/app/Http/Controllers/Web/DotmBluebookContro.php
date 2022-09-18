<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DotmBluebook;

class DotmBluebookContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dotmbluebooks = DotmBluebook::all();
        return view('dotmbluebook.index',compact('dotmbluebooks'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('dotmbluebook.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $dotmbluebook = new DotmBluebook();
        $dotmbluebook->dcompanyname=$request->input('dcompanyname');  
        $dotmbluebook->dmodel=$request->input('dmodel');
        $dotmbluebook->dmanufacturedyear=$request->input('dmanufacturedyear');
        $dotmbluebook->dcylinder=$request->input('dcylinder');
        $dotmbluebook->dcc=$request->input('dcc');
        $dotmbluebook->dchasisno=$request->input('dchasisno');
        $dotmbluebook->dengineno=$request->input('dengineno');
        $dotmbluebook->dcolor=$request->input('dcolor');
        $dotmbluebook->dseatcapacity=$request->input('dseatcapacity');
        $dotmbluebook->dfueltype=$request->input('dfueltype');
        $dotmbluebook->dboughtfrom=$request->input('dboughtfrom');
        $dotmbluebook->duse=$request->input('duse');
        $dotmbluebook->ddrivingarea=$request->input('ddrivingarea');
        $dotmbluebook->drenewdate=$request->input('drenewdate');
        $dotmbluebook->dphone=$request->input('dphone');
        $dotmbluebook->dpimage="";
        $dotmbluebook->ddimage="";
        if($dotmbluebook->save()){

            $dpimage = $request->file('dpimage');
            if($dpimage != null){
                $ext = $dpimage->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($dpimage->move(public_path(), $fileName)){
                        $dotmbluebook = DotmBluebook::find($dotmbluebook->id);
                        $dotmbluebook->dpimage = url('/') . '/' . $fileName;
                        $dotmbluebook->save();
                    }
                }

            }

            $ddimage = $request->file('ddimage');
            if($ddimage != null){
                $ext = $ddimage->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($ddimage->move(public_path(), $fileName)){
                        $dotmbluebook = DotmBluebook::find($dotmbluebook->id);
                        $dotmbluebook->ddimage = url('/') . '/' . $fileName;
                        $dotmbluebook->save();
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
        $dotmbluebook = DotmBluebook::find($id);
        return view('dotmbluebook.edit',compact('dotmbluebook'));
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
        $dotmbluebook= DotmBluebook::find($id);
        $dotmbluebook->dcompanyname=$request->input('dcompanyname');  
        $dotmbluebook->dmodel=$request->input('dmodel');
        $dotmbluebook->dmanufacturedyear=$request->input('dmanufacturedyear');
        $dotmbluebook->dcylinder=$request->input('dcylinder');
        $dotmbluebook->dcc=$request->input('dcc');
        $dotmbluebook->dchasisno=$request->input('dchasisno');
        $dotmbluebook->dengineno=$request->input('dengineno');
        $dotmbluebook->dcolor=$request->input('dcolor');
        $dotmbluebook->dseatcapacity=$request->input('dseatcapacity');
        $dotmbluebook->dfueltype=$request->input('dfueltype');
        $dotmbluebook->dboughtfrom=$request->input('dboughtfrom');
        $dotmbluebook->duse=$request->input('duse');
        $dotmbluebook->ddrivingarea=$request->input('ddrivingarea');
        $dotmbluebook->drenewdate=$request->input('drenewdate');
        $dotmbluebook->dphone=$request->input('dphone');
        $dotmbluebook->dpimage="";
        $dotmbluebook->ddimage="";
        if($dotmbluebook->save()){

            $dpimage = $request->file('dpimage');
            if($dpimage != null){
                $ext = $dpimage->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($dpimage->move(public_path(), $fileName)){
                        $dotmbluebook = DotmBluebook::find($dotmbluebook->id);
                        $dotmbluebook->dpimage = url('/') . '/' . $fileName;
                        $dotmbluebook->save();
                    }
                }

            }
            $ddimage = $request->file('ddimage');
            if($ddimage != null){
                $ext = $ddimage->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($ddimage->move(public_path(), $fileName)){
                        $dotmbluebook = DotmBluebook::find($dotmbluebook->id);
                        $dotmbluebook->ddimage = url('/') . '/' . $fileName;
                        $dotmbluebook->save();
                    }
                }

            }
         

            return redirect()->back()->with('success','Save Successfully');
        }
        return redirect()->back()->with('failed','Could not save');
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if(DotmBluebook::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
