@extends('layout')
@section('dashboard-content')
    <h1> Update Bike form</h1>

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

    <form action="{{ URL::to('update-bike') }}/{{ $bike->id }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Title </label>
            <input type="text" class="form-control" value="{{ $bike->btitle}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Title" name="btitle">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1"> Description </label>
            {{-- <input type="text" class="form-control" value="{{ $dotm->ddescription }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Descrpition" name="ddescription"> --}}
            <textarea name="bdescription" id="editor1">{!! $bike->bdescription !!}</textarea>
        </div>

        
        <div class="form-group">
            <label for="exampleInputEmail1"> Image </label>
            <input type="file" class="form-control" name="bimage" onchange="loadShelf(event)">
        </div>

        <div>
            <img id="bimage" height="100" width="100">
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
                var output = document.getElementById('bimage');
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
