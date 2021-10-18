package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO;
import model.VO;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String url=null;
		
		DAO dao=DAO.getInstance();
		int result=dao.userCheck(id, pwd);
		
		if(result == 1) {
			VO emp=new VO();
			emp=dao.getMember(id);
			
			
			HttpSession session=request.getSession();
			session.setAttribute("loginUser", emp);
			session.setAttribute("result", result);
			
			url="Main.jsp";
		}else {
			if(result == 0) {
				request.setAttribute("message","로그인 실패 : 비밀번호 불일치");
			
			}
			
			url="Login.jsp";
		}
		
		RequestDispatcher rd=request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}














