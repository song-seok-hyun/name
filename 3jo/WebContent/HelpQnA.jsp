<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

td {
	
	padding:10px;
	border:1px solid #ccc;
	
}
th, #name{
	padding:10px;
	background: #000817;
	border:1px solid #ccc;
	color:white;

}

</style>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
String pageNum=request.getParameter("pageNum");
String check2=request.getParameter("check2");
String search=request.getParameter("search");

BoardDAO bdao=new BoardDAO();
BoardVO bvo=new BoardVO();
VO vo=new VO();
vo=(VO)session.getAttribute("loginUser");
int num=Integer.parseInt(request.getParameter("num"));

if(request.getParameter("check")==null){
	bvo=bdao.getOneHelpBoardNocount(num);
}else{
	bvo=bdao.getOneHelpBoard(num);
}
Vector<BoardVO> vec=bdao.getAllHelpReBoard(num);


String content=bvo.getContent().replace("\r\n","<br>");
%>
<div align="center">
<br>
<table width=1000 align="center">
	<tr>
		<td style="border:0px"><font size="6em">문의 게시판</font></td>
	</tr>
</table>
<table width="1000" border="1" style="border-collapse:collapse;">
	<tr >
		<th width="100" align="center" style="border-right-style:hidden;">제목</th><td><%=bvo.getSubject()%></td>
		<td width="200" align="right" style="border-left-style:hidden; color:gray;">
		<%=bvo.getReg_date() %>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<th width="100" align="center" style="border-right-style:hidden;">작성자</th><td colspan="2"><%=bvo.getWriter()%></td>
	</tr>
	<tr height="100px">
		<td colspan="3"><%=content %></td>
	</tr>
</table>
<form action="HelpQnAReProc.jsp">
<table width="1000" style="border-collapse:collapse;">

	

	<%
	for(int i=0;i<vec.size();i++){
		BoardVO brvo=vec.get(i);
		String recontent=brvo.getContent().replace("\r\n","<br>");
	%>
	<tr align="center">
		<td width="100" id="name"><%=brvo.getWriter() %></td>
		<td width="600" align="left"><%=recontent %></td>
		<td width="300" style="border-left:hidden; color:gray" >
		<%=brvo.getReg_date() %> &nbsp;&nbsp;
		
		 <%
			if(vo.getAdmin().equals("0")){ //댓글
				if(brvo.getId().equals(vo.getId())){
				%>	
				<input type="button" onclick="location.href='HelpQnAReUpdate.jsp?num=<%=brvo.getNum()%>&content=<%=recontent %>&ref=<%=brvo.getRef()%>&check2=<%=check2 %>&pageNum=<%=pageNum %>&search=<%=search %>'" value="수정">
				<%
				}
				%>
				&nbsp;&nbsp;<input type="button" onclick="if(confirm('삭제 하시겠습니까?')) location.href='HelpQnAReDelete.jsp?num=<%=brvo.getNum()%>&ref=<%=brvo.getRef()%>&check2=<%=check2 %>&pageNum=<%=pageNum %>&search=<%=search %>'" value="삭제">
				<%
			}else if(brvo.getId().equals(vo.getId())){
				%>
				 <input type="button" onclick="location.href='HelpQnAReUpdate.jsp?num=<%=brvo.getNum()%>&content=<%=recontent %>&ref=<%=brvo.getRef()%>&check2=<%=check2 %>&pageNum=<%=pageNum %>&search=<%=search %>'" value="수정">
				<input type="button" onclick="if(confirm('삭제 하시겠습니까?')) location.href='HelpQnAReDelete.jsp?num=<%=brvo.getNum()%>&ref=<%=brvo.getRef()%>&check2=<%=check2 %>&pageNum=<%=pageNum %>&search=<%=search %>'" value="삭제">
	<%
			}
	 %>
		 		</td>
				</tr>
	<%
		 
		 	}
	
	%>
	<tr>
		<td colspan="3" align="right"><textarea rows="2" cols="100" name="content" style="resize: none; maxlength:300; position: relative; top:6px" required></textarea>
		<input type="hidden" name="num" value="<%=bvo.getNum()%>">  
		<%if(vo.getAdmin().equals("1")){ %>
		<input type="hidden" name="writer" value="<%=vo.getName()%>">
		<%}else{ %>
		<input type="hidden" name="writer" value="운영자">
		<%} %>
		<input type="hidden" name="ref" value="<%=bvo.getRef()%>">
		<input type="hidden" name="re_step" value="<%=bvo.getRe_step()%>">
		<input type="hidden" name="re_level" value="<%=bvo.getRe_level()%>">
		<input type="hidden" name="check2" value="<%=check2%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<input type="hidden" name="search" value="<%=search%>">
			&nbsp;<input type="submit" value="댓글 등록" style="width:100px; height:45px; position: relative; bottom: 10px; margin-right:70px">
		</td>
	</tr>
	<tr>
		<td colspan="3" align="left">
		<%if(vo.getAdmin().equals("0")){
			
			if(bvo.getId().equals(vo.getId())){
			%>
				<input type="button" onclick="location.href='HelpQnAUpdate.jsp?num=<%=bvo.getNum() %>&subject=<%=bvo.getSubject()%>&content=<%=content%>&writer=<%=bvo.getWriter()%>&check2=<%=check2 %>&pageNum=<%=pageNum %>&search=<%=search %>'" value="수정">
				<%} %>
				&nbsp;&nbsp;<input type="button" onclick="if(confirm('삭제 하시겠습니까?')) location.href='HelpQnADelete.jsp?num=<%=bvo.getNum() %>&check2=<%=check2 %>&pageNum=<%=pageNum %>&search=<%=search %>'" value="삭제">
			<%
		}else if(bvo.getId().equals(vo.getId())){
		 %>
				<input type="button" onclick="location.href='HelpQnAUpdate.jsp?num=<%=bvo.getNum() %>&subject=<%=bvo.getSubject()%>&content=<%=content%>&writer=<%=bvo.getWriter()%>&check2=<%=check2 %>&pageNum=<%=pageNum %>&search=<%=search %>'" value="수정">
				&nbsp;&nbsp;<input type="button" onclick="if(confirm('삭제 하시겠습니까?')) location.href='HelpQnADelete.jsp?num=<%=bvo.getNum() %>&check2=<%=check2 %>&pageNum=<%=pageNum %>&search=<%=search %>'" value="삭제">
		 <%}
			
		  %>
		 	<%if(check2.equals("1")){ %>
		 		
		 		&nbsp;&nbsp;<input type="button" onclick="location.href='Help.jsp?pageNum=<%=pageNum %>'" value="목록">
		 	<%}else if(check2.equals("2")){ %>
		 		&nbsp;&nbsp;<input type="button" onclick="location.href='HelpQnASearch.jsp?pageNum=<%=pageNum %>&search=<%=search %>'" value="목록">
		 	<%} %>
		 	</td>
	</tr>
	
	
</table>

</form>
</div>

</body>
</html>

<%@ include file="bottom.jsp"%>