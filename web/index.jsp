<%-- 
    Document   : index
    Created on : Feb 19, 2016, 4:09:33 PM
    Author     : administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
      
        <style>
            body{
                background-image: url(Img/digital.jpg);
            }
            h1 span{
                color: white;
                transition: all 0.5s ease-in-out;
            }
            hr{
                transition: all 0.5s cubic-bezier(1.000, -0.530, 0.405, 1.425);
            }
            h1:hover span{
                color: #F04D44;
            }
            
            body{
              font-style:initial;
            }
        </style>
        <script>
            $(document).ready(function(){

                $(".btn").hover(function(){

                    $(this).addClass("btn-info");  //Add the active class to the area is hovered
                    document.getElementById("hrID").style =" transform: translateY(90px)";
                }, function () {
                    $(this).removeClass("btn-info");
                    document.getElementById("hrID").style ="";
                });

              });
        </script>


</head>

<body >

    <!-- Navigation -->
    
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right" style="font-size: 17px;">
                    <li>
                        <a href="About.jsp"><strong>A</strong>bout</a>
                    </li>
                    <li>
                        <a href="Data.jsp"><strong>D</strong>ata</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>


    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header">
        <div class="container">

            <div class="row" style="padding: 15% 0%">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1 style="color: white" ><strong><span>M</span>egaDrive.Com</strong></h1>
                        <h4 style="color: white">keep in touch with your data</h4>
                        <hr id="hrID" class="intro-divider ">
                        <ul class="list-inline intro-social-buttons">
                            <li>
                                <a href="Registration.jsp" class="btn btn-default btn-lg"><i class="glyphicon glyphicon-tasks"></i> <span class="network-name"><strong>R</strong>egistration</span></a>
                            </li>
                            <li>
                                <a href="Login.jsp" class="btn btn-default btn-lg"><i class="glyphicon glyphicon-briefcase"></i> <span class="network-name"><strong>L</strong>ogin</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>

    </div>

</body>

</html>
