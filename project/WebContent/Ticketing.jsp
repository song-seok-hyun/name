<%@page import="model.MovieTimeVO"%>
<%@page import="model.MovieVO"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="header.jsp"%>
<%
MovieDAO mdao = MovieDAO.getInstance();
Vector<MovieVO> vecm = mdao.allSelectMovie();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.movienamebox {
	overflow: hidden;
	display: inline-block;
	height: 700px;
	width: 300px;
	border: 3px solid #000;
}

.moviename {
	display: block;
	border-bottom: 3px solid #000;
}

.tab {
	display: none;
}

.datebox {
	overflow: hidden;
	display: inline-block;
	height: 700px;
	width: 150px;
	border: 3px solid #000;
}

.timebox {
	overflow: hidden;
	display: inline-block;
	height: 700px;
	width: 150px;
	border: 3px solid #000;
}

.ticket {
	overflow: hidden;
	display: inline-block;
	height: 700px;
	width: 150px;
	border: 3px solid #000;
}

.ticketinfo {
	overflow: hidden;
	display: inline-block;
	height: 700px;
	width: 150px;
	border: 3px solid #000;
}

.chair {
	overflow: hidden;
	display: inline-block;
	height: 700px;
	width: 610px;
	border: 3px solid #000;
}

.top {
	border-bottom: 3px solid #000;
}

.date {
	border-bottom: 3px solid #000;
}

.time {
	border-bottom: 3px solid #000;
}

.dateboxbottom {
	display: none;
}

.timeboxbottom {
	display: none;
}

.movieinfo {
	overflow: hidden;
	display: inline-block;
	height: 700px;
	width: 300px;
	border: 3px solid #000;
}

.movieimg {
	display: none;
}

#sit {
	display: none;
}

.slide {
	overflow: hidden;
	z-index: 1;
	width: 200vw;
	transition: transform 0.5s;
}

.page {
	width: 100vw;
	float: left;
}

.middle {
	height: 500px;
}

<%
				for (int i = 1; i < 13; i++) {
				%>
input[id="A<%=i%>"]:checked + label {
	background-color: #666666;
}
<%}%>
<%
				for (int i = 1; i < 13; i++) {
				%>
input[id="B<%=i%>"]:checked + label {
	background-color: #666666;
}
<%}%>
<%
				for (int i = 1; i < 13; i++) {
				%>
input[id="C<%=i%>"]:checked + label {
	background-color: #666666;
}
<%}%>
<%
				for (int i = 1; i < 13; i++) {
				%>
input[id="D<%=i%>"]:checked + label {
	background-color: #666666;
}
<%}%>
<%
				for (int i = 1; i < 13; i++) {
				%>
input[id="E<%=i%>"]:checked + label {
	background-color: #666666;
}
<%}%>
<%
				for (int i = 1; i < 13; i++) {
				%>
input[id="F<%=i%>"]:checked + label {
	background-color: #666666;
}
<%}%>
<%
				for (int i = 1; i < 13; i++) {
				%>
input[id="G<%=i%>"]:checked + label {
	background-color: #666666;
}
<%}%>
input[id="A2"] + label , input[id="B2"] + label , input[id="C2"] + label ,input[id="D2"] + label ,input[id="E2"] + label ,input[id="F2"] + label ,input[id="G2"] + label ,
input[id="A10"] + label , input[id="B10"] + label , input[id="C10"] + label ,input[id="D10"] + label ,input[id="E10"] + label ,input[id="F10"] + label ,input[id="G10"] + label
{
	margin-right: 15px;
}

</style>
<script type="text/javascript">


	function showtab(a) {
		
		<%
		
		for (int i = 0; i < vecm.size(); i++) {
	MovieVO mvo = vecm.get(i);%>

			var target = document.getElementById('dateboxbottom' + <%=mvo.getNum()%>);
			var target2 = document.getElementsByClassName('timeboxbottom');
			var target3 = document.getElementById('movieimg' + <%=mvo.getNum()%>);
			var target4 = document.getElementById('sit');
			target4.style.display = 'block';
			
			
			for (var i = 0;i<target2.length; i++)
				{
				var tg = target2.item(i);
				tg.style.display = 'none';	
				}
			
			if (<%=mvo.getNum()%> == a) {
				
				
				target.style.display = 'block';
				target3.style.display = 'block';

			} else {

				target.style.display = 'none';
				target3.style.display = 'none';
			}
			
			<%}%>

		}
	
function showtab2(a) {
		
		<%
		Vector<MovieTimeVO> scvectm = null;
		for (int i = 0; i < vecm.size(); i++) {
			MovieVO mvo = vecm.get(i);
			
			scvectm = mdao.SelectOneMovieDate(mvo.getNum());
			
			for (int j = 0; j < scvectm.size(); j++)
			{
				MovieTimeVO mtvo = scvectm.get(j);
			%>
			
		
	
	
	
			var target = document.getElementById('timeboxbottom' + <%=mvo.getNum()%><%=mtvo.getDateNum()%>)
			

			if (<%=mvo.getNum()%><%=mtvo.getDateNum()%> == a) {

				target.style.display = 'block';

			} else {

				target.style.display = 'none';

			}
			
			
			<%}%>
			<%}%>
	}
	

	
