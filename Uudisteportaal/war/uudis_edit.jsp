<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap PROOV</title>

    <!-- Bootstrap -->
    <link type="text/css" href="bsstyle/bootstrap.min.css" rel="stylesheet">
    <link href="bsstyle/StyleSheet4.css" rel="stylesheet">
    <link href="stylesheets/StyleSheet5.css" rel="stylesheet">
  
  
  <body>
   <!-- NAVBAR -->
  	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/bsproov3.jsp">Mustikauudised</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          
            <li><a href="https://www.google.com/accounts/ServiceLogin?service=ah&passive=true&continue=https://appengine.google.com/_ah/conflogin%3Fcontinue%3Dhttp://mustikauudised.appspot.com/bsuudis.jsp%253Fid%253D6&ltmpl=gm&shdf=CiQLEgZhaG5hbWUaGEJsdWViZXJyeSBVdWRpc3RlcG9ydGFhbAwSAmFoIhR-k8jv8Ek_fJEVFvL48M3LsjaDmigBMhTsmYNgoQjVDdf6ZBzhoysHc6oCKQ">Logi sisse</a></li>
            
            <li><a href="#kontakt">Kontakteeru</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Teemad/Otsi <b class="caret"></b></a>			 
              <ul class="dropdown-menu">
   			 	<li><a href="#t1">Teema 1</a></li>
            	<li><a href="#t2">Teema 2</a></li>
            	<li><a href="#t3">Teema 3</a></li>
            	<li><a href="#t6">Koerad</a></li>
    			<li class="divider"></li>
    			<li>
            	  <form class="navbar-form navbar-left" role="search">
       				<div class="form-group">
         			 <input type="text" class="form-control" placeholder="Otsi">
        			</div>
        			<button type="submit" class="btn btn-default">OTSI</button>
     		 	  </form>
     		    </li>
     		   </ul>
     		</li>
          </ul>
          </div>
      </div>
    </div>
    
    <!-- NAVBAR END -->
    
    
  	<div class="container">
      <div class="row">
  		<div class="col-md-8 col-xs-12">
			<div class="thumbnail">
		      <img src="http://www.bauhof.ee/media/wysiwyg/Uudised/mustika_avamine/Bauhof_Mustika_v_livaade_28.11.2013.jpg" alt="Proov">	
		      <div class="btn-group">
		      	<button class="btn btn-primary">Lisa lemmikutesse</button>
		      	<button class="btn btn-primary">Muuda uudist</button>
			  	<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">Kaart</button>
			  </div>
		      <div class="caption">
		        <h3>Proov</h3>
		        <p class="list-group-item-text">lalaalalal2</p>
		      </div>
		    </div>
		    
  		</div>
  		<div class="col-md-4 col-xs-12 well">
  			<h3>Kommentaarid</h3>
			<div class="alert alert-success"><h4>Kasutaja1</h4>Mulle maitsevad kommid.</div>	
			<div class="alert alert-danger"><h4>Kasutaja2</h4>Mulle ei maitse kommid.</div>
			<div class="alert alert-info"><h4>Kasutaja3</h4>Jobu oled.</div>
			<div class="alert alert-warning"><h4>Kasutaja4</h4>EDGAR, PUTIN, jeeee</div>
  		</div>
  		

    </div> 
	</div><!-- /container -->
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
        <object type="text/html" data="/map.jsp?latitude=0.0&longitude=0.0">
    </object>
      </div>
    </div>
  </div>
</div>
  </body>
</html>