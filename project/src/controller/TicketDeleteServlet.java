package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MovieDAO;
import model.MovieTimeSeatVO;

/**
 * Servlet implementation class TicketDeleteServlet
 */
@WebServlet("/ticketdelete.do")
public class TicketDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TicketDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		MovieDAO mdao=MovieDAO.getInstance();
		
		
		String 	 id   =	request.getParameter("id");
		String   name = request.getParameter("name");
		String   date = request.getParameter("date");
		String   time = request.getParameter("time");
		String   seat = request.getParameter("seat");
		mdao.DeleteOneTicket(id, name, date, time, seat);
		String url="Cancel_Ticketing.jsp";
		RequestDispatcher rd=request.getRequestDispatcher(url);
		rd.forward(request, response);
		
		
	}

}
