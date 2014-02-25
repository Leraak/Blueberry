package proov;

import java.io.IOException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class ProovServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
		
		for(int i = 0; i<5; i++){
			resp.getWriter().println("Hello, world");
		}
	}
}
