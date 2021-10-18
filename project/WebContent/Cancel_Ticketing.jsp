<%@page import="model.MovieTimeSeatVO"%>
<%@page import="java.util.Vector"%>
<%@page import="model.VO"%>
<%@page import="model.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="header.jsp" %> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MovieDAO mdao = MovieDAO.getInstance();
%>
<div align="center">
<c:if test="${empty loginUser}">
<h1 style="text-align: center;">로그인이 필요합니다.</h1>
</c:if>
<c:if test="${!empty loginUser}">
<h1>예매취소</h1>
	<HR>
<c:set var="id" value="${loginUser.id}" ></c:set>
<div style="overflow: hidden;
	display: inline-block;
	
	width: 800px;
	border: 3px solid #000;">
<%
String id = (String)pageContext.getAttribute("id");
Vector<MovieTimeSeatVO> vecmts =mdao.allSelectMovieTimeSeat(id);
for (int i = 0 ; i<vecmts.size();i++)
{
	MovieTimeSeatVO mtsvo =vecmts.get(i);
%>
	<form action="ticketdelete.do" method="post">
	<div style="border-bottom:  3px solid #000;height: 150px;"><div>제목 : <%=mtsvo.getMovieName()%></div><div>상영일 : <%=mtsvo.getMovieDate()%></div>
	<div>상영시간 :<%=mtsvo.getMovieTime()%></div><div>좌석번호 : <%=mtsvo.getSeatNum()%></div><input name="id" type="hidden" value ="<%=id%>"><input name="name"type="hidden" value ="<%=mtsvo.getMovieName()%>">
	<input name="date"type="hidden" value ="<%=mtsvo.getMovieDate()%>"><input name="time" type="hidden" value ="<%=mtsvo.getMovieTime()%>"><input name="seat" type="hidden" value ="<%=mtsvo.getSeatNum()%>"><input type="submit" value="삭제"></div>
	</form>
						
<% 
}
%>
</div>
</c:if>
</div>
</body>
</html>
<%@ include file="bottom.jsp" %> 