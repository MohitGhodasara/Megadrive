<%-- 
    Document   : About
    Created on : Jan 26, 2016, 10:51:19 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
    padding-top: 70px;
}

.img-center {
	margin: 0 auto;
}

footer {
    margin: 50px 0;
}
    </style>
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">MegaDrive</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="Login.jsp">Login</a>
                    </li>
                    <li>
                        <a href="Registration.jsp">Registration</a>
                    </li>
                </ul>
            </div>
         
        </div>
    
    </nav>
 
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">About Us
                    <small>It's Nice to Meet You!</small>
                </h1>
                <p>MegaDrive is a file storage and synchronization service created by Mohit Ghodasara. It allows users to store files in the cloud, share files, and edit documents, spreadsheets, and presentations with collaborators.</p>
            </div>
        </div>

        <!-- Team Members Row -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Developed by</h2>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                
                <img class="img-circle img-responsive img-center" height="200" width="200" src="Img/Mohit Ghodasara.jpg" alt=""/>
                <h3>Mohit Ghodasara
                    <small>Student</small>
                </h3>
                <p>asdnasdknaskldnalksdnalksdnlkn</p>
            </div>    
        </div>

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; MegaDrive.com 2016</p>
                </div>
              
            </div>
       
        </footer>

    </div>
    <script src="js/bootstrap.js" type="text/javascript"></script>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
</body>

</html>
