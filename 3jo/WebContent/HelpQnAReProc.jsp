<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.BoardDAO"%>
<%@page import="model.VO"%>
<%@page import="model.BoardVO"%>

<%@ include file="header.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="bvo" class="model.BoardVO">
	<jsp:setProperty name="bvo" property="*"/>
</jsp:useBean>

<%
	BoardDAO bdao=new BoardDAO();
	VO vo=(VO)session.getAttribute("loginUser");
	String id=vo.getId();
	bvo.setId(id);
	bdao.insertHelpReBoard(bvo);
%>

<jsp:forward page="HelpQnA.jsp">
	<jsp:param value='<%=bvo.getNum() %>' name="num"/>
	<jsp:param value='<%=bvo.getCheck2() %>' name="check2"/>
	<jsp:param value='<%=bvo.getPageNum() %>' name="pageNum"/>
	<jsp:param value='<%=URLEncoder.encode(bvo.getSearch(),"UTF-8") %>' name="search"/>
</jsp:forward>



</body>
</html>