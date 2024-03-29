<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<script>
function uploadFile(){
	var file = document.getElementById("file1").files[0];
	// alert(file.name+" | "+file.size+" | "+file.type);
	var formdata = new FormData();
	formdata.append("file1", file);
	var ajax = new XMLHttpRequest();
	ajax.upload.addEventListener("progress", progressHandler, false);
	ajax.addEventListener("load", completeHandler, false);
	ajax.addEventListener("error", errorHandler, false);
	ajax.addEventListener("abort", abortHandler, false);
	ajax.open("POST", "FileUploadServlet");
	ajax.send(formdata);
}
function progressHandler(event){
	document.getElementById("loaded_n_total").innerHTML = "Uploaded "+event.loaded+" bytes of "+event.total;
	var percent = (event.loaded / event.total) * 100;
	document.getElementById("progressBar").value = Math.round(percent);
	document.getElementById("status").innerHTML = Math.round(percent)+"% uploaded... please wait";
}
function completeHandler(event){
	document.getElementById("status").innerHTML = event.target.responseText;
	document.getElementById("progressBar").value = 0;
}
function errorHandler(event){
	document.getElementById("status").innerHTML = "Upload Failed";
}
function abortHandler(event){
	document.getElementById("status").innerHTML = "Upload Aborted";
}
</script>
</head>
<body>
<h2>HTML5 File Upload Progress Bar Tutorial</h2>
<form id="upload_form" enctype="multipart/form-data" method="post">
  <input type="file" name="file1" id="file1"><br>
  <input type="button" value="Upload File" onclick="uploadFile()">
  <progress id="progressBar" value="0" max="100" style="width:300px;"></progress>
  <h3 id="status"></h3>
  <p id="loaded_n_total"></p>
</form>
</body>
</html>
