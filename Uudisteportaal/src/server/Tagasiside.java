package server;

import java.io.*;
import java.sql.*;
import com.google.appengine.api.users.*;

import javax.servlet.http.*;

import com.google.appengine.api.utils.SystemProperty;

public class Tagasiside extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			Class.forName("com.mysql.jdbc.GoogleDriver");
		    } catch (Exception e) {
		      e.printStackTrace();
		      return;
		    }
		
		PrintWriter out = resp.getWriter();
		try {
	    	Connection conn = DriverManager.getConnection("jdbc:google:mysql://mustikauudised:blueberrysql/uudisteportaal?user=root");
	      try {
	    	String tyyp = req.getParameter("tyyp");
	    	String sisu = req.getParameter("kastike");
	        //andmed andmebaasi
	          String statement = "INSERT INTO tagasiside (tagasiside_tyyp, sisu) VALUES( ? , ? )";
	          PreparedStatement ps = conn.prepareStatement(statement);
	          ps.setString(1, tyyp);
	          ps.setString(2, sisu);
	          
	          int success = 2;
	          success = ps.executeUpdate();
	          if (success == 1) {
	  			out.println(
	  		              "<html><head></head><body>Tagasiside edastatud! " +
	  		              "Redirecting ...</body></html>");
	          } else if (success == 0) {
	          }
	      } finally {
	        conn.close();
	      }
	    } catch (SQLException e) {
	      e.printStackTrace();
	    }
			resp.setHeader("Refresh", "2; url=/bskontakt.jsp");
	}
}
