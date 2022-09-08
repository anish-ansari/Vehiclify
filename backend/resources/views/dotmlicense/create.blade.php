@extends('layout')
@section('dashboard-content')
    <h1> Create Dotm License form</h1>

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

    <form action="{{ URL::to('post-dotmlicense-form') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1">  Name </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name" name="dname">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Phone </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone" name="dphone">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Date of birth </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Date of birth" name="ddateofbirth">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Address </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Address" name="daddress">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Fathername </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Fathername" name="dfathername">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Citizenship No </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Citizenship No" name="dcitizenshipno">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1"> License No</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="License No" name="dlicenseno">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> License Office </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="License Office" name="dlicenseoffice">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Date of issue </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Date of issue" name="ddateofissue">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Date of expiry </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Date of expiry" name="ddateofexpiry">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Category </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Category" name="dcategory">
        </div>


        
        <div class="form-group">
            <label for="exampleInputEmail1"> License Image </label>
            <input type="file" class="form-control" name="dimg" onchange="loadShelf(event)">
        </div> 

        <div>
            <img id="dimg" height="100" width="100">
        </div>


        {{-- <div class="form-group">
            <label for="exampleInputEmail1"> DD Image </label>
            <input type="file" class="form-control" name="ddimage" onchange="loadBook(event)">
        </div> 

        <div>
            <img id="ddimage" height="100" width="100">
        </div> --}}


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
                var output = document.getElementById('dimg');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }

        // function loadBook(event) {
        //     var reader = new FileReader();
        //     reader.onload = function () {
        //         var output = document.getElementById('ddimage');
        //         output.src = reader.result;
        //     };
        //     reader.readAsDataURL(event.target.files[0]);
        // }
     </script> 

@stop
