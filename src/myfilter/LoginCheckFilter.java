package myfilter;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

public class LoginCheckFilter implements Filter{
	public void init (FilterConfig config) throws ServletException {
	}	
	public void doFilter (ServletRequest request, ServletResponse response,
				FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		if(session == null) {
			httpResponse.sendRedirect("/Project1/Main.jsp?BODY_PATH=Login.html");
		}
		String id = (String) session.getAttribute("LOGIN_ID");
		if( id == null ) {
			httpResponse.sendRedirect("/Project1/Main.jsp?BODY_PATH=Login.html");
		}
		else
			chain.doFilter(request, response);
	}
	public void destroy() {
	}
}
