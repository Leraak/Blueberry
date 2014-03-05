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
        <style>
        </style>
        <script type="text/javascript"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script src="js/popBox/popbox.min.js" type="text/javascript"></script>
        <link href="js/popBox/popbox.css" rel="stylesheet" type="text/css"/>
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
            <h2>Kell vms</h2>
            <h2>Lemmikud</h2>
            <h2>Tellimine</h2>
            <h2>Kalender</h2>
        </div>
    </body>
</html>