function ticketinfo(name,date,time)
	{
		
	
		document.getElementById('infoname').value = name;
		document.getElementById('infodate').value = date;
		document.getElementById('infotime').value = time;
	
		document.querySelector(".infoname").innerHTML += name;
		document.querySelector(".infodate").innerHTML += date;
		document.querySelector(".infotime").innerHTML += time;
		
		
	}
	
	

	function sitClick() {
		document.querySelector('.slide').style.transform = 'translate(-100vw)';
	}
	function returnClick() {
		document.querySelector('.slide').style.transform = 'translate(0vw)';
	}

</script>
</head>
<body>


<c:if test="${empty loginUser }">
<h1 style="text-align: center;">로그인이 필요합니다.</h1>
</c:if>
<c:if test="${!empty loginUser }">
	<div class="slide">

<br> <br>
		<div class="page" align="center">




			<div class="movienamebox">
				<div class="top">
					<h2>영화</h2>
				</div>

				<%
				for (int i = 0; i < vecm.size(); i++) {
					MovieVO mvo = vecm.get(i);
				%>
				<div class="moviename">
					<a href="javascript:;"
						onclick="javascript:showtab('<%=mvo.getNum()%>');"> <%
 switch (mvo.getFilmRate()) {
 case 1:
 %><img src="./img/all.gif" width='14' height='14'> <%
 break;
 case 2:
 %><img src="./img/12.gif" width='14' height='14'> <%
 break;
 case 3:
 %><img src="./img/15.gif" width='14' height='14'> <%
 break;
 case 4:
 %><img src="./img/18.gif" width='14' height='14'> <%
 break;
 }
 %>&nbsp;<%=mvo.getMovieName()%></a>
				</div>
				<%
				}
				%>
			</div>










			<div class="datebox">
				<div class="top">
					<h3>날짜</h3>
				</div>
				<%
				Vector<MovieTimeVO> vectm = null;
				for (int i = 0; i < vecm.size(); i++) {
					MovieVO mvo = vecm.get(i);
					vectm = mdao.SelectOneMovieDate(mvo.getNum());
				%>
				<div id="dateboxbottom<%=mvo.getNum()%>" class="dateboxbottom">
					<%
					for (int j = 0; j < vectm.size(); j++) {
						MovieTimeVO mtvo = vectm.get(j);
					%>
					<div class="date">
						<a href="javascript:;"
							onclick="javascript:showtab2('<%=mvo.getNum()%><%=mtvo.getDateNum()%>');"><%=mtvo.getDate()%></a>
					</div>
					<%
					}
					%>

				</div>
				<%
				}
				%>
			</div>









			<div class="timebox">
				<div class="top">
					<h3>시간</h3>
				</div>
				<%
				Vector<MovieTimeVO> vectm2 = null;
				Vector<MovieTimeVO> vectm3 = null;
				for (int i = 0; i < vecm.size(); i++) {
					MovieVO mvo = vecm.get(i);
					vectm2 = mdao.SelectOneMovieDate(mvo.getNum());
					for (int j = 0; j < vectm2.size(); j++) {
						MovieTimeVO mtvo = vectm2.get(j);
				%>
				<div id="timeboxbottom<%=mvo.getNum()%><%=mtvo.getDateNum()%>"
					class="timeboxbottom">
					<%
					vectm3 = mdao.SelectOneMovieTime(mvo.getNum(), mtvo.getDate());
					for (int k = 0; k < vectm3.size(); k++) {
						MovieTimeVO mtvo2 = vectm3.get(k);
					%>
					<div class="time">
					<a href="javascript:;" onclick="javascript:ticketinfo('<%=mvo.getMovieName()%>','<%=mtvo.getDate()%>','<%=mtvo2.getTime()%>');"><%=mtvo2.getTime()%></a>
					</div>



					<%
					}
					%>

				</div>
				<%
				}
				%>
				<%
				}
				%>

			</div>
			
			


			<div class="movieinfo">
				<div class="top">
					<h2>영화 정보</h2>
				</div>
				<div class="middle">
					<%
					for (int i = 0; i < vecm.size(); i++) {
						MovieVO mvo = vecm.get(i);
					%>
					<div id="movieimg<%=mvo.getNum()%>" class="movieimg">
						<img alt="<%=mvo.getMovieName()%>" src="<%=mvo.getImg()%>"
							style="width: 250px; height: 353.5px; margin-top: 20px;">
						<h2><%=mvo.getMovieName()%></h2>
						<hr>
						<p>
							상영등급 :
							<%
						switch (mvo.getFilmRate()) {
						case 1:
						%><img src="./img/all.gif"> 전체관람가
							<%
						break;
						case 2:
						%><img src="./img/12.gif"> 세이상관람가
							<%
						break;
						case 3:
						%><img src="./img/15.gif"> 세이상관람가
							<%
						break;
						case 4:
						%><img src="./img/18.gif"> 세이상관람가
							<%
						break;
						}
						%>
						</p>
					</div>
					<%
					}
					%>
				</div>
				<button id="sit" onclick="sitClick();">좌석선택 →</button>

			</div>
		</div>
