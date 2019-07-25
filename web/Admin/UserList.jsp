<%-- 
    Document   : UserList
    Created on : Feb 1, 2016, 4:25:47 PM
    Author     : administrator
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="MegaDrive.DataConnection" %>
<%@include file="../InfoNawBar.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <title>Users</title>
    </head>
    <body>
        
        <% 
            DataConnection datas = new DataConnection();
            Connection conn = datas.getConnection();
            Statement st =conn.createStatement();
            String sql = "Select * from Userinfo";
            ResultSet rs = st.executeQuery(sql);
            
        %>
        <div class="container" style="padding-top: 25px">
  <h2>User Rows</h2>
  <p>The table shows all registered users</p>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Username</th>
        <th>Email</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      
<%
            
    while(rs.next())
    {
%>   
      <tr>
          <td><%=rs.getString("name")%></td>
        <td><%=rs.getString("sname")%></td>
        <td><%=rs.getString("userid")%></td>
        <td><%=rs.getString("emailid")%></td>
        <td><a href="UserDetails.jsp?userid=<%=rs.getString("userid")%>"><input  type="button" class="btn btn-info" value="Details"/></a></td>
      </tr>
<%   
    }
%>
      
      
    </tbody>
  </table>
</div>
<script src="../js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui.js" type="text/javascript"></script>
    </body>
    
</html>
