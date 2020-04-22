<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
function memberDrop(){
	var id = document.MEM.ID.value;
	if(id.length<1 || id==null){
		alert("���̵� �Է��ϼ���.");
		return false;
	}
	else {
		var url = "MemberDrop.jsp?ID=" + id;
		location.replace(url);
	}
}
</script>
</head>
<body>

<TABLE align=center>
	<TR>
	<TD>
	<FORM NAME=MEM ACTION='Reader.jsp' METHOD=POST>
		<INPUT TYPE=TEXT NAME=ID SIZE=20 >
		<INPUT TYPE=SUBMIT VALUE='ȸ�� ���� ����'>
		<INPUT TYPE=BUTTON NAME=NEWBOOK VALUE="ȸ�� Ż��" onclick="memberDrop()">
	</FORM>
	</TD>
	</TR>
</TABLE>
<TABLE border=1 rules=all align=center cellpadding=5 >
	<TR>
		<TD align=center width=150>���̵�</TD>
		<TD align=center width=100>�̸�</TD>
		<TD align=center width=150>��ȭ��ȣ</TD>
		<TD align=center width=100>�뿩�¼�</TD>
	</TR>
	<c:if test= "${MEMBERS_INFO.size > 0}">
		<c:forEach var="cnt" begin="0" end="${MEMBERS_INFO.size - 1}">
			<TR>
				<TD align=center>${MEMBERS_INFO.id[cnt]}</TD>
				<TD align=center>${MEMBERS_INFO.name[cnt]}</TD>
				<TD align=center>${MEMBERS_INFO.phone[cnt]}</TD>
				<TD align=center>����</TD>
			</TR>
		</c:forEach>
	</c:if>
</TABLE>
<c:if test="${!MEMBERS_INFO.lastPage}">
	<p align=center><A href='ReadMember?PAGE=${PAGE+1}'>���� ������</A></p>
</c:if>
<p align=center>|
<c:choose>
	<c:when test="${PAGE>=5}">
		<c:forEach var="cnt" begin="${PAGE-5}" end="${PAGE+5}">
			<c:if test="${cnt>=0 && cnt<=MEMBERS_INFO.maxPage}">
				<c:choose>
					<c:when test="${cnt==PAGE }">
						<b><A href='ReadMember?PAGE=${cnt}'>${cnt}</A></b>
					</c:when>
					<c:otherwise>
					<A href='ReadMember?PAGE=${cnt}'>${cnt}</A>
					</c:otherwise>
				</c:choose>
				|
			</c:if>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<c:forEach var="cnt" begin="0" end="${PAGE+5}">
			<c:if test="${cnt>=0 && cnt<=MEMBERS_INFO.maxPage}">
				<c:choose>
					<c:when test="${cnt==PAGE }">
						<b>${cnt}</b>
					</c:when>
					<c:otherwise>
					<A href='ReadMember?PAGE=${cnt}'>${cnt}</A>
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