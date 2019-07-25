<%-- 
    Document   : AdminNawBar
    Created on : Mar 1, 2016, 12:07:31 PM
    Author     : Mohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link href="../../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/bootstrap.js" type="text/javascript"></script>
    <script src="../../js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../js/jquery-ui.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
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
                <a class="navbar-brand" href="../../index.jsp">MegaDrive</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="../../Data.jsp">Home</a>
                    </li>
                    <li>
                        <a href="../../Login.jsp">Login</a>
                    </li>
                    <li>
                        <a href="../../Registration.jsp">Registration</a>
                    </li>
                </ul>
 <ul class="nav navbar-nav navbar-right">
        <li><a href="../../About.jsp">About</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" 
             aria-expanded="false"><% if(session.getAttribute("userid") != null){ out.println(session.getAttribute("userid")); }else{ out.println("Action");} %> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="../../Profile.jsp">Profile</a></li>
            <li><a href="../../Registration.jsp">Register</a></li>
            <li role="separator" class="divider"></li>
            <% 
                        //session = request.getSession(false);
                       // String name=(String)session.getAttribute("name");
                        if(session.getAttribute("userid") != null)
                        {  
                            
                                  
            %>
                             <li><a href="../../LogoutServlet">LogOut</a></li>
            <%                  

            
                        } 
                        else
                        {  
            %>
                            <li><a href="../../Login.jsp">Login</a></li>
            <%  
                        }  
            
            %>
          </ul>
        </li>
      </ul>
            </div>
            
         
        </div>
        
    
    </nav>
            <div class="container" style="padding-top: 40px">
    </div>
    </body>
</html>
