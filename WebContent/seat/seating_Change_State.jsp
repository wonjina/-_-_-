<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String seatNum = (String)session.getAttribute("seatNum");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>좌석 부여</title>
</head>
<body>
	
	<form action="seat_State_Change" method="post">
		<table width="600" align=center>
			<tr>
				<th>
					좌석번호
				</th>
				<th>
					<%= seatNum %>
				</th>
			</tr>
			<tr>
				<th>
					아이디
				</th>
				<th>
					<input type="text" name="id">
				</th>
			</tr>
			<tr>
					<th>
					</th>
					<th>
					<input type="submit" value="확인">
						<input type="button" onclick='location.replace("/Project1/Main.jsp?BODY_PATH=seat/seating.jsp")' value="취소">
					</th>
			</tr>
		</table>
	</form>

</body>
</html>