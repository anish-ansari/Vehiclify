<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
class UserContro extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::all();
        return view('user.index',compact('users'));
    }

    public function index1()
    {
        $users = User::all();
        return view('license.index',compact('users'));
    }

    public function index2()
    {
        $users = User::all();
        return view('bluebook.index',compact('users'));
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
        $user = User::find($id);
        return view('user.edit',compact('user'));
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
        $user = User::find($id);
        // $user->verify=$request->input('verify'); 
        $user->name=$request->input('name'); 
        $user->phone=$request->input('phone'); 
        $user->dateofbirth=$request->input('dateofbirth'); 
        $user->address=$request->input('address'); 
        $user->fathername=$request->input('fathername'); 
        $user->citizenshipno=$request->input('citizenshipno'); 
        $user->licenseno=$request->input('licenseno');
        $user->licenseoffice=$request->input('licenseoffice');  
        $user->dateofissue=$request->input('dateofissue');  
        $user->dateofexpiry=$request->input('dateofexpiry');  
        $user->category=$request->input('category');  
        $user->companyname=$request->input('companyname'); 
        $user->model=$request->input('model'); 
        $user->manufacturedyear=$request->input('manufacturedyear'); 
        $user->cylinder=$request->input('cylinder'); 
        $user->cc=$request->input('cc'); 
        $user->chasisno=$request->input('chasisno'); 
        $user->engineno=$request->input('engineno'); 
        $user->color=$request->input('color'); 
        $user->seatcapacity=$request->input('seatcapacity'); 
        $user->fueltype=$request->input('fueltype'); 
        $user->boughtfrom=$request->input('boughtfrom'); 
        $user->use=$request->input('use'); 
        $user->drivingarea=$request->input('drivingarea'); 
        $user->renewdate=$request->input('renewdate'); 

        if($user->save()){

            return redirect()->back()->with('success','Update Successfully');
        }
        return redirect()->back()->with('failed','Could not update'); 
    }

    public function verify($id)
    {
        $user = User::find($id);
        return view('user.verify',compact('user'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateverifystatus(Request $request, $id)
    {
        $user = User::find($id);
        $user->verify=$request->input('verify'); 
        if($user->save()){

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
        if(User::destroy($id)){
            return redirect()->back()->with('deleted','Deleted Successfully');
         }
         return redirect()->back()->with('delete-failed','Could not delete');
    }
}
