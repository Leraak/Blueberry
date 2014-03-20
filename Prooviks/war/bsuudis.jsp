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
  
  
  <body>
  	<jsp:include page="/header2.jsp"></jsp:include>
  	<div class="container">
      <div class="row">
  		<div class="col-xl-2 well">
			<div class="thumbnail">
		      <img src="http://f3.pmo.ee/f/2014/03/12/2889646t151hc3c1.jpg" alt="...">	
		      <div class="nupud">
		      	<button class="btn btn-primary btn-lg">Lisa lemmikutesse</button>
		      	<button class="btn btn-primary btn-lg">Muuda uudist</button>
			  	<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Kaart</button>
			  </div>
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
  		<div class="col-xl-6 well">
  			<h3>Kommentaarid</h3>
			<div class="alert alert-success"><h4>Kasutaja1</h4>Mulle maitsevad kommid.</div>	
			<div class="alert alert-lilla"><h4>Kasutaja1</h4>Mulle maitsevad kommid.</div>		
			<div class="alert alert-danger"><h4>Kasutaja2</h4>Mulle ei maitse kommid.</div>
			<div class="alert alert-info"><h4>Kasutaja3</h4>Jobu oled.</div>
			<div class="alert alert-warning"><h4>Kasutaja4</h4>EDGAR, PUTIN, jeeee</div>
  		</div>
  		

    </div> <!-- /container -->
	</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
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
  </body>
</html>