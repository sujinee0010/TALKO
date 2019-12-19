<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="controller.Controller" %>
<%@page import="java.io.IOException"%>
<%@page import="service.BoardMapper"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title> Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min2.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dashboard2.css" rel="stylesheet">

    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

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
          //로그
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
        	  <a class="navbar-brand" ><%=name%>님 </a>
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






            
            <div style="text-align:center;">
            
           <h2> 수업전 과 수업 후 변화  알아보기 </h2>
           
            <form  method="post"  action="SelectScore" >
           
            
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
            List<Score> scoreList = controller.selectScoreList(email);
            %>
            
            <tbody>
					<tr>
						<th scope="row" > 수업 전 레벨테스트   </th>
						
						
						<td>
						
						<select name="before">
					
						
						<%
						//int before=0;
                        for(int j=scoreList.size()-1;j>=0;j--){
                        //before=scoreList.get(j).getSum();
                        %>
                        
                            <option ><%=scoreList.get(j).getLevel()%>]<%=scoreList.get(j).getDate()%></option>
						<%} %>   
                        </select>
						                
						 </td>
						 <th scope="row">수업 후 레벨테스트    </th>
						 <td>
							<select name="after">
							
							<%
							
							//int after=0;

	                        for(int j=scoreList.size()-1;j>=0;j--){
	                        	//after=scoreList.get(j).getSum();

	                        %>
	                        
	                            <option ><%=scoreList.get(j).getLevel()%>]<%=scoreList.get(j).getDate()%></option>
	                        <%} %>                         
	                        </select>
	                        
						</td >
					</tr>
									
					
										
			</tbody>
			</table>
			 <div><input type="submit" id="hw" value=" 향상률 확인해 보기  " class="btn" style="vertical-align:middle;"></div>
             
			
			</form>
            
            
 </div>










</body>
</html>