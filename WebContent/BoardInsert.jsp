<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<FORM NAME=INFO ACTION="uploadBoard.jsp" METHOD=POST>
<TABLE align=center>
	<TR>
		 <td>제목 | <INPUT TYPE=TEXT NAME=name SIZE=70 > </td>
	</TR>
	<tr>
		<td>
			<TEXTAREA COLS=80 ROWS=15 NAME=content ></TEXTAREA>
		</td>
	</tr>
	<TR>
		<td>
			공개 여부
			<select NAME=open>
			<OPTION VALUE="공개">공개</OPTION>			
			<OPTION VALUE="비공개">비공개</OPTION>
			</select>
		</td>
	</tr>
	<tr>
		<td align=right>
			<INPUT TYPE=BUTTON NAME=NEWBOOK VALUE="목록" onclick="location.href='BoardRead?NUM=<%=0%>'">
			<INPUT TYPE=SUBMIT VALUE=확인>
			<INPUT TYPE=RESET VALUE=취소>
		</td>
	</TR>	
</TABLE>
</FORM>	
</body>
</html>