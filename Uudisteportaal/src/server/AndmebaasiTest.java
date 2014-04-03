package server;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.utils.SystemProperty;

public class AndmebaasiTest extends HttpServlet {
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
	    	Connection conn = DriverManager.getConnection("jdbc:google:mysql://mustikauudised:blueberrysql/uudisteportaal?user=root");
	      try {
	        String nimi = req.getParameter("name");
	        String sisu = req.getParameter("sisu");
	        if (nimi == "" || sisu == "") {
	          out.println(
	              "<html><head></head><body>You are missing either a message or a name! Try again! " +
	              "Redirecting in 3 seconds...</body></html>");
	        } else {
	          String statement = "INSERT INTO esimene_proov (name, sisu) VALUES( ? , ? )";
	          PreparedStatement stmt = conn.prepareStatement(statement);
	          stmt.setString(1, nimi);
	          stmt.setString(2, sisu);
	          int success = 2;
	          success = stmt.executeUpdate();
	          if (success == 1) {
	            out.println(
	                "<html><head></head><body>Success! Redirecting in 3 seconds...</body></html>");
	          } else if (success == 0) {
	            out.println(
	                "<html><head></head><body>Failure! Please try again! " +
	                "Redirecting in 3 seconds...</body></html>");
	          }
	        }
	      } finally {
	        conn.close();
	      }
	    } catch (SQLException e) {
	      e.printStackTrace();
	    }
	    resp.setHeader("Refresh", "3; url=/dbtest.jsp");
	}
}
