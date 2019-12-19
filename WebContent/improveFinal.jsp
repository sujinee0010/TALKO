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
            
           <h2> 수업전 과 수업 후 변화 알아보기 </h2>
            
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
                        
                            <option><%=scoreList.get(j).getLevel()%>]<%=scoreList.get(j).getDate()%></option>
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
	                        
	                            <option><%=scoreList.get(j).getLevel()%>]<%=scoreList.get(j).getDate()%></option>
	                        <%} %>                         
	                        </select>
	                        
						</td >
					</tr>
									
					
										
			</tbody>
			</table>
			 <div style="text-align:center;"><input type="submit" id="hw" value=" 향상률 확인해 보기  " class="btn" style="vertical-align:middle;"></div>
             
			
			</form>
            
            </div>
<%
  // 이전 걍 레벨 객체를 들고와면 될듯? 
  // 이전 응시 
  //
 	Score bscore = (Score)request.getAttribute("bscore");
	Score ascore = (Score)request.getAttribute("ascore");
	
	
	
	
  double  aSum = ascore.getSum();
  double  aListen = ascore.getListening();
  double  aWriting =ascore.getWriting();
	
  String alevel = ascore.getLevel();		  
  
  
  
  
double  bSum = bscore.getSum();
  
  double  bListen = bscore.getListening();
  
  double  bWriting =bscore.getWriting();
	
  String blevel = bscore.getLevel();
  
  
  String ment1="";
  String ment2="";
  String ment3="";
  
  String img1="";
  String img2="";
  String img3="";
  
  String images[] = new String [3];
  images[0]="images/up.png";
  images[1]="images/mid.png";
  images[2]="images/down.png";
  
  if(aSum>bSum){
	  ment1= "총점이 향상 되었습니다.";
	  img1=images[0];
	  
  }
  else if (bSum==aSum ){
	  ment1= "총점에 변화가 없습니다";
	  img1=images[1];

	  
  }
  else{
	  ment1= "총점이 떨어 졌습니다 ";
	  img1=images[2];

	  
  }
  
  
  if(aListen>bListen){
	  ment2= "듣기 실력이 향상되었습니다  ";
	  img2=images[0];

	  
  }
  else if (bListen==aListen){
	  ment2= " 듣기 실력에 변화가 없습니다   ";
	  img2=images[1];

	  
  }
  else{
	  ment2= " 듣기 실력이 떨어 졌습니다   ";
	  img2=images[2];

	  
  }
  
  
  if(aWriting>bWriting){
	  ment3= "쓰기 실력이 향상되었습니다  ";
	  img3=images[0];

  }
  else if (bWriting==aWriting ){
	  ment3= " 쓰기 실력이 변화가 없습니다   ";
	  img3=images[1];

	  
  }
  else{
	  ment3= "쓰기 실력이 떨어 졌습니다 ";
	  img3=images[2];

	  
  }
  
 
 %>
  
  
   
  <div style ="text-align:center">
 <br/>
  <br/>
  <br/>
  <br/>
  
  <h2>비교 결과</h2>
  <br/>
 <h4>동일 난이도가 아닐 경우 결과가 정확하지 않을 수 있습니다</h4>
 <br/>
  
 <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                
                <tr>
                <th>수업 전 후</th>
                  <th>응시레벨</th>              
                  <th>총 점수 </th>
                   <th>듣기 점수 </th>
                    <th>쓰기 점수 </th>
                  
                </tr>  
                
                
              </thead>

	

		<tbody>           
		
		               		
              	 <tr>
                 <th>수업 전 </th>
                  <th><%=blevel%></th>
                  <th><%=bSum%></th>
                  <th><%=bListen%></th>
                  <th><%=bWriting%></th>
                  
                </tr>
                 <tr>
                 <th>수업 후 </th>
                  <th><%=alevel%></th>
                  <th><%=aSum%></th>
                  <th><%=aListen%></th>
                  <th><%=aWriting%></th>
                </tr>
                	
            
              </tbody>
            </table>
          </div>
 
 
 
 
 
 
 
 
  
  <br/>
  <br/>
  <img src =<%=img1%> width='165' height='165'>
  <h2 style ="text-align:center;" ><%=name%>님의 수강전 총점은 <%=bSum%>점 , 수강 후 총점은<%=aSum%>으로 </h2>
   <h2><%=ment1%></h2>
  <br/>
  <br/>
  
  <br/>
  <br/>
  <img src =<%=img2%> width='165' height='165'>
  <h2 style ="text-align:center;" ><%=name%>님의 수강전 듣기 점수는 <%=bListen%>점 , 수강 후 듣기 점수는 <%=aListen%>으로 </h2>
   <h2><%=ment2%></h2>
  <br/>
  <br/>
  
  <br/>
  <br/>
  <img src =<%=img3%> width='165' height='165'>
  <h2 style ="text-align:center;" ><%=name%>님의 수강전 쓰기 점수는  <%=bWriting%>점 , 수강 후 쓰기 점수는 <%=aWriting%>으로 </h2>
   <h2><%=ment3%></h2>
  <br/>
  <br/>
  
  <br/>
  <br/>
  <br/>
  <br/>
  
  
  
  </div>
   











</body>
</html>