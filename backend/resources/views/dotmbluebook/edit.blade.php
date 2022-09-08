@extends('layout')
@section('dashboard-content')
    <h1> Update Dotm Bluebook form</h1>

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

    <form action="{{ URL::to('update-dotmbluebook') }}/{{ $dotmbluebook->id }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Company Name </label>
            <input type="text" class="form-control" value="{{ $dotmbluebook->dcompanyname}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Company Name" name="dcompanyname">
        </div>
       
        <div class="form-group">
            <label for="exampleInputEmail1"> Model </label>
            <input type="text" class="form-control" value="{{ $dotmbluebook->dmodel}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Model" name="dmodel">
        </div>
       
        <div class="form-group">
            <label for="exampleInputEmail1"> Manufacture Year </label>
            <input type="text" class="form-control" value="{{ $dotmbluebook->dmanufacturedyear}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Manufacture Year" name="dmanufacturedyear">
        </div>
       
        <div class="form-group">
            <label for="exampleInputEmail1"> Cylinder </label>
            <input type="text" class="form-control" value="{{ $dotmbluebook->dcylinder}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Cylinder" name="dcylinder">
        </div>
       
        <div class="form-group">
            <label for="exampleInputEmail1"> CC </label>
            <input type="text" class="form-control" value="{{ $dotmbluebook->dcc}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter CC" name="dcc">
        </div>
       
        <div class="form-group">
            <label for="exampleInputEmail1"> Chasis no </label>
            <input type="text" class="form-control" value="{{ $dotmbluebook->dchasisno}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Chasis no" name="dchasisno">
        </div>
       
        <div class="form-group">
            <label for="exampleInputEmail1"> Engine no </label>
            <input type="text" class="form-control" value="{{ $dotmbluebook->dengineno}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Engine no" name="dengineno">
        </div>
       

        <div class="form-group">
            <label for="exampleInputEmail1"> Color </label>
            <input type="text" class="form-control" value="{{ $dotmbluebook->dcolor}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Color" name="dcolor">
        </div>
       

        <div class="form-group">
            <label for="exampleInputEmail1"> Seatcapacity </label>
            <input type="text" class="form-control" value="{{ $dotmbluebook->dseatcapacity}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Seatcapacity" name="dseatcapacity">
        </div>
       

        <div class="form-group">
            <label for="exampleInputEmail1"> Fuel Type </label>
            <input type="text" class="form-control" value="{{ $dotmbluebook->dfueltype}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Fuel Type" name="dfueltype">
        </div>
       

        <div class="form-group">
            <label for="exampleInputEmail1"> Bought from </label>
            <input type="text" class="form-control" value="{{ $dotmbluebook->dboughtfrom}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Bought from" name="dboughtfrom">
        </div>
       

        <div class="form-group">
            <label for="exampleInputEmail1"> Use </label>
            <input type="text" class="form-control" value="{{ $dotmbluebook->duse}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Use" name="duse">
        </div>
       

        <div class="form-group">
            <label for="exampleInputEmail1"> Driving Area </label>
            <input type="text" class="form-control" value="{{ $dotmbluebook->ddrivingarea}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Driving Area" name="ddrivingarea">
        </div>
       
        

        <div class="form-group">
            <label for="exampleInputEmail1"> Renew Date </label>
            <input type="text" class="form-control" value="{{ $dotmbluebook->drenewdate}}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Renew Date" name="drenewdate">
        </div>
       
        
        <div class="form-group">
            <label for="exampleInputEmail1">Dp Image </label>
            <input type="file" class="form-control" name="dpimage" onchange="loadShelf(event)">
        </div>

        <div>
            <img id="dpimage" height="100" width="100">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> DD image </label>
            <input type="file" class="form-control" name="ddimage" onchange="loadBook(event)">
        </div>

        <div>
            <img id="ddimage" height="100" width="100">
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
            <label for="exampleInputEmail1"> Book Qunatity</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="0" name="book_quantity">
        </div> --}}


        <button type="submit" class="btn btn-primary"> Update </button>
    </form>
    <script>
        function loadShelf(event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('dpimage');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }

        function loadBook(event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('ddimage');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script> 

@stop
