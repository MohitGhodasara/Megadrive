<%
      String location="0";
      if (request.getParameterMap().containsKey("location")) 
      {
            location = request.getParameter("location");
      }
      if(session.getAttribute("userid") == null)
      {  
          response.sendRedirect("Login.jsp");
      }
%>
<html>
<head>   
    <style type="text/css">
        body{
            margin: 0;
            padding: 0;
            left: 0;
            right: 0;
           
        }
                .tab
              {
                  padding: 10px 0;
                  width: 100%; 
                  text-align: center; 
                  background-color: #ffb040;
                  margin: 10px 0;
                  font-size: 16px !important;
                  color: black !important;
                
              }
              .sizeBox
              {
                  padding: 10px 0;
                  width: 100%; 
                  height: 40%;
                  text-align: center; 
                  background-color: #ffb040;
                  margin: 10px 0;
                  font-size: 16px !important;
                  color: black !important;
                  background-color: white; 
                  border-radius: 10px;
                 
              }
        .imgstyle
        {
            width: 60px;
            height: 60px;
       //     background : url('Img/Mohit Ghodasara.jpg') no-repeat center;
            background-size: 100% 120%;
            border-radius: 5px;
        }
        .container0
        {
            height: 100%;
            width: 100%;
/*            background-color: yellow;*/
        }
        .top0
        {            
            height: 20%;
            width: 100%;
            background-color: #999999;  
            float: left;
        }
        .bottom0
        {
            height: 2%;
            width: 100%;
            background-color: #999999;
            float: left;
        }
       
        .left0
        {
            height: 78%;
            width: 15%;
         //   background-color: #999999;
            float: left;
          //  background-color: #666666;
        }
       
        .mid0
        {
            height: 78%;
            width: 65%;
            float: left;
            overflow-y:auto;
	    float:left;
	    //position:relative;
            margin-left:-5px;
            border-size:0.5px 0 0 50px;
            border-color: black;
            //border-left:  15px solid black; 
            border-right:   1px solid black; 
/*           ffb040*/
            border-style:solid;
            border-radius: 5px 0 0 5px;
            
            
        }
        .right0
        {
            height: 78%;
            width: 20%;
/*            background-color: yellow;*/
            float: left;
            
             border-size:2px;
            border-style:solid;
            border-radius:    0  5px 5px 0;
             border-left:  1px solid black; 
            border-color:black;
            
        }
        .menu0{
            width: 150px;
            background: #000;
            color: #fff;
            position:absolute;
            z-index: 999999;
            display: none;
            box-shadow: 0 0 10px #713C3C;
            //box-radius: 20px;
        }
        .menu0 ul{
            list-style: none;
            padding: 0;
            margin:0;
        }
        .menu0 ul a{
            text-decoration: none;
        }
        .menu0 ul li{
          //  width: 88%;
            padding: 6%;
            background-color: #ffb040;
/*         #ffc940   #ffb040 #F04D44*/
            color: black;
            font-size: 15px;
        }
        .menu0 ul li:hover{
            background-color: #F04D44;
            color: #fff;
               font-weight: bold;
        }
        
/*        Model Center*/
          .modal {
                           text-align: center;
                           padding: 0!important;
                         }

                         .modal:before {
                           content: '';
                           display: inline-block;
                           height: 100%;
                           vertical-align: middle;
                           margin-right: -4px; /* Adjusts for spacing */
                         }

                         .modal-dialog {
                           display: inline-block;
                           text-align: left;
                           vertical-align: middle;
                         }
        
/*     over    Model Center */        
        
/*        css for selectable */
.folder{
    
    padding: 5px !important;
    width: 215px !important; 
    overflow: hidden !important; 
    white-space: nowrap !important; 
    text-overflow: ellipsis !important; 
    padding-bottom: 65px !important;
}
.wrap{
    
    width: 95% !important; 
    overflow: hidden !important; 
    white-space: nowrap !important; 
    text-overflow: ellipsis !important; 
}
#feedback { font-size: 1.4em; }
#select .ui-selecting { background: #ffc940; }
  #select .ui-selected { 
     // background: #ffb075;
     background: #ffb040;
      color: black ;
      border-radius: 5px;
  }
  
  #select { list-style-type: none; margin: 0; padding: 0; width: 60%; }
  #select li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 18px; }
  
