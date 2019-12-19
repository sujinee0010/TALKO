<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="controller.Controller"%>
<%@ page import="java.util.*"%>
<%@page import="java.io.IOException"%>
<%@page import="service.BoardMapper"%>
<%@page import="java.text.SimpleDateFormat"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>TALK_IN_KOREAN</title>

    <!-- Bootstrap core CSS -->
   <link href="css/bootstrap.min2.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dashboard2.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

  
  </head>
<!-- NAVBAR
================================================== -->
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
          <a class="navbar-brand" href="#">TALKO | 전화 한국어 </a>
           <%
          
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
        	  <a class="navbar-brand" > <%=name%>님  </a>
        	  <a class="navbar-brand" href="logout.jsp">  로그아웃  </a>
        	  <%
          }
          %>
          

        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">메인 페이지  </a></li>
            <li><a href="#">레벨 테스트 </a></li>
            <li><a href="#">수강 안내 </a></li>
            <li><a href="#">마이 페이지 </a></li>
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
        </div>
        </div>
   


    <!-- Carousel
    ================================================== -->
  
    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
  
      <!-- START THE FEATURETTES -->
      	
         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
         <h1>학생 정보 수정 </h1>
         <h4><%=controller.getUser(email).getName()%> 님의 정보를 수정할  수 있어요 </h4>
         
         <%!String update = ""; 
         String wchecked = "";
         String mchecked = "";
         
         %>
         
         <%LoginUser user = controller.getUser(email);
        
      	if(type.equals("teacher"))
      		update="Tupdate";
      	
      	else if(type.equals("student"))
      		update="Supdate";

      	
      	if(user.getGender().equals("w"))
      		wchecked ="checked= \"checked\"";
      	

      	else if(user.getGender().equals("m"))
      		mchecked ="checked= \"checked\"";
         %>
         
        <br>
        <form action=<%=update%> method ="post" >
        <input type= "hidden" name = "ip" value = "" />
   
      	<table class="table">
      	<tr>
      		<td>사용자 이메일</td>
      		<td><%=user.getEmail()%></td>
      		<td><input name ="email" type= "hidden" value=<%=user.getEmail()%> /></td>
 			<!-- <td><input id="valid" type ="button" value="중복확인"/></td>   -->  	
      	</tr>
      	<tr>
      		<td>비밀번호</td>
      		<td><input name ="password" type ="password"  value=<%=user.getPassword()%> /></td>
      	</tr>
      	<tr>
      		<td>이름</td>
      		<td><input name ="name" type ="text" value=<%=user.getName()%> /></td>
      	</tr>
      	<tr>
      		<td>성별</td>
      		<td>
      			<input id = "man" type ="radio" name ="gender" value =<%=user.getGender()%> <%=mchecked%>/>
      			<label for= "man">남자</label>
      			<input id = "woman" type ="radio" name ="gender" value ="w"  <%=wchecked%> />
      			<label for= "woman">여자</label>
      		</td>
      	</tr>
      	<tr>
      		<td>만 나이</td>
      		<td><input name ="age" type ="text" value=<%=user.getAge()%> /></td>
      </tr>
      <tr>
      	<td>국적</td>
      	<td>
      	<select name ="nation" >
      	 <option><%=user.getNation()%></option>
         <option value="CHINA">CHINA</option>
      	 <option value="FRANCE">FRANCE</option>
      	 <option value="GERMANY">GERMANY</option>
      	 <option value ="VIETNAM">VIETNAM</option>
      	 <option value ="KOREA">KOREA</option>
      	 <option value ="Swaziland">Swaziland</option>
      	 </select>
      	</td>	
      </tr>
      <tr>
      	<td>휴대전화</td>
        <td><input name ="phone" type ="text" value=<%=user.getPhone()%> />&nbsp;&nbsp;※구분표시 없이</td>
      </tr>
      <tr>
       	<td>가능 요일 선택</td>
       	<td>
       		월<input type ="checkbox" name="lesson_time" value="월">
       		화<input type ="checkbox" name="lesson_time" value="화">
       		수<input type ="checkbox" name="lesson_time" value="수">
       		목<input type ="checkbox" name="lesson_time" value="목">
       		금<input type ="checkbox" name="lesson_time" value="금">
       		토<input type ="checkbox" name="lesson_time" value="토">
       		일<input type ="checkbox" name="lesson_time" value="일">
       		 &nbsp;&nbsp;설정 요일 : <%=user.getLesson_time()%>
       	</td>
      </tr>
      <tr>
      </tr>
      	</table>
      	<input type="submit" id="submit" value="수정 하기" class="btn">
      	      
      	
      	</form>
      </div>
 

      <!-- /END THE FEATURETTES -->


      <!-- FOOTER -->
      
    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>