<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="controller.Controller"%>
<%@ page import="service.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="model.*"%>
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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
                <div class="row">
                
            
            <%
            
            Controller controller = new Controller();
            
            int IdNumber = Integer.parseInt(request.getParameter("num"));
            
            Tutor tutor = controller.getTutorDetail(IdNumber);
                        
            
            	
            %>
            
           <div class="Teacher-header">
            <img src="images/support.png" align="left" width ="110" height="110" vspace="20" hspace="20" />&nbsp;
        <h1 class="Teacher-title"> <strong><%=tutor.getName() %></strong></h1>
         <a class="btn pull-right" href="applyWrite.jsp?teacher=<%=tutor.getName()%>" role="button"><strong>신청 하기&raquo;</strong></a>
        <p class="Teacher-description"><%=tutor.getIntroduce() %></p>
      </div>

          <div class="blog-post">
            <hr>
            <h3> <strong>학력 및 경력</strong></h3>
            
            <blockquote>
              <p><%=tutor.getCareer()%></p>
            </blockquote>
            <h3> <strong>사용 가능 외국어 </strong></h3>
             <p><%= tutor.getLanguage()%></p>
             <br/>
            <h3> <strong>수업 가능 요일 /시간</strong></h3>
             <pre><code><%= tutor.getLesson_time() %>  </code></pre>
             <br/>
             
             
              <%
              
              List<Review> list= new ArrayList<Review>();         
              String tname ="";
           
              tname=tutor.getName();
              list= controller.selectReviewList(tname);
            
            
             %>
              
               <% 
         
               
               %>     
            <h3> <strong>수강 후기</strong></h3>
             <div class="table-responsive">
          
          <% for(int i=0;i<list.size();i++){
        	  
        	  // 리뷰 
        	  String rm ="";
        	  String color ="#000000";
        	  int improvement =list.get(i).getImprovement();
        	  if(improvement>0){
        		  rm="수업 후 실력이 상승했어요 ";
        		  color="#5040E8";
        	  }
        	  else if(improvement==0){
        		  rm="수업 후 실력이 변화가 없었어요";
        		  color="#2E001F";
        	  }
        	  if(improvement<0){
        		  rm="수업 후 실력이 하락했어요 ";
        		  color="#FC5E5D";
        	  }

        
        	  String review =list.get(i).getReview();
        	  
        	  String reviews[] = review.split("\n");
        	  
        	%>
          <textarea style=" color:<%=color%>; width:100%; height:40px; font-size:1.5em; border:1px soild #F5F4F4; border-radius: 5px; overflow-y:hidden; background:clear;" name="review_m" ><%=rm%></textarea>
          <textarea style="  width:100%; height:150px; font-size:1.5em; border:0; overflow-y:hidden; border-radius: 5px; background:#F5F4F4;" name="review_m" ><%=reviews[1]%></textarea>
             
         <%} %>     
          
        </div>
            
          </div><!-- /.blog-post -->

          <br/><br/>

        
       
        </div><!--/row-->  
        </div><!--/.col-xs-12.col-sm-9-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group">
            <a href="TutorList.jsp" class="list-group-item">선생님 소개</a>
            <a href="#" class="list-group-item active">선생님 상세</a>
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