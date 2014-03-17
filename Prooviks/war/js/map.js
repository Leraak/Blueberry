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