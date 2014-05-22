package server;

import java.io.*;
import java.sql.*;

import javax.servlet.http.*;

import com.google.appengine.api.utils.SystemProperty;

public class KaardiOtsing extends HttpServlet {

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
		StringBuilder sb = new StringBuilder();
		try {
	    	Connection conn = DriverManager.getConnection("jdbc:google:mysql://mustikauudised:blueberrysql/uudisteportaal?user=root");
	      try {
	        Double latitude = Double.parseDouble(req.getParameter("Latitude"));
	        Double longitude = Double.parseDouble(req.getParameter("Longitude"));
	        if (longitude == 0.0 || latitude == 0.0) {
	          out.println(
	              "<html><head></head><body>Sa ei liigutanud markerit. " +
	              "Redirecting...</body></html>");
	        } else {
	        //andmed andmebaasi
	          String statement = "SELECT uudiseid, asukoht_lat, asukoht_long from uudised;";
	          ResultSet rs = conn.createStatement().executeQuery(statement);
	          while(rs.next()){
	        	  if(Math.abs(latitude) - Math.abs(rs.getDouble("asukoht_lat")) < Math.abs(5) 
	        			  && Math.abs(longitude) - Math.abs(rs.getDouble("asukoht_long")) < Math.abs(10)){
	        		  sb.append(rs.getString("uudiseid") + ",");
	        	  }
	        	  else if(Math.abs(latitude) - Math.abs(rs.getDouble("asukoht_lat")) < Math.abs(10) 
	        			  && Math.abs(longitude) - Math.abs(rs.getDouble("asukoht_long")) < Math.abs(20)){
	        		  sb.append(rs.getString("uudiseid") + ",");
	        	  }
	        	  else if(Math.abs(latitude) - Math.abs(rs.getDouble("asukoht_lat")) < Math.abs(15) 
	        			  && Math.abs(longitude) - Math.abs(rs.getDouble("asukoht_long")) < Math.abs(30)){
	        		  sb.append(rs.getString("uudiseid") + ",");
	        	  }
	          }
	          if(sb.length() == 0){
	        	  out.println(
	    	              "<html><head></head><body>Ei leidnud ühtegi uudist." +
	    	              "Redirecting...</body></html>");
	        	  resp.sendRedirect("/bsproov3.jsp");
	          }
	          sb.setLength(sb.length() - 1);
	          resp.sendRedirect("/kaardi_otsing.jsp?s=" + sb.toString());
	        }
	      } finally {
	        conn.close();
	      }
	    } catch (SQLException e) {
	      e.printStackTrace();
	    }
	}
}