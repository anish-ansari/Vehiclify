@extends('layout')
@section('dashboard-content')
    <h1> Create Market form</h1>

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

    <form action="{{ URL::to('post-carmarket-form') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Name</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name" name="vcname">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Image </label>
            <input type="file" class="form-control" name="vcimage" onchange="loadShelf(event)">
        </div> 

        <div>
            <img id="vcimage" height="100" width="100">
        </div>


        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Colors</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Colors as R/W/L" name="vccolor">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Displacement </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Displacement" name="vcdisplacement">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Power</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Power" name="vcpower">
        </div>
        
        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Torque</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Torque" name="vctorque">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Tyre</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Tyre" name="vctyre">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Price</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Price" name="vcprice">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Varient</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Varient as V1/V2/V3" name="vcvarient">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Transmission </label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Transmission" name="vctransmission">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Dimension</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Dimension as L/W/H/Wh/GC in  mm" name="vcdimension">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Book now link</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Book now link " name="vcbooknow">
        </div>
        
        <div class="form-group">
            <label for="exampleInputEmail1"> Select car category </label>
            <select class="form-control" name="carmarcategory">
                <option> Select </option>
                @foreach($carcategorys as $carcategory)
                    <option value="{{ $carcategory->id }}"> {{ $carcategory->carcatname }}</option>
                @endforeach
            </select>
        </div>


        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    <script>
        function loadShelf(event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('vcimage');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }

     </script> 
    
@stop
