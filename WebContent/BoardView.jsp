<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("LOGIN_ID");
	%>
	<table border =1  rules=rows  align = center cellpadding=5>
		<tr>
			<td align=center width=50>��ȣ</td>
			<td align=center width=270>����</td>
			<td align=center width=80>��������</td>
			<td align=center width=130>�ۼ���</td>
			<td align=center width=120>�ۼ��ð�</td>
			<td align=center width=70>�亯����</td>
		</tr>
		<c:if test= "${BOARD_LIST.listSize > 0}">
			<c:forEach var="cnt" begin="0" end="${BOARD_LIST.listSize -1}">
				<tr>
					<TD align=center>${BOARD_LIST.num[cnt]}</TD>
					<TD><A href='Main.jsp?BODY_PATH=BoardContent.jsp?NUM=${BOARD_LIST.num[cnt]}'><FONT COLOR=BLACK>${BOARD_LIST.name[cnt]}</FONT></A></TD>
					<TD align=center>${BOARD_LIST.open[cnt]}</td>
					<TD align=center>${BOARD_LIST.writer[cnt]}</td>
					<TD align=center>${BOARD_LIST.date[cnt]}</td>
					<TD align=center>${BOARD_LIST.answer[cnt]}</td>						
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<p align=center>
		<c:if test="${!BOARD_LIST.lastPage}">
			<A href='BoardRead?PAGE=${PAGE+1}'>���� ������</A>
		</c:if>
		</p>
		<p align=center>|
		<c:choose>
			<c:when test="${PAGE>=5}">
				<c:forEach var="cnt" begin="${PAGE-5}" end="${PAGE+5}">
					<c:if test="${cnt>=0 && cnt<=BOARD_LIST.maxPage}">
						<A href='BoardRead?PAGE=${cnt}&WORD=${WORD}&SEARCH=${SEARCH}'>${cnt}</A>
						|
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="cnt" begin="0" end="${PAGE+5}">
					<c:if test="${cnt>=0 && cnt<=BOARD_LIST.maxPage}">
						<c:choose>
							<c:when test="${cnt==PAGE }">
								<b>${cnt}</b>
							</c:when>
							<c:otherwise>
							<A href='BoardRead?PAGE=${cnt}&WORD=${WORD}&SEARCH=${SEARCH}'>${cnt}</A>
							</c:otherwise>
						</c:choose>
						|
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</p>

<TABLE align=center cellpadding=5 >
	<TR>
	<TD>
	<FORM ACTION='BoardRead'>
		<SELECT NAME=SEARCH>
		<OPTION VALUE='name'>����</OPTION>
		<OPTION VALUE='writer'>�ۼ���</OPTION>
		</SELECT>
		<INPUT TYPE=TEXT NAME=WORD SIZE=20 >
		<INPUT TYPE=SUBMIT VALUE='�˻�'>

	</FORM>
	</TD>
	<% if(id != null){ %>
		<TD>
			<INPUT TYPE=BUTTON NAME=NEWBOARD VALUE="�۾���" onclick="location.href='Main.jsp?BODY_PATH=BoardInsert.jsp'">
		</TD>
		<%} %>
	</TR>
</TABLE>
</body>
</html>