<%@page import="model.VO"%>
<%@page import="model.DAO"%>
<%@page import="model.BoardDAO"%>
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
		BoardDAO bdao = new BoardDAO();
		int num = Integer.parseInt(request.getParameter("num"));
		String eventname = request.getParameter("eventname");
		String password = request.getParameter("password");

		DAO dao = DAO.getInstance();
		VO vo = (VO) session.getAttribute("loginUser");
	%>
	<%
		if (dao.userCheck(vo.getId(), password) == 1) {
			bdao.deleteEventBoard(num);
			response.sendRedirect(eventname);
		}else{
	%>
	<script type="text/javascript">
		alert("비밀번호가 틀리셨습니다.");
		history.go(-1);
	</script>
	<%} %>
</body>
</html>