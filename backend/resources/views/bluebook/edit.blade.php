@extends('layout')
@section('dashboard-content')
    <h1> Update user form</h1>

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
        <div class="form-group">
            <label for="exampleInputEmail1"> User Name</label>
            <input type="text" class="form-control" value="{{ $user->user_name }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter user name" name="user_name">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> User Email</label>
            <input type="text" class="form-control" value="{{ $user->email }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email">
        </div>

        {{-- <div class="form-group">
            <label for="exampleInputEmail1"> requestbook Icon </label>
            <input type="file" class="form-control" name="requestbookIcon" onchange="loadPhoto(event)">
        </div>

        <div>
            <img id="photo" height="100" width="100">
        </div> --}}

        <button type="submit" class="btn btn-primary"> Update </button>
    </form>
    {{-- <script>
        function loadPhoto(event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('photo');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script> --}}
@stop
