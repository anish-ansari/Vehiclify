@extends('layout')
@section('dashboard-content')

    @if(Session::get('deleted'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert" id="gone">
            <strong> {{ Session::get('deleted') }} </strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif

    @if(Session::get('delete-failed'))
        <div class="alert alert-warning alert-dismissible fade show" role="alert" id="gone">
            <strong> {{ Session::get('delete-failed') }} </strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif

    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            All Dotm Bluebooks </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th> Company Name </th>
                        <th> Model </th>
                        <th> Manufactured Year </th>
                        <th> Cylinder</th>
                        <th> CC </th>
                        <th> Chasis No </th>
                        <th> Engine No </th>
                        <th> Color </th>
                        <th> Seat Capacity </th>
                        <th> Fuel type </th>
                        <th> Bought From </th>
                        <th> Use </th>
                        <th> Driving Area </th>
                        <th> Renew Date </th>
                        <th> Dp image </th>
                        <th> DD image </th>
                        <th>Actions </th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th> Company Name </th>
                        <th> Model </th>
                        <th> Manufactured Year </th>
                        <th> Cylinder</th>
                        <th> CC </th>
                        <th> Chasis No </th>
                        <th> Engine No </th>
                        <th> Color </th>
                        <th> Seat Capacity </th>
                        <th> Fuel type </th>
                        <th> Bought From </th>
                        <th> Use </th>
                        <th> Driving Area </th>
                        <th> Renew Date </th>
                        <th> Dp image </th>
                        <th> DD image </th>
                        <th>Actions </th>
                    </tr>
                    </tfoot>
                    <tbody>

                    @foreach($dotmbluebooks as $dotmbluebook)

                        <tr>
                            <td> {{ $dotmbluebook->dcompanyname }} </td>
                            <td> {{ $dotmbluebook->dmodel }} </td>
                            <td> {{ $dotmbluebook->dmanufacturedyear }} </td>
                            <td> {{ $dotmbluebook->dcylinder }} </td>
                            <td> {{ $dotmbluebook->dcc }} </td>
                            <td> {{ $dotmbluebook->dchasisno }} </td>
                            <td> {{ $dotmbluebook->dengineno }} </td>
                            <td> {{ $dotmbluebook->dcolor }} </td>
                            <td> {{ $dotmbluebook->dseatcapacity }} </td>
                            <td> {{ $dotmbluebook->dfueltype }} </td>
                            <td> {{ $dotmbluebook->dboughtfrom }} </td>
                            <td> {{ $dotmbluebook->duse }} </td>
                            <td> {{ $dotmbluebook->ddrivingarea }} </td>
                            <td> {{ $dotmbluebook->drenewdate }} </td>
                            <td> <img src="{{ $dotmbluebook->dpimage }}" width="100" height="100"></td>
                            <td> <img src="{{ $dotmbluebook->dpimage }}" width="100" height="100"></td> 
                            <td>
                                <a href="{{ URL::to('edit-dotmbluebook') }}/{{ $dotmbluebook->id }}" class="btn btn-outline-primary btn-sm"> Edit </a>
                                <hr>
                                <a href="{{ URL::to('delete-dotmbluebook') }}/{{ $dotmbluebook->id }}" class="btn btn-outline-danger btn-sm" onclick="checkDelete()"> Delete </a>                   
                            </td>

                        </tr>


                    @endforeach



                    </tbody>
                </table>
            </div>
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
    </div>

    <script>
        function checkDelete() {
            var check = confirm('Are you sure you want to Delete this?');
            if(check){
                return true;
            }
            return false;
        }
    </script>

@stop
