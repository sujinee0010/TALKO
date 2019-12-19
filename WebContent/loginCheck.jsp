<%@page import="controller.LoginController"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controller.Controller"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%


	 request.setCharacterEncoding("UTF-8");
	
	 String  email = request.getParameter("email");
	 String  password = request.getParameter("password");
	 
	 
	 //유저가 맞는지 체크 
	 if(LoginController.isUser(email,password)){
		 session.setAttribute("email", email);
		 session.setAttribute("login","yes");
	 }
	 
	 else{
		out.println("<script>");
		out.println("alert('아이디 또는 비밀번호를 틀렸습니다!')");
		out.println("location.href='signin.jsp'");
		out.println("</script>");
		 
		 
	 }
	 

	 
	 //로그인 성공 메세지 
	 String login =(String)session.getAttribute("login");
	 if(login!= null && login.equals("yes")){
		 out.println("<script>");
		 out.println("alert('환영합니다.')");
		 out.println("location.href='main.jsp'");
		 out.println("</script>");
	 }
  
	
%>
</body>
</html>