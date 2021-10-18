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
<jsp:useBean id="bvo" class="model.BoardVO">
	<jsp:setProperty name="bvo" property="*"/>
</jsp:useBean>
<%
String content=bvo.getContent().replace("<br>","\r\n");
%>
<div align="center">

<form action="HelpQnAReUpdateProc.jsp">

<table>
	<tr>
		<td><font size="6em">댓글 수정</font></td>
	</tr>
	<tr>
		<td>
		<textarea rows="3" cols="60" name="content" maxlength="300" style="resize: none"  required ><%=content %></textarea>
		<td>
	</tr>
	<tr>
		<td align="center">	
		
		<input type="hidden" name="num" value="<%=bvo.getNum() %>">
		<input type="hidden" name="ref" value="<%=bvo.getRef() %>">
		<input type="hidden" name="pageNum" value="<%=bvo.getPageNum() %>">
		<input type="hidden" name="check2" value="<%=bvo.getCheck2() %>">
		<input type="hidden" name="search" value="<%=bvo.getSearch() %>">
		
		<input type="submit" value="수정하기">&nbsp;&nbsp;
		<input type="button" onclick="location.href='HelpQnA.jsp?num=<%=bvo.getNum() %>&check2=<%=bvo.getCheck2() %>&pageNum=<%=bvo.getPageNum() %>&search=<%=bvo.getSearch() %>'" value="돌아가기">
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>

<%@ include file="bottom.jsp"%>