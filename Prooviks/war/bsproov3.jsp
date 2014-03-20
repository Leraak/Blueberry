<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>
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
  <%
  Class.forName("com.mysql.jdbc.GoogleDriver");
  
	Connection conn = DriverManager.getConnection("jdbc:google:mysql://mustikauudised:blueberrysql/uudisteportaal?user=root");
	ResultSet rs = conn.createStatement().executeQuery(
	    "SELECT uudiseid, uudise_pealkiri, uudise_sisu, pildi_url FROM uudised order by uudiseid desc");
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
		      <img src="<%= pildi_url  %>" width="300px" alt="...">
		      </a>
		      <div class="caption">
		      <a href="/bsuudis.jsp?id=<%= id %>">
		        <h3><%= pealkiri %></h3>
		        </a>
		        <p> tagid </p>
		        <p><a href="#" class="btn btn-primary" role="button">Lisa lemmikutesse</a> 
		        <a href="#" class="btn btn-default" role="button">Muuda</a></p>
		      </div>
		    </div>
        </div><!-- /.col-sm-4 -->
	<%
	}
	conn.close();
	%>
	</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>