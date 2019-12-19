<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="controller.Controller" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%@ page import="model.*"%>
<%@ page import="controller.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
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

  </head>

  <body>
 
  
  
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

    <div class="container">

      <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
          <div class="jumbotron">
            <h1><strong>내 맞춤 선생님은 어디에 ?</strong></h1>
            <p>편하고 즐겁게 대화 해요! <br/> 상세 보기를 통해 선생님들의  언어, 요일, 시간을 확인 해 보세요   </p>
          </div>
          
          <div class="row"> 
          <%
             
               
               List<Tutor> list =controller.getTutorList();
               
               
               for(int i=0;i<list.size();i++){
            	   
            %>
            <div class="col-xs-6 col-lg-4">
            <p>
              <h2><%= list.get(i).getName() %></h2>
              <%= list.get(i).getIntroduce()%> <br/>
              사용 가능 언어: <%=list.get(i).getLanguage()%> <br/>
              수업     요일: <%= list.get(i).getLesson_time()%>
            </p>
              <a class="btn btn-default" href="TutorDetail.jsp?num=<%=list.get(i).getIdx()%>" role="button">상세 보기 &raquo;</a>
            </div><!--/.col-xs-6.col-lg-4-->
            
            <% 
            } %>
           
          </div><!--/row-->
        </div><!--/.col-xs-12.col-sm-9-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group">
            <a href="#" class="list-group-item active">선생님 소개</a>
            <a href="#" class="list-group-item">선생님 상세</a>
            
          </div>
        </div><!--/.sidebar-offcanvas-->
      </div><!--/row-->

      <hr>


    </div><!--/.container-->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <script src="offcanvas.js"></script>
  </body>
</html>