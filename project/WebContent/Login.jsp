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
	
	
	<div class="login_area" align="center">
	<form action="login.do" method="post" >
	<table width="300" cellspacing="0" bordercolordark="white"
			bordercolorlight="black" cellpadding="0" align="center">
			<tr bgcolor="#008baf" valign="middle">
				<td height="25" class="t1" align="center"><b>
				<font color="#FFFFFF" size="2">로그인</font></b></td>
			</tr>
	<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#0CA5A5">
						<tr>
							<td width="50%" class="t1" bgcolor="#bddee8" align="center">
								아이디
							<td width="50%" class="t1" align="center">
		<input type="text" name="id"  maxlength="13" size="13" >
		</td>
		</tr>
		</table>
		<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#0CA5A5">
						<tr>
							<td width="50%" class="t1" bgcolor="#bddee8" align="center">
								 비밀번호
							<td width="50%" class="t1" align="center">
						
		<input type="password" name="pwd" maxlength="15" maxlength="13" size="13">
		</td>
		</tr>
		</table>
	<br>
	</table>	
		<input type="hidden" name="hidLoginType" id="hidLoginType" value>
		<input type="submit" value="로그인">
		<input type="reset" value="취소">
	</div>
	
	
	
	<br><br>
	<div class="login_bot_wrap" align="center">
		<div class="login_menu"><a href="Join.jsp">회원가입</a>&nbsp;&nbsp;
		<a href="Idsearch.jsp">아이디 찾기</a>&nbsp;&nbsp;
		<a href="Idsearch.jsp">비밀번호 찾기</a>
		</div>
	</div>
	
	</form>
	
	<div style="color:red; text-align:center;">${message}</div>
	
	
	
	
	
</body>
</html>
</body>
</html>

<%@ include file="bottom.jsp" %> 