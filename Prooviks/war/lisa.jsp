<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lisa uudis</title>

    <!-- Bootstrap -->
    <link href="bsstyle/bootstrap.min.css" rel="stylesheet">
    <link href="stylesheets/StyleSheet5.css" rel="stylesheet">
    <link href="bsstyle/StyleSheet4.css" rel="stylesheet">
    <link href="bsstyle/bootstrap-theme.min.css" rel="stylesheet">
    <link href="js/popBox/popbox.css" rel="stylesheet" type="text/css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
	<jsp:include page="/header2.jsp"></jsp:include>
	 <div class="row">
	 	<div class="col-md-6">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Lisa Uudis</h3>
            </div>
            <div class="panel-body">
              <form>
              	 <div class="form-group">
    				<h2><label for="Pealkiri">Pealkiri</label></h2>
    				<input type="text" class="form-control" id="Pealkiri" placeholder="Pealkiri">
  				</div>
				<div class="form-group">
				    <h2><label for="Sisu">Sisu</label></h2>
				    <textarea name="sisu" rows="4" cols="60"></textarea>
				</div>
                <h2>Uudise pilt</h2>
                	<input type="url" class="form-control" id="Pilt"placeholder="Pilt">
                <h2>Uudise asukoht</h2>
                	<style>
        				#map_canvas {
        				width: 500px;
        				height: 400px;
      					}
        			</style>
                	<div id="map_canvas"></div>
    				<label for="latitude">Latitude:</label>
    				<input id="latitude" type="text" value="" />
  	    			<label for="longitude">Longitude:</label>
    				<input id="longitude" type="text" value="" />

              </form>
            </div>
         </div>
        </div>
        </div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="js/map.js"></script>
    <script type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script src="js/popBox/popbox.min.js" type="text/javascript"></script>
  </body>
</html>