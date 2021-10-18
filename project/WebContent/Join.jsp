<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<body>
	
	<div class="join_content" align="center">
		<form action="join.do" method="post" name="frm">
		<table class="join_tb">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id">
						<input type="hidden" name="reid" >
						<input type="button" value="중복 체크" onclick="idCheck()">
					</td>					
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" ></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="password_chk" ></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>	
				<tr>
					<td>전화번호</td>
					<td><input type="tel" name="tel"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>
				</tr>	
				<tr>
					<td>등급</td>
					<td><input type="radio" name="admin" value="1" checked='checked'>일반회원 &nbsp;&nbsp;&nbsp; <input type="radio" name="admin" value="0">관리자</td>
				</tr>
				
				<tr class="join_bnt">
					<td colspan="2"><input type="submit" value="가입하기" onclick="return joinCheck()"></td>
				</tr>																		
			</table>
		</form>
	</div>

</body>
</html>

<%@ include file="bottom.jsp" %>