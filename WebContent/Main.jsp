<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tool" uri="WEB-INF/tool.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ������</title>
<script>
function goMain(){
	location.replace("Main.jsp?BODY_PATH=Main.html");
}
</script>
<style type="text/css">
A:link {color:#7e7e7e; text-decoration:none}
A:active {color:#7e7e7e; text-decoration:none}
A:visited {color:#7e7e7e; text-decoration:none}
A:hover {color:#7e7e7e; text-decoration:underline}
</style>
</head>
<body>
<p align=right>
<c:choose>
	<c:when test="${sessionScope.LOGIN_ID == null}">
		<A HREF="Main.jsp?BODY_PATH=Login.html">�α���</A>
		<A HREF="Main.jsp?BODY_PATH=Join.jsp">ȸ������</A><BR>
		</c:when>
	<c:otherwise>
		${sessionScope.LOGIN_ID}��, �ȳ��ϼ���
		<A HREF="LogoutServlet">�α׾ƿ�</A>
		<A HREF="Reader.jsp">ȸ����������</A><BR>
		<c:choose>
			<c:when test="${sessionScope.LOGIN_ID == 'admin'}">
				<A HREF="ReadMember">ȸ������</A>
				</c:when>
		</c:choose>
	</c:otherwise>
</c:choose>
</p>
<p><img src="image/name.png" onclick="goMain()"></p>
<table align=center bgcolor=#7e7e7e width=100%>
	<tr>
		<td align=center><A HREF="ReadBooksInfo"><img src="image/menu1.png"></A></td>
		<td align=center><A HREF="seat/seating.jsp"><img src="image/menu2.png"></A></td>
		<td align=center><A HREF="BoardRead"><img src="image/menu3.png"></A></td>
	</tr>
</table>
<c:choose>
	<c:when test="${param.BODY_PATH == null}">
		<p align=center><jsp:include page="Main.html"/></p>
	</c:when>
	<c:otherwise>
		<p align=center><jsp:include page="${param.BODY_PATH}"/></p>
	</c:otherwise>
</c:choose>
<br>
<H5 align=center>Copyright@ ���յ�����<br>��⵵ ����� ���յ� 171-7���� ���� ������</H5>

</body>
</html>