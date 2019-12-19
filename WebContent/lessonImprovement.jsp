<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="service.BoardMapper"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%

int idx=Integer.parseInt(request.getParameter("idx"));
int no=Integer.parseInt(request.getParameter("no"));
int before = Integer.parseInt(request.getParameter("before_score"));
int after = Integer.parseInt(request.getParameter("after_score"));


int improvement = (after-before);


BoardMapper service = new BoardMapper();


service.insertImprovement(improvement, idx);

 
RequestDispatcher rd = request.getRequestDispatcher("lessonDetail.jsp?no="+no);
 
rd.forward(request,response);



%>







</body>
</html>