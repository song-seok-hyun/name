<%@page import="model.MovieVO"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main ㅣ 이젠 시네마</title>
<style type=text/css>
.now
{
	margin-top: 50px;
	margin-left: 120px;
	margin-right:120px;
	margin-bottom: 50px;
	text-align: center;
}
.boximg
{
	
	width: 292px;
	height: 420px;
	
	
}


footer {
position: absolute;
bottom: 0;
left: 0;
right: 0;
}





</style>
</head>
<body>
	
	<div class="containerouter">
		<div class="imgcontainer">
			<div class="imginner">
				<img src="./img/img1.jpg">
			</div>
			<div class="imginner">
				<img src="./img/img2.jpg">
			</div>
			<div class="imginner">
				<img src="./img/img3.jpg">
			</div>

		</div>
		<div class="imgbutton">
			<button class="imgbutton1" onclick="imgButtonClick1()"></button>
			<button class="imgbutton2" onclick="imgButtonClick2()"></button>
			<button class="imgbutton3" onclick="imgButtonClick3()"></button>
			
		</div>
		
	</div>

	
	<div class="now">
	<hr>
	
	<h2>상영중인 영화</h2>
	
	<% MovieDAO mdao=MovieDAO.getInstance();
	
	Vector<MovieVO> vec = mdao.allSelectMovie();

	if (!(vec.isEmpty()))
	{
	for (int i = 0; i < vec.size(); i++)

	{
		
		MovieVO mvo = vec.get(i); %>
	
		<img src="<%=mvo.getImg()%> " class="boximg<%=mvo.getNum()%>" style=" width:292px; height:420px;">
	
		<input type="checkbox" id="popup<%=mvo.getNum()%>">
		<label for="popup<%=mvo.getNum()%>">예고편</label>
		
		<div>
			<div class="trailer<%=mvo.getNum()%>">
			<iframe width="840" height="472" src="<%=mvo.getUrl()%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				<label for="popup<%=mvo.getNum()%>"><img src="./img/x_icon.png"></label>
			</div>
			<label for="popup<%=mvo.getNum()%>"></label>
			
		</div>
		<%
		if (i+1 == 6)
			break;
		%>
		<% } %>
		<% } %>
	</div>
	

</body>
</html>
<%@ include file="bottom.jsp" %> 