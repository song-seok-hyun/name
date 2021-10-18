<%@page import="model.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %> 	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 예제</title>
<style type="text/css">
td {
	padding:10px;
	border:1px solid #ccc;
}
th{
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
	VO vo=(VO)session.getAttribute("loginUser");
	String eventname=request.getParameter("eventname");
%>

	<div align="center">
	<table width=550>
	<tr>
		<td style="border:0px"><font size="6em">이벤트 작성</font></td>
	</tr>
	</table>
	<form action="EventWriteProc.jsp" method="post"
		enctype="multipart/form-data">
		<table style="border-collapse:collapse" width="550px">

			<tr>
				<th>제목 </th>
				<td><input type="text" name="subject" style="width:97%" maxlength="300" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="30" cols="60" name="content" style="resize: none" maxlength='300' required></textarea></td>
			</tr>
			<tr>
				<th>이벤트 기간</th>
				<td><input type="date" name="startdate" required> ~ <input type="date" name="enddate" required></td>
			</tr>
			<tr>
				<th>썸네일 </th>
				<td><input type="file" name="file2"> <font size="2em" color="gray">썸네일 크기 480x270px</font></td>
			</tr>
			<tr>
				<th>첨부 이미지 </th>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="hidden" name="eventname" value="<%=eventname %>" >
				<input type="hidden" name="password" value="<%=vo.getPass()%>" >
				<input type="submit" value="작성하기">
				&nbsp;&nbsp;<input type="button" onclick="location.href='<%=eventname %>'" value="돌아가기">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>

</html>

<%@ include file="bottom.jsp"%>


