@extends('layout')
@section('dashboard-content')
    <h1> Create Car Catehory form</h1>

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

    <form action="{{ URL::to('post-carcategory-form') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Name </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name" name="carcatname">
        </div>


        <div class="form-group">
            <label for="exampleInputEmail1"> Icon </label>
            <input type="file" class="form-control" name="carcaticon" onchange="loadShelf(event)">
        </div> 

        <div>
            <img id="carcaticon" height="100" width="100">
        </div>


        {{-- <div class="form-group">
            <label for="exampleInputEmail1"> Book Image </label>
            <input type="file" class="form-control" name="book_image" onchange="loadBook(event)">
        </div> --}}

        {{-- <div>
            <img id="book_image" height="100" width="100">
        </div>  --}}


        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

      <script>
        function loadShelf(event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('carcaticon');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }

    //     function loadBook(event) {
    //         var reader = new FileReader();
    //         reader.onload = function () {
    //             var output = document.getElementById('book_image');
    //             output.src = reader.result;
    //         };
    //         reader.readAsDataURL(event.target.files[0]);
    //     }
     </script> 

@stop
