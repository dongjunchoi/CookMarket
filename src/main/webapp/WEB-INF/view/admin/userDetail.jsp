
<%@page import="middle.market.vo.UserVO"%>
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
    #btnUpdate,#btnDelete,#btnList{
    	margin-bottom: 10px;
    }
  </style>
  <script type="text/javascript">
  $(function(){
		// 회원목록버튼 클릭
		$("#btnList").on("click", function(){
			location.href = "<%=request.getContextPath()%>/admin/clientAdmin.do";
		});
		
		// 수정버튼 클릭
		$("#btnUpdate").on("click", function(){
			var form = $("#userForm").get(0);
			form.action = "<%=request.getContextPath()%>/admin/clientUpdateForm.do";
			form.submit();  // form의 데이터를 서버로 전송
		});
		
		// 삭제버튼 클릭
		$("#btnDelete").on("click", function(){
			var form = $("#userForm").get(0);
			form.action = "<%=request.getContextPath()%>/admin/clientDelete.do";
			form.submit();  // form의 데이터를 서버로 전송
		});
	});
  </script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a>  <img src="../image/logo2.png"></a>
      
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
  <!-- 수정부분 경로 다 덯음 -->
				<ul class="nav navbar-nav">
					<li><a href="adminMain.do">Home</a></li>
					<li class="active"><a href="<%=request.getContextPath() %>/admin/clientAdmin.do">회원관리</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="<%=request.getContextPath() %>/admin/boardAdmin.do">게시판관리<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
						      <li><a href="<%=request.getContextPath() %>/recipe/Recipemain.do">레시피 게시판</a></li>
							<li><a href="<%=request.getContextPath() %>/admin/noticeListAdmin.do">공지사항</a></li>
							<li><a href="<%=request.getContextPath() %>/grocery/groceryList.do">식품관리</a></li>							
							<%-- <li><a href="<%=request.getContextPath() %>/class/classList.do">클래스게시판</a></li> --%>
							
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
<%
	UserVO vo =(UserVO) request.getAttribute("userDetail");
%>
	<form id="userForm" method="post" action="">
	<input type="hidden" name="user_id" id="user_id" value="<%=vo.getId() %>">
      <table class="table table-bordered">
						<tr>
							<td scope="col">ID</td>
							<td><%=vo.getId() %></td>
						</tr>
						<tr>
							<td scope="col">NAME</td>
							<td><%=vo.getName() %></td>
						</tr>
						<tr>
							<td scope="col">EMAIL</td>
							<td><%=vo.getEmail() %></td>
						</tr>
						<tr>
							<td scope="col">PHONE</td>
							<td><%=vo.getPhone() %></td>
						</tr>
						<tr>
							<td scope="col">GRADECODE</td>
							<td><%=vo.getGradecode() %></td>
						</tr>
						<tr>
							<td scope="col">POINT</td>
							<td><%=vo.getPoint() %></td>
						</tr>
						<tr>
							<td scope="col">LASTLOGIN</td>
							<td><%=vo.getLastlogin() %></td>
						</tr>
						<tr>
							<td scope="col">ADDR</td>
							<td><%=vo.getAddr1() %> <%=vo.getAddr2() %></td>
						</tr>
						<tr>
							<td scope="col">WORK_COD</td>
							<td><%=vo.getWork_cod() %></td>
						</tr>
				</table>
			<div class="btn-group">
 			<button type="button" class="btn btn-primary">수정</button>
  			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
    		<span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu">
			    <li><a href="#">전체 수정</a></li>
			    <li><a href="#">이름 수정</a></li>
			  </ul>
			<input type="button" class="btn btn-primary" id="btnDelete" value="삭제">
			<input type="button" class="btn btn-primary" id="btnList" value="회원목록">
			</div>
    </form>
    </div>
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
</body>
</html>