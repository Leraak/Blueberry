package server;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Uuskommentaar extends HttpServlet {

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
  			
	  			String new_comment_name = req.getParameter("new_comment_name");
	  			String new_comment_text = req.getParameter("new_comment_text");
	  			String uudise_id = req.getParameter("uudise_id");
	
			   if(new_comment_name != null && new_comment_text != null &&
		        new_comment_text.length() >= 1 && new_comment_name.length() >= 1) {
			        String updateStatement =
			                " INSERT INTO kommentaarid " +
			                " (kommenteerija, uudiseID, kommentaari_sisu) VALUES " +
			                " (?, ?, ?) ";
			        PreparedStatement pstmt = conn.prepareStatement(updateStatement);
			        pstmt.setString(1, new_comment_name);
			        pstmt.setInt(2, Integer.parseInt(uudise_id));
			        pstmt.setString(3, new_comment_text);
			        int success = pstmt.executeUpdate();
			        out.println(success);
			    } else {
	  				out.println(0);
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
