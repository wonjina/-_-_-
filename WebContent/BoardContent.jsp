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
	String id = (String)session.getAttribute("LOGIN_ID");
	String qna = "";
	String open = null;
	boolean order = false;

	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","1234");
		if (conn == null)
		throw new Exception("데이터베이스에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from board where num='"+num+"';");
		
        if (!rs.next())
            throw new Exception("잘못된 접근");
		
		name = rs.getString("name");
		content = rs.getString("content");
		writer = rs.getString("writer");
		qna = rs.getString("qna");
		if(qna==null)
			qna="아직 답변이 달리지 않았습니다.";
		open = rs.getString("open");
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
	if(id != null)
		if( (id.equals(writer)==true) || (id.equals("admin")==true) )
			order=true;
	if( open.equals("비공개")&&order==false ) {
		%>
		<script>
		alert("읽기 권한이 없습니다.");
		location.replace("BoardRead");
		</script>
		<%
	}
%>

<table align=center width=600>
	<TR>
		<td width=50>[<%=num%>] </td>
	 	<td width=350><%=name %></td>
	 	<td>| 글쓴이 : <%=writer %></td>
	</TR>
</table>
<Table align=center>
	<TR>
		<TD>
		<TEXTAREA COLS=80 ROWS=15 NAME=content READONLY=READONLY ><%=content %></TEXTAREA>
		</TD>
	<TR>
		<TD align=right>
			<c:if test="<%=order %>" >
				<INPUT TYPE=BUTTON NAME=alter VALUE="수정" onclick="location.href='Main.jsp?BODY_PATH=updateBoard.jsp?NUM=<%=num%>'">
				<INPUT TYPE=BUTTON NAME=delete VALUE="삭제" onclick="location.href='Main.jsp?BODY_PATH=DeleteBoard.jsp?NUM=<%=num%>'">
			</c:if>
			<INPUT TYPE=BUTTON NAME=list VALUE="목록" onclick="location.href='BoardRead?NUM=<%=0%>'">
		</TD>
	</TR>
	<TR>
		<TD>
			답변<br>
			<TEXTAREA COLS=80 ROWS=15 NAME=qna READONLY=READONLY ><%=qna %></TEXTAREA>			
		</TD>
	</TR>
	<TR>
		<TD align=right>
			<c:if test="${sessionScope.LOGIN_ID == 'admin'}">
					<INPUT TYPE=BUTTON NAME=qbutton VALUE="답변" onclick="location.href='Main.jsp?BODY_PATH=AnswerBoard.jsp?NUM=<%=num%>'">
			</c:if>
		</TD>
	</TR>
</Table>
</body>
</html>