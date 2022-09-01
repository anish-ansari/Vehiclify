@extends('layout')
@section('dashboard-content')
    <h1> Create Dotm form</h1>

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

    <form action="{{ URL::to('post-dotm-form') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Title </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter title" name="dtitle">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Description </label>
            {{-- <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter author name" name="ddescription"> --}}
            <textarea name="ddescription" id="editor1"></textarea>
        </div>


        <div class="form-group">
            <label for="exampleInputEmail1"> Image </label>
            <input type="file" class="form-control" name="dimage" onchange="loadShelf(event)">
        </div> 

        <div>
            <img id="dimage" height="100" width="100">
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
                var output = document.getElementById('dimage');
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
