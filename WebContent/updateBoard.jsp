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
	String id = (String)request.getSession().getAttribute("LOGIN_ID");


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
		int state =0;
		
		if(writer.equals(id) == true)
			state = 1;
		else state = 0;
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
<FORM NAME=INFO ACTION="BoardUpdater.jsp" METHOD=POST>
<Table align=center>
	<TR>
		<TD>��ȣ
		<INPUT TYPE=TEXT NAME=NUM SIZE=3 VALUE=<%=num %> READONLY=READONLY>
		 | ����:<INPUT TYPE=TEXT NAME=name SIZE=50 VALUE=<%=name %>> </TD>
	</TR>
	<TR>
		<TD>
			<TEXTAREA COLS=80 ROWS=15 NAME=content><%=content%></TEXTAREA>
		</TD>
	</TR>
	<TR>
		<TD width=100>���� ����
			<select NAME=open>
			<OPTION VALUE="����">����</OPTION>
			<OPTION VALUE="�����">�����</OPTION>
			</select>
		</TD>
	</TR>
	<TR>
		<TD>
			<INPUT TYPE=BUTTON NAME=NEWBOOK VALUE="���" onclick="location.href='BoardRead?NUM=<%=0%>'">
			<INPUT TYPE=SUBMIT VALUE=�����Ϸ�>
			<INPUT TYPE=RESET VALUE=���>
		<TD>
	</TR>
</Table>
</FORM>
</body>
</html>