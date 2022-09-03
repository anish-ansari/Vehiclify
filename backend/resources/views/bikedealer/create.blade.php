@extends('layout')
@section('dashboard-content')
    <h1> Create Dealer form</h1>

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

    <form action="{{ URL::to('post-bikedealer-form') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Name</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name" name="bikedelname">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Address</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Address" name="bikedeladdress">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Location </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Location no" name="bikedellocation">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Phone no</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone no" name="bikedelphoneno">
        </div>
        
        <div class="form-group">
            <label for="exampleInputEmail1"> Select bike category </label>
            <select class="form-control" name="bikedelcategory">
                <option> Select </option>
                @foreach($bikecategorys as $bikecategory)
                    <option value="{{ $bikecategory->id }}"> {{ $bikecategory->bikecatname }}</option>
                @endforeach
            </select>
        </div>


        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    
@stop
