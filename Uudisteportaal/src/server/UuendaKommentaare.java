package server;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UuendaKommentaare extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html; charset=UTF-8");
		try {
			Class.forName("com.mysql.jdbc.GoogleDriver");
  			Connection conn = java.sql.DriverManager.getConnection("jdbc:google:mysql://mustikauudised:blueberrysql/uudisteportaal?user=root");	      
  			try {
	  			String last_id = req.getParameter("last_id");
 				String uudise_id = req.getParameter("uudise_id");

 				String requestStatement = " SELECT id, kommenteerija, kommentaari_sisu FROM kommentaarid WHERE uudiseID = ? AND id > ?";
 				PreparedStatement prps = conn.prepareStatement(requestStatement);

 				prps.setString(1, uudise_id);
 				prps.setString(2, last_id);

 				ResultSet rs = prps.executeQuery();

 				while(rs.next()) {
 					out.println("<div class='bscomment' id='bscomment-" + rs.getInt("id") + "'><span>" + rs.getString("kommenteerija") + ": </span>" + rs.getString("kommentaari_sisu") + "</div>");
 				}

			} finally {
				conn.close();
			}
	
		    } catch (SQLException e) {
		      e.printStackTrace();
		    } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
