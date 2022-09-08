@extends('layout')
@section('dashboard-content')
    <h1> Create Dotm Bluebook form</h1>

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

    <form action="{{ URL::to('post-dotmbluebook-form') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Company Name </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter companyname" name="dcompanyname">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Model </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter model" name="dmodel">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Manufactured Year </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Manufactured Year" name="dmanufacturedyear">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Cylinder </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Cylinder" name="dcylinder">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> CC </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="CC" name="dcc">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Chasis No </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Chassis No" name="dchasisno">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1"> Engine No</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Engine No" name="dengineno">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Color </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Color" name="dcolor">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Seat Capacity </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Seat Capacity" name="dseatcapacity">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Fuel Type </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Fuel Type" name="dfueltype">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Bought From </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Color" name="dboughtfrom">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Use </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Use" name="duse">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Driving Area </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Driving Area" name="ddrivingarea">
        </div>


        <div class="form-group">
            <label for="exampleInputEmail1"> RenewDate </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Renew Date" name="drenewdate">
        </div>



        <div class="form-group">
            <label for="exampleInputEmail1"> DP Image </label>
            <input type="file" class="form-control" name="dpimage" onchange="loadShelf(event)">
        </div> 

        <div>
            <img id="dpimage" height="100" width="100">
        </div>


        <div class="form-group">
            <label for="exampleInputEmail1"> DD Image </label>
            <input type="file" class="form-control" name="ddimage" onchange="loadBook(event)">
        </div> 

        <div>
            <img id="ddimage" height="100" width="100">
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
