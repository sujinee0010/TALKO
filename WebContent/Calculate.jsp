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
double count = Double.parseDouble(request.getParameter("count"));
double ongoing = Double.parseDouble(request.getParameter("ongoing"));


double rate = (ongoing/count)*100;


BoardMapper service = new BoardMapper();


service.updateLessonRate(count, ongoing, rate, idx);

 
RequestDispatcher rd = request.getRequestDispatcher("lessonDetail.jsp?no="+no);
 
rd.forward(request,response);



%>




</body>
</html>