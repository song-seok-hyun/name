<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>	
	<div class="search_content" align="center">
		
		<form action="" method="post" name="frm">
		<table class="idsearch_tb">
				<tr>
					<th><h3>아이디찾기</h3></th>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>						
					<td>이메일</td>
					<td><input type="email" name="email"></td>									
				</tr>
				<tr class="idsearch_bnt">
					<td colspan="2"><input type="button" value="찾기" onclick="idSearch()"></td>
				</tr>		
		 </table>
		 </form>
		 
		<form action="" method="post" name="frm_2">
		<table class="pwdsearch_tb">
				<tr>
					<th><h3>비밀번호 찾기</h3></th>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>						
					<td>이메일</td>
					<td><input type="email" name="email"></td>									
				</tr>
				<tr class="idpwd_bnt">
					<td colspan="2"><input type="button" value="찾기" onclick="pwSearch()"></td>
				</tr>		
		 </table>
		 </form>		
	</div>
		
<%-- 	<c:if test="${result == 1 }">	
	<form action="idPopup.jsp" method="get" name="frm">
	<input type="hidden" name="id" value="${id}">	
	<input type="hidden" name="name" value="${name}">	
	</form>
		<script type="text/javascript">
				var url="search.do?id=+document.frm.id.value&name=+document.frm.name.value"; 
				window.open(url,"","toolbar=no,menubar=no,scrollbars=yes,resizable=no,width=450,height=200");				
/* 			var id=document.frm.id.value;
			var name=document.frm.name.value;
			alert('name+"님의 아이디는"+id+"입니다."'); */		
		</script>
	</c:if> --%>	
	
<%-- 	<c:if test="${result == -1 }">	
		<script type="text/javascript">
			alert("일치하는 회원정보가 없습니다.");		
		</script>
	</c:if> --%>

	
</body>
</html>

<%@ include file="bottom.jsp" %>