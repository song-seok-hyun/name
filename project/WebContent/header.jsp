<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>이젠 시네마</title>
<style type=text/css>
header{ 

position: absolute; 
left: 0; 
right: 0; 
top: 0; 
z-index:999;
background:#ffff;
	}
	
body{

padding-top:350px;
background-color:#EAE9E6;

}		

.menutap{

    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
}

.color{
background-color:#000817;
}

		
</style>
</head>
<script src="script.js?v=<%= System.currentTimeMillis() %>"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<body>

<header class="header" style="background-color:#000817" >
	<div class="menu_wrap" style="color:white">
		<H2 style="font-size:30px"><a href="Main.jsp"><img src="./img/unnamed.png" width="100"></a></H2>
		
		<c:if test="${empty loginUser }">
		<div class="JoinLogin"><a href="Join.jsp">회원가입</a>&nbsp;
		<a href="Login.jsp">로그인</a></div>
		</c:if>
		
		<c:if test="${!empty loginUser }">
		<tr>
		
			<td>${loginUser.name}님 반갑습니다.</td> 
		<div align="right">
			<c:choose>
			<c:when test="${loginUser.admin=='0'}">
				<td class="adminpage"><a href="adminPage.jsp" style="text-decoration:none;">관리자페이지</a></td>&nbsp;
			
			</c:when>
				</c:choose>
				
				<td class="mypage"><a href="Mypage.jsp" style="text-decoration:none;">마이페이지</a></td>&nbsp;
				<td class="login"><a href="logout.do" style="text-decoration:none;">로그아웃</a></td>
		
	
		</div>	
		</tr>
		</c:if>	
		
		
		
	
		
		
		
		
		
		<HR>
		<ul class="dep1">

				<li><a href="Ticketing.jsp" class="color">예매</a>
				<ul class="dep2">
					<li class="menutap" style="font-size:14px"><a href="Ticketing.jsp">예매하기 |&nbsp;</a></li>
					<li class="menutap" style="font-size:14px"><a href="Timetable.jsp">상영시간표 |&nbsp;</a></li>
					<li class="menutap" style="font-size:14px"><a href="Cancel_Ticketing.jsp">예매취소</a></li>
				</ul></li>

			<li><a href="Now.jsp" class="color">영화</a>
				

			<li><a href="Theater.jsp" class="color">극장</a>
				<ul class="dep2">
					<li class="menutap" style="font-size:14px"><a href="Theater.jsp">영화관소개 |&nbsp;</a></li>
					<li class="menutap" style="font-size:14px"><a href="Map.jsp">찾아오는길</a></li>
				</ul></li>
			<li><a href="Event.jsp" class="color">공지사항</a>
				<ul class="dep2">
					<li class="menutap" style="font-size:14px"><a href="Event.jsp">진행중 이벤트 |&nbsp;</a></li>
					<li class="menutap" style="font-size:14px"><a href="End_Event.jsp">종료된 이벤트 |&nbsp;</a></li>
					<li class="menutap" style="font-size:14px"><a href="Help.jsp">문의하기</a></li>
				</ul></li>

		</ul>

	</div>
	<div style="background-color:#1297B9"><br></div>
	</header>

</body>
</html>