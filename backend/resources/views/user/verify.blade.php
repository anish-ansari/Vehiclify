@extends('layout')
@section('dashboard-content')
    <h1> Update user verify status</h1>

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

    <form action="{{ URL::to('updateverifystatus-user') }}/{{ $user->id }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Verify Status </label>
            <input type="text" class="form-control" value="{{ $user->verify }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Verify Status" name="verify">
        </div>

        <button type="submit" class="btn btn-primary"> Verify Status </button>
    </form>

@stop
