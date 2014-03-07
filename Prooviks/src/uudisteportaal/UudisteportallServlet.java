package uudisteportaal;

import java.io.IOException;
import javax.servlet.http.*;
import com.google.appengine.api.users.*;


@SuppressWarnings("serial")
public class UudisteportallServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
	}
}
