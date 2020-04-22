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
		String name = request.getParameter("name"); //제목
		String content = request.getParameter("content");
		String writer = id;	//아이디
		String date = String.format("%TF", now);
		String open = request.getParameter("open");	//공개 비공개 여부
		String answer = "X";	// 답변이 달렷는지 안달렷는지
		
		if (name.length()==0){
			%>
			<script>
				alert("제목을 입력해주세요.");
				history.go(-1);
			</script>
			<%
		}
		else if (content.length() == 0){
			%>
			<script>
				alert("내용을 입력해주세요.");
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
				String command = String.format("insert into board (name, content ,open, writer, answer, wdate) values('%s','%s','%s','%s','%s','%s');",
					name, content, open, writer, answer, date);
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
			%>
			<script>
				alert("글이 추가되었습니다.");
				location.replace("BoardRead");
			</script>
			<%
		}
	%>
</body>
</html>