/*selectable over*/

    </style>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var AjaxCheck = { Check:"value"};
        function storageSize()
        {
                    $.ajax({
                          url: "SizeServlet",
                          success: function(data){                         
                        $("#UsedSize").html(data);
                    }});    
            
        }
        function downloadFile()
        {
            
            var FileID = SelectData.substring(0, SelectData.length - 3);
            var FileName = $('#'+FileID).attr("FileName");
            if(FileID.indexOf("!-!") < 0 && FileName.indexOf(".") > 0)
            {
                       window.location.href = 'DownloadServlet?FileID='+FileID;
            }
        }
        function getInfo(temp)
        {
                    $.ajax({
                          type: "POST",
                          url: "GetInfoServlet",
                          data: { 
                                'FileID': temp,
                          },
                          success: function(data){                         
                        $("#GetInfo").html(data);
                    }});    
        }
        function renameBox()
        {
            
            if(SelectData!='')
            {
                  $('#RenameModalBox').modal('show');      
                  
            }
            
            var id = SelectData.split("!-!");
            $('#RenameTxt').val($('#'+id[0]).attr("FileName"));      
            
        }
        function rename()
        {
            var Rename = $('#RenameTxt').val();          
            
            if(Rename=='')
            {
                $('#RenameModalBox').modal('show');
            }
            else
            {
                    $.ajax({
                          type: "POST",
                          url: "RenameAjax",
                          data: { 
                                'SelectData': SelectData,
                                'name': Rename,
                          },
                          success: function(){                         
                      loadData();
                    }});    
            }            
            
        }
        
        function createFolder()
        {
            var name = $('#foldername').val();            
               
            if(name=='')
            {
                $('#myModal').modal('show');
            }
            else
            {
                $('#myModal').modal('hide');
                    $.ajax({
                          type: "POST",
                          url: "CreateAjax",
                          data: { 
                                'location': '<%=location%>',
                                'name': name,
                          },
                          success: function(){                         
                      loadData();
                    }});    
            }
        }
        function loadData()
        {
                            //Ajax for file Load
                  $.ajax({
                        url: "BackAjax", 
                        type: 'POST',
                        data: { 
                                'location': '<%=location%>'
                        },
                      success: function(result){
                      $("#select").html(result);
                    }});    

                      //Ajax Over
            
        }
        function goback()
        {
            if('<%=location%>'=="0")
            {
                return;    
            }            
                  $.ajax({
                        url: "PreviousAjax", 
                        type: 'POST',
                        data: { 
                                'location': '<%=location%>'
                        },
                      success: function(result){
                      window.location.href = 'Data.jsp?location='+result;
                    }});    
        }
          $(document).ready(function() {
          
          $('[data-toggle="tooltip"]').tooltip(); 
          
                 storageSize();
                 loadData();
            
           $(".container").on("contextmenu",function(e){
               
                e.preventDefault();
                            
            });
                        
           $(".container").on("contextmenu",function(e){
               
                e.preventDefault();
                            
            });

           $("#explorer").on("contextmenu",function(e){
                //prevent default context menu for show click
                e.preventDefault();

                var menu = $(".menu0");

                //hide menu if already shown
                menu.hide();

                //get x and y values of the click event
                var pageX = e.pageX;
                var pageY = e.pageY;

                //position menu div near mouse cliked area
                menu.css({top: pageY , left: pageX});

                var mwidth = menu.width();
                var mheight = menu.height();
                var screenWidth = $(window).width();
                var screenHeight = $(window).height();

                //if window is scrolled
                var scrTop = $(window).scrollTop();

                //if the menu is close to right edge of the window
                if(pageX+mwidth > screenWidth){
                    menu.css({left:pageX-mwidth});
                }

                //if the menu is close to bottom edge of the window
                if(pageY+mheight > screenHeight+scrTop){
                    menu.css({top:pageY-mheight});
                }

                //finally show the menu
                menu.show();
            });
            
            $("html").on("click", function(){
                $(".menu0").hide();
            });
        });
        
//        Jquery of selectable
 $(function() {
    $( "#select" ).selectable();
  });

// selectable over        
               
            
        
       

var SelectData = "";
//var SelectData = {selected: []};
   $(function() {
    $( "#select" ).selectable({
        cancel: "span",
      stop: function() {
        SelectData = "";
        $( ".ui-selected", this ).each(function() {
          var index = $( "#select a" ).index( this );
          var temp = $("#select a").get(index).id;
                        //var init = temp.indexOf("<filename");
                        //var fin = temp.indexOf("</filename");
                       //temp = temp.substr(init+30,fin-init-30);
                       getInfo(temp);
           SelectData=SelectData + temp +"!-!";
        });       
      }
    });
  });

function DeleteData()
{
    $.ajax({
          url: 'DeleteAjax',
          type: 'POST',
           data: { 
                    'SelectData': SelectData
                 },
        success: function(data) {
            loadData();
            storageSize();
            $("#GetInfo").html("");
        },
        error: function(data) {
            alert("File Selecting problem...");
        }
    }); 
}



