@extends('layout')
@section('dashboard-content')
    <h1> Update Car Accesorie form</h1>

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

    <form action="{{ URL::to('update-caraccesorie') }}/{{ $caraccesorie->id }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Vendor Name </label>
            <input type="text" class="form-control" value="{{ $caraccesorie->vendorname }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Vendor Name " name="vendorname">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Link </label>
            <input type="text" class="form-control" value="{{ $caraccesorie->linkc }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Car Accesorie " name="linkc">
        </div>
        <button type="submit" class="btn btn-primary"> Update </button>
    </form>
 
@stop
