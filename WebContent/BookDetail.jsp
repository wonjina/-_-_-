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
<%
	String code = request.getParameter("CODE");
	String name, writer, publisher, location, info, image;
	boolean rent;
	if (code == null)
		throw new Exception("잘못된 접근");
	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","1234");
		if (conn == null)
		throw new Exception("데이터베이스에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from bookinfo where code='"+code+"';");
		
        if (!rs.next())
            throw new Exception("잘못된 접근");
		
		name = rs.getString("name");
		writer = rs.getString("writer");
		publisher = rs.getString("publisher");
		location = rs.getString("location");
		info = rs.getString("info");
		image = rs.getString("IMAGE");
		rent = rs.getBoolean("rent");
		System.out.print(rent);
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
<TABLE align=center>
	<TR>
		<TD align=center height=250><img src="image/<%=image %>" border=1 width=200 alt="이미지가 없습니다"></TD>
		<TD valign=bottom width=400>
			<TABLE border=1 rules=all align=left cellpadding=10 >
				<TR>
					<TD width=100>도서명</TD>
					<TD width=300><%=name %></TD>
				</TR>
				<TR>
					<TD width=100>저자</TD>
					<TD width=300><%=writer %></TD>
				</TR>
				<TR>
					<TD width=100>출판사</TD>
					<TD width=300><%=publisher %></TD>
				</TR>
				<TR>
					<TD width=100>보관 위치</TD>
					<TD width=300><%=location %></TD>
				</TR>
				<TR>
					<TD width=100>대여 여부</TD>
					<TD width=300>
					<c:choose>
						<c:when test="<%=rent %>">대여가능</c:when>
						<c:otherwise>대여중</c:otherwise>
					</c:choose>
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
</TABLE>
<p align=center><TEXTAREA COLS=80 ROWS=15 NAME=INFO READONLY=READONLY ><%=info %></TEXTAREA></p>
<p align=center>
<c:choose>
	<c:when test="${sessionScope.LOGIN_ID == 'admin'}">
		<INPUT TYPE=BUTTON NAME=NEWBOOK VALUE="수정" onclick="location.href='BookReader.jsp?CODE=<%=code%>'">
		<INPUT TYPE=BUTTON NAME=NEWBOOK VALUE="삭제" onclick="location.href='DeleteBook.jsp?CODE=<%=code%>'">
	</c:when>
</c:choose>
</p>
</body>
</html>