<%@page import="model.MovieTimeVO"%>
<%@page import="model.MovieVO"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>

<title>관리자 페이지 | 이젠 시네마</title>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<form action="movie.do" method="post">
		<p>
			영화이름: <input type="text" name="movieName">
		</p>
		<p>
			영화등급: 전체이용가 <input type="radio" name="filmRate" value="1">
			12세 <input type="radio" name="filmRate" value="2"> 15세 <input
				type="radio" name="filmRate" value="3"> 18세 <input
				type="radio" name="filmRate" value="4">
		</p>
		<p>
			영화사진 경로: <input type="text" name="img">
		</p>
		<p>
			영화예고편 경로: <input type="text" name="url">
		</p>

		<input type="submit">
	</form>
	<hr>

	<div style="overflow:scroll; width:700px; height:1500px; display: inline-block;">
		<%
		MovieDAO mdao =MovieDAO.getInstance();
		Vector<MovieVO> vec = mdao.allSelectMovie();

		for (int i = 0; i < vec.size(); i++)

		{
			MovieVO mvo = vec.get(i);
		%>


		<tr>
			<td>번호 : <%=mvo.getNum()%></td>
		</tr>

		<hr>
		<tr>
			<td>영화 제목 : <%=mvo.getMovieName()%></td>
		</tr>

		<hr>
		<tr>
			<td>영화 등급 : <%=mvo.getFilmRate()%></td>
		</tr>
		<hr>




		<tr>
			<td><img src=<%=mvo.getImg()%>></td>
			<td><a href=<%=mvo.getUrl()%>></a></td>
			<%
			Vector<MovieTimeVO> vect = mdao.SelectOneMovieDate(mvo.getNum());

			for (int j = 0; j < vect.size(); j++) {
				MovieTimeVO mtvo = vect.get(j);
			%>
			<div class="tab_content">
				<%=mtvo.getDate()%><br>
				<%
				Vector<MovieTimeVO> vect2 = mdao.SelectOneMovieTime(mvo.getNum(), mtvo.getDate());

				for (int k = 0; k < vect2.size(); k++) {
					MovieTimeVO mtvo2 = vect2.get(k);
				%>
				<%=mtvo2.getTime()%>
				<form action="timedelete.do" method="post" style="display:inline-block">
				<select id="num" name="num" style="display: none;  ">
					<option value="<%=mvo.getNum()%>"><%=mvo.getNum()%></option>
				</select>
				<select id="date" name="date" style="display: none;">
					<option value="<%=mtvo.getDate()%>"><%=mtvo.getDate()%></option>
				</select>
				<select id="time" name="time" style="display: none;">
					<option value="<%=mtvo2.getTime()%>"><%=mtvo2.getTime()%></option>
				</select>
				 <input type="submit" value="삭제" style="display:inline-block">
			</form>
				<br>
			
			<%
			}
			%>
			</div>
			<%
			}
			%>
			<form action="movietime.do" method="post">
				<select id="num" name="num" style="display: none;">
					<option value="<%=mvo.getNum()%>"><%=mvo.getNum()%></option>

				</select>
				<p>
					이미지 경로:
					<%=mvo.getImg()%></p>
				<p>
					예고편 경로:
					<%=mvo.getUrl()%></p>
				<p>
					상영일: <select id="month" name="month">
						<%
						for (int j = 1; j <= 12; j++) {
						%><option value="<%=j%>"><%=j%></option>
						<%
						}
						%>

					</select> 월 <select id="day" name="day">
						<%
						for (int j = 1; j <= 31; j++) {
						%><option value="<%=j%>"><%=j%></option>
						<%
						}
						%>


					</select> 일
				</p>
				<p>
					상영시간: <select id="hour" name="hour">
						<%
						for (int j = 0; j <= 23; j++) {
						%><option value="<%=j%>"><%=j%></option>
						<%
						}
						%>

					</select>시 <select id="minute" name="minute">
						<%
						for (int j = 0; j <= 59; j = j + 10) {
						%><option value="<%=j%>"><%=j%></option>
						<%
						}
						%>

					</select>분
				</p>

				<input type="submit">

			</form>
			<form action="moviedelete.do" method="post">
				<select id="num" name="num" style="display: none;">
					<option value="<%=mvo.getNum()%>"><%=mvo.getNum()%></option>

				</select> <input type="submit" value="삭제">
			</form>

		</tr>

		<hr>
		<%
		}
		%>
	</div>


	<div style="display: inline-block; margin-bottom: 1300px">
	
		<table width="640" border="0" cellspacing="0" cellpadding="0"
			align="center">
			<tr>

				<td><br>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						align="center">

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
													
													
													<option value="adminPage.jsp?date=<%=mtvo.getDate()%>"
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