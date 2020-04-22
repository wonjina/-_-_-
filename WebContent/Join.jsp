<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
function idCheck(){
	var id = document.INFO.ID.value;
	if(id.length<1 || id==null){
		alert("아이디를 입력하세요.");
		return false;
	}
	else {
		var url = "idCheck.jsp?id=" + id;
		window.open(url, "get", "height = 200, width = 300");
	}
}
function idModify(){
	document.INFO.SM.disabled=true;
}
</script>
</head>
<body>
<H4 align=center>회원 가입</H4>
<FORM NAME=INFO ACTION="Insert.jsp" METHOD=POST>
<table align=center rules="none" border=1 cellpadding=10 width=400>
	<tr>
		<td align=center>아이디</td>
		<td><INPUT TYPE=TEXT NAME=ID SIZE=20 onchange="idModify()">
			<INPUT TYPE=BUTTON NAME=IDC VALUE="중복확인" onclick="idCheck()"></td>
	</tr>
	<tr>
		<td align=center>비밀번호</td>
		<td><INPUT TYPE=PASSWORD NAME=PASSWORD1 SIZE=20 ></td>
	</tr>
	<tr>
		<td align=center>비밀번호 확인</td>
		<td><INPUT TYPE=PASSWORD NAME=PASSWORD2 SIZE=20 ></td>
	</tr>
	<tr>
		<td align=center>이름</td>
		<td><INPUT TYPE=TEXT NAME=NAME SIZE=20></td>
	</tr>
	<tr>
		<td align=center>전화번호</td>
		<td><INPUT TYPE=TEXT NAME=PHONE1 SIZE=4>
			-<INPUT TYPE=TEXT NAME=PHONE2 SIZE=4>
			-<INPUT TYPE=TEXT NAME=PHONE3 SIZE=4></td>
	</tr>
	<tr>
		<td align=RIGHT><INPUT TYPE=SUBMIT NAME=SM VALUE='확인' disabled=disabled></td>
		<td align=LEFT><INPUT TYPE=RESET VALUE='취소'></td>
	</tr>
</table>
</FORM>
</body>
</html>