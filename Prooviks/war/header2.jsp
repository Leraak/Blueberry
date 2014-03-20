<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Proov3</title>

    <!-- Bootstrap -->
    <link href="bsstyle/bootstrap.min.css" rel="stylesheet">
    <link href="stylesheets/StyleSheet5.css" rel="stylesheet">
    <link href="bsstyle/bootstrap-theme.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
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
          Class.forName("com.mysql.jdbc.GoogleDriver");
    	  
	  		Connection conn = DriverManager.getConnection("jdbc:google:mysql://mustikauudised:blueberrysql/uudisteportaal?user=root");
	  		ResultSet rs = conn.createStatement().executeQuery("select kasutajanimi, uudise_pealkiri, uudised.uudiseID from lemmikud join uudised where uudised.uudiseID=lemmikud.uudiseID");
		    UserService userService = UserServiceFactory.getUserService();
		    User user = userService.getCurrentUser();
		    if (user != null) {
		    	String a = user.getNickname();
		    	pageContext.setAttribute("user", user);
		 %>
            <li><p class="navbar-text navbar-left">Signed in as <%= a %></p></li>
			<li><a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Logi välja</a></li>
			<li class="dropdown">
              <a href="#l" class="dropdown-toggle" data-toggle="dropdown">Lemmikud <b class="caret"></b></a>    
              <ul class="dropdown-menu">
              <%
					while(rs.next()){
						String kasutajanimi = rs.getString("kasutajanimi");
				  		String uudise_pealkiri = rs.getString("uudise_pealkiri");
				  		int id = rs.getInt("uudiseID");
						if(kasutajanimi.equals(a)){
              %>
				<li><a href="/bsuudis.jsp?id=<%= id %>"><%= uudise_pealkiri %></a></li>
				<%
						}
					}
				%>
	          </ul>
	       </li>
			<%
			    } else {
			%>
			<li><a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Logi sisse</a></li>
            <%
			    } conn.close();
			%>
            <li><a href="#registreeri">Registreeri</a></li>
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
  </body>
</html>