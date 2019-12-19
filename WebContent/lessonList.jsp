<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Lesson"%>
<%@ page import="model.*"%>
<%@ page import="controller.Controller"%>
<%@ page import="java.util.*"%>
<%@page import="java.io.IOException"%>
<%@page import="service.BoardMapper"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title> Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min2.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dashboard2.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

   
  </head>


</head>
<body>

 <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="main.jsp">TALKO | 전화 한국어 </a>
          
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
        	  <a class="navbar-brand" > <%=name%>님   </a>
        	  <a class="navbar-brand" href="logoutCheck.jsp">  로그아웃  </a>
        	  <%
          }
          %>
          
          
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="main.jsp">메인 페이지  </a></li>
            <li><a href="leveltestfirstshow.jsp">레벨 테스트 </a></li>
            <li><a href="TutorList.jsp">수강 안내 </a></li>
            <li><a href="applyList.jsp">마이 페이지 </a></li>
          </ul>
          
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          
         
         <%!String mypage = ""; %>
         <%
        	String type = controller.getUser(email).getType();
         	if(type.equals("teacher"))
         		mypage="mypage_teacher.jsp";
         	
         	else if(type.equals("student"))
         		mypage="mypage_student.jsp";
         
         %>
          <ul class="nav nav-sidebar">
            <li><a href="applyList.jsp" style="text-decoration:none ;color:#000000;">요청 내역 </a></li>
            <li><a href="lessonList.jsp" style="text-decoration:none ;color:#000000;">수강 현황 </a></li>
            
            <li><a href=<%=mypage%> style="text-decoration:none ;color:#000000;">내정보 수정</a></li>
            
          </ul>
          
         
         </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          


          <h2 class="sub-header" style=" text-align: center; ">나의 수업 리스트  </h2>



		<%
		//int aIdx =Integer.parseInt(request.getParameter("no"));
		
		
		//신청 리스트 실행
		List<Lesson> list =controller.lessonList(email);
		
		%>

          <div class="table-responsive">
            <table class="table table-striped">
              
              <thead>
                <tr>
                  <th>NO.</th>
                  <th>TITLE</th>
                                    
                </tr>
              </thead>
              <tbody>
              
             <% 		
               
               if(list.size()==0) {
            	   
            	   System.out.print("사이즈 없음 ");	
             %>
            	    <tr>
	                <td colspan=3 style= "text-align: center;">수업 목록이 없습니다 </td>	                 
	                </tr>

            <% 
            	   
            	   
               }
               
               else{
            	   
            	   for(int i=0;i<list.size();i++){
                 		
             			int no_ = list.get(i).getIdx();
             			String student =list.get(i).getStudent();
             			String teacher =list.get(i).getTeacher();

             			
             			
              	%>	
              	
              	
		              	<tr>   
		              	  <td><%=i+1%></td>
		                  <td colspan=3><a href="lessonDetail.jsp?no=<%=i%>" style="text-decoration:none ;color:#000000;"><%=student%>님 과<%=teacher%>의 수업  </a></td>
		                
		                </tr>
		                
		       <%	}
            	   }
                
		       %>
              
               
               
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>