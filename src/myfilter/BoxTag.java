package myfilter;

import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class BoxTag extends SimpleTagSupport{

	public void doTag() throws JspException,IOException{
		JspContext context = getJspContext();
		JspWriter out = context.getOut();
		JspFragment body = getJspBody();
		out.println("<TABLE border=1 cellpadding=20  align=right><TR><TD>");
		body.invoke(out);
		out.println("</TD></TR></TABLE>");
		return ;
	}
}
