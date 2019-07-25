<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MegaDrive.DataConnection"%>
<%@page import="MegaDrive.SizeServlet"%>
<%@include file="InfoNawBar.jsp" %>
<!DOCTYPE html>
<% 
    DataConnection data = new DataConnection();
    Connection conn = data.getConnection();
   // Statement st =conn.createStatement();
    String Userid=null;
      if(session.getAttribute("userid") != null)
      {
            Userid = (String)session.getAttribute("userid");
      }
      else
      { 
           response.sendRedirect("Login.jsp");
           return;
      }
   
      

    String sql = "Select * from Userinfo Where userid='"+Userid+"'";
    ResultSet rs = conn.createStatement().executeQuery(sql);
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
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <div class="container">
    <h1>Edit Profile</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
<!--      <div class="col-md-3">
        <div class="text-center">
            <img src="Img/Mohit Ghodasara.jpg" class="avatar img-circle" height="200" width="200" alt="avatar">
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
        
        <form class="form-horizontal" role="form" action="ProfileServlet" method="post">
          <div class="form-group">
            <label class="col-lg-3 control-label">First name:</label>
            <div class="col-lg-8">
                <input class="form-control" required name="fname" value="<%=rs.getString("name")%>" type="text">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Last name:</label>
            <div class="col-lg-8">
                <input class="form-control" name="lname" required value="<%=rs.getString("sname")%>" type="text">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
                <input class="form-control input-medium" required disabled="disable" value="<%=rs.getString("emailid")%>" type="text">
            </div>
          </div>
         
          <div class="form-group">
            <label class="col-md-3 control-label ">Username:</label>
            <div class="col-md-8">
                <input class="form-control input-medium" required disabled="disable" name="username" value="<%=rs.getString("userid")%>" type="text">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"  >Password:</label>
            <div class="col-md-8">
              <input class="form-control" name="password" required value="<%=rs.getString("password")%>" type="password">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Confirm password:</label>
            <div class="col-md-8">
              <input class="form-control" required value="<%=rs.getString("password")%>" type="password">
            </div>
          </div>
             <div class="form-group">
            <label class="col-md-3 control-label">Birthdate:</label>
            <div class="col-md-8">
                <input class="form-control" required name="date" value="<%=rs.getString("birthdate")%>" type="date">
            </div>
          </div>
             <div class="form-group">
            <label class="col-md-3 control-label">Mobile:</label>
            <div class="col-md-8">
                <input class="form-control"  required name="phone" value="<%=rs.getString("mobile")%>" type="number">
            </div>
          </div>
             <div class="form-group">
            <label class="col-md-3 control-label">Gender:</label>
            <div class="col-md-8">
                <select class="form-control input-medium"  required name="gender" disabled="disable">
                      <option <% if(rs.getString("gender").equalsIgnoreCase("male")){ out.print("selected=\"select\"");  }  %>>Male</option>
                    <option <% if(rs.getString("gender").equalsIgnoreCase("female")){ out.print("selected=\"select\"");  }  %>>Female</option>
                    <option <% if(rs.getString("gender").equalsIgnoreCase("other")){ out.print("selected=\"select\"");  }  %>>Other</option>
                </select><br>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
                <input class="btn btn-primary" value="Save Changes" type="submit">
              <span></span>
              <input class="btn btn-default" value="Cancel" type="reset">
            </div>
          </div>
        </form>
      </div>
  </div>
</div>
<hr>
 <script src="js/bootstrap.js" type="text/javascript"></script>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    </body>
   
</html>

