package controller;

import java.io.IOException;
import java.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Apply;
import model.LoginUser;
import service.BoardMapper;



// 신청  삽입 서블릿 (메서드)
/**
 * Servlet implementation class InsertApply
 */
@WebServlet("/InsertApply")
public class InsertApply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	

    public InsertApply() {
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
			BoardMapper service = new BoardMapper();
            
			//세션 가져오기 (사용자 이메일로 사용자 정보 가져오기 )
            HttpSession session = request.getSession();
            String email = (String)session.getAttribute("email");
            
            LoginUser loginUser = service.getUser(email);
			
			
			// 신청서 제목 ,내용 ,선생 + 유저 이메일 가져오기 
            String title =request.getParameter("title");
            String content = request.getParameter("content");
            //String student =request.getParameter("student");
            //String student = loginUser.getName();
            String teacher = request.getParameter("teacher");
          
            
            //int idx = service.getUser(email).getIdx();
            
            // 정보를 바탕으로 집어 넣기  
            service.insertApply(title,content,teacher,loginUser);
            //신청하면 신청 리스트 화면으로 포워딩 
            RequestDispatcher rd = request.getRequestDispatcher("applyList.jsp");
            rd.forward(request,response);
            

		
	}
				

				
}
	
			
			

