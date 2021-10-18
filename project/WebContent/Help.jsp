<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.VO"%>
<%@page import="model.BoardDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="model.BoardVO"%>

<%@ include file="header.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
  border-spacing: 0px;
  table-layout:fixed;
}

th{
  padding: 10px;
  background: #000817;
}

td{
  padding: 10px;
  border-bottom: 1px solid #ccc;
}

.off {
  background: #EAE9E6;
}
  
.on {
  background: #dddddd;
}


</style>
</head>

<%
	BoardVO bvo=new BoardVO();
    BoardDAO  bdao=new BoardDAO();
    Vector<BoardVO> vec;
	int pageSize=10;
	String pageNum=request.getParameter("pageNum");

	if(pageNum == null){
		pageNum="1";
	}

	int count=0;
	int number=0;
	int currentPage=Integer.parseInt(pageNum);
	count=bdao.getAllCount();
	int startRow=(currentPage-1)*pageSize+1;
	int endRow=currentPage*pageSize;
	
	vec=bdao.getAllHelpBoard(startRow, endRow);
	
	number=count-(currentPage-1)*pageSize;
%>
<body >
<br>
<table width=1000 align="center" border="0">
	<tr>
		<td style="border:0px"><font size="6em">문의 게시판</font></td>
	</tr>
</table>
<div align="center" >
<table width="900"><!-- <table border="1" width="900" style="border-collapse:collapse" > -->
	<tr align="center" style="color:white">
		<th width="100">번호</th>
		<th width="500">제목</th>
		<th width="100">작성자</th>
		<th width="100">등록일</th>
		<th width="100">조회수</th>
	</tr>
	
	<%
	for(int i=0;i<vec.size();i++){
		bvo=vec.get(i);
	%>
	<tr align="center" class="off" onmouseover="this.className='on'" onmouseout="this.className='off'" >
		<td><%=bvo.getNum()%></td>
		<td width="500" height="5" style="text-overflow:ellipsis; overflow:hidden">
		<%if(session.getAttribute("loginUser") == null){%>
		<nobr><%=bvo.getSubject() %></nobr>
		<%}else{ %><a href="HelpQnA.jsp?num=<%=bvo.getNum()%>&pageNum=<%=pageNum %>&check=1&check2=1">
		<nobr><%=bvo.getSubject() %></nobr> </a>
		<% } %>
		</td>
		<td><%=bvo.getWriter() %></td>
		<td><%=bvo.getReg_date() %></td>
		<td><%=bvo.getReadcount() %></td>
	</tr>
	
	<%} %>
	<tr>
		<td colspan="2">
	<%if(session.getAttribute("loginUser") != null){ %>
	
			<button onclick="location.href='HelpWrite.jsp'">문의하기</button>
		
	<%} %>
	</td>
	
	<td colspan="3" align="right">
			<form action="HelpQnASearch.jsp">
			<input type="text" name="search">
			<button type="submit"><img src="img/search.png" alt="검색 " width="15px"></button>
			</form>
		</td>
		</tr>
</table>

<br>
<%
		if(count > 0){
			int pageCount=count/pageSize+(count%pageSize == 0? 0:1);
			int startPage=1;
			if(currentPage%10 != 0){
				startPage=((int)(currentPage/10))*10+1;
			}else{
				startPage=((int)(currentPage/10)-1)*10+1;
			}
			int pageBlock=10;
			int endPage=startPage+pageBlock-1;
			
			if(endPage > pageCount)
				 endPage=pageCount;

			if(startPage > 10){
	%>
			<a href="Help.jsp?pageNum=<%=startPage-10 %>"><span class="off" onmouseover="this.className='on'" onmouseout="this.className='off'" >&nbsp;&nbsp;이전&nbsp;&nbsp;</span></a>
	<%
			}
			for(int i=startPage;i<=endPage;i++){
	%>
			<a href="Help.jsp?pageNum=<%=i %>"><span class="off" onmouseover="this.className='on'" onmouseout="this.className='off'" >&nbsp;&nbsp;<%=i %>&nbsp;&nbsp;</span></a>
	<%
			}
			if(endPage < pageCount){
	%>
			<a href="Help.jsp?pageNum=<%=startPage+10%>"><span class="off" onmouseover="this.className='on'" onmouseout="this.className='off'" >&nbsp;&nbsp;다음&nbsp;&nbsp;</span></a>
	<%
			}
		}
	%>
	</div>
</body>
</html>

<%@ include file="bottom.jsp" %>