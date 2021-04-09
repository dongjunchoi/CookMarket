<%@page import="middle.market.vo.RecipeVO"%>
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
    
  </style>
</head>

<script>



$(function(){

	

	

	

	// 사진 누르면 상세페이지 이동

	$(".img-responsive").on('click' , function(){

		var rbcod = $(this).attr("id");

		location.href='<%=request.getContextPath()%>/recipe/recipeone.do?rbcod=' + rbcod;

		

		//console.log("코드값 검사 : " + rbcod);

// 	 	$.ajax({

<%-- 			url : '<%=request.getContextPath()%>/recipe/recipeone.do',  --%>

// 			type : 'get', 

// 			data : { "rbcod" : rbcod },

// 			success : function(res){

// 				alert("1개레시피 페이지로 이동 성공");

// 			},

// 			error : function(xhr) {

// 				alert("상태: " + xhr.status); 

// 			},

			

// 			dataType : 'json'

// 		})

		 



		

		

		

	}) // 사진 누르면 상세페이지 이동 끝 

	

	

	//버튼누르면 레시피 등록하기 

		

	$('#inputrecipe').on('click' , function(){

		 title = $('#rtitle').val();

		 cont = $('#cont').val();

		

		//저장된 아이디가 꼭 필요하다. ( 로그인시 저장된 아이디)

		// in = 

		$.ajax({

			url : '<%=request.getContextPath()%>/recipe/recipeinput.do' ,

			type : 'get',

			data : {

				'title' :  title,

				'cont' : cont

			} , 

			success : function(res){

				//서버 재 업로드 

				location.reload(true);

				

			},

			error : function(xhr){

				alert("상태 : " + xhr.status);

			},

			

			dataType : 'json'

			

			

		})	

			

		

	})

	

	

	

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





















	

	

<!-- 레시피 등록하는 모달 창  -->	

	

<div class="container">



<!-- Trigger the modal with a button -->

<!-- 레시피 등록하기 버튼 -->

  <button type="button" id="inputrecipe" class="btn btn-info btn-xsm" data-toggle="modal" data-target="#myModal">레시피등록하기</button>





  <!-- Modal -->

  <div class="modal fade" id="myModal" role="dialog">

    <div class="modal-dialog modal-lg">

      <div class="modal-content">

        <div class="modal-header">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Modal Header</h4>

        </div>

        <div class="modal-body">

          <h3>쿡마켓 레시피 등록하기</h3>

          

          

          

          <!-- <form id="rform" action="" method="post" enctype="multipart/form-data"> -->

          	

          	<form id="rform">

          	<label>제목</label><input type="text" id="rtitle"><br><br>

          	<label>내용</label><br>

          	<textarea cols="100" rows="50" id="cont"></textarea><br><br>

          	<label>첨부파일</label>

          	<input type="file" id="rfile"><br><br>

          	<input type="submit" value="글 저장하기" id="save">

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

 List<RecipeVO> recipeList = (List<RecipeVO>)request.getAttribute("recipeList");  



 String color = "panel-primary"; 





 //for(RecipeVO revo : recipeList ){

	for(int i = 0 ; i < recipeList.size() ; i++){ 

	 

	//페이지에 바 색상을 3가지 색상으로 나누려고 구분함 

	 if (i % 3 == 1 ){ 

		 color = "panel-primary"; 

	 }else if (i % 3 == 2 ) {

		color = "panel-danger";

	}else {

		color = "panel-success";

		

	}

	

	

	

	 

%>





    <div class="col-sm-4">

      <div class="panel <%=color %>">

        <div class="panel-heading title"><%=recipeList.get(i).getRb_title()%></div>

        <div class="panel-body"><img src="<%=request.getContextPath() %>/image/<%=recipeList.get(i).getRb_cod()%>.jpg" class="img-responsive" id="<%=recipeList.get(i).getRb_cod()%>" style="width:100%" alt="검사중"></div>

        <div class="panel-footer"><%=recipeList.get(i).getRb_content()%></div>

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
