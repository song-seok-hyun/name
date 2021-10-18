<%@page import="java.net.URLEncoder"%>
<%@page import="model.BoardDAO"%>
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
BoardDAO bdao=new BoardDAO();
bdao.deleteHelpReBoard(bvo);
%>

<jsp:forward page="HelpQnA.jsp">
	<jsp:param value='<%=bvo.getNum() %>' name="num"/>
	<jsp:param value='<%=URLEncoder.encode(bvo.getSearch(),"UTF-8") %>' name="search"/>
	<jsp:param value='<%=bvo.getCheck2() %>' name="check2"/>
	<jsp:param value='<%=bvo.getPageNum() %>' name="pageNum"/>
</jsp:forward>

</body>
</html>

<%@ include file="bottom.jsp"%>