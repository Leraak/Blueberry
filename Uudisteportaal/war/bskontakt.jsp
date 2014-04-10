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
   <jsp:include page="/header2.jsp"></jsp:include>
    
    
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
		        <button class="btn btn-primary btn-sm" onclick="saada()">Saada tagasiside</button>
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
    <script type="text/javascript">
    	saada(){
    		alert("Saadetud!");
    	}
    </script>
  </body>
</html>