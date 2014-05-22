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
            <!-- Bootstrap -->
    <link href="bsstyle/bootstrap.min.css" rel="stylesheet">
    <link href="bsstyle/bootstrap-theme.min.css" rel="stylesheet">
    <link href="stylesheets/lisauudis.css" rel="stylesheet">
        <style>
        #map_canvas {
        width: 500px;
        height: 400px;
      	}
        </style>
        <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <script type="text/javascript">
        var myMarkerIsDraggable = true;
		var myCoordsLenght = 6;
		var defaultLat = 37.973787;
		var defaultLng = 23.722426;
		
		function initialize() {
        		var map_canvas = document.getElementById('map_canvas');
        		var parliament = new google.maps.LatLng(58.378307, 26.71463);
        		var marker;
        		var map;
        		var map_options = {
          			center: new google.maps.LatLng(defaultLat, defaultLng),
          			zoom: 1,
          			mapTypeId: google.maps.MapTypeId.ROADMAP
        			}
        		var map = new google.maps.Map(map_canvas, map_options)
        		marker = new google.maps.Marker({
        		    map:map,
        		    draggable:true,
        		    animation: google.maps.Animation.DROP,
        		    position: parliament
        		  });
        		  google.maps.event.addListener(marker, 'click', toggleBounce);
        		  google.maps.event.addListener(marker, 'dragend', function(evt){
        			      document.getElementById('latitude').value = evt.latLng.lat().toFixed(myCoordsLenght);
        			      document.getElementById('longitude').value = evt.latLng.lng().toFixed(myCoordsLenght);
        			  });

        		}
     		

        		function toggleBounce() {

        		  if (marker.getAnimation() != null) {
        		    marker.setAnimation(null);
        		  } else {
        		    marker.setAnimation(google.maps.Animation.BOUNCE);
        		  }
        		}

        		google.maps.event.addDomListener(window, 'load', initialize);
        </script>
        <script type="text/javascript"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    </head>
    <body>
    	<jsp:include page="/header2.jsp"></jsp:include>
    <div class="row">
	    <div class="panel panel-default">
		    <div class="panel-heading">
		      <h3 class="panel-title">Otsi kaardi järgi</h3>
		    </div>
		    <div class="panel-body">
				    <form action="/kaardiotsing" method="post">
						<div class="form-group">
					  		<h2>Uudise asukoht: </h2>
						    	<div id="map_canvas"></div>
						    	<label for="latitude">Latitude:</label>
					  				<input name="Latitude" id="latitude" type="text" value="0.0" /><br>
						    			<label for="longitude">Longitude:</label>
					  				<input name="Longitude" id="longitude" type="text" value="0.0" />
					  				<button type="submit">Otsi!</button>
						    </div>	    
					</form>
			</div>
		</div>
	</div>
    </body>
</html>