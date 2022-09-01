<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Dotm;

class DotmContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dotms = Dotm::all();
        return view('dotm.index',compact('dotms'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('dotm.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $dotm = new Dotm();
        $dotm->dtitle=$request->input('dtitle');  
        $dotm->ddescription=$request->input('ddescription');
        $dotm->dimage="";
        if($dotm->save()){

            $dimage = $request->file('dimage');
            if($dimage != null){
                $ext = $dimage->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($dimage->move(public_path(), $fileName)){
                        $dotm = Dotm::find($dotm->id);
                        $dotm->dimage = url('/') . '/' . $fileName;
                        $dotm->save();
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
        $dotm = Dotm::find($id);
        return view('dotm.edit',compact('dotm'));
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
        $dotm= Dotm::find($id);
        $dotm->dtitle=$request->input('dtitle');  
        $dotm->ddescription=$request->input('ddescription');
        $dotm->dimage="";
        if($dotm->save()){
            $dimage = $request->file('dimage');
            if($dimage != null){
                $ext = $dimage->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($dimage->move(public_path(), $fileName)){
                        $dotm = Dotm::find($dotm->id);
                        $dotm->dimage = url('/') . '/' . $fileName;
                        $dotm->save();
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
        if(Dotm::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
