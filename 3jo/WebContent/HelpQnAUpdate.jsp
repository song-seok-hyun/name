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
	border:1px solid #ccc;
}
th{
	padding:10px;
	background: #000817;
	color:white;
	border:1px solid #ccc;
}
</style>
</head>
<body>
<br>
<jsp:useBean id="bvo" class="model.BoardVO">
	<jsp:setProperty name="bvo" property="*"/>
</jsp:useBean>
<%
String content=bvo.getContent().replace("<br>","\r\n");
%>
<div align="center">

<table width=550 align="center" border="0">
	<tr>
		<td style="border:0px"><font size="6em">문의 수정</font></td>
	</tr>
</table>
<form action="HelpQnAUpdateProc.jsp">
<table  border="1" style="border-collapse:collapse" width="550px">
	<tr>
		<th>제목</th>
		<td><input type="text" name="subject" maxlength="300"  style="width:97%" value="<%=bvo.getSubject() %>" required></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="hidden" name="writer" value="<%=bvo.getWriter() %>"><%=bvo.getWriter()%></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="password" required></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="30" cols="60" name="content" maxlength="300"  style="resize: none" required><%=content%></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="right">
		<input type="hidden" name=num value="<%=bvo.getNum() %>">
		<input type="hidden" name=pageNum value="<%=bvo.getPageNum() %>">
		<input type="hidden" name=check2 value="<%=bvo.getCheck2() %>">
		<input type="hidden" name=search value="<%=bvo.getSearch() %>">
		<input type="submit" value="수정하기">
		<input type="button" onclick="location.href='HelpQnA.jsp?num=<%=bvo.getNum() %>&check2=<%=bvo.getCheck2() %>&pageNum=<%=bvo.getPageNum() %>&search=<%=bvo.getSearch() %>'" value="돌아가기"></td>
	</tr>
</table>
</form>
</div>
</body>
</html>

<%@ include file="bottom.jsp"%>