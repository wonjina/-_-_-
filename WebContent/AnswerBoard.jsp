<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	String num = request.getParameter("NUM");
	String name, content;
	String writer = null;
	String qna = "";
	String con = "";

	String id = (String)session.getAttribute("LOGIN_ID");
	
	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","1234");
		if (conn == null)
		throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from board where num='"+num+"';");
		
        if (!rs.next())
            throw new Exception("�߸��� ����");
		
		name = rs.getString("name");
		content = rs.getString("content");
		writer = rs.getString("writer");
		con = rs.getString("qna");
		if( con != null) qna = con;

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
<FORM NAME=INFO ACTION="qnaUpdater.jsp" METHOD=POST>
<INPUT TYPE=HIDDEN NAME=NUM VALUE="<%=num %>">
<table align = center width =600>
	<TR>
		<td width =50> [<%=num %>] </td>
		<td width =350> <%=name %> </td>
		<td>| �۾��� : <%=writer %></td>		 
	</TR>
</table>
<table align = center>
	<tr>
		<td>
			<TEXTAREA COLS=80 ROWS=15 NAME=content READONLY=READONLY><%=content%></TEXTAREA>
		</td>
	</tr>
	<tr>
		<td align=right>
			<INPUT TYPE=BUTTON NAME=list VALUE="���" onclick="location.href='BoardRead?NUM=<%=0%>'">
		</td>
	</tr>
	<tr>
		<td>
			�亯<br>
			<TEXTAREA COLS=80 ROWS=15 NAME=qna><%=qna%></TEXTAREA>
		</td>
	</tr>
	<TR>
		<td align=right>
			<INPUT TYPE=SUBMIT VALUE=�����Ϸ�>
			<INPUT TYPE=RESET VALUE=���>
		</td>
	</TR>
</table>
</FORM>
</body>
</html>