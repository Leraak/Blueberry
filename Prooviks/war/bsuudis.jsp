<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <link rel="stylesheet" href="js/fancyBox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
		<script type="text/javascript" src="js/fancyBox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
		<script type="text/javascript" src="js/fancybox_proov.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap PROOV</title>

    <!-- Bootstrap -->
    <link href="bsstyle/bootstrap.min.css" rel="stylesheet">
    <link href="bsstyle/StyleSheet4.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  
  <body>
 	 <!-- Fixed navbar -->
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Mustikauudised</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Logi sisse</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    
      <div class="row">
      <div class="col-sm-1 well">
      	<div class="caption">
			<h4>Valikud:</h4>
      		<p><a href="#" class="btn btn-primary" role="button">Favorite</a></p>
      		<!-- Button trigger modal -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Map
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Kaart</h4>
      </div>
      <div class="modal-body">
        <object type="text/html" data="/map.jsp">
    </object>
      </div>
    </div>
  </div>
</div>
      		<p><a href="#" class="btn btn-default" role="button">Edit</a></p>
      	</div>
      </div>
  		<div class="col-sm-8 main well">
			<div class="thumbnail">
		      <img src="http://f3.pmo.ee/f/2014/03/12/2889646t151hc3c1.jpg" alt="...">
		      <div class="caption">
		        <h3>KOMMID</h3>
		        <p>Tallinnas, Pärnu maanteel Kalevi kommikaupluse tagatoas valmivad OÜ Karamelle käsitöökompvekid, mida mekivad nii peaministrid, presidendid kui ka kroonitud pead. Rootsi kuningat vaimustasid Eesti kommimeistri Vello Koosma käe all valminud kadakamarjakommid koguni nõnda, et ta neli tükki järgemööda ära sõi! 
            		Missugune on Karamelle suussulavate kompvekkide saladus ning kuidas näeb välja pisikese, kõigest 7 töötajaga kommivabriku argipäev, vaata Tallinncity videost!
            		Tallinnas, Pärnu maanteel Kalevi kommikaupluse tagatoas valmivad OÜ Karamelle käsitöökompvekid, mida mekivad nii peaministrid, presidendid kui ka kroonitud pead. Rootsi kuningat vaimustasid Eesti kommimeistri Vello Koosma käe all valminud kadakamarjakommid koguni nõnda, et ta neli tükki järgemööda ära sõi! 
            		Missugune on Karamelle suussulavate kompvekkide saladus ning kuidas näeb välja pisikese, kõigest 7 töötajaga kommivabriku argipäev, vaata Tallinncity videost!
            		Tallinnas, Pärnu maanteel Kalevi kommikaupluse tagatoas valmivad OÜ Karamelle käsitöökompvekid, mida mekivad nii peaministrid, presidendid kui ka kroonitud pead. Rootsi kuningat vaimustasid Eesti kommimeistri Vello Koosma käe all valminud kadakamarjakommid koguni nõnda, et ta neli tükki järgemööda ära sõi! 
            		Missugune on Karamelle suussulavate kompvekkide saladus ning kuidas näeb välja pisikese, kõigest 7 töötajaga kommivabriku argipäev, vaata Tallinncity videost!</p>
		      </div>
		    </div>
  		</div>
  		<div class="row">
		  <div class="col-sm-3 sidebar well">
		  <h3>Kommentaarid</h3>
			  <ul class="nav nav-sidebar">
	            <li><div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">Kasutaja1</h3>
				  </div>
				  <div class="panel-body">
				    suussulavate kompvekkide saladus ning kuidas näeb välja pisikese, kõigest 7 töötajaga kommivabriku argipäev, vaata Tallinncity videost!
            		Tallinnas, Pärnu maanteelune on Karamelle suussulavate kompvekkide saladus ning kuidas näeb välja pisikese, kõigest 7 töötajaga kommivabriku argipäev, vaata Tallinncity videost!
            		Tallinnas, Pärnu maanteel Kalevi kommikaupluse tagatoas valmivad OÜ Karamelle käsitöökompvekid, mida mekivad nii peaministrid, presidendid kui ka kroonitud pead. Rootsi kuningat vaimustasid Eesti kommimeistri Vello Koosma käe all valminud kadakamarjakommid koguni nõnda, et ta neli tükki järgemööda ära sõi! 
            		Missugune on Karamelle suussulavate kompvekkide saladus ning kuidas näeb välja pisikese, kõigest 7 töötajaga kommivabriku argipäev, vaata Tallinncity videost!
            		Tallinnas, Pärnu ma
				  </div>
				</div>
	            </li>
	            <li><div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">Kasutaja1</h3>
				  </div>
				  <div class="panel-body">
				    Missugune on Karamelle suussulavate kompvekkide saladus ningune on Karamelle suussulavate kompvekkide saladus ning kuidas näeb välja pisikese, kõigest 7 töötajaga kommivabriku argipäev, vaata Tallinncity videost!
            		Tallinnas, Pärnu maanteel Kalevi kommikaupluse tagatoas valmivad OÜ Karamelle käsitöökompvekid, mida mekivad nii peaministrid, presidendid kui ka kroonitud pead. Rootsi kuningat vaimustasid Eesti kommimeistri Vello Koosma käe all valminud kadakamarjakommid koguni nõnda, et ta neli tükki järgemööda ära sõi! 
            		Missugune on Karamelle suussulavate kompvekkide saladus ning kuidas näeb välja pisikese, kõigest 7 töötajaga kommivabriku argipäev, vaata Tallinncity videost!
            		Tallinnas, Pärnu ma
				  </div>
				</div>
				</li>
	          </ul>
	          <div class="col-sm-12">
	          	<input type="text" class="form-control" id="kommentaar" placeholder="Lisa kommentaar">
	          </div>
	          
		  </div>
		</div>

    </div> <!-- /container -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>