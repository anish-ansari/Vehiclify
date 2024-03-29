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
            All User </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th> User Name</th>
                        <th> User Email </th>
                        <th> User Phone </th>
                        <th> User Birth Date </th>
                        <th> User Address </th>
                        <th> User FatherName </th>
                        <th> User Citizenship no </th>
                        <th> Verify </th>
                        {{-- <th> USer Icon </th> --}}
                        <th>Actions </th>
                        
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th> User Name</th>
                        <th> User Email </th>
                        <th> User Phone </th>
                        <th> User Birth Date </th>
                        <th> User Address </th>
                        <th> User FatherName </th>
                        <th> User Citizenship no </th>
                        <th> Verify </th>
                        {{-- <th> User Icon </th> --}}
                        <th>Actions </th>
                    </tr>
                    </tfoot>
                    <tbody>

                    @foreach($users as $user)

                        <tr>
                            <td> {{ $user->name }} </td>
                            <td> {{ $user->email }} </td>
                            <td> {{ $user->phone }} </td>
                            <td> {{ $user->dateofbirth }} </td>
                            <td> {{ $user->address }} </td>
                            <td> {{ $user->fathername }} </td>
                            <td> {{ $user->citizenshipno }} </td>
                            <td> {{ $user->verify }} </td>
                            {{-- <td> {{ $user->name }} </td> --}}
                            {{-- <td> <img src="{{ $user->icon }}" width="100" height="100"></td> --}}
                            <td>
                                <a href="{{ URL::to('edit-user') }}/{{ $user->id }}" class="btn btn-outline-primary btn-sm"> Correction </a>
                                {{-- <a href="{{ URL::to('soft-delete-user') }}/{{ $user->id }}" class="btn btn-outline-warning btn-sm" onclick="checkDelete()">Soft Delete </a> --}}
                                <hr>
                                
                                <a href="{{ URL::to('verify-user') }}/{{ $user->id }}" class="btn btn-outline-primary btn-sm"> Verify Status </a>
                                <hr>

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
