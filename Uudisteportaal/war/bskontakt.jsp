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
    <link href="bsstyle/bootstrap.min.css" rel="stylesheet">
    <link href="bsstyle/StyleSheet4.css" rel="stylesheet">
    <link href="stylesheets/StyleSheet5.css" rel="stylesheet">
  
  
  <body>
   <!-- NAVBAR -->
  	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
  		<div class="col-xl-2 well">
		      <div class="caption">
		        <h2>Kontakteerumine</h2>
		        <select class="form-control-md">
			        <option selected disabled value="Vali tagasiside tüüp:">Vali tagasiside tüüp:</option>
					<option value="report">Teata ebasobivast käitumisest</option>
					<option value="bug">Teata veast veebilehe funktsionaalsuses</option>
					<option value="lisa">Soovita lisasid</option>
					<option value="kiitus">Ütle midagi ilusat</option>
				</select>
		        <textarea name="kastike" class="form-control" rows="5"></textarea>
		        <button class="btn btn-primary btn-sm">Saada tagasiside</button>
		        <table class = "table"> 
		        	<tr>
  						<th><h4>Tegijad:</h4></th>
  						<th> </th>
  						<th><h4>Email:</h4></th>
					</tr>
					<tr>
  						<td>Andreas Ellervee</td>
  						<td>  </td>
  						<td>andrease@ut.ee</td>
					</tr>
					<tr>
  						<td>Kaarel Kastehein</td>
  						<td>  </td>
  						<td>kkastehe@ut.ee</td>
					</tr>
					<tr>
  						<td>Sander Mikelsaar</td>
  						<td>  </td>
  						<td>sandermi@ut.ee</td>
					</tr>
					<tr>
  						<td>Hans Raukas</td>
  						<td>  </td>
  						<td>hans.raukas@gmail.com</td>
					</tr>
				</table>
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