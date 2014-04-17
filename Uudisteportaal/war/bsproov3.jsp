<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mustikauudised</title>
    <meta charset="UTF-8">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <%
  Class.forName("com.mysql.jdbc.GoogleDriver");
  
	Connection conn = DriverManager.getConnection("jdbc:google:mysql://mustikauudised:blueberrysql/uudisteportaal?user=root");
	ResultSet rs = conn.createStatement().executeQuery(
	    "SELECT uudiseid, uudise_pealkiri, uudise_sisu, pildi_url FROM uudised order by uudiseid desc");
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    ResultSet rs2 = conn.createStatement().executeQuery("SELECT * FROM lemmikud");
%>
  
	<jsp:include page="/header2.jsp"></jsp:include>
	<div class="row">
    <%
	while (rs.next()) {
		int id = rs.getInt("uudiseid");
		String pealkiri = rs.getString("uudise_pealkiri");
		String uudise_sisu = rs.getString("uudise_sisu");
		String pildi_url = rs.getString("pildi_url");
	 %>
	   <div class="col-md-6 col-lg-4" >
		<div class="thumbnail">
			<a href="/bsuudis.jsp?id=<%= id %>">
		      <img src="<%= pildi_url  %>" alt="<%= pealkiri %>">
		      </a>
		      <div class="caption">
		      <a href="/bsuudis.jsp?id=<%= id %>">
		        <h3><%= pealkiri %></h3>
		        </a>
		        <%
			        if (user != null) {
				    	String a = user.getNickname();
				    	pageContext.setAttribute("user", user);
				    	boolean lemmikUudis = false;
				    	while(rs2.next()){
				    		String kasutajanimi = rs2.getString("kasutajanimi");
				    		int uudiseID = rs2.getInt("uudiseID");
				    		
				    		if(kasutajanimi.equals(a) && id == uudiseID){ //kasutaja lemmikuudis
				    			lemmikUudis = true;
				 %>
					<!-- LEMMIKUUDIS -->
					<form action="/lemmikutesse" method="post">
								<input type="hidden" name="lemmikuID" value="<%= id %>" /> 
					        	<button type="submit" class="btn btn-default" disabled>Lisa lemmikutesse</button>
					        </form>
		        <%			rs2.first();
		        			break;
				    		}//if
				    	}//while
						if(lemmikUudis == false){
							%>
							<form action="/lemmikutesse" method="post">
								<input type="hidden" name="lemmikuID" value="<%= id %>" /> 
					        	<button type="submit" class="btn btn-default">Lisa lemmikutesse</button>
					        </form>
					    <%
				    	rs2.first();
			    		}
			        }//if
		        %>
		      </div>
		    </div>
        </div><!-- /.col-sm-4 -->
	<%
	}//while
	conn.close();
	%>
	</div>
  </body>
</html>

<!-- Bootstrap -->
    <link type="text/css" href="bsstyle/bootstrap.min.css" rel="stylesheet">
  <link type="text/css" href="stylesheets/StyleSheet5.css" rel="stylesheet">
	<link type="text/css" href="bsstyle/bootstrap-theme.min.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>