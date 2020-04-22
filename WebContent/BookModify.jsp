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
		<TD width=100>도서번호</TD>
		<TD><INPUT TYPE=TEXT NAME=CODE SIZE=5 VALUE='${CODE}' READONLY=TRUE></TD>
	</TR>
	<TR>
		<TD width=100>도서명</TD>
		<TD><INPUT TYPE=TEXT NAME=NAME SIZE=30 VALUE='${NAME}'></TD>
	</TR>
	<TR>
		<TD width=100>저자</TD>
		<TD><INPUT TYPE=TEXT NAME=WRITER SIZE=16 VALUE='${WRITER}'></TD>
	</TR>
	<TR>
		<TD width=100>출판사</TD>
		<TD><INPUT TYPE=TEXT NAME=PUBLISHER SIZE=16 VALUE='${PUBLISHER}'></TD>
	</TR>
	<TR>
		<TD width=100>보관 위치</TD>
		<TD><INPUT TYPE=TEXT NAME=LOCATION SIZE=8 VALUE='${LOCATION}'></TD>
	</TR>
	<TR>
		<TD width=100>대여 여부</TD>
		<TD>
		<select NAME=RENT>
		<OPTION VALUE="true">대여가능</OPTION>
		<OPTION VALUE="false">대여중</OPTION>
		</select>
		</TD>
	</TR>
</TABLE>
<p align=center><TEXTAREA COLS=80 ROWS=15 NAME=INFO >${INFO}</TEXTAREA></p>
<p align=center>
<INPUT TYPE=SUBMIT VALUE=확인>
<INPUT TYPE=RESET VALUE=취소>
</p>
</FORM>
</body>
</html>