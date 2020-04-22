<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("EUC-KR");
	String code = request.getParameter("CODE");
	if (code == null)
		response.sendRedirect("Main.jsp?BODY_PATH=");
	String name = request.getParameter("NAME");
	String writer = request.getParameter("WRITER");
	String publisher = request.getParameter("PUBLISHER");
	String location = request.getParameter("LOCATION");
	String rent = request.getParameter("RENT");
	String info = request.getParameter("INFO");
	
	if (name.length()==0 || writer.length()==0 || publisher.length()==0 || location.length()==0) {
		%>
		<script>
			alert("도서 기본 정보를 입력해주세요.");
			history.go(-1);
		</script>
		<%
	}
	else {
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","1234");
			if (conn == null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			stmt = conn.createStatement();
			String command = String.format(
				"update bookinfo set name:='%s',writer:='%s',publisher:='%s',location:='%s',rent:=%s,info:='%s' where code=%s;",
				name, writer, publisher, location, rent, info, code);
			int rowNum = stmt.executeUpdate(command);
			if (rowNum < 1)
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp?BODY_PATH=BookDetail.jsp?CODE="+code);
		dispatcher.forward(request, response);
	}
%>
