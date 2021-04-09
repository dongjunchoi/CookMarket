<%@page import="middle.market.vo.GroceryVO"%>
<%@page import="middle.market.vo.NoticeVO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="middle.market.vo.UserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>관리자 페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
	<script type="text/javascript">
$(function(){
	// 회원목록버튼 클릭
	$("#btnList").on("click", function(){
		location.href = "<%=request.getContextPath()%>/grocery/groceryList.do";
	});
	
	var chkgrocery_cod = "";  // 중복 체크할 때의 ID가 저장될 변수
	
	// 중복확인버튼 클릭
	$("#idCheck").on("click", function(){
		var grocery_cod = $("#grocery_cod").val(); // 입력한 회원ID 읽어오기
		if(grocery_cod==""){
			alert("회원ID를 입력하세요.");
			$("#grocery_cod").focus();
			return;
		}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/grocery/groceryIdCheck.do",
			method : "post",
			data : { "grocery_cod" : grocery_cod },
			dataType : "json",
			success : function(result){
				//alert(result);
				if(result=="OK"){  // 중복되지 않을 때
					$("#idChkResult").html("사용가능ID");
					chkgrocery_cod = grocery_cod;  // 검사가 완료된 회원ID를 전역변수에 저장
				}else{ // 중복될 때
					$("#idChkResult").html("ID중복 - 사용불가");
					chkgrocery_cod = "";
				}
			},
			error : function(xhr){
				alert("오류 - 상태값 : " + xhr.status);
			}
		});
		
	});
	
	// 저장버튼클릭 --> form의 submit될 때
	$("#groceryForm").on("submit", function(){
		var grocery_cod = $("#grocery_cod").val(); 
		var idchk = $("#idChkResult").html().trim();
		if(chkgrocery_cod!= grocery_cod || idchk!="사용가능ID"){
			alert("ID가 중복됩니다. 새로운 ID를 입력하세요.");
			return false;  // 서버로의 전송을 취소한다.
		}
		return true;  // 서버로 전송작업을 수행한다.
	});
	
	
	
});

</script>				
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a> <img src="../image/logo2.png"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
			<!-- 수정부분 경로 넣음 -->
					<li><a href="<%=request.getContextPath() %>/admin/adminMain.do">Home</a></li>
					<li><a href="<%=request.getContextPath() %>/admin/clientAdmin.do">회원관리</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="<%=request.getContextPath() %>/admin/boardAdmin.do">게시판관리<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
						      <li><a href="<%=request.getContextPath() %>/recipe/Recipemain.do">레시피 게시판</a></li>
							<li><a href="<%=request.getContextPath() %>/admin/noticeListAdmin.do">공지사항</a></li>
							<li class="active"><a href="<%=request.getContextPath() %>/grocery/groceryList.do">식품관리</a></li>							
							<li><a href="<%=request.getContextPath() %>/class/classList.do">클래스게시판</a></li>
							
						</ul></li>
				</ul>
				  <!-- 수정부분 로그아웃 경로 넣음 -->
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<%=request.getContextPath()%>/cookmarket/Cookmarket.do"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
  
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
     
    </div>
    <div class="col-sm-8 text-left"> 
      <h1>식품등록</h1>
      <input class="form-control" id="myInput" type="text" placeholder="식품 검색">
  <br>
			
	

<form id="groceryForm" method="post" 
	   action="<%=request.getContextPath()%>/grocery/groceryInsert.do"
	   enctype="multipart/form-data">
<table class="table table-hover">


<tbody id="myTable">
	<tr>
	</tr>
	<tr>
		<th>식료품명</th>
		<th>
			<input type="text" name="g_name" id="g_name">
		</th>
	</tr>
	<tr>
		<th>가격</th>
		<th>
			<input type="text" name="g_price" id="g_price">
		</th>
	</tr>
	<tr>
		<th>첨부파일등록</th>
		<td><input type="file" id="gfile" name="gfile"></td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="저장">
			<input type="reset" value="취소">
			<input type="button" value="회원목록" id="btnList">
		</th>
	</tr>	
	
</tbody>
	</table>
</form>
</div>


				

    </div>
      </div>
    
 

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>



</body>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</html>