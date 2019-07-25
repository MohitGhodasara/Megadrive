<%-- 
    Document   : Registration
    Created on : Jan 24, 2016, 6:54:32 PM
    Author     : administrator
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="MegaDrive.DataConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="InfoNawBar.jsp" %>
<!DOCTYPE html>
<script src="js/bootstrap.js" type="text/javascript"></script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script>
    function getLocation(Location,id,countryID)
    {
         $.ajax({
                          type: "POST",
                          url: "LocationAjax",
                          data: { 
                                'Location': Location,
                                'id': id,
                                'countryID': countryID,
                          },
                          success: function(data){
                              if(Location=='state')
                              {
                                  
                                  $("#stateID").html(data);  
$("#cityID").html("<select class='form-control' required name='city'><option selected disabled>City</option></select>");
                              }
                              else
                              {
                                  $("#cityID").html(data);      
                              }
                       
                    }});    
    }
</script>
    <body class="container">
        <div class="centered" style="padding: 25px">    
<div align="Center">
     <div class="page-header" style="margin-top:5px;">
                                                <h2>Registration</h2>
                                        </div>
<table>
    <form action="RegistrationServlet">  
        <tr >
            <td ><label class="col-sm-2 control-label">Name</label></td>
            <td style="width: 350px">
                <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span></span>
                    <input required type="text" class="form-control" name="fname" placeholder="First Name..."/>
                      <input required  type="text" class="form-control" name="lname" placeholder="Last Name..."/><br>
                </div>
              </td>
        </tr>
        
        
        <tr>
            <td><label class="col-sm-2 control-label">Username</label></td>
            <td>
                <div class="input-group">
                          <span class="input-group-addon">
                            <span class="glyphicon glyphicon-pencil"></span></span>
                            
                    <input required  type="text" class="form-control"  name="username" placeholder="Username..." /><br>
                </div>
               </td>
        </tr>
        
        
        <tr>
            <td>
                      <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
            </td>
            <td>
                      
                      <div class="input-group">
                        <span class="input-group-addon">@</span>
                    <input required  type="text" name="email" class="form-control" placeholder="Email ID..." /><br>
                            </div>
                    </div>
                  
           </td>
        </tr>
        
        
         <tr>
             <td><label class="col-sm-2 control-label">Password</label></td>
            <td>
                <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-star"></span></span>
                    <input required  type="password" class="form-control" name="password"  placeholder="Password..."/><br>
               </td>
        </tr>
      
        
          <tr>
             <td><label class="col-sm-2 control-label">Birth_date</label></td>
            <td>
                <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span></span>
                   <input required  type="date" class="form-control"  name="date"  placeholder="date" /><br>
               </td>
        </tr>
      
        <tr>
             <td><label class="col-sm-2 control-label">Mobile_Number</label></td>
            <td>
                <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-phone"></span></span>
                    <style>
                        input[type='number'] {
    -moz-appearance:textfield;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none;
}
                    </style>
                   <input required  type="number" name="phone"  class="form-control"  maxlength="10" placeholder="phone"/><br>
               </td>
        </tr>
      
    
        
          <tr>
             <td><label class="col-sm-2 control-label">Gender</label></td>
            <td>
                <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span></span>
                    <select class="form-control" name="gender" >
                        <option selected="selecte" disabled="disable">Select Gender</option>
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
                </select><br>
               </td>
        </tr>
      
        
          <tr>
             <td><label class="col-sm-2 control-label">Location</label></td>
            <td>
              
                <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-home"></span></span>
                  
                    <select id="countryID" class="form-control" required name="country" 
                            onchange="getLocation('state',this.value,'');">
                  <option selected disabled >Country</option>
                  <% 
                      try{

                            DataConnection data = new DataConnection();
                            Connection conn = data.getConnection();
                            Statement st = conn.createStatement();
                            String Query = "Select * from country;";
                            ResultSet rs = st.executeQuery(Query);
                            while(rs.next())
                            {
                                %>
                                <option value="<%=rs.getString("id") %>"><%=rs.getString("country") %></option>
                                <%

                            }
                      }
                      catch(Exception e)
                      {
                          out.println(e);
                      }
                  
                  %>
                  </select>
                       

            <span id="stateID">
                <select class="form-control" required name="state" onchange="getLocation('city',this.value,countryID.value);" >
                  <option selected disabled >State</option>
                </select>
            </span>            
            <span id="cityID">       
               <select class="form-control" required name="city"   >
                   <option selected disabled>City</option>
               </select>
             </span>
               </td>
        </tr>
      
        <tr>
        </tr>
      </div>
          
        <tr>
            <td></td>
            <td><div class="form-group" style="padding-top: 10px" >
                <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Register</button>
                <a href="Login.jsp"><button type="button" class="btn btn-success" onclick="">Back to Login</button></a>
                </div></td>
        </tr>
        
    
    
    
    
    </form>  
    </table>

</div>
                
</div>
</body>
