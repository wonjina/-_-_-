<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̵� �ߺ� Ȯ��</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","1234");
		if (conn == null)
			throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
		stmt = conn.createStatement();
		String command = String.format("select * from user where id='%s';", id);
		ResultSet rs = stmt.executeQuery(command);
		if (rs.next()) {
			%>
			<H3 align=center>�̹� �����ϴ� ���̵��Դϴ�.</H3>
			<%
		}
		else {
			%>
			<H3 align=center>��� ������ ���̵��Դϴ�.</H3>
			<script type="text/javascript">
				opener.document.INFO.SM.disabled=false;
			</script>
			<%
		}
		%>
		<BR>
		<p align=center><A href='#' onClick='self.close()'>�ݱ�</A></p>
		<%
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
%>
</body>
</html>