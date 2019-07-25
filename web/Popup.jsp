<%-- 
    Document   : Popup
    Created on : Feb 14, 2016, 5:15:12 PM
    Author     : administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery UI Selectable - Serialize</title>
  <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <script src="js/jquery-ui.js" type="text/javascript"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
 
  <style>
  #feedback { font-size: 1.4em; }
  #selectable .ui-selecting { background: #FECA40; }
  #selectable .ui-selected { background: #F39814; color: white; }
  #selectable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
  #selectable li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 18px; }
  </style>
  <script>
var i=0;

var SelectData = {selected: []};

  $('#selectable').selectable({distance: 1});

$('#selectable > li').dblclick(function() {
	$('#selectable > li').removeClass('ui-selected');
	$(this).addClass('ui-selected');
});

$('#selectable > li').click(function() {
	$('#selectable > li').removeClass('ui-selected');
	$(this).addClass('ui-selected');
});


  </script>
</head>
<body>
 
<p id="feedback">
<span>You've selected:</span> <span id="select-result">none</span>.
</p>
<a value="asd" name="sd"></a>

<button onclick="calls()" >click</button>
<ol id="selectable" class="asd">
    <a href="#" class="ui-widget-content" id="0" >Item 0</a>
    <li onclick="alert()" class="ui-widget-content" id="1">Item 1</li>
    <li class="ui-widget-content" id="2" >Item 2</li>
    <li class="ui-widget-content" id="3">Item 3</li>
    <li class="ui-widget-content" id="4">Item 4</li>
    <li class="ui-widget-content" id="5">Item 5</li>
    <li class="ui-widget-content" id="6">Item 6</li>
</ol>
 
 
</body>
</html>
