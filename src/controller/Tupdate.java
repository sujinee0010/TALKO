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
 * Servlet implementation class Tupdate
 */
@WebServlet("/Tupdate")
public class Tupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	BoardMapper service = new BoardMapper();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Tupdate() {
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
		String phone = (String)request.getParameter("phone");
		String career = (String)request.getParameter("career");
		String introduce = (String)request.getParameter("introduce");
		
		 String [] level=request.getParameterValues("level");
		   String textlevel="";
		   for(int i =0; i<level.length;i++){
		      textlevel += level[i]+"";
		   }
		   String [] language=request.getParameterValues("language");
		   String textlanguage="";
		   for(int i =0; i<language.length;i++){
		      textlanguage += language[i]+"";
		   }
		
		   String [] day=request.getParameterValues("lesson_time");
			  String textday="";
			  for(int i =0; i<day.length;i++){
			     textday += day[i]+"";
			  }
		
		service.updateTeacher(email,password,name,gender,age,phone,textlevel,textlanguage,career,introduce,textday);
		
		RequestDispatcher rd = request.getRequestDispatcher("mypage_teacher.jsp");
        rd.forward(request,response);
        

	
	}

}
