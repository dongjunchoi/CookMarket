<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
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

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
         <a class="navbar-brand" href="<%=request.getContextPath() %>/admin/adminMain.do"></a>
      <img src="../image/logo2.png">
      <!-- 수정부분 경로 매출관리 빼고 다 덯음 -->
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="adminMain.do">Home</a></li>
        <li><a href="clientAdmin.do">회원관리</a></li>
        <li class="active"><a href="board.do">게시판관리</a></li>
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
      <p><a href="<%=request.getContextPath() %>/recipe/Recipemain.do">레시피 게시판</a></p>
   <%--    <p><a href="<%=request.getContextPath() %>/class/classList.do">요리클래스 게시판</a></p> --%>
      <p><a href="<%=request.getContextPath() %>/grocery/groceryList.do">식료품게시판</a></p>
      <p><a href="<%=request.getContextPath() %>/admin/noticeListAdmin.do">공지사항 게시판</a></p>
    </div>
    <div class="col-sm-8 text-left"> 
      <h1>Welcome</h1>
      <p>게시판 관리 페이지 입니다</p>
      <hr>
      <input class="form-control" id="myInput" type="text" placeholder="게시판 검색">
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
					<tbody id="myTable">
<%-- <%
	

	for(UserVO vo : userList){
%>
						<tr>
							<th scope="row"><a href="<%=request.getContextPath()%>/admin/adminView.do?user_id=<%=URLEncoder.encode(vo.getId(),"UTF-8")%>"><%=vo.getId() %></a></th>
							<td><%=vo.getName() %></td>
							<td><%=vo.getEmail() %></td>
							<td><%=vo.getGradecode() %></td>
							<td><%=vo.getLastlogin() %></td>
						</tr>
<%		
	}
%> --%>
					</tbody>
				</table>



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