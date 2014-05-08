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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Uudis</title>
    
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
  			//lemmikuudised, join lause
  			ResultSet rs1 = conn.createStatement().executeQuery("select kasutajanimi, uudise_pealkiri, uudised.uudiseID from lemmikud join uudised where uudised.uudiseID=lemmikud.uudiseID");
  			//lemmikuudiste arv, group by lause
  			ResultSet rs2 = conn.createStatement().executeQuery("select kasutajanimi, count(*) from lemmikud group by kasutajanimi");
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
			 	<li><p class="navbar-text navbar-left">Tere, <%= a %>!</p></li>
			 	<li><a href="<%= userService.createLogoutURL(request.getRequestURI() + "?id=" + id) %>">Logi välja</a></li>
				<li class="dropdown">
				<%
					int lemmikuid = 0;
					while(rs2.next()){
						String kasutajanimi = rs2.getString("kasutajanimi");
						int count = rs2.getInt("count(*)");
						if(kasutajanimi.equals(a)){
							lemmikuid = count;
						}
					}//while
				%>
	              <a href="#l" class="dropdown-toggle" data-toggle="dropdown">Lemmikud (<%=lemmikuid%>) <b class="caret"></b></a>    
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
            <li><a href="/bskontakt.jsp">Kontakteeru</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Otsing <b class="caret"></b></a>			 
              <ul class="dropdown-menu">
    			<li>
            	  <form class="navbar-form navbar-left" action='/otsing' method="post">
       				<div class="form-group">
         			 <input type="text" id="otsing" name="otsingu_sisu" class="form-control" placeholder="Otsi">
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
	%>
    
  	<div class="container">
      <div class="row">
  		<div class="col-md-12 well">
			<div class="thumbnail">
		      <img src="<%= pildi_url %>" alt="<%= pealkiri %>">	
		      <div class="nupud">
			  	<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">Kaart</button>
			  </div>
		      <div class="caption">
		        <h3><strong><%= pealkiri %></strong></h3>
		        <p><%= uudise_sisu %></p>
		      </div>
		    </div>
		    
	</div>
  		<div class="col-md-12 well">
  			<h3 id="kommentaaridh3">Kommentaarid</h3>

<% 
    String new_comment_name = request.getParameter("new_comment_name");
    String new_comment_text = request.getParameter("new_comment_text");
    if(new_comment_name != null && new_comment_text != null &&
        new_comment_text.length() >= 1 && new_comment_name.length() >= 1) {
        String updateStatement =
                " INSERT INTO kommentaarid " +
                " (kommenteerija, uudiseID, kommentaari_sisu) VALUES " +
                " (?, ?, ?) ";
        PreparedStatement pstmt = conn.prepareStatement(updateStatement);
        pstmt.setString(1, new_comment_name);
        pstmt.setInt(2, Integer.parseInt(id));
        pstmt.setString(3, new_comment_text);
        int success = pstmt.executeUpdate();
    }
%>


    <div id="comments_holder">
        <%
            ResultSet kommentaarid = conn.createStatement().executeQuery(
                "SELECT id, kommenteerija, kommentaari_sisu FROM kommentaarid WHERE uudiseID=" + id);
            while(kommentaarid.next()) {

                String kommentaari_id = kommentaarid.getString("id");
                String kommenteerija = kommentaarid.getString("kommenteerija");
                String kommentaar = kommentaarid.getString("kommentaari_sisu");
                %>
                    <div class="bscomment" id="bscomment-<%= kommentaari_id %>">
                        <span><%= kommenteerija %>: </span>
                        <%= kommentaar %>
                    </div>
                <%
            }
            conn.close();
        %>
    </div>

          <form action="" method="POST" role="form">
               <h3 id="lisa_kommentaar_h3">Lisa kommentaar</h3>
                <div id="new_comment_error_box"></div>
                <div class="form-group">
                    <label for="new_comment_name">Nimi:</label>
                    <input type="text" name="new_comment_name" id="new_comment_name" class="form-control" value="" required="required" title="" placeholder="Sisesta nimi...">
                    <label for="new_comment_text">Sisu:</label>
                    <textarea rows="5" name="new_comment_text" class="form-control" id="new_comment_text" required="required" placeholder="Lisa kommentaar..."></textarea>
                    <input type="hidden" name="uudise_id" id="uudise_id" value="<%= id %>">
                </div>
                <button type="submit" id="new_comment_submit" class="btn btn-primary">Sisesta!</button>
          </form>
	</div>

    </div> <!-- /container -->
	</div>
	
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
<!-- Bootstrap -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="js/bsuudis.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>