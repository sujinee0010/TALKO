package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardMapper;

/**
 * Servlet implementation class Update
 */
@WebServlet("/Supdate")
public class Supdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	BoardMapper service = new BoardMapper();
    public Supdate() {
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
		
		String email = (String)request.getParameter("email");
		String password = (String)request.getParameter("password");
		String name = (String)request.getParameter("name");
		String gender = (String)request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String nation = (String)request.getParameter("nation");
		String phone = (String)request.getParameter("phone");
		//String lesson_time = (String)request.getParameter("lesson_time");


		 String [] day=request.getParameterValues("lesson_time");
		  String textday="";
		  for(int i =0; i<day.length;i++){
		     textday += day[i]+"";
		  }

		
		service.updateStudent(email,password,name,gender,age,nation,phone,textday);
		
		RequestDispatcher rd = request.getRequestDispatcher("mypage_student.jsp");
        rd.forward(request,response);
        

	}

}
