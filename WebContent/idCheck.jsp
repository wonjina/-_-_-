<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 중복 확인</title>
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
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		String command = String.format("select * from user where id='%s';", id);
		ResultSet rs = stmt.executeQuery(command);
		if (rs.next()) {
			%>
			<H3 align=center>이미 존재하는 아이디입니다.</H3>
			<%
		}
		else {
			%>
			<H3 align=center>사용 가능한 아이디입니다.</H3>
			<script type="text/javascript">
				opener.document.INFO.SM.disabled=false;
			</script>
			<%
		}
		%>
		<BR>
		<p align=center><A href='#' onClick='self.close()'>닫기</A></p>
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