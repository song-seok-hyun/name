<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		String eventname=request.getParameter("eventname");
	%>

	<div align="center">
	<form action="EventDeleteProc.jsp">
		<table>
			<tr>
				<td><font size="6em">이벤트 삭제</font></td>
			</tr>
			<tr>
				<td><input type="password" name="password" 
				placeholder="비밀번호를 입력해주세요." required></td>
				<td>
					<input type="hidden" name="eventname" value="<%=eventname %>">
					<input type="hidden" name="num" value="<%=num%>">
					<input type="submit" value="삭제하기">
				</td>
				<td><input type="button" onclick="location.href='<%=eventname %>'" value="돌아가기"></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>

<%@ include file="bottom.jsp"%>