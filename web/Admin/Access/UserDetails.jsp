<%-- 
    Document   : UserDetails.jsp
    Created on : Feb 1, 2016, 5:18:23 PM
    Author     : administrator
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MegaDrive.DataConnection"%>
<%@page import="MegaDrive.SizeServlet" %>
<%@include file="../../AdminNawBar.jsp" %>
<!DOCTYPE html>
<% 
    DataConnection data = new DataConnection();
    Connection conn = data.getConnection();
    Statement st =conn.createStatement();
    String Userid = null;
      if (request.getParameterMap().containsKey("userid")) 
      {
            Userid = request.getParameter("userid");
      }
      else
      { 
           response.sendRedirect("./UserList.jsp");
           return;
      }
   
    String sql = "Select * from Userinfo Where userid='"+Userid+"'";
    ResultSet rs = st.executeQuery(sql);
    rs.first();
    
    
       String SizeQuery = "SELECT SUM(size) FROM data  Where userid='"+Userid+"' ;";
            ResultSet rsSize = conn.createStatement().executeQuery(SizeQuery);
            rsSize.first();
        //    long FileSize = Long.parseLong(request.getParameter("size"));
            long TotalSize = rsSize.getLong(1);
            SizeServlet ss = new SizeServlet();
           String UsedSize = ss.getSize(TotalSize);
   
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=Userid%></title>
        <link href="../../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
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
                        <a href="Registration.jsp">Registration</a>
                    </li>
                </ul>
 <ul class="nav navbar-nav navbar-right">
        <li><a href="About.jsp">About</a></li>
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
                             <li><a href="LogoutServlet">LogOut</a></li>
            <%                  

            
                        } 
                        else
                        {  
            %>
                            <li><a href="Login.jsp">Login</a></li>
            <%  
                        }  
            
            %>
          </ul>
        </li>
      </ul>
            </div>
            
         
        </div>
        
    
    </nav>
    </div>
    <div class="container">
    <h1>Edit Profile</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
<!--      <div class="col-md-3">
        <div class="text-center">
            <img src="../../Img/Mohit Ghodasara.jpg" class="avatar img-circle" height="200" width="200" alt="avatar">
          <h6>Upload a different photo...</h6>
          
          <input class="form-control" type="file">
        </div>
      </div>-->
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <i class="fa fa-coffee"></i>
         <strong><%=UsedSize%><strong> of <strong> 1GB </strong>Used .
        </div>
        <h3>Personal info</h3>
        
        <form class="form-horizontal" role="form">
          <div class="form-group">
            <label class="col-lg-3 control-label">First name:</label>
            <div class="col-lg-8">
                <input class="form-control" value="<%=rs.getString("name")%>" type="text">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Last name:</label>
            <div class="col-lg-8">
              <input class="form-control" value="<%=rs.getString("sname")%>" type="text">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
              <input class="form-control" value="<%=rs.getString("emailid")%>" type="text">
            </div>
          </div>
         
          <div class="form-group">
            <label class="col-md-3 control-label">Username:</label>
            <div class="col-md-8">
              <input class="form-control" value="<%=rs.getString("userid")%>" type="text">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Password:</label>
            <div class="col-md-8">
              <input class="form-control" value="000000000000" type="password">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Confirm password:</label>
            <div class="col-md-8">
              <input class="form-control" value="000000000000" type="password">
            </div>
          </div>
             <div class="form-group">
            <label class="col-md-3 control-label">Birthdate:</label>
            <div class="col-md-8">
                <input class="form-control" value="<%=rs.getString("birthdate")%>" type="date">
            </div>
          </div>
             <div class="form-group">
            <label class="col-md-3 control-label">Mobile:</label>
            <div class="col-md-8">
                <input class="form-control" value="<%=rs.getString("mobile")%>" type="number">
            </div>
          </div>
             <div class="form-group">
            <label class="col-md-3 control-label">Gender:</label>
            <div class="col-md-8">
                  <select class="form-control" name="gender" >
                      <option <% if(rs.getString("gender").equalsIgnoreCase("male")){ out.print("selected=\"select\"");  }  %>>Male</option>
                    <option <% if(rs.getString("gender").equalsIgnoreCase("female")){ out.print("selected=\"select\"");  }  %>>Female</option>
                    <option <% if(rs.getString("gender").equalsIgnoreCase("other")){ out.print("selected=\"select\"");  }  %>>Other</option>
                </select><br>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input class="btn btn-primary" value="Save Changes" type="button">
              <span></span>
              <input class="btn btn-default" value="Cancel" type="reset">
            </div>
          </div>
        </form>
      </div>
  </div>
</div>
<hr>
 <script src="../../js/bootstrap.js" type="text/javascript"></script>
    <script src="../../js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../js/jquery-ui.js" type="text/javascript"></script>
    </body>
   
</html>

