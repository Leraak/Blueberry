<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="stylesheets/StyleSheet.css"/>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <link rel="stylesheet" href="js/fancyBox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
		<script type="text/javascript" src="js/fancyBox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
		<script type="text/javascript" src="js/fancybox_proov.js"></script>
		
        
        <title>BEST NEWS EU</title>
    </head>
    <body>
		<jsp:include page="/header.jsp"></jsp:include>
		
        <div id="sisukord" class="disain">
            <h2>TEEMAD</h2>
            <div id="valikud">
                <form>
                    <input type="checkbox">Üks<br>
                    <input type="checkbox">Kaks<br>
                    <input type="checkbox">Kolm
                </form>
            </div>
            <div id="otsing">
            	<h2>Otsing</h2>
            </div>
        </div>

        <div id="uudised" class="disain">
        	<ul>
        		<li>Esimene</li>
        		<li>Teine</li>
        		<li>Kolmas</li>
        	</ul>
        </div>

        <div id="widgets" class="disain">
            <%
			    UserService userService = UserServiceFactory.getUserService();
			    User user = userService.getCurrentUser();
			    if (user != null) {
			    	pageContext.setAttribute("user", user);
				    if (userService.isUserAdmin()) {
					 %>
					 <ul>
					 	<li><a href="#">LISA UUDIS</a></li>
					 	<li><a href="#">MUUDA KASUTAJA SEADEID</a></li>
					 	<li><a href="#">LEMMIKUD</a></li>
					 	<li><a class="various" data-fancybox-type="iframe" href="http://www.postimees.ee">TELLIMINE</a></li>
					 </ul>
					 <%
				    	} else {
					 %>
					 <ul>
					 	<li><a href="#">LEMMIKUD</a></li>
					 	<li><a href="#">TELLIMINE</a></li>
					 </ul>
					 <%
			    	}
				} else {
			 %>
			 <ul>
			 	<li><a>Sinu jaoks ei ole siin midagi</a></li>
			 </ul>
			 <%
			    }
			 %>
        </div>
    </body>
</html>