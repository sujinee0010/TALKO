package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardMapper;
import model.*;

@WebServlet("/SelectScore")
public class SelectScore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectScore() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		//세션 가져오기 (사용자 이메일로 사용자 정보 가져오기 )
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("email");
		
		String before = request.getParameter("before");
		String after =  request.getParameter("after");
		System.out.println(before);
		System.out.println(after);
		
		
		String b[] = before.split("]");
		String a[] = after.split("]");
		
		System.out.println(b[0]+"?");
		System.out.println(b[1]+"?");
		
		BoardMapper service = new BoardMapper();
		

		Score bscore =service.selectScore(email, b);
		Score ascore =service.selectScore(email, a);
		
		
		request.setAttribute("bscore", bscore);
		request.setAttribute("ascore", ascore);
		
		RequestDispatcher rd = request.getRequestDispatcher("improveFinal.jsp");

		rd.forward(request,response);


		
	}

}


