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
<h2>회원 탈퇴하기</h2>
<form action="MemberDeleteProc.jsp" method="post">
	<table width="400" border="1" align="center">
		<tr height="50">
			<td align="center" width="150">아이디</td>
			<td width="250"><input type="text" name="id" value="${loginUser.id}" readonly="readonly"></td>
		</tr>
		
		<tr height="50">
			<td align="center" width="150">비밀번호</td>
			<td width="250">
				<input type="password" name="pass">
			</td>
		</tr>
		
		<tr height="50">
			<td align="center" colspan="2">
			<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
			<input type="submit" value="회원정보 삭제하기">&nbsp;&nbsp;
			<button type="button" onclick="location.href='Mypage.jsp'">마이페이지로</button>
			</td>
		</tr>		
	</table>
</form>
</body>
</html>
<%@ include file="bottom.jsp" %> 