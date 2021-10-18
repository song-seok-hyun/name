<%@page import="java.util.Vector"%>
<%@page import="model.VO"%>
<%@page import="model.BoardVO"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

td {
	padding:10px;
	
}
th{
	padding:10px;
	background: #000817;
	color:white;
}

</style>
</head>
<body>
<br>
<%
	int rownum=Integer.parseInt(request.getParameter("rownum"));
	BoardDAO bdao=new BoardDAO();
	VO vo=(VO)session.getAttribute("loginUser");
	Vector<BoardVO> vec=bdao.getAllEventBoard();
	BoardVO bvo=vec.get(rownum-1);
	int num=bvo.getNum();
	
	String content=bvo.getContent().replace("\r\n","<br>");
%>

<div align="center">
<table border="1" style="border-collapse:collapse"  >
	<tr >
		<th width="600px" align="left" style="padding:15px;">이벤트 | <%=bvo.getSubject() %></th>
		<th width="300px" align="right" style="border-left-style:hidden"><font size="2" color="gray"><%=bvo.getStartdate()%> ~ <%=bvo.getEnddate()%></font></th>
	</tr>
	<tr>
		<td align="center" colspan="2" width="900px"><font size="4"><%=content%></font>
		<br><br>
		<img width="1100px" src="img\<%=bvo.getImgname()%>" onerror="this.style.display='none';">
		<br><br>
		<hr><br>
		</td>
	</tr>
	<tr>
		<td colspan="2">다음글 |&nbsp;&nbsp;&nbsp;
		<%if(0 == rownum-1){ %>
		다음 게시글이 없습니다.
		<%}else{ %>
		<a href="EventInfo.jsp?rownum=<%=rownum-1%>"><%=vec.get(rownum-2).getSubject() %></a>
		<%} %>
		</td>
	</tr>
	<tr>
		<td colspan="2">이전글 |&nbsp;&nbsp;&nbsp;
		<%if(vec.size() < rownum+1){ %>
		이전 게시글이 없습니다.
		<%}else{ %>
		<a href="EventInfo.jsp?rownum=<%=rownum+1%>"><%=vec.get(rownum).getSubject() %></a>
		<%} %>
		</td>
	</tr>
	<%
	if(session.getAttribute("loginUser") != null){ 
		if(vo.getAdmin().equals("0")){
	%>
	<tr>
		<td colspan="2" align="right">
			<button onclick="location.href='EventUpdateForm.jsp?num=<%=num%>&subject=<%=bvo.getSubject()%>&content=<%=content%>&eventname=Event.jsp'">수정</button>
			&nbsp;&nbsp;<button onclick="if(confirm('삭제 하시겠습니까?')) location.href='EventDeleteForm.jsp?num=<%=num%>&eventname=Event.jsp'">삭제</button>
		</td>
	</tr>
	<%
		}
	}
	%>
</table>
</div>
</body>
</html>

<%@ include file="bottom.jsp"%>