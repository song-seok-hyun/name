<%@page import="java.net.URLEncoder"%>
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
<jsp:useBean id="bvo" class="model.BoardVO">
	<jsp:setProperty name="bvo" property="*"/>
</jsp:useBean>
<%
BoardDAO bdao=new BoardDAO();
DAO dao=DAO.getInstance();
VO vo=(VO)session.getAttribute("loginUser");

if(dao.userCheck(vo.getId(), bvo.getPassword()) == 1){
	bdao.updateHelpBoard(bvo);
	if(bvo.getCheck2().equals("2") ){
	%>
	<jsp:forward page="HelpQnASearch.jsp">
	<jsp:param value='<%=bvo.getNum() %>' name="num"/>
	<jsp:param value='<%=bvo.getPageNum() %>' name="pageNum"/>
	<jsp:param value='<%=URLEncoder.encode(bvo.getSearch(),"UTF-8") %>' name="search"/>
    </jsp:forward>
	<%
	}else{
		%>
		<jsp:forward page="Help.jsp">
		<jsp:param value='<%=bvo.getNum() %>' name="num"/>
		<jsp:param value='<%=bvo.getPageNum() %>' name="pageNum"/>
	    </jsp:forward>
	    <%
	}
}
%>
<script type="text/javascript">
	alert("비밀번호가 틀리셨습니다.");
	history.go(-1);
</script>
</body>
</html>