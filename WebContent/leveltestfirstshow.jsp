<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="controller.Controller" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%@ page import="model.Tutor"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Off Canvas Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/offcanvas.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->





<title>Insert title here</title>
<style>
h1 {text-align:center;}
#A {background-color:#BDBDBD; border-color:#BDBDBD; font-size:20px;}
#B {background-color:#A6A6A6; border-color:#A6A6A6; font-size:20px;}
#C {background-color:#8C8C8C; border-color:#8C8C8C; font-size:20px;}
</style>
</head>
<body>
<script language = "javascript">
function f1() {location.href='levelL1.jsp';}
function f2() {location.href='levelL2.jsp';}
function f3() {location.href='levelM1.jsp';}
function f4() {location.href='levelM2.jsp';}
function f5() {location.href='html.jsp';}
function f6() {location.href='html2.jsp';}


</script>
<% 
request.setCharacterEncoding("UTF-8");
out.println("<div class='container'>");
out.println("<div class='row'>");
out.println("<div class='col'>");
out.println("<h1 text align='center'>레벨테스트 수준을 선택하세요</h1>");
out.println("<br/>");
out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' id = 'A' name = 'L1' style='width:200pt;height:180pt;' class='btn btn-primary' onclick='javascript:f1()'>초급1</button>");
out.println("<button type='button' id = 'B' name='M1' style='width:200pt;height:180pt;' class='btn btn-primary' onclick='javascript:f3()'>중급1</button>");
out.println("<button type='button' id = 'C' name='H1' style='width:200pt;height:180pt;' class='btn btn-primary' onclick='javascript:f5()'>고급1</button>");
out.println("<br/>");
out.println("<br/>");
out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' id = 'A' name='L2'  style='width:200pt;height:180pt;' class='btn btn-primary' onclick='javascript:f2()'>초급2</button>");
out.println("<button type='button' id = 'B' name='M2' style='width:200pt;height:180pt;' class='btn btn-primary' onclick='javascript:f4()'>중급2</button>");
out.println("<button type='button' id = 'C' name='H2' style='width:200pt;height:180pt;' class='btn btn-primary' onclick='javascript:f6()'>고급2</button>");
out.println("</div>");
out.println("</div>");
out.println("</div>");
out.println("<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>");
out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>");
out.println("<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>");
%>
<br/>
<br/>
<br/>
<br/>

<div style="text-align:center;">
 <h2> 내 실력은 어느 정도 일까?  </h2>
  <a href="leveltestResult.jsp" style="text-decoration:none ;color:#000000;"><input  type="button" id="hw" value="점수 보러 가기 "  class="btn" style="vertical-align:middle;"></a></div>
  <br/>
  <br/>
  <br/>
<div style="text-align:center;">
 <h2> 수강 전 과  수강 후 실력 비교 해 보기  </h2>
  <a href="improvePage.jsp" style="text-decoration:none ;color:#000000;"><input  type="button" id="hw" value="점수 비교하러 가기 "  class="btn" style="vertical-align:middle;"></a></div>
  <br/>
  <br/>
  <br/>
  
  
</body>



<nav class="navbar navbar-fixed-top navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="main.jsp">TAlKO | 전화한국어</a>
    
           <%
           request.setCharacterEncoding("UTF-8");
          String email = (String)session.getAttribute("email");
          Controller controller = new Controller();
          String name="";
		
          if (email==null){
        %>
        	  <a class="navbar-brand" href="Login.html">  로그인 </a>
        <% 
          }
          else{
        	  
        	   name = controller.getUser(email).getName();
        	   
        	 %> 
        	  <a class="navbar-brand" > <%=name%>님 </a>
        	  <a class="navbar-brand" href="logoutCheck.jsp">  로그아웃  </a>
        	  <%
          }
          %>
          
          
          
          
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="main.jsp">홈</a></li>
                <li><a href="leveltestfirstshow.jsp">레벨테스트</a></li>
                <li><a href="TutorList.jsp">수강안내</a></li>
                <li><a href="applyList.jsp">마이페이지</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->


</html>