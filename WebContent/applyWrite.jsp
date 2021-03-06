<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="controller.Controller"%>
<!DOCTYPE html>
<html>
<head>
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
        	  <a class="navbar-brand" ><%=name%>님</a>
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
          
         <h2 class="sub-header"> 수업 요청 메세지 작성   </h2>
          <div class="table-responsive">
          
          	<form id="frm" method="post"  action="InsertApply">
	    	<table class="table table-striped">
				<colgroup>
					<col width="15%"/>
					<col width="35%"/>
					<col width="15%"/>
					<col width="35%"/>
				</colgroup>
				
				<tbody>
				<%
				
				//신청하기 버튼 누르면 ->선생님 값도 받아와야함 
				//int i=Integer.parseInt(request.getParameter("i")); 
				String t_name = (String)request.getParameter("teacher");
			
							
				%>
					<tr>
						<th scope="row">신청자</th>
						<td><%=name%></td>					
																
						<th scope="row" >선생님</th>
						<td><textarea name ="teacher" style="width:100px;height:25px;border-color:#F9F9F9;outline: none;resize: none;background-color:#F9F9F9;"><%=t_name%></textarea></td>											
					</tr>
					
					<tr>
						<th scope="row" >제목</th>
						<td colspan=3><input type="text" id="title" name="title" placeholder="제목을 입력하세요" style="width:600px;height:30px;"></td>
					</tr>
					
				</tbody>
				
			</table>
			
			<textarea title="내용" id="content" name="content" style="width:100%;min-height:170px;border-color:white;outline: none;resize: none;background-color:#F9F9F9;"></textarea>
			<input type="hidden" id="boardIdx" name="boardIdx" />
			<input type="hidden" id="method" name="_method"/>
		
		
		<input type="submit" id="submit" value="신청하기" class="btn">
          
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