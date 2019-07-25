<%-- 
    Document   : UserList
    Created on : Feb 1, 2016, 4:25:47 PM
    Author     : administrator
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="MegaDrive.DataConnection" %>
<%@include file="../../AdminNawBar.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/bootstrap.js" type="text/javascript"></script>
    <script src="../../js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../js/jquery-ui.js" type="text/javascript"></script>
        <script>
            var start=0;
            LoadUser(0);
            function LoadUser(start)
            {
         
                                    $.ajax({
                          url: 'BackUser.jsp',
                          type: 'POST',
                           data: { 
                                    'start': start
                                 },
                        success: function(data) {
                            
                            var record = data.search("NoRecordFound");
                            if(record != -1)
                            {
                                LoadUser(function (){ if(start>0){return start-=10;}else{return 0;} });
                            }
                            else
                            {
                                $("#PutUser").html(data);
                            }
                        },
                        error: function(data) {
                            alert("User Load problem...");
                        }
                    }); 
              



            }
        </script>
        <title>Users</title>
    </head>
    <body>
        <div class="container" style="padding-top: 25px">
            <h2>User Rows</h2>
  <p>The table shows all registered users</p>   
            <div  class="avbar-brand col-sm-0"></div>
        <button class="btn btn-info col-sm-1" onclick="LoadUser(function (){ if(start>0){return start-=10;}else{return 0;} })" >previous</button>
        <button class="btn btn-info col-sm-1 col-lg-offset-9" onclick="LoadUser(start+=10)" >Next</button>
        <div id="PutUser" class="avbar-brand container" style="clear: both"></di>
   
    </body>
    
</html>
