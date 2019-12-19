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
          
		<%!
		int i=0;
		 %>
		<%
		
		 int i=Integer.parseInt(request.getParameter("no"));
		 BoardMapper service = new BoardMapper();
		
		 List<Lesson> list =service.lessonList(email);
		 Lesson lesson =list.get(i);
		 
		 
		 %>
		 




		
        <h2 class="sub-header" style=" text-align: center; ">  <%=lesson.getStudent()%>님과  <%=lesson.getTeacher()%>선생님의 수업 </h2>
		   
                        
          <div class="table-responsive">
          
          <form id="frm" method="post"  action="Calculate.jsp?idx=<%=lesson.getIdx()%>&no=<%=i%>">
            <table class="table table-striped"> 
              <colgroup>
					<col width="15%"/>
					<col width="35%"/>
					<col width="15%"/>
					<col width="35%"/>
				</colgroup>
				
				
				<tbody>
					<tr>
						<th scope="row"> 총 수업 횟수  </th>
						<td> <input type="text" id="inputEmail" name="count" class="form-control" placeholder=<%=lesson.getCount()%> required>

						 </td>
						<th scope="row">진행한 수업 횟수 </th>
						<td > <input type="text" id="inputPassword" name="ongoing" class="form-control" placeholder=<%=lesson.getOngoing()%> required>
						</td>
					</tr>
			
							
				</tbody>
            </table>
            
            
            <br/>
            
            <div style="text-align:center;"><input type="submit" id="hw" value="진행률 기록하기" class="btn" style="vertical-align:middle;"></div>
           
     
           </form>
           
            <div style="text-align:center;">
                      
           
           
           
           <script type="text/javascript" src="cal.js"></script>
            </div>
            
            
            <br/>
            <h3 style=" text-align: center; ">     <%=lesson.getStudent()%>님의 수업 진행률  </h3>
            <br/>
            <br/>
            <br/>
            <br/>
           <p style=" text-align: center; font-size: 6em; "><%=lesson.getRate()%>%</p>
           
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>            
            <h3 style=" text-align: center; ">   수업을 완료 하셨나요?  </h3>
            <h5 style=" text-align: center; "> "수강 완료" 를 누르면  후기를 작성할 수 있어요  </h5>
            <br/>
            <br/>
            <br/>
            
            
            <form  method="post"  action="lessonComplete.jsp?idx=<%=lesson.getIdx()%>&no=<%=i%>" >
            <table class="table table-striped">
              
              <colgroup>
					<col width="15%"/>
					<col width="35%"/>
					<col width="15%"/>
					<col width="35%"/>
				</colgroup>
            
            <tbody>
            
					<tr>
						<th scope="row"> 수업 시작 날짜  </th>
						
                    	<td>
                        <select name="s_year">
						<%
                        for(int j=2020 ;j>=2010;j--){
                        %>
                        
                            <option><%=j%></option>
                         <%} %>                            
                        </select>
                        년 
                        
                        <select name="s_month">
                        <%
                        for(int j=1 ;j<13;j++){
                        %>
                        
                            <option><%=j%></option>
                         <%} %>
                        </select>
                        월 
                        <select name="s_date">
                         <%
                        for(int j=1 ;j<31;j++){
                        %>
                        
                            <option><%=j%></option>
                         <%} %>
                        </select>
                        일 
						 </td>
						
						<th scope="row">수업 종료 날짜 </th>
						<td>
                        <select name="e_year">
						<%
                        for(int j=2020 ;j>=2010;j--){
                        %>
                        
                            <option><%=j%></option>
                         <%} %>                            
                        </select>
                        년 
                        
                        <select name="e_month">
                        <%
                        for(int j=1 ;j<13;j++){
                        %>
                        
                            <option><%=j%></option>
                         <%} %>
                        </select>
                        월 
                        <select name="e_date">
                         <%
                        for(int j=1 ;j<31;j++){
                        %>
                        
                            <option><%=j%></option>
                         <%} %>
                        </select>
                        일 
					 </td>
						
					</tr>
					<tr>
					<th scope="row" style="color:#9D03B4;">저장된 시작  날짜   </th>
					<td style="color:#9D03B4;"><%=lesson.getStart_date()%></td>
									
					<th scope="row" style="color:#9D03B4;"> 저장된  종료  날짜  </th>
					<td  style="color:#9D03B4;"> <%=lesson.getEnd_date()%></td>
					
					
					</tr>
					
									
															
			</tbody>
			</table>
				
				
             <div style="text-align:center;"><input type="submit" id="hw" value="수강 완료 " class="btn" style="vertical-align:middle;"></div>
             
             </form>
             <br/>
            <br/>
            <br/>
            <form  method="post"  action="lessonImprovement.jsp?idx=<%=lesson.getIdx()%>&no=<%=i%>" >
            <h3 style=" text-align: center; ">   수업 결과와 후기를 남겨 주세요 !  </h3>
            <h5 style=" text-align: center; ">   <%=lesson.getStudent()%>님이 남겨준 소중한 후기가  다른 학생들에게 도움이 될 수 있어요 ^-^    </h5>
            
            
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
						
						<select>
						<%!int before=0; %>
						<%
						//int before=0;
                        for(int j=scoreList.size()-1;j>=0;j--){
                        //before=scoreList.get(j).getSum();
                        %>
                        
                            <option><%=scoreList.get(j).getLevel()%> | <%=scoreList.get(j).getSum()%>점 | <%=scoreList.get(j).getDate()%></option>
						<%} %>   
                        </select>
						 점수 : <input type="text" value= <%=before%> name="before_score" style ="width:30px; height:20px"/>
						 
                                                  
						 </td>
						 <th scope="row">수업 후 레벨테스트    </th>
						 <td>
							<select>
							<%!int after=0; %>
							<%
							
							//int after=0;

	                        for(int j=scoreList.size()-1;j>=0;j--){
	                        	//after=scoreList.get(j).getSum();

	                        %>
	                        
	                            <option><%=scoreList.get(j).getLevel()%> | <%=scoreList.get(j).getSum()%>점 | <%=scoreList.get(j).getDate()%></option>
	                        <%} %>                         
	                        </select>
	                        점수 : <input type="text" value="<%=after%>" name="after_score" style ="width:30px; height:20px"/>
							
						
						</td >
					</tr>
									
					
										
			</tbody>
			</table>
			 <div style="text-align:center;"><input type="submit" id="hw" value="수업 결과 " class="btn" style="vertical-align:middle;"></div>
             
			
			</form>
            
            
            
            
            <%
            
            String result = "";
            String color ="#000000";
            if(lesson.getImprovement()>0){
            		result="향상 됬어요";
            		//result="better than before";
            		color="#5040E8";
            }
            else if(lesson.getImprovement()==0){
        		
            	result="의 차이로 변화가 없었어요 ";
            	//result=",you're no better than before.";
        		color="#2E001F";

            }
            else if(lesson.getImprovement()<0){
            	result="내려갔어요 ";
            	//result="is down ";
        		color="#FC5E5D";

            }
            		
            	
            
            String review[] = lesson.getReview().split("\n");
    		//String a[] = after.split("]");
            %>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <form  method="post"  action="insertReview.jsp?idx=<%=lesson.getIdx()%>&no=<%=i%>" >
            
            <textarea style=" color:<%=color%>; width:100%; height:40px; font-size:1.5em; border:1px soild #F5F4F4; border-radius: 5px; overflow-y:hidden; background:clear;" name="review_m" >  <%=lesson.getStudent()%>님은 <%=lesson.getTeacher()%>과 수업 후  실력이 <%=lesson.getImprovement()%>점  <%=result%> </textarea>
           
           
           
           <textarea style="  width:100%; height:150px; font-size:1.5em; border:0; overflow-y:hidden; border-radius: 5px; background:#F5F4F4;" name="review" > <%=review[1]%></textarea>
             
            <div style="text-align:center;"><input type="submit" id="hw" value="후기 작성  " class="btn" style="vertical-align:middle;"></div>
             
			
           </form>
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