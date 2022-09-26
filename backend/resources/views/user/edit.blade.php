@extends('layout')
@section('dashboard-content')
    <h1> Update Infor or Correction form</h1>

    @if(Session::get('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert" id="gone">
            <strong> {{ Session::get('success') }} </strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif

    @if(Session::get('failed'))
        <div class="alert alert-warning alert-dismissible fade show" role="alert" id="gone">
            <strong> {{ Session::get('failed') }} </strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif

    <form action="{{ URL::to('update-user') }}/{{ $user->id }}" method="post" enctype="multipart/form-data">
        @csrf
        {{-- <div class="form-group">
            <label for="exampleInputEmail1"> Verify Status </label>
            <input type="text" class="form-control" value="{{ $user->verify }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Verify Status" name="verify">
        </div> --}}
        <label><b> Personal info Correction</b></label>

        <div class="form-group">
            <label for="exampleInputEmail1"> Name Correction </label>
            <input type="text" class="form-control" value="{{ $user->name }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Name Correction" name="name">
        </div>

        
        <div class="form-group">
            <label for="exampleInputEmail1"> Phone Correction </label>
            <input type="text" class="form-control" value="{{ $user->phone }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Phone Correction" name="phone">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> DOB Correction </label>
            <input type="text" class="form-control" value="{{ $user->dateofbirth }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="DOB Correction" name="dateofbirth">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Address Correction </label>
            <input type="text" class="form-control" value="{{ $user->address }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Address Correction" name="address">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Fathername Correction </label>
            <input type="text" class="form-control" value="{{ $user->fathername }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Fathername Correction" name="fathername">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Citizenship Correction </label>
            <input type="text" class="form-control" value="{{ $user->citizenshipno }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Citizenship Correction" name="citizenshipno">
        </div>


        <label><b> License info Correction </b></label>

        <div class="form-group">
            <label for="exampleInputEmail1"> License no Correction </label>
            <input type="text" class="form-control" value="{{ $user->licenseno }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="License no Correction" name="licenseno">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> License office Correction </label>
            <input type="text" class="form-control" value="{{ $user->licenseoffice }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="License office Correction" name="licenseoffice">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">License Date of issue Correction </label>
            <input type="text" class="form-control" value="{{ $user->dateofissue }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Date of issue Correction" name="dateofissue">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">License Date of expiry Correction </label>
            <input type="text" class="form-control" value="{{ $user->dateofexpiry }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Date of expiry Correction" name="dateofexpiry">
        </div>


        <div class="form-group">
            <label for="exampleInputEmail1">Category Correction </label>
            <input type="text" class="form-control" value="{{ $user->category }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Category Correction" name="category">
        </div>

        <label><b> BlueBook info Correction </b></label>

        <div class="form-group">
            <label for="exampleInputEmail1">Company Name Correction </label>
            <input type="text" class="form-control" value="{{ $user->companyname }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Comapany Name Correction" name="companyname">
        </div>


        <div class="form-group">
            <label for="exampleInputEmail1">Model Correction </label>
            <input type="text" class="form-control" value="{{ $user->model }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Model Correction" name="model">
        </div>
        
        <div class="form-group">
            <label for="exampleInputEmail1">Manufacture Year Correction </label>
            <input type="text" class="form-control" value="{{ $user->manufacturedyear }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Manufacture Year Correction" name="manufacturedyear">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">Cylinder Correction </label>
            <input type="text" class="form-control" value="{{ $user->cylinder }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Cylinder Correction" name="cylinder">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">CC Correction </label>
            <input type="text" class="form-control" value="{{ $user->cc }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="CC Correction" name="cc">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">Chasis No Correction </label>
            <input type="text" class="form-control" value="{{ $user->chasisno }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Chasis No Correction" name="chasisno">
        </div>
        
        <div class="form-group">
            <label for="exampleInputEmail1">Engine No Correction </label>
            <input type="text" class="form-control" value="{{ $user->engineno }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Engine No Correction" name="engineno">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">Color Correction </label>
            <input type="text" class="form-control" value="{{ $user->color }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Color Correction" name="color">
        </div>


        <div class="form-group">
            <label for="exampleInputEmail1">Seat Capacity Correction </label>
            <input type="text" class="form-control" value="{{ $user->seatcapacity }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Seat Capacity Correction" name="seatcapacity">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">Fuel Type Correction</label>
            <input type="text" class="form-control" value="{{ $user->fueltype }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Fuel Type Correction" name="fueltype">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">Bought From Correction </label>
            <input type="text" class="form-control" value="{{ $user->boughtfrom }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Bought From Correction" name="boughtfrom">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">Use Correction </label>
            <input type="text" class="form-control" value="{{ $user->use }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Use Correction" name="use">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">Driving Area Correction </label>
            <input type="text" class="form-control" value="{{ $user->drivingarea }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Driving Area Correction" name="drivingarea">
        </div>


        <div class="form-group">
            <label for="exampleInputEmail1">RenewDate Correction </label>
            <input type="text" class="form-control" value="{{ $user->renewdate }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="RenewDate Correction" name="renewdate">
        </div>


        <button type="submit" class="btn btn-primary"> Update </button>
    </form>

@stop
