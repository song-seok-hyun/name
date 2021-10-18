package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.MovieDAO;
import model.MovieTimeVO;


/**
 * Servlet implementation class MovieTimeServlet
 */
@WebServlet("/movietime.do")
public class MovieTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieTimeServlet() {
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
		member.setDate(String.format("%02d", Integer.parseInt(request.getParameter("month")))+"월"+String.format("%02d", Integer.parseInt(request.getParameter("day")))+"일");
		member.setTime(String.format("%02d", Integer.parseInt(request.getParameter("hour")))+":"+String.format("%02d", Integer.parseInt(request.getParameter("minute"))));
		member.setDateNum(Integer.parseInt(request.getParameter("month")+"00")+Integer.parseInt(request.getParameter("day")));
		member.setTimeNum(Integer.parseInt(request.getParameter("hour")+"00")+Integer.parseInt(request.getParameter("minute")));
		mdao.insertMovieTime(member);
		
		request.setAttribute("member", member);
		String url="adminPage.jsp";
		
		RequestDispatcher rd=request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
