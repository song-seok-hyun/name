<%@page import="model.VO"%>
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

String id=request.getParameter("id");
DAO mdao=new DAO();
VO mbean=mdao.oneSelectMember(id);

	String pwd = request.getParameter("pwd");
	String passwd1 = request.getParameter("passwd1");
	
	DAO dao = DAO.getInstance();
	if(dao.userCheck(id, pwd) == 1) {
		
		boolean flag = dao.changePassword(id, passwd1);
		if(flag) {
%>
<script type="text/javascript">
			alert("비밀번호가 정상적으로 변경되었습니다. 다시 로그인해주세요.");
			window.location.href = 'logout.do';
		</script>
<%
//response.sendRedirect("logout.do");
		}else {
%>
		<script>
			alert("비밀번호 변경에 실패했습니다.");
			history.go(-1);
		</script>
<%		
		}
	}else {
%>
	<script>
		alert("기존 비밀번호를 다시 확인해주세요.");
		history.go(-1);
	</script>
<%		
	}
%>


</body>
</html>