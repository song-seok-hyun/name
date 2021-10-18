<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="script.js"></script>
</head>
<body>
	
<h2>아이디 찾기</h2>

	<c:if test="${result == 1 }">	
<form action="login.jsp" method="get" name="frm">
	<input type="hidden" name="id" value="${id}">
	<input type="hidden" name="name" value="${name}">
	
	${name} 고객님의 ID는 ${id} 입니다. 
	
	<input type="button" name="bnt" value="로그인하기" onclick="search_su()">
</form>
	</c:if>	
	
	<c:if test="${result == -1 }">	
<form action="" method="get" name="frm">
	<input type="hidden" name="id" value="${id}">
	<input type="hidden" name="name" value="${name}">
	
	일치하는 회원정보가 없습니다. 
	
	<input type="button" name="bnt" value="다시 찾기" onclick="search_fa()">
</form>
	</c:if>	
	




</body>
</html>
