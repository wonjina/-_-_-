<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("ID");
	if (id == null)
		response.sendRedirect("Main.jsp");
	String password = request.getParameter("PASSWORD1").trim();
	String password2 = request.getParameter("PASSWORD2").trim();
	String name = request.getParameter("NAME").trim();
	String num1 = request.getParameter("PHONE1");
	String num2 = request.getParameter("PHONE2");
	String num3 = request.getParameter("PHONE3");
	
	if ( password.equals(password2)==false ) {
		%>
		<script>
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");	
			history.go(-1);
		</script>
		<%
	}
	
	else if (password.length()==0 || name.length()==0 || num1.length()==0 || num2.length()==0 || num3.length()==0) {
		%>
		<script>
			alert("������ ��� �Է����ּ���.");
			history.go(-1);
		</script>
		<%
	}
	else {
		String phone = String.format("%s-%s-%s", num1,num2,num3);
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","1234");
			if (conn == null)
				throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
			stmt = conn.createStatement();
			String command = String.format("update user set password:='%s',name:='%s',phone:='%s' where id='%s';",
			password, name, phone, id);
			int rowNum = stmt.executeUpdate(command);
			if (rowNum < 1)
				throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�.");
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("Reader.jsp");
		dispatcher.forward(request, response);
	}
%>
