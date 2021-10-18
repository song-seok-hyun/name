<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br>
<jsp:useBean id="bvo" class="model.BoardVO">
	<jsp:setProperty name="bvo" property="*"/>
</jsp:useBean>
<div align="center">

<form action="HelpQnADeleteProc.jsp">
<table>
<tr>
	<td><font size="6em">문의 삭제</font></td>
</tr>
<tr>
<td><input type="password" name="password" placeholder="비밀번호를 입력해주세요." ></td>
<td><input type="hidden" name="num" value="<%=bvo.getNum()%>"><input type="submit" value="삭제하기"></td>
<td><input type="button" onclick="location.href='HelpQnA.jsp?num=<%=bvo.getNum() %>&check2=<%=bvo.getCheck2() %>&pageNum=<%=bvo.getPageNum() %>&search=<%=bvo.getSearch() %>'" value="돌아가기"></td>
</tr>
</table>
</form>
</div>
</body>
</html>

<%@ include file="bottom.jsp"%>