<%@page import="model.VO"%>
<%@page import="model.DAO"%>
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
<%
	String id=request.getParameter("id");
	DAO mdao=new DAO();
	VO mbean=mdao.oneSelectMember(id);
%>
<div align="center">
<h2>회원정보 수정하기</h2>
	<table width="400" border="1">
		<form action="MemberUpdateProc.jsp" method="post">
		
		<tr height="50">
			<td align="center" width="150">아이디</td>
			<td width="250"><input type="text" name="id" value="${loginUser.id}" readonly="readonly"></td>
		</tr>
		
		<tr height="50">
			<td align="center" width="150">패스워드</td>
			<td width="250">
			<input type="password" name="pass">
			</td>
			
		<tr height="50">
			<td align="center" width="150">전화번호</td>
			<td width="250">
			<input type="tel" name="tel" value="${loginUser.tel}">
			</td>
		</tr>	
		
		<tr height="50">
			<td align="center" width="150">이메일</td>
			<td width="250">
			<input type="email" name="email" value="${loginUser.email}">
			</td>
		</tr>
	
		</tr>
		<tr height="50">
			<td align="center" colspan="2">
				<input type="hidden" name="id" value="<%=mbean.getId()%>">
				<input type="submit" value="회원정보 수정하기">&nbsp;&nbsp;		
		</form>	
		<button onclick="location.href='Mypage.jsp'">마이페이지</button>
			</td>	
		</tr>
		
		
	</table>			
</div>		
</body>
</html>

<%@ include file="bottom.jsp" %> 