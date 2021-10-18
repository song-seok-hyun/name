<%@page import="model.MovieDAO"%>
<%@page import="model.MovieVO"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MovieTimeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main ㅣ 이젠 시네마</title>
</head>

<%MovieDAO mdao =MovieDAO.getInstance(); %>



<body>
	<div align="center">
	<h1>상영시간표</h1>
	<HR>
		<table width="640" border="0" cellspacing="0" cellpadding="0"
			align="center">
			<tr>

				<td><br>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						>

						<tr>
							<td valign="middle">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										
										<%
											
										
										Vector<MovieTimeVO> vect3 = mdao.SelectAllDate();
										%>

										<td align="right"><a> 상영일: <select id="month"
												name="month" onchange="location.href=this.value">
												
												<option value="">-</option>
												
												
													<%
													for (int j = 0; j < vect3.size(); j++) {
														MovieTimeVO mtvo = vect3.get(j);
													%>
													
													
													<option value="Timetable.jsp?date=<%=mtvo.getDate()%>"
														<%if (request.getParameter("date") != null)
													if (mtvo.getDate().equals(request.getParameter("date"))) {%>
														selected <%}%>><%=mtvo.getDate()%></option>
													
													
													<%
													}
													%>
														


											</select>  &emsp;

										</a><img src="./img/level_top.gif" border="0" align="absmiddle"></td>

									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table width="100%" border="0" cellpadding="5" cellspacing="1"
									bgcolor="#CCCCCC" align="center">
									<tr bgcolor="#F3F3F3">

										<td width="28%">
											<div align="center">영화명</div>
										</td>
										<td width="8%">
											<div align="center">
												관람<br> 등급
											</div>
										</td>
										<td><div align="center">
												상영시간<br>
											</div></td>
									</tr>

									
										<%
										Vector<MovieTimeVO> vectt = mdao.SelectOneDateAllMovieNum(request.getParameter("date"));

										for (int i = 0; i < vectt.size(); i++)

										{
											MovieTimeVO mtvo = vectt.get(i);
											Vector<MovieVO> vecmt = mdao.SelectOneMovieName(mtvo.getNum());
											Vector<MovieTimeVO> vecmt2 = mdao.SelectOneMovieTime(mtvo.getNum(), request.getParameter("date"));
											MovieVO mvo = vecmt.get(0);
											
											String src = null;
										
											
											switch (mvo.getFilmRate())
											{
											case 1 :
												src="./img/all.gif";
											break;
											case 2 :
												src="./img/12.gif";
												break;
											case 3 :
												src="./img/15.gif";
												break;
											case 4 :
												src="./img/18.gif";
												break;
											} 
											%>
											<tr bgcolor="#ffffff">
											<td><font color='#000000'><%=mvo.getMovieName()%></font><br></td>
											<td><div align='center'><img src=<%=src%> width='14' height='14'></div></td>
											<td><a>
											<%
											for (int j = 0; j < vecmt2.size(); j++) {
												
												MovieTimeVO mtvo3 = vecmt2.get(j);
										%>


										
										
										<%=mtvo3.getTime()%>
										<%
									
										if (j+1 < vecmt2.size())
										{
										%>|<%
										}
										else
										{
											
										}
										
										}
										%>
										</a></td>
								</tr>
									<%
									}
									%>
									
								</table>
							</td>
						</tr>
					</table>
					</div></td>
			</tr>
		</table>
	</div>
	

</body>
</html>
<%@ include file="bottom.jsp" %> 