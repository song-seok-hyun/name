package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;
import model.VO;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search.do")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setCharacterEncoding("UTF-8");
		VO member=new VO();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String id=request.getParameter("id");
		
		if(name != null && id== null) {
		
		DAO mdao =DAO.getInstance();
		
		int result=mdao.search_confirmID(name,email);
		
		if(result == 1) {
		
			member=mdao.getId(name, email);
			String id_d=member.getId();
			
			request.setAttribute("id", id_d);
			request.setAttribute("name", name);
			
			request.setAttribute("result", result);
			/*
			 * String url="Idsearch.jsp";
			 */		
			
			String url="IdPopup.jsp";
		
		RequestDispatcher rd=request.getRequestDispatcher(url);
		rd.forward(request, response);
		
		}else {
			
			request.setAttribute("result", result);
			
			String url="IdPopup.jsp";
			
			RequestDispatcher rd=request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
		}
		
		if(id != null && name== null) {
			
		DAO mdao =DAO.getInstance();
		
		int result=mdao.search_confirmPW(id,email);
		
		if(result == 1) {
		
			String pw_tem=mdao.getPw_tem(id);
			String id_d=member.getId();
			
			request.setAttribute("id", id_d);
			request.setAttribute("pw_tem", pw_tem);
			
			request.setAttribute("result", result);
			/*
			 * String url="Idsearch.jsp";
			 */		
			
			String url="PwPopup.jsp";
		
		RequestDispatcher rd=request.getRequestDispatcher(url);
		rd.forward(request, response);
		
		}else {
			
			request.setAttribute("result", result);
			
			String url="PwPopup.jsp";
			
			RequestDispatcher rd=request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
		}

	}

			

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}

