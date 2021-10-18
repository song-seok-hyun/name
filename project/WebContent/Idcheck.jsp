<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idcheck</title>
<script type="text/javascript" src="script.js?v=<%= System.currentTimeMillis() %>"></script>
</head>
<body>
<h2>아이디 중복 확인</h2>
<form action="idCheck.do" method="get" name="frm">
	아이디<input type="text" name="id" value="${id}"><br>
	
<c:if test="${result == 1 }">
	<script type="text/javascript">
		opener.document.frm.id.value="";
	</script>
	${id}는 이미 사용 중인 아이디입니다.<br>
	
	<!-- <input type="submit" value="중복 확인" onclick="idCheck()"> -->
	
</c:if>	
<c:if test="${result == -1 }">	
	${id}는 사용가능한 아이디입니다.<br>
	<input type="button" value="사용" onclick="idOk()">
</c:if>
</form>
	
</body>
</html>