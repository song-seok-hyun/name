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
	border:1px solid #ccc;
}
th{
	text-align:center;
	padding:10px;
	background: #000817;
	border:1px solid #ccc;
	color:white;
}
</style>
</head>
<body>
<br>
<%
	String eventname=request.getParameter("eventname");
%>
<jsp:useBean id="bvo" class="model.BoardVO">
	<jsp:setProperty name="bvo" property="*"/>
</jsp:useBean>
<%
	String content=bvo.getContent().replace("<br>","\r\n");
%>
<div align="center">
<table width=550>
	<tr>
		<td style="border:0px"><font size="6em">이벤트 수정</font></td>
	</tr>
	</table>
<form action="EventUpdateProc.jsp" method="post"
		enctype="multipart/form-data">
		<table style="border-collapse:collapse" width="550px" >
			<tr>
				<th>제목 </th>
				<td><input type="text" name="subject" style="width:97%" maxlength="300" value="<%=bvo.getSubject() %>" required></td>
			</tr>
			<tr>
				<th>내용 </th>
				<td><textarea rows="30" cols="60" name="content" maxlength="300" style="resize: none" required><%=content %></textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" required></td>
			</tr>
			<tr>
				<th>이벤트 기간</th>
				<td><input type="date" name="startdate" required>&nbsp; ~ &nbsp;<input type="date" name="enddate" required></td>
			</tr>
			<tr>
				<th>썸네일 </th>
				<td><input type="file" name="file2">  <font size="2em" color="gray">썸네일 크기 480x270px</font></td>
			</tr>
			<tr>
				<th>첨부 파일 </th>
				<td><input type="file" name="file"></td>
			</tr>
			<tr align="right" align="right">
				<td colspan="2">
				<input type="hidden" name="num" value="<%=bvo.getNum()%>">
				<input type="hidden" name="eventname" value="<%=eventname%>">
				<input type="submit" value="수정하기">
				&nbsp;&nbsp;<input type="button" onclick="location.href='<%=eventname %>'" value="돌아가기">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>

<%@ include file="bottom.jsp"%>