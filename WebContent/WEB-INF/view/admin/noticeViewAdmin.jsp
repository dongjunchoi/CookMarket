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
<body>

<!-- 수정부분 nav~/nav 지우고 복붙 -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a><img src="../image/logo2.png"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
   			<ul class="nav navbar-nav">
   			<!-- 수정부분 경로 넣음 -->
					<li><a href="adminMain.do">Home</a></li>
					<li><a href="<%=request.getContextPath() %>/admin/clientAdmin.do">회원관리</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="<%=request.getContextPath() %>/admin/boardAdmin.do">게시판관리<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
						      <li><a href="<%=request.getContextPath() %>/recipe/Recipemain.do">레시피 게시판</a></li>
							<li class="active"><a href="<%=request.getContextPath() %>/admin/noticeListAdmin.do">공지사항</a></li>
							<li><a href="<%=request.getContextPath() %>/grocery/groceryList.do">식품관리</a></li>							
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
      <h1>회원 목록</h1>
      <input class="form-control" id="myInput" type="text" placeholder="회원 검색">
  <br>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">이름</th>
							<th scope="col">이메일</th>
							<!-- <th scope="col">회원분류</th> -->
							<th scope="col">마지막 로그인</th>
						</tr>
					</thead>
					
<div>


<script type="text/javascript">
$(function(){
	// 회원목록버튼 클릭
	$("#btnList").on("click", function(){
		location.href = "<%=request.getContextPath()%>/admin/noticeListAdmin.do";
	});
	
	// 수정버튼 클릭
	$("#btnUpdate").on("click", function(){
		var form = $("#noticeForm").get(0);
		form.action = "<%=request.getContextPath()%>/admin/noticeUpdateFormAdmin.do";
		form.submit();  // form의 데이터를 서버로 전송
	});
	
	// 삭제버튼 클릭
	$("#btnDelete").on("click", function(){
		var form = $("#noticeForm").get(0);
		form.action = "<%=request.getContextPath()%>/admin/noticeDeleteAdmin.do";
		form.submit();  // form의 데이터를 서버로 전송
	});
	
	
});
</script>
<table class="table table-hover">
<thead>
  <tr>
  	<th>COD</th><th>제목</th><th>날짜</th>
  </tr>
</thead>
<tbody id="myTable">
<%
	NoticeVO noticeVo = (NoticeVO)request.getAttribute("noticeVo");
%>
		  <form id="noticeForm" method="post" action="">
	<input type="hidden" name="n_title" id="n_title" value="<%=noticeVo.getN_title() %>">
		 <tr class="danger">
	<tr>
		<td>코드</td>
		<td><%=noticeVo.getN_code() %></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><%=noticeVo.getN_title() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><%=noticeVo.getN_content() %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=noticeVo.getN_name() %></td>
	</tr>
	<tr>
		<td>작성날짜</td>
		<td><%=noticeVo.getN_date() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" id="btnUpdate" value="수정">
			<input type="button" id="btnDelete" value="삭제">
			<input type="button" value="회원목록" id="btnList">
		</td>
	</tr>	

	</tbody>
	</table>
</div>
					</tbody>
				</table>

    </div>

      </div>
    </div>
 

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

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

</body>
</html>