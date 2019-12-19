<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
 
     <link href="css/carousel.css" rel="stylesheet">
    
  </head>
<!-- NAVBAR
================================================== -->
  <body>
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
             <a class="navbar-brand" href="main.jsp">TALKO</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="active"><a href="main.jsp">홈</a></li>
                <li><a href="leveltestfirstshow.jsp">레벨테스트</a></li>
                <li><a href="TutorList.jsp">수강안내</a></li>
                <li><a href="applyList.jsp">마이페이지</a></li>                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">언어 선택 <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">한국어</a></li>
                    <li><a href="#">English</a></li>
                    <li><a href="#">中文</a></li>
                   <!--  
                    <li class="divider"></li>
                    <li class="dropdown-header">Nav header</li>
                    <li><a href="#">Separated link</a></li>
                    <li><a href="#">One more separated link</a></li>
                    -->
                  </ul>
                </li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <li><a href="join.jsp">회원가입</a></li>
                <li><a href="signin.jsp">로그인</a></li>
              </ul>
            </div>
          </div>
        </nav>

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
     <hr>
     <hr>
     <hr>
      <div class="">
        <div class="col-md-7">
          <img src="images/login.jpg"/>
        </div>
        <img src ="images/stage2.jpg"/>
        <br>
        <form action="insertStudent.jsp" method ="post" onsubmit="return joinCheck(this)">
        <input type= "hidden" name = "ip" value = "<%=request.getRemoteAddr() %>" />
   
      	<table class="table">
      	<tr>
      		<td>사용자 이메일</td>
      		<td><input name ="email" type ="text" value="id@example.com" /></td>
 			<!-- <td><input id="valid" type ="button" value="중복확인"/></td>   -->  	
      	</tr>
      	<tr>
      		<td>비밀번호</td>
      		<td><input name ="password" type ="password" value="password"/> </td>
      	</tr>
      	<tr>
      		<td>이름</td>
      		<td><input name ="name" type ="text" value="성이름" /></td>
      	</tr>
      	<tr>
      		<td>성별</td>
      		<td>
      			<input id = "man" type ="radio" name ="gender" value ="m"/>
      			<label for= "man">남자</label>
      			<input id = "woman" type ="radio" name ="gender" value ="w"/>
      			<label for= "woman">여자</label>
      		</td>
      	</tr>
      	<tr>
      		<td>만 나이</td>
      		<td><input name ="age" type ="text" /></td>
      </tr>
      <tr>
      	<td>국적</td>
      	<td>
      	<select name ="nation">
      	 <option>KOREA,REPUBLIC OF</option>
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
        <td><input name ="phone" type ="text" />&nbsp;&nbsp;※구분표시 없이</td>
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
       	</td>
      </tr>
      <tr>
      	<td>
      		위 정보 제공에 동의 합니다.<input type ="checkbox" name="type" value="student">
      	</td>
      </tr>
      	</table>
      	
      	<input type ="submit" value = "가입신청"/>
      
      	
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