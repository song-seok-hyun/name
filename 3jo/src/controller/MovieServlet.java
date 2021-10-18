package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MovieDAO;
import model.MovieVO;

/**
 * Servlet implementation class MovieServlet
 */
@WebServlet("/movie.do")
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieServlet() {
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
		MovieVO member=new MovieVO();
		member.setMovieName(request.getParameter("movieName"));
		member.setFilmRate(Integer.parseInt(request.getParameter("filmRate")));
		member.setImg(request.getParameter("img"));
		member.setUrl(request.getParameter("url"));
		
		MovieDAO mdao=MovieDAO.getInstance();
		
		mdao.insertMovie(member);
		
		request.setAttribute("member", member);
		String url="adminPage.jsp";
		
		RequestDispatcher rd=request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
