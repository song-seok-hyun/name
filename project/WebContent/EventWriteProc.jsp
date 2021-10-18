
<%@page import="model.BoardVO"%>
<%@page import="model.BoardDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="javax.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

	String path = request.getRealPath("img");
	MultipartRequest multi = null;

	int size = 1024 * 1024 * 10;
	String file = "";
	String file2 = "";
	String oriFile = "";
	
	try {
		multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String str = (String) files.nextElement();
		file = multi.getFilesystemName(str);
		
		String str2 = (String) files.nextElement();
		file2 = multi.getFilesystemName(str2);
		
		oriFile = multi.getOriginalFileName(str);

	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		String subject = multi.getParameter("subject");
		String password = multi.getParameter("password");
		String content = multi.getParameter("content");
		String startdate = multi.getParameter("startdate");
		String enddate = multi.getParameter("enddate");
		String eventname = multi.getParameter("eventname");
		
		BoardVO bvo = new BoardVO();

		BoardDAO bdao = new BoardDAO();
		bvo.setSubject(subject);
		bvo.setPassword(password);
		bvo.setContent(content);
		bvo.setStartdate(startdate);
		bvo.setEnddate(enddate);
		bvo.setImgname(file);
		bvo.setImgname2(file2);

		bdao.insertEventBoard(bvo);
		response.sendRedirect(eventname);
	%>
</body>
</html>