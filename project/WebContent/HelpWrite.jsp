<%@page import="model.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
	padding:10px;
}
th{
	padding:10px;
	background: #000817;
	color:white;
}
</style>
</head>
<body>
<form action="HelpWriteProc.jsp">
<%
VO vo=new VO();
vo=(VO)session.getAttribute("loginUser");
String pass=vo.getPass();
%>
<div align="center">
<br>
<table width=550 align="center" border="0">
	<tr>
		<td style="border:0px"><font size="6em">문의 하기</font></td>
	</tr>
</table>
<table border="1" style="border-collapse:collapse" width="550px">
	<tr>
		<th width="100px">제목</th>
		<td><input type="text" name="subject" style="width:94%" maxlength="300" required></td>
	</tr>
	<tr>
		<th>이름</th>
		<%if(vo.getAdmin().equals("1")){ %>
		<td><input type="hidden" name="writer" value="<%=vo.getName()%>" required><%=vo.getName() %></td>
		<%}else{ %>
		<td><input type="hidden" name="writer" value="운영자" required>운영자</td>
		<%} %>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="30" cols="60" name="content" style="resize: none" maxlength="300" required></textarea></td>
	</tr>
	<tr>
		<td align="right" colspan="2"><input type="hidden" name="id" value="<%=vo.getId()%>"><input type="hidden" name="password" value="<%=pass%>"><input type="submit" value="글쓰기">
		&nbsp;&nbsp;<input type="button" onclick="location.href='Help.jsp'" value="돌아가기"></td>
	</tr>
</table>
</div>
</form>
</body>
</html>

<%@ include file="bottom.jsp"%>
