<%@page import="model.MovieDAO"%>
<%@page import="model.MovieVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>     
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Main ㅣ 이젠 시네마</title>
</head>
<body>
	


	<!-- 시작 -->
	<H2>상영 예정 영화</H2>


	<% MovieDAO mdao=MovieDAO.getInstance();
	
	Vector<MovieVO> vec = mdao.allSelectMovie();

	%>

	<div align="center">
		<table border="1" bgcolor="black">

			<tr>
				<%  for (int i = 0; i < 3; i++)

	{
				MovieVO mvo = vec.get(i); %>
				<td colspan="2"><img height="500" width="400"
					src="<%=mvo.getImg()%>"></td>
				<% } %>
			</tr>
			<tr align="center">
				<%  for (int i = 0; i < 3; i++)

	{
				MovieVO mvo = vec.get(i); %>
				<td><input type="button" value="  예  매  하  기  "
					onclick="location.href='Ticketing.jsp'"></td>
				<td><a
					href="<%=mvo.getUrl()%>"
					target=_blank> <input type="button" value="  영  화  정  보  ">
				</a></td>
				<% } %>
			</tr>

		</table>
	</div>




	<div align="center">
		<table border="1" bgcolor="gray">
			<tr>
				<% for (int i = 3; i < 6; i++)

	{
		MovieVO mvo = vec.get(i); %>


				<td colspan="2"><img height="500" width="400"
					src="<%=mvo.getImg()%>"></td>
				<% } %>
			</tr>
			<tr align="center">
				<% for (int i = 3; i < 6; i++)

	{
		MovieVO mvo = vec.get(i); %>


				<td><input type="button" value="  예  매  하  기  "
					onclick="location.href='Ticketing.jsp'"></td>
				<td><a
					href="<%=mvo.getUrl()%>"
					target=_blank> <input type="button" value="  영  화  정  보  ">
				</a></td>
				<% } %>
			</tr>
		</table>
	</div>
</body>
</html>

<%@ include file="bottom.jsp" %> 