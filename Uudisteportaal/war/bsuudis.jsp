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
          <%
          	//db ühendus
          	Class.forName("com.mysql.jdbc.GoogleDriver");
  			Connection conn = DriverManager.getConnection("jdbc:google:mysql://mustikauudised:blueberrysql/uudisteportaal?user=root");
  			ResultSet rs1 = conn.createStatement().executeQuery("select kasutajanimi, uudise_pealkiri, uudised.uudiseID from lemmikud join uudised where uudised.uudiseID=lemmikud.uudiseID");
  			//parameeter uudise jaoks
  			String id = request.getParameter("id");
  			if(id == null){
  				response.sendRedirect("bsproov3.jsp");
  			}
          		//autentimine
			    UserService userService = UserServiceFactory.getUserService();
			    User user = userService.getCurrentUser();
			    if (user != null) {
			    	String a = user.getNickname();
			    	pageContext.setAttribute("user", user);
			 %>
			 	<li><p class="navbar-text navbar-left">Signed in as <%= a %></p></li>
			 	<li><a href="<%= userService.createLogoutURL(request.getRequestURI() + "?id=" + id) %>">Logi välja</a></li>
				<li class="dropdown">
	              <a href="#l" class="dropdown-toggle" data-toggle="dropdown">Lemmikud <b class="caret"></b></a>    
	              <ul class="dropdown-menu">
	              <%
						while(rs1.next()){
							String kasutajanimi = rs1.getString("kasutajanimi");
					  		String uudise_pealkiri = rs1.getString("uudise_pealkiri");
					  		int uudiseID = rs1.getInt("uudiseID");
							if(kasutajanimi.equals(a)){
	              %>
					<li><a href="/bsuudis.jsp?id=<%= uudiseID %>"><%= uudise_pealkiri %></a></li>
					<%
							}
						}
					%>
		          </ul>
		       </li>
			 <%
			    } else {
			%>
            <li><a href="<%= userService.createLoginURL(request.getRequestURI() + "?id=" + id) %>">Logi sisse</a></li>
            <%
			    }
			%>
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
    <%
		ResultSet rs = conn.createStatement().executeQuery(
		    "SELECT uudise_pealkiri, uudise_sisu, pildi_url, asukoht_lat, asukoht_long FROM uudised WHERE uudiseid=" + id);
		rs.next();
		String pealkiri = rs.getString("uudise_pealkiri");
		String uudise_sisu = rs.getString("uudise_sisu");
		String pildi_url = rs.getString("pildi_url");
		Double latitude = rs.getDouble("asukoht_lat");
		Double longitude = rs.getDouble("asukoht_long");
		conn.close();
	%>
    
  	<div class="container">
      <div class="row">
  		<div class="col-xl-2 well">
			<div class="thumbnail">
		      <img src="<%= pildi_url %>" alt="<%= pealkiri %>">	
		      <div class="nupud">
		      	<button class="btn btn-primary">Lisa lemmikutesse</button>
		      	<button class="btn btn-primary">Muuda uudist</button>
			  	<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">Kaart</button>
			  </div>
		      <div class="caption">
		        <h3><%= pealkiri %></h3>
		        <p><%= uudise_sisu %></p>
		      </div>
		    </div>
		    
  		</div>
  		<div class="col-xl-6 well">
  			<h3>Kommentaarid</h3>
			<div class="alert alert-success"><h4>Kasutaja1</h4>Mulle maitsevad kommid.</div>	
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
      <%
      	String x = "/map.jsp?latitude=" + latitude + "&longitude=" + longitude;
      %>
      <div class="modal-body">
        <object type="text/html" data="<%= x %>">
    </object>
      </div>
    </div>
  </div>
</div>
  </body>
</html>