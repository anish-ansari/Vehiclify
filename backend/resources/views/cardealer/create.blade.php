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

    <form action="{{ URL::to('post-cardealer-form') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Name</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name" name="cardelname">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Address</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Address" name="cardeladdress">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Location </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Location no" name="cardellocation">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Phone no</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone no" name="cardelphoneno">
        </div>
        
        <div class="form-group">
            <label for="exampleInputEmail1"> Select car category </label>
            <select class="form-control" name="cardelcategory">
                <option> Select </option>
                @foreach($carcategorys as $carcategory)
                    <option value="{{ $carcategory->id }}"> {{ $carcategory->carcatname }}</option>
                @endforeach
            </select>
        </div>


        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    
@stop
