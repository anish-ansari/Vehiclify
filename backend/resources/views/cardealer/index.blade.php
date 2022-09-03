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
            All Car Dealer Detail 
            
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th> Name </th>
                        <th> Address </th>
                        <th> Location </th>
                        <th> Phone No </th>
                        <th> Car Category </th> 
                        <th> Actions </th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th> Name </th>
                        <th> Address </th>
                        <th> Location </th>
                        <th> Phone No </th>
                        <th> Car Category </th>    
                        <th> Actions </th>                    </tr>
                    </tfoot>
                    <tbody>

                    @foreach($cardealers as $cardealer)

                        <tr>
                            <td> {{ $cardealer->cardelname }} </td>
                            <td> {{ $cardealer->cardeladdress }} </td>
                            <td> {{ $cardealer->cardellocation }} </td>
                            <td> {{ $cardealer->cardelphoneno }} </td>
                            <td> {{ $cardealer->cardelcategory->carcatname }} </td>
                            <td>
                                <a href="{{ URL::to('edit-cardealer') }}/{{ $cardealer->id }}" class="btn btn-outline-primary btn-sm"> Edit </a>
                                <hr>
                                <a href="{{ URL::to('delete-cardealer') }}/{{ $cardealer->id }}" class="btn btn-outline-danger btn-sm" onclick="checkDelete()"> Delete </a>
                                {{-- <hr>
                                <a href="{{ URL::to('restore-deleted-rule') }}/{{ $rule->id }}" class="btn btn-outline-danger btn-sm">Restore </a>                                                                 --}}
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
