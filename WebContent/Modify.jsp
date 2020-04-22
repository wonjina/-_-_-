<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>브라움 도서관</title>
</head>
<body>
<H4 align=center>회원 정보 수정</H4>
<FORM ACTION="Updater.jsp" METHOD=POST>
<table align=center rules="none" border=1 cellpadding=10 width=400>
	<tr>
		<td align=center>아이디</td>
		<td><INPUT TYPE=TEXT NAME=ID SIZE=20 VALUE='${ID}' READONLY=READONLY></td>
	</tr>
	<tr>
		<td align=center>비밀번호</td>
		<td><INPUT TYPE=PASSWORD NAME="PASSWORD1" SIZE=20 ></td>
	</tr>
	<tr>
		<td align=center>비밀번호 확인</td>
		<td><INPUT TYPE=PASSWORD NAME="PASSWORD2" SIZE=20 ></td>
	</tr>
	<tr>
		<td align=center>이름</td>
		<td><INPUT TYPE=TEXT NAME=NAME SIZE=20 VALUE='${NAME}'></td>
	</tr>
	<tr>
		<td align=center>전화번호</td>
		<td><INPUT TYPE=TEXT NAME=PHONE1 SIZE=4 VALUE='${PHONE1}'>
			-<INPUT TYPE=TEXT NAME=PHONE2 SIZE=4 VALUE='${PHONE2}'>
			-<INPUT TYPE=TEXT NAME=PHONE3 SIZE=4 VALUE='${PHONE3}'></td>
	</tr>
	<tr>
		<td align=RIGHT><INPUT TYPE=SUBMIT VALUE='확인'></td>
		<td align=LEFT><INPUT TYPE=RESET VALUE='취소'></td>
	</tr>
</table>
</FORM>

</body>
</html>