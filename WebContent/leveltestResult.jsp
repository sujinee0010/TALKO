<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*"%>
<%@ page import= "controller.*"%>
<%@ page import= "service.*"%>
<%@ page import= "model.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="controller.Controller" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%@ page import="model.Tutor"%>
<%@ page import="java.util.*"%>


<!DOCTYPE html>
<html>
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
          String uemail = (String)session.getAttribute("email");
          Controller controller = new Controller();
          String uname="";
		
          if (uemail==null){
        %>
        	  <a class="navbar-brand" href="Login.html">  로그인 </a>
        <% 
          }
          else{
        	  
        	   uname = controller.getUser(uemail).getName();
        	   
        	 %> 
        	  <a class="navbar-brand" > <%=uname%>님 </a>
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






	<div style="text-align:center;"><img src = 'images/checklist.png' width='165' height='165'>
	<h2 id = 'A'> 레벨 테스트 결과</h2>
	
	<form  method="post"  action="SelectRecord" >
           
            
            <br/>
            <br/>
            <table class="table table-striped">
              
              <colgroup>
					<col width="15%"/>
					<col width="35%"/>
					<col width="15%"/>
					<col width="35%"/>
				</colgroup>
            
            <% 
            List<Score> scoreList = controller.selectScoreList(uemail);
            %>
            
            <tbody>
					<tr>
						<th scope="row" > 응시한 레벨테스트   </th>
						
						
						<td>
						
						<select name="record">
					
						
						<%
						//int before=0;
                        for(int j=scoreList.size()-1;j>=0;j--){
                        //before=scoreList.get(j).getSum();
                        %>
                        
                            <option ><%=scoreList.get(j).getLevel()%>]<%=scoreList.get(j).getDate()%></option>
						<%} %>   
                        </select>
						 
					</tr>
									
					
										
			</tbody>
			</table>
			 <div><input type="submit"  value=" 점수 결과  " class="btn" style="vertical-align:middle;"></div>
			</form>
	
	
	
	
  </div>
  
  
</body>
</html>