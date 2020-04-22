<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="DBError.jsp"
    import="java.sql.*,java.io.IOException;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
private boolean checkLoginInfo(String id, String password) throws IOException, ServletException
{
	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		//Class.forName("org.apache.commons.dbcp.PoolingDriver");
		conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:/wdb_pool");
		if( conn == null )
			throw new Exception(">데이터베이스에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		ResultSet rs =stmt.executeQuery("select password from user where id='"+id+"';");
		if( !rs.next() )
			return false;
		String correctPassword = rs.getString("password");
		if( password.equals(correctPassword) )
			return true;
		else
			return false;
	}
	catch (Exception e) {
		throw new ServletException(e);
	}
	finally {
		try {
			stmt.close();
		}
		catch (Exception ignored) {
		}
		try {
			conn.close();
		}
		catch (Exception ignored) {
		}
	}
}
%>

<%
String id = request.getParameter("ID");
String password = request.getParameter("PASSWORD");
if(checkLoginInfo(id,password)) {
	session.setAttribute("LOGIN_ID", id);
	response.sendRedirect("Main.jsp");
}
else {
	%>
	<script>
		alert("아이디 또는 패스워드 오류입니다.");
		history.go(-1);
	</script>
	<%
}
%>