<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB PROOV</title>
</head>
<body>
<%
String url = null;
if (SystemProperty.environment.value() ==
    SystemProperty.Environment.Value.Production) {
  // Load the class that provides the new "jdbc:google:mysql://" prefix.
  Class.forName("com.mysql.jdbc.GoogleDriver");
  url = "jdbc:google:mysql://mustikauudised:blueberrysql/uudisteportaal?user=root";
} else {
  // Local MySQL instance to use during development.
  Class.forName("com.mysql.jdbc.Driver");
  url = "jdbc:mysql://173.194.84.247:3306/uudisteportaal?user=root&password=parool";
}

Connection conn = DriverManager.getConnection(url, "root", "parool");
ResultSet rs = conn.createStatement().executeQuery(
    "SELECT id, name, sisu FROM esimene_proov");
%>

<table style="border: 1px solid black">
<tbody>
<tr>
<th width="35%" style="background-color: #CCFFCC; margin: 5px">Name</th>
<th style="background-color: #CCFFCC; margin: 5px">Message</th>
<th style="background-color: #CCFFCC; margin: 5px">ID</th>
</tr>

<%
while (rs.next()) {
    String guestName = rs.getString("name");
    String content = rs.getString("sisu");
    int id = rs.getInt("id");
 %>
<tr>
<td><%= guestName %></td>
<td><%= content %></td>
<td><%= id %></td>
</tr>
<%
}
conn.close();
%>

</tbody>
</table>
<br />
No more messages!
<p><strong>Kirjuta midagi</strong></p>
<form action="/sign" method="post">
    <div>Nimi: <input type="text" name="name"></input></div>
    <div>Sisu:
    <br /><textarea name="sisu" rows="3" cols="60"></textarea>
    </div>
    <div><input type="submit" value="Go" /></div>
    <input type="hidden" name="guestbookName" />
  </form>


</body>
</html>