//File Upload JavaScript
function checkSize()
{
	var file = document.getElementById("file1").files[0];
                    $.ajax({
                          type: "POST",
                          url: "SizeCheckAjax",
                          data: { 
                                'size': file.size,
                          },
                          
                          success: function(data){
                            if(data=="Space")
                            {
                               uploadFile(file);
                            }
                            else
                            {
                                alert("Drive does not have sufficient space");
                            }
                    }});    
}

function uploadFile(file){
    
                    var location = '<%=location%>';           
            
                  // alert(file.name+" | "+file.size+" | "+file.type);
                            var formdata = new FormData();
                            formdata.append("file1", file);
                            var ajax = new XMLHttpRequest();
                            ajax.upload.addEventListener("progress", progressHandler, false);
                            ajax.addEventListener("load", completeHandler, false);
                            ajax.addEventListener("error", errorHandler, false);
                            ajax.addEventListener("abort", abortHandler, false);
                            ajax.open("POST", "FileUploadServlet?location="+location);
                            ajax.send(formdata);
                            $("#arrow").attr("src","Img/arrow.gif");
                            $("#arrow").css('opacity') = '1';
}
function progressHandler(event){
//	document.getElementById("loaded_n_total").innerHTML = "Uploaded "+event.loaded+" bytes of "+event.total;
	var percent = (event.loaded / event.total) * 100;
        //document.getElementById("progressBar").value = Math.round(percent);
        document.getElementById("progressBar").style.width = Math.round(percent)+"%";
        
	document.getElementById("status").innerHTML = Math.round(percent)+"% uploaded...";
}
function completeHandler(event){
        loadData();
        storageSize();
        document.getElementById("progressBar").style.width="0%";
        document.getElementById("status").innerHTML = event.target.responseText;
        $("#arrow").attr("src","Img/arrow.png");
       // $("#arrow").css('opacity') = "0.6";
        
	
	//document.getElementById("progressBar").value = 0;
        
}
function errorHandler(event){
    
	document.getElementById("status").innerHTML = "Upload Failed";
        $("#arrow").attr("src","Img/arrow.png");
        $("#arrow").css('opacity') = '0.6';
}
function abortHandler(event){
	document.getElementById("status").innerHTML = "Upload Aborted";
        $("#arrow").attr("src","Img/arrow.png");
        $("#arrow").css('opacity') = '0.6';
}

//Over File Upload JavaSript



        
        
</script>

</head>
<body style="background-color: #999999">
    
    <div class="container0" >
        <div class="top0 " >
            <nav class="navbar navbar-inverse" style="z-index: 1000">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
        <a class="navbar-brand" href="index.jsp">Megadrive</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li class="active"><a href="Data.jsp">Home <span class="sr-only">(current)</span></a></li>
        <li><a  href="Profile.jsp">Profile</a></li>
<!--        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Drop lissst <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>-->
      </ul>
<!--      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Search</button>
      </form>-->
      <ul class="nav navbar-nav navbar-right">
        <li><a href="About.jsp">About</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" 
             aria-expanded="false"><%=session.getAttribute("userid")%> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="Profile.jsp">Profile</a></li>
            <li><a href="Registration.jsp">Register</a></li>
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
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
       
 
          <div class="container fixed" style="padding-top: 10px">
          <div class="btn-toolbar row"  role="toolbar">
<button onclick="goback()" class="col-lg-push-1 col-lg-1 btn btn-warning" style="color: #000"  >
      <i class="glyphicon glyphicon-share-alt pull-left"></i> Back </button>    
<button data-toggle="modal" data-target="#myModal" class="col-lg-push-1 col-lg-1 btn btn-warning" style="color: #000" >
      <i class="glyphicon glyphicon-folder-open pull-left"></i>  Create</button>    
<button onclick="DeleteData()" class="col-lg-push-1 col-lg-1 btn btn-warning " style="color: #000" >
      <i class="glyphicon glyphicon-trash pull-left"></i> Delete</button>
<button onclick="renameBox()" class="col-lg-push-1 col-lg-1 btn btn-warning" style="color: #000" >
    <i class="glyphicon glyphicon-edit pull-left"></i> Rename</button>
<button onclick="document.getElementById('file1').click()"class="col-lg-1 col-lg-push-1 btn btn-warning" 
         style="color: #000" > <i class="glyphicon glyphicon-cloud-upload pull-left"></i> Upload</button>
