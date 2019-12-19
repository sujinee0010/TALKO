<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="model.Apply"%>
<%@ page import="java.util.*"%>
<%@ page import="controller.Controller" %>
<%@page import="java.io.IOException"%>
<%@page import="service.BoardMapper"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%

int i=Integer.parseInt(request.getParameter("i")); 

Controller controller = new Controller();
		
//세션 가져오기 (사용자 이메일로 사용자 정보 가져오기 )
      
String email = (String)session.getAttribute("email");
      
 
Apply apply = controller.applyList(email).get(i);
				
				
//신청 객체의   받아서  레슨 만들기 
controller.makeLesson(apply);
		
RequestDispatcher rd = request.getRequestDispatcher("lessonList.jsp");
rd.forward(request,response);
		




%>
</body>
</html>