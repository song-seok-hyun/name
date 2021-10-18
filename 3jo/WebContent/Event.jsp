<%@page import="model.BoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.VO"%>
<%@page import="model.BoardDAO"%>
<%@page import="java.util.Vector"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	int pageSize=10;
	String pageNum=request.getParameter("pageNum");
	if(pageNum == null){
		pageNum="1";
	}
	int count=0;
	int number=0;
	int currentPage=Integer.parseInt(pageNum);
	int startRow=(currentPage-1)*pageSize+1;
	int endRow=currentPage*pageSize;
	Vector<BoardVO> vec=bdao.getAllEventBoard1(startRow, endRow);
	count=bdao.getAllEventBoard().size(); //count 대체
	number=count-(currentPage-1)*pageSize;
%>
<body>
	<div align="center">
		<table width="900px">
			<tr>
				<td colspan="2" style="padding:20px;"><br><font size="7">이벤트</font></td>
			</tr>
			<tr>
				<td colspan="2"><hr  style="border: solid 3px black;"></td>
			</tr>
			<%
				for (int i = 0; i < vec.size(); i++) {
					bvo = vec.get(i);

			%>
			<tr height="270px">
				<td width="480px">
					<a href="EventInfo.jsp?num=<%=bvo.getNum()%>&rownum=<%=bvo.getRownum()%>"><img width="480px" height="270px"
						src="img\<%=bvo.getImgname2()%>" onerror="this.style.display='none';"></a>
				</td>
				<td><a
					href="EventInfo.jsp?num=<%=bvo.getNum()%>&rownum=<%=bvo.getRownum()%>">
					<font size="5"><%=bvo.getSubject()%></font></a>
					<br>
				<br><font color="gray"> 기간 &nbsp;&nbsp;&nbsp;&nbsp; <%=bvo.getStartdate()%> ~ <%=bvo.getEnddate()%></font>
				</td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<%
				}
				if (session.getAttribute("loginUser") != null) {
					VO vo = (VO) session.getAttribute("loginUser");
					if (vo.getAdmin().equals("0")) {
			%>
			<tr>
				<td colspan="2" >
					<button
						onclick="location.href='EventWriteForm.jsp?eventname=Event.jsp'">글쓰기</button>
				</td>
			</tr>	
			<%
				}
				}
			%>
		</table>
		<br>

		<%
			if (count > 0) {
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				int startPage = 1;
				if (currentPage % 10 != 0) {
					startPage = ((int) (currentPage / 10)) * 10 + 1;
				} else {
					startPage = ((int) (currentPage / 10) - 1) * 10 + 1;
				}

				int pageBlock = 10;
				int endPage = startPage + pageBlock - 1;

				if (endPage > pageCount)
					endPage = pageCount;

				if (startPage > 10) {
		%>
		<a href="Event.jsp?pageNum=<%=startPage - 10%>"><span class="off" onmouseover="this.className='on'" onmouseout="this.className='off'" >&nbsp;&nbsp;이전&nbsp;&nbsp;</span></a>
		<%
			}
				for (int i = startPage; i <= endPage; i++) {
		%>
		<a href="Event.jsp?pageNum=<%=i%>"><span class="off" onmouseover="this.className='on'" onmouseout="this.className='off'" >&nbsp;&nbsp;<%=i %>&nbsp;&nbsp;</span></a>
		<%
			}
				if (endPage < pageCount) {
		%>
		<a href="Event.jsp?pageNum=<%=startPage + 10%>"><span class="off" onmouseover="this.className='on'" onmouseout="this.className='off'" >&nbsp;&nbsp;다음&nbsp;&nbsp;</span></a>
		<%
			}
			}
		%>
	</div>
</body>
</html>

<%@ include file="bottom.jsp"%>