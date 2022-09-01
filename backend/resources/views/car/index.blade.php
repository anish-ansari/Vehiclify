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
            All Car News </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th> Title </th>
                        <th> Description </th>
                        {{-- <th> Shelf No </th> --}}
                        <th> Image </th>
                        {{-- <th> Row No </th>
                        <th> Column No </th> --}}
                        {{-- <th> Book Image </th>  --}}
                        {{-- <th> Book Qunatity</th> --}}
                        {{-- <th> User Id</th> --}}
                        <th>Actions </th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th> Title </th>
                        <th> Description </th>
                        {{-- <th> Shelf No </th> --}}
                        <th> Image </th>
                        {{-- <th> Row No </th>
                        <th> Column No </th> --}}
                        {{-- <th> Book Image </th>  --}}
                        {{-- <th> Book Qunatity</th> --}}
                        {{-- <th> User Id</th> --}}
                        <th>Actions </th>
                    </tr>
                    </tfoot>
                    <tbody>

                    @foreach($cars as $car)

                        <tr>
                            <td> {{ $car->ctitle}} </td>
                            <td> {{  $car->cdescription  }} </td>
                            {{-- <td> {{ $book->shelf_no }} </td> --}}
                            <td> <img src="{{ $car->cimage }}" width="100" height="100"></td>
                            {{-- <td> {{ $book->row_no }} </td>
                            <td> {{ $book->column_no }} </td> --}}
                            {{-- <td> <img src="{{ $book->book_image }}" width="100" height="100"></td>  --}}
                            {{-- <td> {{ $book->book_quantity }} </td>
                            <td> {{ $book->user_id }} </td> --}}
                            <td>
                                <a href="{{ URL::to('edit-car') }}/{{ $car->id }}" class="btn btn-outline-primary btn-sm"> Edit </a>
                                <hr>
                                <a href="{{ URL::to('delete-car') }}/{{ $car->id }}" class="btn btn-outline-danger btn-sm" onclick="checkDelete()"> Delete </a>                   
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
