@extends('layout')
@section('dashboard-content')
    <h1> Update Car Dealer form</h1>

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

    <form action="{{ URL::to('update-drivingschool') }}/{{ $drivingschool->id }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Name </label>
            <input type="text" class="form-control" value="{{ $drivingschool->drivingschoolname }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name " name="drivingschoolname">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Address </label>
            <input type="text" class="form-control" value="{{ $drivingschool->drivingschooladdress }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Address " name="drivingschooladdress">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Location </label>
            <input type="text" class="form-control" value="{{ $drivingschool->drivingschoollocation }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Location " name="drivingschoollocation">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Phone no </label>
            <input type="text" class="form-control" value="{{ $drivingschool->drivingschoolphoneno }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone no " name="drivingschoolphoneno">
        </div>

    
        <button type="submit" class="btn btn-primary"> Update </button>
    </form>
 
@stop
