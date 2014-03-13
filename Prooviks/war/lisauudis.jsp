<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="stylesheets/StyleSheet3.css"/>
<link rel="stylesheet" type="text/css" href="stylesheets/StyleSheet.css"/>
<title>LISA UUS UUDIS</title>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	
	<div id="uudiseLisamine" class="disain">
		<form action="/addNews" method="post">
		    <div>Pealkiri:
		    <br><input type="text" name="uudise_pealkiri"></input></div>
		    <div>Sisu:
		    <br /><textarea name="sisu" rows="3" cols="60"></textarea>
		    </div>
		    <div>Pildi URL:
		    <br><input type="text" name="uudise_pilt"></input>
		    </div>
		    <div id="uudiste_teemad">Teema:
		    <br>
		    	<form>
                    <input type="checkbox">Üks
                    <input type="checkbox">Kaks
                    <input type="checkbox">Kolm
                </form>
		    </div>
		    <iframe src="map.jsp"></iframe>
		    <div><input type="submit" value="Lisa uudis" /></div>
		</form>
	</div>

</body>
</html>