<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String id = request.getParameter("ID");

	if(id == null)
		throw new Exception("�߸��� ����");
	else {
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","1234");
			if (conn == null)
				throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
			stmt = conn.createStatement();
			String command = String.format("delete from user where id='%s'", id);
			int rowNum = stmt.executeUpdate(command);
			if (rowNum < 1) {
				%>
				<script>
					alert("��ġ�ϴ� ���̵� �����ϴ�.");
					location.replace("ReadMember");
				</script>
				<%
			}
			else {
				%>
				<script>
					alert("ȸ���� �����Ǿ����ϴ�.");
					location.replace("ReadMember");
				</script>
				<%
			}
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