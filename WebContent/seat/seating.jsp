<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page import="myfilter.Myseat" %>
 <%@taglib prefix="tool" uri="/WEB-INF/tool.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <link href="styles.css" rel="stylesheet">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>좌석 조회</title>

<script>

var path = window.location.pathname;
if(path == "/Project1/seat/seating.jsp")
	location.replace("/Project1/Main.jsp?BODY_PATH=seat/seating.jsp");
</script>

<%
	String id = (String)session.getAttribute("LOGIN_ID");
//	String id = "admin";
	if( id.equals("admin")) //
		session.setAttribute("LOGIN_ID", id);

	Myseat ms = new Myseat();	//
	ms.setId(id);			//
	ms.readDB();			//
	pageContext.setAttribute("LOGINSTATE", ms.getSeat_Num());	//
	int seatState[] = new int[24];		//
	seatState =	ms.getSeat_State();		//
	pageContext.setAttribute("state", seatState);
	
	String bbb= ms.getSeat_Num();
%>

	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript"> 
		$(document).ready(function(){
		  $("#flip").click(function(){
		    $("#panel").slideToggle("slow");
		  });
		});

	</script>
	<script type="text/javascript"> 
		(function($){
			$("input", this).click(function(){
				vat index = $()
			});
		})(jQuery)
		
	</script>
	
	<style> 
		#panel,#flip
		{
			wigth:10px;
			text-align:center;
		}
		#panel
		{
			display:none;
		}
		input {
			 border:1x solid #333333; /* 테두리 정의 */
			 /* border: 1px dashed #ff008; /* 테두리 점선 */
			 background-Color:#E4E4E4; /* 백그라운드 정의 */
			 font:12px 굴림; /* 폰트 정의 */
			 font-weight:bold; /* 폰트 굵기 */
			 color:#444444; /* 폰트 색깔 */
			 width:130;height:30; /* 버튼 크기 */
		}
	</style>
 

</head>

