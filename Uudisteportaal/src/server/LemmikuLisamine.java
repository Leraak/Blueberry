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

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class LemmikuLisamine extends HttpServlet {

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
			UserService userService = UserServiceFactory.getUserService();
		    User user = userService.getCurrentUser();
		    String a = user.getNickname();
	    	Connection conn = DriverManager.getConnection("jdbc:google:mysql://mustikauudised:blueberrysql/uudisteportaal?user=root");
	      try {
	    	int id = Integer.parseInt(req.getParameter("lemmikuID"));
	        //andmed andmebaasi
	          String statement = "INSERT INTO lemmikud (kasutajanimi, uudiseID) VALUES( ? , ? )";
	          PreparedStatement ps = conn.prepareStatement(statement);
	          ps.setString(1, a);
	          ps.setInt(2, id);
	          
	          int success = 2;
	          success = ps.executeUpdate();
	          if (success == 1) {
	            	resp.sendRedirect("bsproov3.jsp");
	          } else if (success == 0) {
	          }
	      } finally {
	        conn.close();
	      }
	    } catch (SQLException e) {
	      e.printStackTrace();
	    }
		resp.sendRedirect("bsproov3.jsp");
	}
}
