<%-- 
    Document   : SessionDestroy
    Created on : Feb 12, 2016, 11:14:32 AM
    Author     : Mohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           
      // request.getRequestDispatcher("Login.jsp").include(request, response);  
       session.invalidate();
       
       response.sendRedirect("index.jsp");
           
                   
       %>    
    </body>
</html>