<button onclick="downloadFile()"class="col-lg-1 col-lg-push-1 btn btn-warning" style="color: #000" > 
    <i class="glyphicon glyphicon-download-alt pull-left" style="margin-left: -5px;"></i> &nbsp;Download</button>
 
 
 
     <form id="upload_form" enctype="multipart/form-data" method="post">
     <input style="display: none" type="file" onchange="document.getElementById('btnclk').click()" name="file1" id="file1">
     <input style="display: none" type="button" id="btnclk" value="Upload File" onclick="checkSize()">
          </form>
          </div>
        </div>
</div>
          <div class="left0">
              <div class="" style="height: 100%;width: 100%;padding: 10px;">
                  <div class="tab btn btn-danger" data-toggle="modal" data-target="#myModal"  id="NewBtn"><i class="glyphicon glyphicon-plus"></i> New</div>
                  <div class="tab btn btn-warning " onclick="window.location.href='Data.jsp'">
                      <i class="glyphicon glyphicon-folder-open"></i> &nbsp; My Drive </div>
                  <div class="" style="height: 40%;"  >
                      <img src="Img/arrow.png" id="arrow" style="height: 100%;width: 100% ;padding: 30px 20%; opacity: 0.6" />
                  </div>
                  <div class="sizeBox"  >
                      <div style="padding: 20% 0;">
                          <a style="font-size: 17px;"><b><i class="glyphicon glyphicon-list"></i> Storage Used</b></a>
                      <br/>
                      <br/>
                      <a id="UsedSize"></a>
                      <br/>
                      <br/>
                      <b><a id="status" style=""></a></b>
                      </div>
                  </div>
              </div>
          </div>
          <div class="mid0" id="explorer"  style="background-color: white">
            <div id="select" style="padding: 5px;width: auto" class="explorer ui-selected"></div>
        </div>
          <div class="right0" style="background-color: #ffe2b2" ><span id="GetInfo"></span></div>
          <div class="bottom0" >
              
                
              <div id="progressBar" class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar"
  aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width:0%">
  </div>
            
              
              
<!--            <progress class='pull-right' id="progressBar" value="0" max="100" 
                                      style="width:100%; height: 100%;"></progress>
              
            <p id="loaded_n_total"></p>-->
            
            
          </div>
    </div>
<div class="menu0" id="menu">
    <ul>
        <a data-toggle="modal" data-target="#myModal" ><li>New Folder</li></a>
        <a onclick="document.getElementById('file1').click()"><li>Upload</li></a>
        <a onclick="renameBox()"><li>Rename</li></a>
        <a onclick="DeleteData()" href="#"><li>Delete</li></a>
        <a onclick="downloadFile()" href="#"><li>Download</li></a>
    </ul>
</div>
                    <div class="modal fade" id="myModal" role="dialog">
                 <div class="modal-dialog" style="width: 500px">

                 <!-- Modal content-->
                 <div class="modal-content">
                     <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">New Folder</h4>
                   </div>
                     <div class="modal-body">

                     <div class="form-group">
                       <label for="recipient-name" class="control-label">Folder Name...</label>
                       <input type="text" class="form-control" id="foldername">
                     </div>
                   </div>
                   <div class="modal-footer">
                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" onclick="createFolder()" 
                     class="btn btn-primary" style="width: 70px" >Ok</button>
                   </div>
                 </div>

               </div>
             </div> 
          
          
          <div class="modal fade" id="RenameModalBox" role="dialog">
                 <div class="modal-dialog" style="width: 500px">

                 <!-- Modal content-->
                 <div class="modal-content">
                     <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">Rename</h4>
                   </div>
                     <div class="modal-body">

                     <div class="form-group">
                         <form>
                       <label for="recipient-name" class="control-label">Rename...</label>
                       <input type="text" class="form-control" id="RenameTxt">
                     </div>
                   </div>
                   <div class="modal-footer">
                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                     <button type="submit" onclick="rename();" 
                     class="btn btn-primary" style="width: 70px" data-dismiss="modal">Ok</button>
                     </form>
                   </div>
                 </div>

               </div>
             </div> 
          
          
          
           <div class="modal fade" id="progressBarView" role="dialog">
                 <div class="modal-dialog" style="width: 500px">

                    <!-- Modal content-->
                 <div class="modal-content">
                     <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">Rename</h4>
                   </div>
                     <div class="modal-body">

                     <div class="form-group">
                         <form>
                       <label for="recipient-name" class="control-label">Rename...</label>
                       <input type="text" class="form-control" id="RenameTxt">
                     </div>
                   </div>
                   <div class="modal-footer">
                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                     <button type="submit" onclick="rename();" 
                     class="btn btn-primary" style="width: 70px" data-dismiss="modal">Ok</button>
                     </form>
                   </div>
                 </div>

               </div>
             </div> 
          
          
          
          
          
        
</body>
</html>
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/jquery-ui.js" type="text/javascript"></script>