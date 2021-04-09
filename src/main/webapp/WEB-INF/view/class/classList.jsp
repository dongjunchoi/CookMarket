<%@page import="middle.market.vo.ClassVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>0
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 30;
       background-color: #FFB6C1;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
   
    .panel-heading , .panel-footer {
    	text-align : center;
    }
    
    body {
    	color : #000080;
 		background-color : 	#F0F8FF;
    }
    #inputrecipe {
		border : 1px solid skyblue; 
		background-color : #E0FFFF;
		color : #4B0082	;
    	float : right;
 
    	
    	
    }
    
    footer {
     	 background-color: #FFB6C1;
     	 padding: 25px;
    }
    
    #classInsertform{
    	width: 10%;
    	margin-left: 200px;
    }
    
    #modal-dialog{
    	width: 30%;
    }
   .panel-body:hover{
    	background-color : red;
    }
    
  </style>
  
  
</head>

<script>

$(function(){
	
	
	// 사진 누르면 상세페이지 이동
	$(document).on('click' ,".img-responsive", function(){
		var class_cod = $(this).attr("id");
		location.href='<%=request.getContextPath()%>/class/classView.do?class_cod=' + class_cod;
		
	}) // 사진 누르면 상세페이지 이동 끝 
	
	
	
	
	
	
}) //전체 함수 끝 


</script>

<body>


<!-- 상위 메뉴바 -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">Products</a></li>
        <li><a href="#">Deals</a></li>
        <li><a href="#">Stores</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">   
 <div class="row">






<%
	
	String sessionId = (String)session.getAttribute("id");
	String gradecode = (String)session.getAttribute("gradecode");

	
%>



	
	
<!-- 클래스 등록하는 모달 창  -->	
	
<div class="container">

<!-- Trigger the modal with a button -->
<!-- 클래스 등록하기 버튼 -->

	<%if(gradecode.equals("요리사")){ %>
  <button type="button" id="inputrecipe" class="btn btn-info btn-xsm" data-toggle="modal" data-target="#myModal">클래스등록하기</button>
	<%} %>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">클래스 등록하기</h4>
        </div>
        <div class="modal-body">         
          <form id="classInsertform" method="post" action="<%=request.getContextPath()%>/class/classInsert.do" enctype="multipart/form-data">
          	<label>제목</label><input type="text" id="ctitle" name="ctitle"><br><br>
          	<label>강사명 </label><span> <%=session.getAttribute("id") %></span><br><br>
          	<label>내용</label><br>
          	<textarea name="content" id="content" cols="60" rows="30"></textarea><br><br>
          	<label>시작날짜</label><input type="date" name="startDate" id="startDate"><br><br>
          	<label>종료날짜</label><input type="date" name="endDate" id="endDate"><br><br>
          	<label>가격</label><input type="text" name="price" id="price"><br><br>
          	<label>진행상태</label>
          	<select name="status" id="status">
    			<option value="진행중">진행중</option>
    			<option value="시작전">시작전</option>
    			<option value="종료">종료</option>
          	</select>
          	<br>
          	<label>첨부파일</label>
          	<input type="file" name="cfile" id="cfile"><br><br>
          	<input type="submit" value="클래스 등록하기" id="insertClass">
          </form>
          
          
          
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>	
	
	
	
	
	
	
	
	
	
  <br>
<%
 List<ClassVO> classList = (List<ClassVO>)request.getAttribute("classList");  

 String color = "panel-primary"; 


 //for(RecipeVO revo : recipeList ){
	for(int i = 0 ; i < classList.size() ; i++){ 
	 
	//페이지에 바 색상을 3가지 색상으로 나누려고 구분함 
	 if (i % 3 == 1 ){ 
		 color = "panel-primary"; 
	 }else if (i % 3 == 2 ) {
		color = "panel-danger";
	}else {
		color = "panel-success";
	}
	
	
	 String path = (String)request.getAttribute("filePath");
%>


    <div class="col-sm-4">
      <div class="panel <%=color %>">
        <div class="panel-heading title"><%=classList.get(i).getClass_name()%></div>
        <div class="panel-body"><img src="../upload/<%=classList.get(i).getFileName() %>" class="img-responsive" id="<%=classList.get(i).getClass_cod()%>" style="width:100%; height:200px;"  alt="검사중"></div>
        <div class="panel-footer"><%=classList.get(i).getCb_content()%></div>
      </div>
    </div>


<%    
}

%>



  </div>
</div><br> 

<footer class="container-fluid text-center">
  <p>Online Store Copyright</p>  
  <form class="form-inline">Get deals:
    <input type="email" class="form-control" size="50" placeholder="Email Address">
    <button type="button" class="btn btn-danger">Sign Up</button>
  </form>
</footer>

</body>
</html>
