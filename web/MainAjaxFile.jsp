<%-- 
    Document   : MainAjaxFile
    Created on : Dec 3, 2015, 5:50:31 PM
    Author     : administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
    $("button").click(function(){
        $.ajax({url: "BackAjax", success: function(result){
            $("#div1").html(result);
        }});
    });
});
</script>
</head>
<body>

<div id="div1"><h2>Let Change This Text</h2></div>

<button>Get External Content</button>

</body>
</html>
