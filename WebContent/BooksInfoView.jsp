<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<head>
</head>
<body>
<TABLE align=center cellpadding=5 >
	<TR>
	<TD>
	<FORM ACTION='ReadBooksInfo'>
		<SELECT NAME=SEARCH>
		<OPTION VALUE='name'>도서명</OPTION>
		<OPTION VALUE='writer'>저자</OPTION>
		<OPTION VALUE='publisher'>출판사</OPTION>
		</SELECT>
		<INPUT TYPE=TEXT NAME=WORD SIZE=20 >
		<INPUT TYPE=SUBMIT VALUE='검색'>
		<c:choose>
			<c:when test="${sessionScope.LOGIN_ID == 'admin'}">
				<INPUT TYPE=BUTTON NAME=NEWBOOK VALUE="도서 추가" onclick="location.href='Main.jsp?BODY_PATH=NewBook.jsp'">
			</c:when>
		</c:choose>
	</FORM>
	</TD>
	</TR>
</TABLE>
<TABLE border=1 rules=rows align=center cellpadding=5>
	<TR>
		<TD align=center width=70>NO</TD>
		<TD align=center width=300>도서명</TD>
		<TD align=center width=150>저자</TD>
		<TD align=center width=150>출판사</TD>
		<TD align=center width=80>보관위치</TD>
	</TR>
	<c:if test= "${BOOKS_INFO.size > 0}">
		<c:forEach var="cnt" begin="0" end="${BOOKS_INFO.size - 1}">
			<TR>
				<TD align=center>${BOOKS_INFO.code[cnt]}</TD>
				<TD align=center><A href='Main.jsp?BODY_PATH=BookDetail.jsp?CODE=${BOOKS_INFO.code[cnt]}'><FONT COLOR=BLACK>${BOOKS_INFO.name[cnt]}</FONT></A></TD>
				<TD align=center>${BOOKS_INFO.writer[cnt]}</TD>
				<TD align=center>${BOOKS_INFO.publisher[cnt]}</TD>
				<TD align=center>${BOOKS_INFO.location[cnt]}</TD>
			</TR>
		</c:forEach>
	</c:if>
</TABLE>
<p align=center>
<c:if test="${!BOOKS_INFO.lastPage}">
	<A href='ReadBooksInfo?PAGE=${PAGE+1}'>다음 페이지</A>
</c:if>
</p>
<p align=center>|
<c:choose>
	<c:when test="${PAGE>=5}">
		<c:forEach var="cnt" begin="${PAGE-5}" end="${PAGE+5}">
			<c:if test="${cnt>=0 && cnt<=BOOKS_INFO.maxPage}">
				<A href='ReadBooksInfo?PAGE=${cnt}&WORD=${WORD}&SEARCH=${SEARCH}'>${cnt}</A>
				|
			</c:if>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<c:forEach var="cnt" begin="0" end="${PAGE+5}">
			<c:if test="${cnt>=0 && cnt<=BOOKS_INFO.maxPage}">
				<c:choose>
					<c:when test="${cnt==PAGE }">
						<b>${cnt}</b>
					</c:when>
					<c:otherwise>
					<A href='ReadBooksInfo?PAGE=${cnt}&WORD=${WORD}&SEARCH=${SEARCH}'>${cnt}</A>
					</c:otherwise>
				</c:choose>
				|
			</c:if>
		</c:forEach>
	</c:otherwise>
</c:choose>
</p>
</body>
</html>