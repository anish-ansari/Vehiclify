@extends('layout')
@section('dashboard-content')
    <h1> Update Dotm License form</h1>

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

    <form action="{{ URL::to('update-dotmlicense') }}/{{ $dotmlicense->id }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Name </label>
            <input type="text" class="form-control" value="{{ $dotmlicense->dname}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name" name="dname">
        </div>
       
        <div class="form-group">
            <label for="exampleInputEmail1"> Phone </label>
            <input type="text" class="form-control" value="{{ $dotmlicense->dphone}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter phone" name="dphone">
        </div>
       
        <div class="form-group">
            <label for="exampleInputEmail1"> Date of birth </label>
            <input type="text" class="form-control" value="{{ $dotmlicense->ddateofbirth}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Date of birth" name="ddateofbirth">
        </div>
       
        <div class="form-group">
            <label for="exampleInputEmail1"> Address </label>
            <input type="text" class="form-control" value="{{ $dotmlicense->daddress}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter address" name="daddress">
        </div>
       
        <div class="form-group">
            <label for="exampleInputEmail1"> Fathername </label>
            <input type="text" class="form-control" value="{{ $dotmlicense->dfathername}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter fathername" name="dfathername">
        </div>
       
        <div class="form-group">
            <label for="exampleInputEmail1"> Citizenshipno </label>
            <input type="text" class="form-control" value="{{ $dotmlicense->dcitizenshipno}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Citizenshipno" name="dcitizenshipno">
        </div>
       
        <div class="form-group">
            <label for="exampleInputEmail1"> License no </label>
            <input type="text" class="form-control" value="{{ $dotmlicense->dlicenseno}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter License no" name="dlicenseno">
        </div>
       

        <div class="form-group">
            <label for="exampleInputEmail1"> License office </label>
            <input type="text" class="form-control" value="{{ $dotmlicense->dlicenseoffice}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter License office" name="dlicenseoffice">
        </div>
       

        <div class="form-group">
            <label for="exampleInputEmail1"> Date of issue </label>
            <input type="text" class="form-control" value="{{ $dotmlicense->ddateofissue}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Date of issue" name="ddateofissue">
        </div>
       

        <div class="form-group">
            <label for="exampleInputEmail1"> Date of expiry </label>
            <input type="text" class="form-control" value="{{ $dotmlicense->ddateofexpiry}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Date of expiry" name="ddateofexpiry">
        </div>
       
        <div class="form-group">
            <label for="exampleInputEmail1"> Category </label>
            <input type="text" class="form-control" value="{{ $dotmlicense->dcategory}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Category" name="dcategory">
        </div>
    
       
        
        <div class="form-group">
            <label for="exampleInputEmail1">License Image </label>
            <input type="file" class="form-control" name="dimg" onchange="loadShelf(event)">
        </div>

        <div>
            <img id="dimg" height="100" width="100">
        </div>

        {{-- <div class="form-group">
            <label for="exampleInputEmail1"> DD image </label>
            <input type="file" class="form-control" name="ddimage" onchange="loadBook(event)">
        </div>

        <div>
            <img id="ddimage" height="100" width="100">
        </div>  --}}



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
            <label for="exampleInputEmail1"> Book Qunatity</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="0" name="book_quantity">
        </div> --}}


        <button type="submit" class="btn btn-primary"> Update </button>
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
