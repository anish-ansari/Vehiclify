@extends('layout')
@section('dashboard-content')
    <h1> Update Car Market form</h1>

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

    <form action="{{ URL::to('update-carmarket') }}/{{ $carmarket->id }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Name </label>
            <input type="text" class="form-control" value="{{ $carmarket->vcname }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name " name="vcname">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Image </label>
            <input type="file" class="form-control" name="vcimage"  onchange="loadShelf(event)">
        </div>

        <div>
            <img id="vcimage" height="100" width="100">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Color </label>
            <input type="text" class="form-control" value="{{ $carmarket->vccolor }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Color " name="vccolor">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Displacement </label>
            <input type="text" class="form-control" value="{{ $carmarket->vcdisplacement }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Displacement " name="vcdisplacement">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Power </label>
            <input type="text" class="form-control" value="{{ $carmarket->vcpower }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Power " name="vcpower">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Torque </label>
            <input type="text" class="form-control" value="{{ $carmarket->vctorque }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Torque " name="vctorque">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Tyre </label>
            <input type="text" class="form-control" value="{{ $carmarket->vctyre }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Tyre " name="vctyre">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Price </label>
            <input type="text" class="form-control" value="{{ $carmarket->vcprice }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Price " name="vcprice">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Varient </label>
            <input type="text" class="form-control" value="{{ $carmarket->vcvarient }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Varient " name="vcvarient">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Transmission </label>
            <input type="text" class="form-control" value="{{ $carmarket->vctransmission }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Transmission " name="vctransmission">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Dimension </label>
            <input type="text" class="form-control" value="{{ $carmarket->vcdimension }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Dimension " name="vcdimension">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Enter Book link </label>
            <input type="text" class="form-control" value="{{ $carmarket->vcbooknow }}" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Book link " name="vcbooknow">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1"> Select Car category </label>
            <select class="form-control" name="carmarcategory">
                <option> Select </option>
                @foreach($carcategorys as $carcategory)
                    <option value="{{ $carcategory->id }}" @if($carcategory->id == $carmarket->carmarcategory_id) selected @endif> {{ $carcategory->carcatname }}</option>
                @endforeach
            </select>
        </div>

        <button type="submit" class="btn btn-primary"> Update </button>
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
