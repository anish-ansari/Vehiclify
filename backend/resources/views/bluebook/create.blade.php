{{--
    
    
    
    
    Not in use
    
    
    
    
    @extends('layout')
@section('dashboard-content')
    <h1> Create user form</h1>

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

    <form action="{{ URL::to('post-user-form') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> User name</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter user name" name="userName">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Category Icon </label>
            <input type="file" class="form-control" name="categoryIcon" onchange="loadPhoto(event)">
        </div>

        <div>
            <img id="photo" height="100" width="100">
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    <script>
        function loadPhoto(event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('photo');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>

@stop --}}
