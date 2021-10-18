package controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MovieDAO;
import model.MovieTimeVO;

/**
 * Servlet implementation class TimeTable
 */
@WebServlet("/timetable.do")
public class TimeTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeTableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher rd=request.getRequestDispatcher("adminPage.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		MovieTimeVO member=new MovieTimeVO();
		
	
		MovieDAO mdao=MovieDAO.getInstance();
		member.setNum(Integer.parseInt(request.getParameter("num")));
		member.setDate(request.getParameter("month")+"월"+request.getParameter("day")+"일");
		
		Vector<MovieTimeVO> v =mdao.SelectOneDateAllMovieNum(request.getParameter("month")+"월"+request.getParameter("day")+"일");
		
		request.setAttribute("v", v);
		String url="adminPage.jsp";
		
		RequestDispatcher rd=request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
