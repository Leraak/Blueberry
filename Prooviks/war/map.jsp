<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="stylesheets/StyleSheet.css"/>
        <style>
        #map_canvas {
        width: 500px;
        height: 400px;
      	}
        </style>
        <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <script>
     		function initialize() {
        		var map_canvas = document.getElementById('map_canvas');
        		var map_options = {
          			center: new google.maps.LatLng(58.378307, 26.71463),
          			zoom: 18,
          			mapTypeId: google.maps.MapTypeId.ROADMAP
        			}
        		var map = new google.maps.Map(map_canvas, map_options)
      			}
      		google.maps.event.addDomListener(window, 'load', initialize);
    	</script>
        <script type="text/javascript"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script src="js/popBox/popbox.min.js" type="text/javascript"></script>
        <link href="js/popBox/popbox.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
		<div id="map_canvas"></div>
    </body>
</html>