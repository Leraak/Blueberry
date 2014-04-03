package server;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Upload extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
			PrintWriter out = response.getWriter();
    	
    	try {
    		RequestDispatcher rd = request.getRequestDispatcher("/header.jsp");
    		response.setContentType("text/html");
    		out.println("<html><head>");
    		out.println("<link rel='stylesheet' type='text/css' href='stylesheets/StyleSheet.css'/>");
    		out.println("</head>");
    		rd.include(request, response);
    		String bt = request.getParameter("name");
    		out.println(bt);
    		out.println("</body></html>");
       
        } catch (Exception ex) {
        	out.println(ex);
        }
	}
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	PrintWriter out = response.getWriter();
    	
    	try {
    		String bt = request.getParameter("name");
    		out.println(bt);
       
        } catch (Exception ex) {
        	out.println(ex);
        }
    	
    }
  
}