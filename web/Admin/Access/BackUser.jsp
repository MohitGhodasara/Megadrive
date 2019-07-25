<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="MegaDrive.DataConnection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <% 
            DataConnection datas = new DataConnection();
            Connection conn = datas.getConnection();
            Statement st =conn.createStatement();
            String start = request.getParameter("start");
            int pages = Integer.parseInt(start);
            String sql = "Select * from Userinfo LIMIT "+start+", 10";
            
            ResultSet rs = st.executeQuery(sql);
            int rsCount=0;
            while(rs.next())
            {
                rsCount = rsCount + 1;
            }
            if(rsCount<=0)
            {
                out.print("NoRecordFound");
                return;
            }            
            rs.beforeFirst();
        %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <title>Users</title>
    </head>
    <body>
    
           
        <h4><a class="col-lg-offset-5">Page : <%=(pages / 10) +1%></a></h4>
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
<script src="../../js/bootstrap.js" type="text/javascript"></script>
    <script src="../../js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../js/jquery-ui.js" type="text/javascript"></script>
    </body>
    
</html>