<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<FORM NAME=INFO ACTION="BookUpdater.jsp" METHOD=POST>
<TABLE align=center>
	<TR>
		<TD width=100>������ȣ</TD>
		<TD><INPUT TYPE=TEXT NAME=CODE SIZE=5 VALUE='${CODE}' READONLY=TRUE></TD>
	</TR>
	<TR>
		<TD width=100>������</TD>
		<TD><INPUT TYPE=TEXT NAME=NAME SIZE=30 VALUE='${NAME}'></TD>
	</TR>
	<TR>
		<TD width=100>����</TD>
		<TD><INPUT TYPE=TEXT NAME=WRITER SIZE=16 VALUE='${WRITER}'></TD>
	</TR>
	<TR>
		<TD width=100>���ǻ�</TD>
		<TD><INPUT TYPE=TEXT NAME=PUBLISHER SIZE=16 VALUE='${PUBLISHER}'></TD>
	</TR>
	<TR>
		<TD width=100>���� ��ġ</TD>
		<TD><INPUT TYPE=TEXT NAME=LOCATION SIZE=8 VALUE='${LOCATION}'></TD>
	</TR>
	<TR>
		<TD width=100>�뿩 ����</TD>
		<TD>
		<select NAME=RENT>
		<OPTION VALUE="true">�뿩����</OPTION>
		<OPTION VALUE="false">�뿩��</OPTION>
		</select>
		</TD>
	</TR>
</TABLE>
<p align=center><TEXTAREA COLS=80 ROWS=15 NAME=INFO >${INFO}</TEXTAREA></p>
<p align=center>
<INPUT TYPE=SUBMIT VALUE=Ȯ��>
<INPUT TYPE=RESET VALUE=���>
</p>
</FORM>
</body>
</html>