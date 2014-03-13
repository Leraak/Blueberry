package server;

import java.io.*;
import java.sql.*;

import javax.servlet.http.*;

import com.google.appengine.api.utils.SystemProperty;

public class UudiseLisamine extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String url = null;
		try {
		      if (SystemProperty.environment.value() ==
		          SystemProperty.Environment.Value.Production) {
		        // Load the class that provides the new "jdbc:google:mysql://" prefix.
		        Class.forName("com.mysql.jdbc.GoogleDriver");
		        url = "jdbc:google:mysql://mustikauudised:blueberrysql/uudisteportaal";
		      } else {
		        // Local MySQL instance to use during development.
		        Class.forName("com.mysql.jdbc.Driver");
		        url = "jdbc:mysql://173.194.84.247:3306/uudisteportaal";

		        
		      }
		    } catch (Exception e) {
		      e.printStackTrace();
		      return;
		    }
		
		PrintWriter out = resp.getWriter();
		try {
	    	Connection conn = DriverManager.getConnection(url, "root", "parool");
	      try {
	        String pealkiri = req.getParameter("name");
	        String uudise_sisu = req.getParameter("sisu");
	        if (pealkiri == "" || uudise_sisu == "") {
	          out.println(
	              "<html><head></head><body>Sa ei sisestanud pealkirja ega uudise sisu. " +
	              "Redirecting in 3 seconds...</body></html>");
	        } else {
	          String statement = "INSERT INTO uudised (pealkiri, uudise_sisu) VALUES( ? , ? )";
	          PreparedStatement stmt = conn.prepareStatement(statement);
	          stmt.setString(1, pealkiri);
	          stmt.setString(2, uudise_sisu);
	          int success = 2;
	          success = stmt.executeUpdate();
	          if (success == 1) {
	            out.println(
	                "<html><head></head><body>Uudis lisatud! Redirecting in 3 seconds...</body></html>");
	          } else if (success == 0) {
	            out.println(
	                "<html><head></head><body>Ebaõnnestus! Proovi uuesti! " +
	                "Redirecting in 3 seconds...</body></html>");
	          }
	        }
	      } finally {
	        conn.close();
	      }
	    } catch (SQLException e) {
	      e.printStackTrace();
	    }
	}
}
