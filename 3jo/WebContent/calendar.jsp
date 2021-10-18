<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.cal{
	width:250px;
	align:center;
}
</style>
</head>
<body>
<div class="cal">
<%

java.util.Calendar cal = java.util.Calendar.getInstance();

String strYear  = request.getParameter("year");

String strMonth = request.getParameter("month");

//System.out.println("strYear:"+strYear);

//System.out.println("strMonth:"+strMonth);

int year = cal.get(java.util.Calendar.YEAR);

int month = cal.get(java.util.Calendar.MONTH);

int date = cal.get(java.util.Calendar.DATE);



if(strYear != null)

{

    year  = Integer.parseInt(strYear);

    month = Integer.parseInt(strMonth);

    if(month==12)

    {

        year++;

        month = 0;

    }

    else if(month<0)

    {

        year--;

        month = 11;

    }
}



cal.set(year, month, 1);

int startDay = cal.getMinimum(java.util.Calendar.DATE);



int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);



int start = cal.get(java.util.Calendar.DAY_OF_WEEK);

int newLine = 0;

%>

        <table align='center'>

            <tr>
	            <td>

                    <div align='center'>

                        <a href="./calendar.jsp?year=<%=year%>&month=<%=month-1%>">◀</a>

                        <strong><%=month+1%>월 </strong><a href="./calendar.jsp?year=<%=year%>&month=<%=month + 1%>">▶</a>

                    </div>

                </td>
            </tr>

        </table>
        
        <table  border='1' cellspacing='0' cellpadding='0'>

            <tr>

                <td>

                    <div align='center'><font color='red'>일</font></div>

                </td>

                <td>

                    <div align='center'>월</div>

                </td>

                <td>

                    <div align='center'>화</div>

                </td>

                <td>

                    <div align='center'>수</div>

                </td>

                <td>

                    <div align='center'>목</div>

                </td>

                <td>

                    <div align='center'>금</div>

                </td>

                <td>

                    <div align='center'><font color='blue'>토</div>

                </td>

            </tr>

<%

for(int index = 1; index < start ; index++ )

{

    out.print("<TD>&nbsp;</TD>");

    newLine++;

}



for(int index = 1; index <= endDay; index++)

{

    String color = (newLine == 0)?"RED":(newLine == 6)?"BLUE":"BLACK";




    out.print("<TD align=center width=100 height=40><font color="+color+">"+index+"</font></TD>");

    newLine++;



    if(newLine == 7)

    {

        out.print("</TR>");

        if(index <= endDay)

        {

            out.print("<TR>");

        }

        newLine=0;

    }

}



while(newLine > 0 && newLine < 7)

{

    out.print("<TD>&nbsp;</TD>");

    newLine++;

}

%>

        </table>
         <table align='center'>

            <tr>

                <td>

                    <a href='./calendar.jsp?year=<%=year-1%>&month=<%=month%>'>◀</a>

                    <strong><%=year%>년 </strong><a href='./calendar.jsp?year=<%=year+1%>&month=<%=month%>'>▶</a>

                </td>
          
            </tr>

        </table>
</div>
    </body>

</html>