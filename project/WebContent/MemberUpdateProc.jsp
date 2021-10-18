<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class="model.VO">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean>	
<%
	String id=request.getParameter("id");
	DAO mdao=new DAO();
	
	
	String pass1=mdao.getPass(id);
	if(member.getPass().equals(pass1)){
		mdao.updateMember(member);
	response.sendRedirect("Mypage.jsp");
	}else{	
%>		
<script type="text/javascript">
	alert("패스워드가 일치하지 않습니다. 다시 확인해주세요.");
	history.go(-1);

</script>
<% 
	}
	
%>
</body>
</html>