<br> <br>

		<div class="page" align="center">
			
			<div class="chair" style="-ms-user-select: none; 
  -moz-user-select: -moz-none;
  -khtml-user-select: none;
  -webkit-user-select: none;
  user-select: none;">
  
  
				<div class="top">
					<h2>좌석</h2>
				</div>
				
				
				<div>
				<br>
				<hr>
				<div style="color: gray;">SCREEN</div>
				<hr>
				<br> <br>
				<br> <br>
				<form action="ticket.do" method="post">
				<div class="lineA">
					
					<%
				for (int i = 1; i < 13; i++) {
				%><input type="checkbox" id="A<%=i%>" style="display: none;" name="seat" value="A<%=i%>"><label
						for="A<%=i%>"
						style="display: inline-block; width: 20px; height: 20px; border: 2px solid #bcbcbc; cursor: pointer; font-size:70%;">A<%=i%></label>
					<%
					}
					%>
				</div>
				<div class="lineB">
					
					<%
				for (int i = 1; i < 13; i++) {
				%><input type="checkbox" id="B<%=i%>" style="display: none;" name="seat" value="B<%=i%>"><label
						for="B<%=i%>"
						style="display: inline-block; width: 20px; height: 20px; border: 2px solid #bcbcbc; cursor: pointer; font-size:70%;">B<%=i%></label>
					<%
					}
					%>
				</div>
				<div class="lineC">
					
					<%
				for (int i = 1; i < 13; i++) {
				%><input type="checkbox" id="C<%=i%>" style="display: none;" name="seat" value="C<%=i%>"><label
						for="C<%=i%>"
						style="display: inline-block; width: 20px; height: 20px; border: 2px solid #bcbcbc; cursor: pointer; font-size:70%;">C<%=i%></label>
					<%
					}
					%>
				</div>
				<div class="lineD">
					
					<%
				for (int i = 1; i < 13; i++) {
				%><input type="checkbox" id="D<%=i%>" style="display: none;" name="seat" value="D<%=i%>"><label
						for="D<%=i%>"
						style="display: inline-block; width: 20px; height: 20px; border: 2px solid #bcbcbc; cursor: pointer; font-size:70%;">D<%=i%></label>
					<%
					}
					%>
				</div>
				<div class="lineE">
					
					<%
				for (int i = 1; i < 13; i++) {
				%><input type="checkbox" id="E<%=i%>" style="display: none;" name="seat" value="E<%=i%>"><label
						for="E<%=i%>"
						style="display: inline-block; width: 20px; height: 20px; border: 2px solid #bcbcbc; cursor: pointer; font-size:70%;">E<%=i%></label>
					<%
					}
					%>
				</div>
				<div class="lineF">
					
					<%
				for (int i = 1; i < 13; i++) {
				%><input type="checkbox" id="F<%=i%>" style="display: none;" name="seat" value="F<%=i%>"><label
						for="F<%=i%>"
						style="display: inline-block; width: 20px; height: 20px; border: 2px solid #bcbcbc; cursor: pointer; font-size:70%;">F<%=i%></label>
					<%
					}
					%>
				</div>
				<div class="lineG">
					
					<%
				for (int i = 1; i < 13; i++) {
				%><input type="checkbox" id="G<%=i%>" style="display: none;" name="seat" value="G<%=i%>"><label
						for="G<%=i%>"
						style="display: inline-block; width: 20px; height: 20px; border: 2px solid #bcbcbc; cursor: pointer; font-size:70%;">G<%=i%></label>
					<%
					}
					%>
				</div>
				<br>
				<br>
				<br>
				</div>
				<hr>
				
			</div>
			
			<div class="ticketinfo">
				<div class="top">
					<h3>구매내역</h3>
				</div>
				<div class="middle" >
				<br>
				<br>
				<div class="infoname"style="text-align: center;"> </div>
				<hr>
				<br>
				<br>
				<div class="infodate"style="text-align: left; margin-left: 5px;"> 날 짜 : &nbsp;</div>
				<div class="infotime"style="text-align: left; margin-left: 5px;">상영시간 : &nbsp;</div>
				<input id="id" type="hidden" value="${loginUser.id}" name="id">
				<input id="infoname" type="hidden" name="infoname">
				<input id="infodate" type="hidden" name="infodate">
				<input id="infotime" type="hidden" name="infotime">
				<input type="submit" value="예매하기"> 
				</form>
				<br>
				<br>
				</div>
				<div>
				
				
				</div>
				<br>
				<br>
					<button id="return" onclick="returnClick();">←영화선택</button>
					
			</div>


		</div>

	</div>
	
	</c:if>	
</body>
</html>

