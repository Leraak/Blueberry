<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
	  		//lemmikuudiste arv, group by lause
  			ResultSet rs2 = conn.createStatement().executeQuery("select kasutajanimi, count(*) from lemmikud group by kasutajanimi");
		    UserService userService = UserServiceFactory.getUserService();
		    User user = userService.getCurrentUser();
		    if (user != null) {
		    	String a = user.getNickname();
		    	pageContext.setAttribute("user", user);
		 %>
            <li><p class="navbar-text navbar-left">Tere, <%= a %>!</p></li>
			<li><a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Logi välja</a></li>
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
     		    <li><a href="/otsingu_map.jsp">Kaardi otsing!!</a></li>
     		   </ul>
     		</li>
          </ul>
          </div>
      </div>
    </div>
   
    