<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import ="java.util.GregorianCalendar"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%
	
		String id = (String)session.getAttribute("LOGIN_ID");
		GregorianCalendar now = new GregorianCalendar();
		request.setCharacterEncoding("EUC-KR");
		
		String num = request.getParameter("NUM");
		String name = request.getParameter("name"); //����
		String content = request.getParameter("content");
		String writer = id;	//���̵�
		String date = String.format("%TF", now);
		String open = request.getParameter("open");	//���� ����� ����
		String answer = "X";	// �亯�� �޷Ǵ��� �ȴ޷Ǵ���
		
		if (name.length()==0){
			%>
			<script>
				alert("������ �Է����ּ���.");
				history.go(-1);
			</script>
			<%
		}
		else if (content.length() == 0){
			%>
			<script>
				alert("������ �Է����ּ���.");
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
				String command = String.format("insert into board (name, content ,open, writer, answer, wdate) values('%s','%s','%s','%s','%s','%s');",
					name, content, open, writer, answer, date);
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
			%>
			<script>
				alert("���� �߰��Ǿ����ϴ�.");
				location.replace("BoardRead");
			</script>
			<%
		}
	%>
</body>
</html>