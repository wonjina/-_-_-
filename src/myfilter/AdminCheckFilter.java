package myfilter;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

public class AdminCheckFilter implements Filter{
	public void init (FilterConfig config) throws ServletException {
	}	
	public void doFilter (ServletRequest request, ServletResponse response,
				FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		if(session == null) {
			httpResponse.sendRedirect("Main.jsp?BODY_PATH=Main.html");
		}
		String id = (String) session.getAttribute("LOGIN_ID");
		if( id == null ) {
			httpResponse.sendRedirect("Main.jsp?BODY_PATH=Main.html");
		}
		else if (id.equals("admin")==false) {
			httpResponse.sendRedirect("Main.jsp?BODY_PATH=Main.html");
		}
		else
			chain.doFilter(request, response);
	}
	public void destroy() {
	}
}
