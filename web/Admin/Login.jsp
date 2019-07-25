
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../InfoNawBar.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
      <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
      <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
  </head>
  <body>
    <p><br/></p>
        <div class="row span12">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                        <div class="panel panel-default">
                                <div class="panel-body">
                                        <div class="page-header" style="margin-top:5px;">
                                                <h3>Admin Log in</h3>
                                        </div>
                                    <form action="../LoginServlet" method="post" class="form-horizontal" role="form">
                                                <div class="form-group">
              <label for="inputfn3" class="col-sm-2 control-label">Username</label>
        <div class="col-sm-10">
                <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                        <input type="text" name="username" class="form-control" id="inputfn3" placeholder="Username">
                                                        </div>
                                                        </div>
                                                </div>
                                               
                                <div class="form-group">
           <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                  <div class="col-sm-10">
                 <div class="input-group">
                     <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                     <input type="password" class="form-control" name="password" id="inputPassword3" placeholder="Password">
                           </div>
                           </div>
                                                </div>
                                                <div class="form-group">
       <div class="col-sm-offset-2 col-sm-10">
<!--           <a href="Registration.jsp"><button type="button" class="btn btn-primary" onclick="" >Registration</button></a>-->
     <button type="submit" class="btn btn-success">Login</button>
           </div>
     </div>
      </form>
 </div>
        </div>
                </div>
                <div class="col-md-2"></div>
        </div>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui.js" type="text/javascript"></script>
  </body>
</html>