<form action="user_Check" method="post">
	<table width="600"  align=center>
		<tr>
			<th>
				<table align=center>
					<tr>
						<th>
							<c:if test="${state[0]==0}"><input type="submit" name="1" value=" 1" style="background-color:white"></c:if>
							<c:if test="${state[0]==1}"><input  type="submit" name="1"  value=" 1" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[1]==0}"><input type="submit"  name="1" value=" 2" style="background-color:white"></c:if>
							<c:if test="${state[1]==1}"><input type="submit" name="1"  value=" 2" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[2]==0}"><input type="submit"  name="1" value=" 3" style="background-color:white"></c:if>
							<c:if test="${state[2]==1}"><input type="submit"  name="1" value=" 3" style="background-color:red"></c:if>
						</th>
					</tr>
					<tr>
						<th>
							<c:if test="${state[3]==0}"><input type="submit"  name="1" value=" 4" style="background-color:white"></c:if>
							<c:if test="${state[3]==1}"><input type="submit"  name="1" value=" 4" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[4]==0}"><input type="submit" name="1" value=" 5" style="background-color:white"></c:if>
							<c:if test="${state[4]==1}"><input type="submit"  name="1" value=" 5" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[5]==0}"><input type="submit"  name="1" value=" 6" style="background-color:white"></c:if>
							<c:if test="${state[5]==1}"><input type="submit"  name="1" value=" 6" style="background-color:red"></c:if>
						</th>
					</tr>
				</table>
			</th>
			<th>
				<table align=center>
					<tr>
						<th>
							<c:if test="${state[6]==0}"><input type="submit" name="1"  value=" 7" style="background-color:white"></c:if>
							<c:if test="${state[6]==1}"><input type="submit" name="1"  value=" 7" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[7]==0}"><input type="submit" name="1"  value=" 8" style="background-color:white"></c:if>
							<c:if test="${state[7]==1}"><input type="submit" name="1"  value=" 8" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[8]==0}"><input type="submit" name="1"  value=" 9" style="background-color:white"></c:if>
							<c:if test="${state[8]==1}"><input type="submit" name="1"  value=" 9" style="background-color:red"></c:if>
						</th>
					</tr>
					<tr>
						<th>
							<c:if test="${state[9]==0}"><input type="submit" name="1"  value="10" style="background-color:white"></c:if>
							<c:if test="${state[9]==1}"><input type="submit" name="1"  value="10" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[10]==0}"><input type="submit" name="1"  value="11" style="background-color:white"></c:if>
							<c:if test="${state[10]==1}"><input type="submit"  name="1" value="11" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[11]==0}"><input type="submit" name="1"  value="12" style="background-color:white"></c:if>
							<c:if test="${state[11]==1}"><input type="submit" name="1"  value="12" style="background-color:red"></c:if>
						</th>
					</tr>
				</table>
			</th>
			
		</tr>
		
		<tr>
			<th>
				<table align=center>
					<tr>
						<th>
							<c:if test="${state[12]==0}"><input type="submit" name="1"  value="13" style="background-color:white"></c:if>
							<c:if test="${state[12]==1}"><input type="submit" name="1"  value="13" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[13]==0}"><input type="submit" name="1"  value="14" style="background-color:white"></c:if>
							<c:if test="${state[13]==1}"><input type="submit" name="1"  value="14" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[14]==0}"><input type="submit" name="1"  value="15" style="background-color:white"></c:if>
							<c:if test="${state[14]==1}"><input type="submit" name="1"  value="15" style="background-color:red"></c:if>
						</th>
					</tr>
					<tr>
						<th>
							<c:if test="${state[15]==0}"><input type="submit" name="1"  value="16" style="background-color:white"></c:if>
							<c:if test="${state[15]==1}"><input type="submit" name="1"  value="16" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[16]==0}"><input type="submit" name="1"  value="17" style="background-color:white"></c:if>
							<c:if test="${state[16]==1}"><input type="submit"  name="1" value="17" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[17]==0}"><input type="submit"  name="1" value="18" style="background-color:white"></c:if>
							<c:if test="${state[17]==1}"><input type="submit" name="1"  value="18" style="background-color:red"></c:if>
						</th>
					</tr>
				</table>
			</th>
			<th>
				<table align=center>
					<tr>
						<th>
							<c:if test="${state[18]==0}"><input type="submit"  name="1" value="19" style="background-color:white"></c:if>
							<c:if test="${state[18]==1}"><input type="submit" name="1"  value="19" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[19]==0}"><input type="submit"  name="1" value="20" style="background-color:white"></c:if>
							<c:if test="${state[19]==1}"><input type="submit" name="1"  value="20" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[20]==0}"><input type="submit" name="1"  value="21" style="background-color:white"></c:if>
							<c:if test="${state[20]==1}"><input type="submit"  name="1" value="21" style="background-color:red"></c:if>
						</th>
					</tr>
					<tr>
						<th>
							<c:if test="${state[21]==0}"><input type="submit" name="1"  value="22" style="background-color:white"></c:if>
							<c:if test="${state[21]==1}"><input type="submit"  name="1" value="22" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[22]==0}"><input type="submit" name="1"  value="23" style="background-color:white"></c:if>
							<c:if test="${state[22]==1}"><input type="submit"  name="1" value="23" style="background-color:red"></c:if>
						</th>
						<th>
							<c:if test="${state[23]==0}"><input type="submit" name="1"  value="24" style="background-color:white"></c:if>
							<c:if test="${state[23]==1}"><input type="submit" name="1"  value="24" style="background-color:red"></c:if>
						</th>
					</tr>
				</table>
			</th>
		</tr> 
	</table>
	
	</form>			
	<div style = 'position:absolute;left:34px;top:283px;z-index: 3;display:"";'>
		<tool:box>		
			<h1 id="flip">Click</h1>
			<h3 id="panel">빨강 : 사용 중<br>
							흰색 : 사용 가능</h3>
		</tool:box>
	</div>			
	<% if( !id.equals("admin"))
		{%>
		<c:if test="${ pageScope.LOGINSTATE  != null }">	
			<table align=center>	
				<tr>
					<th>	
						<h3>내 좌석 : <%=bbb%></h3>
					</th>
						<% session.setAttribute("seat_Num", ms.getSeat_Num() ); %>
					<th>
						<form action="seat_Return" method="post">
							<input type="submit" value="반납하기">
						</form>
					</th>
				</tr>
			</table>
		</c:if>
		<c:if test="${ pageScope.LOGINSTATE == null }">	
			<h3 align=center>내 좌석 : X</h3>
		</c:if>
		<%} %>
<body>


</body>
</html>