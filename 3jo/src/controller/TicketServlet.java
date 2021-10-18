package controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MovieDAO;
import model.MovieTimeSeatVO;
import model.MovieTimeVO;

/**
 * Servlet implementation class TicketServlet
 */
@WebServlet("/ticket.do")
public class TicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TicketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher rd=request.getRequestDispatcher("Ticketing.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		MovieTimeSeatVO member=new MovieTimeSeatVO();
		MovieDAO mdao=MovieDAO.getInstance();
		
		String 	 id   =	request.getParameter("id");
		String   name = request.getParameter("infoname");
		String   date = request.getParameter("infodate");
		String   time = request.getParameter("infotime");
		String[] seat = request.getParameterValues("seat");
		
		for(int i=0;i<seat.length;i++)
		{
		member.setId(id);
		member.setMovieName(name);
		member.setMovieDate(date);
		member.setMovieTime(time);
		member.setSeatNum(seat[i]);
		mdao.insertMovieTimeSeat(member);
		System.out.println(seat[i]);
		}
		request.setAttribute("member", member);
		String url="TicketingEnd.jsp";
		
		RequestDispatcher rd=request.getRequestDispatcher(url);
		rd.forward(request, response);
		
		
		
		
		
		
		
		
		
		
	}

}
