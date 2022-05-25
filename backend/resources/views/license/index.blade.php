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
            All License </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th> User Phone</th>
                        <th> User License No </th>
                        <th> User License office </th>
                        <th> Date of issue </th>
                        <th> Date of expiry </th>
                        <th> Category </th>
                        {{-- <th> USer Icon </th> --}}
                        <th>Actions </th>
                        
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th> User Phone</th>
                        <th> User License No </th>
                        <th> User License office </th>
                        <th> Date of issue </th>
                        <th> Date of expiry </th>
                        <th> Category </th>
                        {{-- <th> User Icon </th> --}}
                        <th>Actions </th>
                    </tr>
                    </tfoot>
                    <tbody>

                    @foreach($users as $user)

                        <tr>
                            <td> {{ $user->phone }} </td>
                            <td> {{ $user->licenseno }} </td>
                            <td> {{ $user->licenseoffice }} </td>
                            <td> {{ $user->dateofissue }} </td>
                            <td> {{ $user->dateofexpiry }} </td>
                            <td> {{ $user->category}} </td>
                            
                            {{-- <td> {{ $user->name }} </td> --}}
                            {{-- <td> <img src="{{ $user->icon }}" width="100" height="100"></td> --}}
                            <td>
                                {{-- <a href="{{ URL::to('edit-user') }}/{{ $user->id }}" class="btn btn-outline-primary btn-sm"> Edit </a> --}}
                                {{-- <a href="{{ URL::to('soft-delete-user') }}/{{ $user->id }}" class="btn btn-outline-warning btn-sm" onclick="checkDelete()">Soft Delete </a>
                                <hr> --}}
                                <a href="{{ URL::to('delete-user') }}/{{ $user->id }}" class="btn btn-outline-danger btn-sm" onclick="checkDelete()"> Delete </a>
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
