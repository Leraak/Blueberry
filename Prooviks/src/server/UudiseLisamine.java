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
	    	  ResultSet rs = conn.createStatement().executeQuery("SELECT EXISTS(select * from uudised where uudise_pealkiri='" + req.getParameter("pealkiri") + "')");
	    	  rs.next();
	    	  if(Integer.parseInt(rs.getString("SELECT EXISTS(select * from uudised where uudise_pealkiri='" + req.getParameter("pealkiri") + "')")) > 0 ){
	    		  out.println(
	  	                "<html><head></head><body>Sellise pealkirjaga uudis on juba olemas! " +
	  	                "Redirecting...</body></html>");
	    		  resp.setHeader("Refresh", "1; url=/lisa.jsp");
	    	  }
	    	  else {
	        String uudise_pealkiri = req.getParameter("pealkiri");
	        String uudise_sisu = req.getParameter("sisu");
	        String pildi_url = req.getParameter("pildi_url");
	        Double latitude = Double.parseDouble(req.getParameter("Latitude"));
	        Double longitude = Double.parseDouble(req.getParameter("Longitude"));
	        String tag = req.getParameter("tags");
	        if (uudise_pealkiri == "" || uudise_sisu == "") {
	          out.println(
	              "<html><head></head><body>Sa ei sisestanud pealkirja ega uudise sisu. " +
	              "Redirecting...</body></html>");
	        } else {
	        //andmed andmebaasi
	          String statement = "INSERT INTO uudised (uudise_pealkiri, uudise_sisu, pildi_url, asukoht_lat, asukoht_long, tag) VALUES( ? , ? , ? , ? , ? , ? )";
	          PreparedStatement ps = conn.prepareStatement(statement);
	          ps.setString(1, uudise_pealkiri);
	          ps.setString(2, uudise_sisu);
	          ps.setString(3, pildi_url);
	          ps.setDouble(4, latitude);
	          ps.setDouble(5, longitude);
	          ps.setString(6, tag);
	          
	          int success = 2;
	          success = ps.executeUpdate();
	          if (success == 1) {
	            	resp.sendRedirect("bsproov3.jsp");
	          } else if (success == 0) {
	            out.println(
	                "<html><head></head><body>Ebaõnnestus! Proovi uuesti! " +
	                "Redirecting...</body></html>");
	          }
	        }
	    	  }
	      } finally {
	        conn.close();
	      }
	    } catch (SQLException e) {
	      e.printStackTrace();
	    }
		resp.setHeader("Refresh", "1; url=/lisa.jsp");
	}
}
