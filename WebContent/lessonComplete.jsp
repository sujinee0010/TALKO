<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.BoardMapper" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
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

String s_year =(String)request.getParameter("s_year");
String s_month =(String)request.getParameter("s_month");
String s_date =(String)request.getParameter("s_date");

String e_year =(String)request.getParameter("e_year");
String e_month =(String)request.getParameter("e_month");
String e_date =(String)request.getParameter("e_date");


String start_date = s_year+"-"+s_month+"-"+s_date ;
String end_date = e_year+"-"+e_month+"-"+e_date ;



//System.out.print(no);
BoardMapper service = new BoardMapper();
//service.updateLessonRate(count,ongoing,rate,idx);

service.insertLessonDate(idx, start_date, end_date);

//String url =request.getRequestURL();
//a href="lessonDetail.jsp?no=<%=i"
 
RequestDispatcher rd = request.getRequestDispatcher("lessonDetail.jsp?no="+no);
 
rd.forward(request,response);



%>











</body>
</html>