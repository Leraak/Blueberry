<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="header" class="disain">
	<div id="logo">
	 	<img src="http://hookedadventures.com/wp-content/uploads/2010/07/blueberry-icon-e1285742618434.png">
	 	<h2>BLUEBERRY</h2>
	 </div>
	 <div id="logimine">
	 <%
	    UserService userService = UserServiceFactory.getUserService();
	    User user = userService.getCurrentUser();
	    if (user != null) {
	    	pageContext.setAttribute("user", user);
	 %>
	 	<ul>
	 		<li><p>Hello, ${fn:escapeXml(user.nickname)}!</p></li>
	 		<li><a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">SIGN OUT</a></li>
		</ul>
	<%
	    } else {
	%>
	 	<ul>
	 		<li><a href="<%= userService.createLoginURL(request.getRequestURI()) %>">LOGI SISSE</a></li>
	 	</ul>
	<%
	    }
	%>
    </div>
</div>