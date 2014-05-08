package server;

import java.io.*;
import java.sql.*;
import javax.servlet.http.*;
import com.google.appengine.api.utils.SystemProperty;

public class Otsing extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String otsing = req.getParameter("otsingu_sisu");
		if(otsing.equals("") == false){
			resp.sendRedirect("/otsing.jsp?s=" + otsing);
		}
		else {
			PrintWriter out = resp.getWriter();
			out.println(
		              "<html><head></head><body>Otsing ei leidnud midagi! Proovi uuesti! " +
		              "Redirecting ...</body></html>");
			resp.setHeader("Refresh", "2; url=/bsproov3.jsp");
		}
		
	}
}
