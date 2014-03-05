<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="stylesheets/StyleSheet.css"/>
        <link rel="stylesheet" type="text/css" href="stylesheets/StyleSheet2.css"/>
    </head>
<body>
	<div id="telli" class="disain">
            <h2>Telli Meilile</h2>
            <h3>Vali teemad</h3>
            <h4>Kui tihti </h4>
            <div id="valik">
                <form>
                    <input type="checkbox">Üks<br>
                    <input type="checkbox">Kaks<br>
                    <input type="checkbox">Kolm
                </form>
            </div>
            <div id="kuna">
              <select>
  					<option value="paev">Kord päevas</option>
  					<option value="nadal">Kord nädalas</option>
  					<option value="kuu">Kord kuus</option>
			  </select> 
            </div>
            <button id="b1" type="button">Telli</button> 
            <button id="b2" type="button">x</button> 
     </div>



</body>
</html> 