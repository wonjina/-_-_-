<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@page import="java.sql.*, java.util.StringTokenizer"%>

<%
	String id;
	if ((id=request.getParameter("ID"))==null)
		id = (String)session.getAttribute("LOGIN_ID");
	if(id.length()<1) {
		%>
		<script>
			alert("������ ��� �Է����ּ���.");
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
			throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from user where id='"+id+"';");
			
	        if (!rs.next()) {
	        	%>
	    		<script>
	    			alert("�߸��� ���̵� �Դϴ�.");
	    			location.replace("ReadMember");
	    		</script>
	    		<%
	        }
	        else {
				
				String name = rs.getString("name");
				StringTokenizer phone = new StringTokenizer(rs.getString("phone"));
				
				String num1 = phone.nextToken("-");
				String num2 = phone.nextToken("-");
				String num3 = phone.nextToken("-");
				
				request.setAttribute("ID", id);
				request.setAttribute("NAME", name);
				request.setAttribute("PHONE1", num1);
				request.setAttribute("PHONE2", num2);
				request.setAttribute("PHONE3", num3);
				

				RequestDispatcher dispatcher =
				request.getRequestDispatcher("Main.jsp?BODY_PATH=Modify.jsp");
				dispatcher.forward(request, response);
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
