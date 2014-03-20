package server;

import java.io.*;
import java.sql.*;

import javax.servlet.http.*;

import com.google.appengine.api.utils.SystemProperty;

public class KommentaariLisamine extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int uudise_id = 0;
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
	        String kommenteerija = req.getParameter("name");
	        uudise_id = Integer.parseInt(req.getParameter("id"));
	        String kommentaar = req.getParameter("kommentaar");
	        
	        if (kommentaar == "") {
	          out.println(
	              "<html><head></head><body>Puudub sisu. " +
	              "Redirecting...</body></html>");
	        } else {
	        //andmed andmebaasi
	          String statement = "INSERT INTO kommentaarid (kommenteerija, uudiseID, kommentaar) VALUES( ? , ? , ? )";
	          PreparedStatement ps = conn.prepareStatement(statement);
	          ps.setString(1, kommenteerija);
	          ps.setInt(2, uudise_id);
	          ps.setString(3, kommentaar);
	          
	          int success = 2;
	          success = ps.executeUpdate();
	          if (success == 1) {
	            	resp.sendRedirect("uudis.jsp?id=" + uudise_id);
	          } else if (success == 0) {
	            out.println(
	                "<html><head></head><body>Ebaõnnestus! Proovi uuesti! " +
	                "Redirecting...</body></html>");
	          }
	        }
	      } finally {
	        conn.close();
	      }
	    } catch (SQLException e) {
	      e.printStackTrace();
	    }
		resp.sendRedirect("uudis.jsp?id=" + uudise_id);
	}
}
