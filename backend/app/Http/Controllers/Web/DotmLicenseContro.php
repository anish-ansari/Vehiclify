<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DotmLicense;

class DotmLicenseContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dotmlicenses = DotmLicense::all();
        return view('dotmlicense.index',compact('dotmlicenses'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('dotmlicense.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $dotmlicense = new Dotmlicense();
        $dotmlicense->dname=$request->input('dname');  
        $dotmlicense->dphone=$request->input('dphone');
        $dotmlicense->ddateofbirth=$request->input('ddateofbirth');
        $dotmlicense->daddress=$request->input('daddress');
        $dotmlicense->dfathername=$request->input('dfathername');
        $dotmlicense->dcitizenshipno=$request->input('dcitizenshipno');
        $dotmlicense->dlicenseno=$request->input('dlicenseno');
        $dotmlicense->dlicenseoffice=$request->input('dlicenseoffice');
        $dotmlicense->ddateofissue=$request->input('ddateofissue');
        $dotmlicense->ddateofexpiry=$request->input('ddateofexpiry');
        $dotmlicense->dcategory=$request->input('dcategory');
        $dotmlicense->dimg="";
        if($dotmlicense->save()){

            $dimg = $request->file('dimg');
            if($dimg != null){
                $ext = $dimg->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($dimg->move(public_path(), $fileName)){
                        $dotmlicense = DotmLicense::find($dotmlicense->id);
                        $dotmlicense->dimg = url('/') . '/' . $fileName;
                        $dotmlicense->save();
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
        $dotmlicense = Dotmlicense::find($id);
        return view('dotmlicense.edit',compact('dotmlicense'));
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
        $dotmlicense= DotmLicense::find($id);
        $dotmlicense->dname=$request->input('dname');  
        $dotmlicense->dphone=$request->input('dphone');
        $dotmlicense->ddateofbirth=$request->input('ddateofbirth');
        $dotmlicense->daddress=$request->input('daddress');
        $dotmlicense->dfathername=$request->input('dfathername');
        $dotmlicense->dcitizenshipno=$request->input('dcitizenshipno');
        $dotmlicense->dlicenseno=$request->input('dlicenseno');
        $dotmlicense->dlicenseoffice=$request->input('dlicenseoffice');
        $dotmlicense->ddateofissue=$request->input('ddateofissue');
        $dotmlicense->ddateofexpiry=$request->input('ddateofexpiry');
        $dotmlicense->dcategory=$request->input('dcategory');
        $dotmlicense->dimg="";
        if($dotmlicense->save()){

            $dimg = $request->file('dimg');
            if($dimg != null){
                $ext = $dimg->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                //  $shelf_image->getClientOriginalName() . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png' || $ext == 'jpeg'){
                    if($dimg->move(public_path(), $fileName)){
                        $dotmlicense = DotmLicense::find($dotmlicense->id);
                        $dotmlicense->dimg = url('/') . '/' . $fileName;
                        $dotmlicense->save();
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
        if(DotmLicense::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
