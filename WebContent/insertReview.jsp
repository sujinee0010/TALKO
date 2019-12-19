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
request.setCharacterEncoding("UTF-8");

int idx=Integer.parseInt(request.getParameter("idx"));
int no=Integer.parseInt(request.getParameter("no"));

String review_c = (String)request.getParameter("review");
String review_m =(String)request.getParameter("review_m");

String review = review_m+ "\n" +review_c;


BoardMapper service = new BoardMapper();

service.insertReview(review, idx); 

 
RequestDispatcher rd = request.getRequestDispatcher("lessonDetail.jsp?no="+no);
 
rd.forward(request,response);



%>

</body>
</html>