<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String code = request.getParameter("CODE");
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
		
		String name = rs.getString("name");
		String writer = rs.getString("writer");
		String publisher = rs.getString("publisher");
		String location = rs.getString("location");
		String info = rs.getString("info");
		boolean rent = rs.getBoolean("rent");
		
		request.setAttribute("CODE", code);
		request.setAttribute("NAME", name);
		request.setAttribute("WRITER", writer);
		request.setAttribute("PUBLISHER", publisher);
		request.setAttribute("LOCATION", location);
		request.setAttribute("RENT", rent);
		request.setAttribute("INFO", info);
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
	RequestDispatcher dispatcher =
	request.getRequestDispatcher("Main.jsp?BODY_PATH=BookModify.jsp");
	dispatcher.forward(request, response);
%>