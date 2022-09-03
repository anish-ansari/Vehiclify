@extends('layout')
@section('dashboard-content')
    <h1> Update Bike Market form</h1>

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

    <form action="{{ URL::to('update-bikemarket') }}/{{ $bikemarket->id }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Name </label>
            <input type="text" class="form-control" value="{{ $bikemarket->vbname }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name " name="vbname">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Image </label>
            <input type="file" class="form-control" name="vbimage"  onchange="loadShelf(event)">
        </div>

        <div>
            <img id="vbimage" height="100" width="100">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Color </label>
            <input type="text" class="form-control" value="{{ $bikemarket->vbcolor }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Color " name="vbcolor">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Displacement </label>
            <input type="text" class="form-control" value="{{ $bikemarket->vbdisplacement }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Displacement " name="vbdisplacement">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Power </label>
            <input type="text" class="form-control" value="{{ $bikemarket->vbpower }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Power " name="vbpower">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Torque </label>
            <input type="text" class="form-control" value="{{ $bikemarket->vbtorque }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Torque " name="vbtorque">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Tyre </label>
            <input type="text" class="form-control" value="{{ $bikemarket->vbtyre }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Tyre " name="vbtyre">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Price </label>
            <input type="text" class="form-control" value="{{ $bikemarket->vbprice }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Price " name="vbprice">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Varient </label>
            <input type="text" class="form-control" value="{{ $bikemarket->vbvarient }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Varient " name="vbvarient">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Transmission </label>
            <input type="text" class="form-control" value="{{ $bikemarket->vbtransmission }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Transmission " name="vbtransmission">
        </div>


        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Book link </label>
            <input type="text" class="form-control" value="{{ $bikemarket->vbbooknow }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Book link " name="vbbooknow">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Select Bike category </label>
            <select class="form-control" name="bikemarcategory">
                <option> Select </option>
                @foreach($bikecategorys as $bikecategory)
                    <option value="{{ $bikecategory->id }}" @if($bikecategory->id == $bikemarket->bikemarcategory_id) selected @endif> {{ $bikecategory->bikecatname }}</option>
                @endforeach
            </select>
        </div>

        <button type="submit" class="btn btn-primary"> Update </button>
    </form>
    <script>
        function loadShelf(event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('vbimage');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }

    </script> 

@stop
