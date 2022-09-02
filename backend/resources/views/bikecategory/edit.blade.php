@extends('layout')
@section('dashboard-content')
    <h1> Update Bike Category form</h1>

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

    <form action="{{ URL::to('update-bikecategory') }}/{{ $bikecategory->id }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Name </label>
            <input type="text" class="form-control" value="{{ $bikecategory->bikecatname}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Title" name="bikecatname">
        </div>
        
        <div class="form-group">
            <label for="exampleInputEmail1"> Icon </label>
            <input type="file" class="form-control" name="bikecaticon"  onchange="loadShelf(event)">
        </div>

        <div>
            <img id="bikecaticon" height="100" width="100">
        </div>


        {{-- <div class="form-group">
            <label for="exampleInputEmail1"> Row No</label>
            <input type="text" class="form-control" value="{{ $book->row_no }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="0" name="row_no">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Column No</label>
            <input type="text" class="form-control" value="{{ $book->column_no }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="0" name="column_no">
        </div>
 --}}

        {{-- <div class="form-group">
            <label for="exampleInputEmail1"> Book Image </label>
            <input type="file" class="form-control" name="book_image" onchange="loadBook(event)">
        </div>

        <div>
            <img id="book_image" height="100" width="100">
        </div>  --}}

        
        {{-- <div class="form-group">
            <label for="exampleInputEmail1"> Book Qunatity</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="0" name="book_quantity">
        </div> --}}


        <button type="submit" class="btn btn-primary"> Update </button>
    </form>
    <script>
        function loadShelf(event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('bikecaticon');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }

        // function loadBook(event) {
        //     var reader = new FileReader();
        //     reader.onload = function () {
        //         var output = document.getElementById('book_image');
        //         output.src = reader.result;
        //     };
        //     reader.readAsDataURL(event.target.files[0]);
        // }
    </script> 

@stop
