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
		alert("���̵� �Է��ϼ���.");
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
<H4 align=center>ȸ�� ����</H4>
<FORM NAME=INFO ACTION="Insert.jsp" METHOD=POST>
<table align=center rules="none" border=1 cellpadding=10 width=400>
	<tr>
		<td align=center>���̵�</td>
		<td><INPUT TYPE=TEXT NAME=ID SIZE=20 onchange="idModify()">
			<INPUT TYPE=BUTTON NAME=IDC VALUE="�ߺ�Ȯ��" onclick="idCheck()"></td>
	</tr>
	<tr>
		<td align=center>��й�ȣ</td>
		<td><INPUT TYPE=PASSWORD NAME=PASSWORD1 SIZE=20 ></td>
	</tr>
	<tr>
		<td align=center>��й�ȣ Ȯ��</td>
		<td><INPUT TYPE=PASSWORD NAME=PASSWORD2 SIZE=20 ></td>
	</tr>
	<tr>
		<td align=center>�̸�</td>
		<td><INPUT TYPE=TEXT NAME=NAME SIZE=20></td>
	</tr>
	<tr>
		<td align=center>��ȭ��ȣ</td>
		<td><INPUT TYPE=TEXT NAME=PHONE1 SIZE=4>
			-<INPUT TYPE=TEXT NAME=PHONE2 SIZE=4>
			-<INPUT TYPE=TEXT NAME=PHONE3 SIZE=4></td>
	</tr>
	<tr>
		<td align=RIGHT><INPUT TYPE=SUBMIT NAME=SM VALUE='Ȯ��' disabled=disabled></td>
		<td align=LEFT><INPUT TYPE=RESET VALUE='���'></td>
	</tr>
</table>
</FORM>
</body>
</html>