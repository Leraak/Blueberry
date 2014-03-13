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
		
        <div id="uudiscontainer" class="disain">
        	<div id="icons">
        		<a class="variousmap" data-fancybox-type="iframe" title="kaart" href="/map.jsp"><img src="https://cdn1.iconfinder.com/data/icons/Android-R2-png/512/Maps-Android-R.png"></a>
	 			
            </div>
            <div id="uudisekene">
	 			<div id="uudispilt" style="text-align: center">
            		<img src="http://f3.pmo.ee/f/2014/03/12/2889646t151hc3c1.jpg">
            	</div>
            	<div id="uudispealkiri">
            		<h1>Külaskäik kommimeistri juurde: kuidas valmivad suussulavad kompvekid?</h1>
            	</div>
            	<div id="uudistekst" style="text-align: center">
            		Tallinnas, Pärnu maanteel Kalevi kommikaupluse tagatoas valmivad OÜ Karamelle käsitöökompvekid, mida mekivad nii peaministrid, presidendid kui ka kroonitud pead. Rootsi kuningat vaimustasid Eesti kommimeistri Vello Koosma käe all valminud kadakamarjakommid koguni nõnda, et ta neli tükki järgemööda ära sõi! 
            		Missugune on Karamelle suussulavate kompvekkide saladus ning kuidas näeb välja pisikese, kõigest 7 töötajaga kommivabriku argipäev, vaata Tallinncity videost!
            		Tallinnas, Pärnu maanteel Kalevi kommikaupluse tagatoas valmivad OÜ Karamelle käsitöökompvekid, mida mekivad nii peaministrid, presidendid kui ka kroonitud pead. Rootsi kuningat vaimustasid Eesti kommimeistri Vello Koosma käe all valminud kadakamarjakommid koguni nõnda, et ta neli tükki järgemööda ära sõi! 
            		Missugune on Karamelle suussulavate kompvekkide saladus ning kuidas näeb välja pisikese, kõigest 7 töötajaga kommivabriku argipäev, vaata Tallinncity videost!
            		Tallinnas, Pärnu maanteel Kalevi kommikaupluse tagatoas valmivad OÜ Karamelle käsitöökompvekid, mida mekivad nii peaministrid, presidendid kui ka kroonitud pead. Rootsi kuningat vaimustasid Eesti kommimeistri Vello Koosma käe all valminud kadakamarjakommid koguni nõnda, et ta neli tükki järgemööda ära sõi! 
            		Missugune on Karamelle suussulavate kompvekkide saladus ning kuidas näeb välja pisikese, kõigest 7 töötajaga kommivabriku argipäev, vaata Tallinncity videost!
            		
            	</div>
            </div>
        </div>

        <div id="chatikast" class="disain">
            <h2>Kommentaarid</h2>
            <div id="chat">
            	<textarea id="note" readonly>Liisu13: nomnom!</textarea>
            </div>
            <div id="textbox">
            	Lisa kommentaar: <input type="kommentaar" name="komm">
            </div>
        </div>
    </body>
</html>