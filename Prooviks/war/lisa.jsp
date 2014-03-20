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
    <link href="bsstyle/bootstrap-theme.min.css" rel="stylesheet">
    <link href="stylesheets/lisauudis.css" rel="stylesheet">

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
	 	<div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Lisa Uudis</h3>
            </div>
            <div class="panel-body">
	 		<div class="col-md-6">
            <form class="form-horizontal" role="form"> <!-- FORM  -->
			  <div class="form-group">
    				<h2><label for="Pealkiri">Pealkiri</label></h2>
    				<div class="col-sm-6">
    					<input type="text" class="form-control" id="Pealkiri" placeholder="Pealkiri">
    				</div>
  				</div>
			  <div class="form-group">
				    <h2><label for="Sisu">Sisu</label></h2>
				    <div class="col-sm-6">
				    	<textarea name="Sisu" rows="4" cols="40"></textarea>
				    </div>
				</div>
				<div class="form-group">
				    <h2><label for="Pildi_url">Pildi url</label></h2>
				    <div class="col-sm-6">
				    	<input type="text" class="form-control" id="Pildi_url" placeholder="Pildi url">
				    </div>
				</div>
				<div class="form-group">
				    <h2><label for="Tags">Tagid (eralda komadega)</label></h2>
				    <div class="col-sm-6">
				    	<input type="text" class="form-control" id="Tags" placeholder="Tagid">
				    </div>
				</div>
			</div>
			<div class="row">
	 			<div class="col-md-6">
			  <div class="form-group">
			  		<h2>Uudise asukoht: </h2>
				    <div class="col-sm-6">
				    	<div id="map_canvas"></div>
				    	<label for="latitude">Latitude:</label>
	    				<input id="latitude" type="text" value="" /><br>
	  	    			<label for="longitude">Longitude:</label>
	    				<input id="longitude" type="text" value="" />
				    </div>
				    
				</div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">Sign in</button>
			    </div>
			  </div>
			  </div>
			</div>
			</form><!-- FORM END -->
			
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