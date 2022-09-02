@extends('layout')
@section('dashboard-content')
    <h1> Update Bike Service form</h1>

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

    <form action="{{ URL::to('update-bikeservice') }}/{{ $bikeservice->id }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Name </label>
            <input type="text" class="form-control" value="{{ $bikeservice->bikesername }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name " name="bikesername">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Address </label>
            <input type="text" class="form-control" value="{{ $bikeservice->bikeseraddress }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Address " name="bikeseraddress">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Location </label>
            <input type="text" class="form-control" value="{{ $bikeservice->bikeserlocation }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Location " name="bikeserlocation">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Phone no </label>
            <input type="text" class="form-control" value="{{ $bikeservice->bikeserphoneno }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone no " name="bikeserphoneno">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Select Bike category </label>
            <select class="form-control" name="bikecategory">
                <option> Select </option>
                @foreach($bikecategorys as $bikecategory)
                    <option value="{{ $bikecategory->id }}" @if($bikecategory->id == $bikeservice->bikecategory_id) selected @endif> {{ $bikecategory->bikecatname }}</option>
                @endforeach
            </select>
        </div>

        <button type="submit" class="btn btn-primary"> Update </button>
    </form>
 
@stop
