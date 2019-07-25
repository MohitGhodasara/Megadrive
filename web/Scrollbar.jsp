<%-- 
    Document   : Registration
    Created on : Jan 24, 2016, 6:54:32 PM
    Author     : administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="mCustomScrollbar" data-mcs-theme="dark">
    <h1>
        Search Results

    Custom scroll-bar for body on bootstrap 3 - Stack Overflow
    stackoverflow.com/questions/.../custom-scroll-bar-for-body-on-bootstrap...

Mar 25, 2014 - Ok, I see what you mean now - looks to me like you can't really use this javascript scroll solution on the <body> tag as it gets confused by the hidden ...
jQuery custom scrollbar demo - Malihu
manos.malihu.gr/tuts/jquery_custom_scrollbar.html
Default scrollbar. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure ...
15+ jQuery Custom Scrollbar Plugins, Scripts and Tutorials ...
designhuntr.com/custom-jquery-scrollers/
Mar 24, 2013 - An article with more than 15 jQuery custom scrollbar plugins, scripts, and tutorials for inspiration. Contains pure CSS3 and non-plugin jQuery ...
Bootstrap Scrollbar - Bootply
www.bootply.com/tagged/scrollbar
Bootstrap Scrollbar example snippets with CSS, Javascript and HTML. This is a Bootstrap Scrollbar snippet for Bootstrap.
‎Scrolling table - ‎H1 - ‎Scrollable
The enscroll jQuery Plugin
enscrollplugin.com/
The enscroll jQuery plugin gives web developers the power to customize scrollbars on their site.
Stylish jQuery Custom Scrollbar Plugin - GScroll | Free ...
www.jqueryscript.net › jQuery Other Plugins
Apr 16, 2014 - Prev: Minimal Custom Scrollbar Plugin with jQuery and jQuery UI - ... Simple jQuery Star Rating System For Bootstrap 3 27187 views - 4 months ...
mCustomScrollbar & Bootstrap Modal · Issue #43 · malihu ...
https://github.com/malihu/malihu-custom-scrollbar-plugin/issues/43
Mar 25, 2013 - I'm trying to implement 
    </h1>
</div>

<link rel="stylesheet" href="/path/to/jquery.mCustomScrollbar.css" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/path/to/jquery.mCustomScrollbar.concat.min.js"></script>

<script>
    (function($){
        $(window).load(function(){
            $(".content").mCustomScrollbar();
        });
    })(jQuery);
    
    $(".content").mCustomScrollbar({
    axis:"x" // horizontal scrollbar
});

$(".content").mCustomScrollbar({
    axis:"yx" // vertical and horizontal scrollbar
});
$(".content").mCustomScrollbar({
    theme:"dark"
});
</script>
