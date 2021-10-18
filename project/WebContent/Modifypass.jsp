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
<script type="text/javascript">
	window.onload=function() {
		passForm.pwd.focus();
	}

	function passwdCheck(form) {
		if(form.pwd.value=="") {
			alert("현재 비밀번호를 입력해 주세요.");
			form.pwd.focus();
			return;
		}
		
		if(form.passwd1.value=="") {
			alert("새로운 비밀번호를 입력해 주세요.");
			form.passwd1.focus();
			return;
		}
		
		if(form.passwd2.value=="") {
			alert("새로운 비밀번호 확인을 입력해 주세요.");
			form.passwd2.focus();
			return;
		}
		
		if (form.passwd1.value!=form.passwd2.value) {
			alert("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다..");
			form.passwd1.value="";
			form.passwd2.value="";
			form.passwd1.focus();
			return;
		}

		form.action="ModifypassProc.jsp";
		form.submit();
	}
</SCRIPT>
</head>
<body>
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=1><spacer type=BLOCK height=10 width=100%></td>
		</tr>
		
	</table>


	<form name="passForm">
		<table width="300" cellspacing="0" bordercolordark="white"
			bordercolorlight="black" cellpadding="0" align="center">
			<tr bgcolor="#008baf" valign="middle">
				<td height="25" class="t1" align="center"><b>
				<font color="#FFFFFF" size="2">비밀번호 변경</font></b></td>
			</tr>

			

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#0CA5A5">
						<tr>
							<td width="50%" class="t1" bgcolor="#bddee8" align="center">
								아이디
							<td width="50%" class="t1" align="center">
							<input type="text" name="id" value="${loginUser.id}" maxlength="13" size="13" readonly="readonly">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#0CA5A5">
						<tr>
							<td width="50%" class="t1" bgcolor="#bddee8" align="center">
								현재 비밀번호
							<td width="50%" class="t1" align="center">
							<input type="password" name="pwd" maxlength="13" size="13" class="TXTFLD">
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#0CA5A5">
						<tr>
							<td width="50%" class="t1" bgcolor="#bddee8" align="center">
								새 비밀번호
							<td width="50%" class="t1" align="center">
							<input type="password" name="passwd1" maxlength="13" size="13" class="TXTFLD">
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#0CA5A5">
						<tr>
							<td width="50%" class="t1" bgcolor="#bddee8" align="center">
								새 비밀번호 확인
							<td width="50%" class="t1" align="center">
							<input type="password" name="passwd2" maxlength="13" size="13" class="TXTFLD">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		
			<br>

			<tr>
				<td height="30" class="t1" align="center">
					<button type="button" onclick="passwdCheck(passForm);">변경하기</button>
					<button type="button" onclick="location.href='Mypage.jsp';">취소</button>
				</td>
			</tr>


		</table>

	<table cellspacing=0 cellpadding=0 border=0 align="center">
		<tr>
			<td height=20 class="t1">
			<font color="red">&nbsp;</font>
			</td>
		</tr>
	</table>

</body>
</html>


</body>
</html>
<%@ include file="bottom.jsp" %> 