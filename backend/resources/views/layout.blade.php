<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Vehiclify</title>

    <!-- Custom fonts for this template-->
    <link href="{{ URL::to('vendor/fontawesome-free/css/all.min.css') }}" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="{{ URL::to('vendor/datatables/dataTables.bootstrap4.css') }}" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="{{ URL::to('css/sb-admin.css') }}" rel="stylesheet">

    <script src="{{ URL::to('ckeditor/ckeditor.js') }}"></script>

</head>

<body id="page-top">

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="{{ URL::to('dashboard') }}">Vehiclify</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
            <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <span class="badge badge-danger">9+</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <span class="badge badge-danger">7</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user-circle fa-fw"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">Settings</a>
                <a class="dropdown-item" href="#">Activity Log</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
            </div>
        </li>
    </ul>

</nav>

<div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="{{ URL::to('dashboard') }}">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>User</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

               
                <a class="dropdown-item" href="{{ URL::to('all-users') }}"> All Users </a>

            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>License</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

               
                <a class="dropdown-item" href="{{ URL::to('all-licenses') }}"> All license </a>

            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Dotm license</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-dotmlicense') }}"> Add Dotm license</a>
                <a class="dropdown-item" href="{{ URL::to('all-dotmlicenses') }}"> All Dotm license </a>

            </div>
        




        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Bluebook</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

               
                <a class="dropdown-item" href="{{ URL::to('all-bluebooks') }}"> All bluebbok </a>

            </div>
        </li>


        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Dotm Bluebook</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-dotmbluebook') }}"> Add Dotm Bluebook</a>
                <a class="dropdown-item" href="{{ URL::to('all-dotmbluebooks') }}"> All Dotm Bluebook </a>

            </div>
        
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Fuel</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-fuel') }}"> Add Fuel</a>
                <a class="dropdown-item" href="{{ URL::to('all-fules') }}"> All Fules </a>

            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Insurance</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-insurance') }}"> Add Insurance Compnay</a>
                <a class="dropdown-item" href="{{ URL::to('all-insurances') }}"> All Insurance Company </a>

            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Car Accesories</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-caraccesorie') }}"> Add Car Accesorie Compnay</a>
                <a class="dropdown-item" href="{{ URL::to('all-caraccesories') }}"> All Car Accesorie Company </a>

            </div>
        </li>


        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Bike Accesories</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-bikeaccesorie') }}"> Add Bike Accesorie Compnay</a>
                <a class="dropdown-item" href="{{ URL::to('all-bikeaccesories') }}"> All Bike Accesorie Company </a>

            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Dotm News</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-dotm') }}"> Add Dotm News</a>
                <a class="dropdown-item" href="{{ URL::to('all-dotms') }}"> All Dotm News</a>

            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Car News</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-car') }}"> Add Car News</a>
                <a class="dropdown-item" href="{{ URL::to('all-cars') }}"> All Car News</a>

            </div>
        </li>


        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Bike News</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-bike') }}"> Add Bike News</a>
                <a class="dropdown-item" href="{{ URL::to('all-bikes') }}"> All Bike News</a>

            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Car Category</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-carcategory') }}"> Add Car Category</a>
                <a class="dropdown-item" href="{{ URL::to('all-carcategorys') }}"> All Car Category </a>

            </div>
        </li>


        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Car Service </span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-carservice') }}"> Add Car Service</a>
                <a class="dropdown-item" href="{{ URL::to('all-carservices') }}"> All Car Service</a>

            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Bike Category</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-bikecategory') }}"> Add Bike Category</a>
                <a class="dropdown-item" href="{{ URL::to('all-bikecategorys') }}"> All Bike Category</a>

            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Bike Service </span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-bikeservice') }}"> Add Bike Service</a>
                <a class="dropdown-item" href="{{ URL::to('all-bikeservices') }}"> All Bike Service</a>

            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Car Dealer </span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-cardealer') }}"> Add Car Dealer</a>
                <a class="dropdown-item" href="{{ URL::to('all-cardealers') }}"> All Car Dealer</a>

            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Bike Dealer </span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-bikedealer') }}"> Add Bike Dealer</a>
                <a class="dropdown-item" href="{{ URL::to('all-bikedealers') }}"> All Bike Dealer</a>

            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Car Market </span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-carmarket') }}"> Add Car Market</a>
                <a class="dropdown-item" href="{{ URL::to('all-carmarkets') }}"> All Car Market</a>

            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Bike Market </span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-bikemarket') }}"> Add Bike Market</a>
                <a class="dropdown-item" href="{{ URL::to('all-bikemarkets') }}"> All Bike Market</a>

            </div>
        </li>


        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Nearby</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-nearby') }}"> Add Nearby</a>
                <a class="dropdown-item" href="{{ URL::to('all-nearbys') }}"> All Nearby </a>

            </div>
        </li>


        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Driving School</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item" href="{{ URL::to('create-drivingschool') }}"> Add Driving School</a>
                <a class="dropdown-item" href="{{ URL::to('all-drivingschools') }}"> All Driving School </a>

            </div>
        </li>






       
    </ul>

    <div id="content-wrapper">

        <div class="container-fluid">

            @yield('dashboard-content')



        </div>
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
        <footer class="sticky-footer">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © Your Website 2019</span>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.content-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="{{ URL::to('vendor/jquery/jquery.min.js') }}"></script>
<script src="{{ URL::to('vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>

<!-- Core plugin JavaScript-->
<script src="{{ URL::to('public/vendor/jquery-easing/jquery.easing.min.js') }}"></script>

<!-- Page level plugin JavaScript-->
<script src="{{ URL::to('vendor/chart.js/Chart.min.js') }}"></script>
<script src="{{ URL::to('vendor/datatables/jquery.dataTables.js') }}"></script>
<script src="{{ URL::to('vendor/datatables/dataTables.bootstrap4.js') }}"></script>

<!-- Custom scripts for all pages-->
<script src="{{ URL::to('js/sb-admin.min.js') }}"></script>

<!-- Demo scripts for this page-->
<script src="{{ URL::to('js/demo/datatables-demo.js') }}"></script>
<script src="{{ URL::to('js/demo/chart-area-demo.js') }}"></script>

<script>
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.replace( 'editor1' );
</script>
</body>

</html>
