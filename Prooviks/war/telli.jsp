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
     <div id="telli">
     <table>
     	<caption><h2>Telli Meilile</h2></caption>
     	<tr>
     		<th>Vali teemad</th>
     		<th>Kui tihti</th>
     	</tr>
     	<tr>
     		<td>
	     		<form>
	                <input type="checkbox">Üks<br>
	                <input type="checkbox">Kaks<br>
	                <input type="checkbox">Kolm
	            </form>
     		</td>
     		<td>
     			<select>
	  				<option value="paev">Kord päevas</option>
	  				<option value="nadal">Kord nädalas</option>
	  				<option value="kuu">Kord kuus</option>
				</select> 
     		</td>
     	</tr>
     </table>
     <button type="button">Telli</button>
     </div>



</body>
</html> 