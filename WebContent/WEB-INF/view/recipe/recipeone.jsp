<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="middle.market.vo.RecipeReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="middle.market.vo.RecipeVO"%>
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
     <link rel="stylesheet" href="../public/shopstyle.css?ver=1607311742">
    <link rel="stylesheet" href="../public/stylep.css?ver=887788">
    <link rel="stylesheet" href="../public/font-awesome.min.css">
    <script src="../js/jquery-latest.min.js"></script>
    <script src="../js/jquery.cookie.js"></script>
    <script src="../js/swiper.min.js"></script> 
<!--   <script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>  -->
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
  <style>
     body {
    	color : #000080;
 		background-color : 	#F0F8FF;
 	
    }
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
      background-color: #FFB6C1;
      padding: 25px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
    .container-fluid {
    	text-align : center;
    }
    
    img {
    width : 600px;
    height : 500px;
    }
    
    .recipegif {
    width : 300px;
    height : 200px;
    
    }
    
    #heartimg , #peachimg {
    width : 50px;
    height : 50px;
    }
    
    
    
    
  </style>
</head>

<script>
 
 $(document).ready(function(){

	 
	 
	 replyCont = $('#text').val(); 


	
	 $('#submitReply').on('click' , function(){
	 
		 var rbcod = $('.mainimg').attr("id");
		 
		console.log(rbcod);
		
        replyContent = $(this).parents(".success").find('#text').val();
        console.log(replyContent)
		 $.ajax({                                   

			url :  '<%=request.getContextPath()%>/recipe/recipeReviewOne.do',
			
			type : 'post',

			data : {

				'replyCont' : replyContent,

				'rbcod' : rbcod

					},

			success : function(res) {

					alert(res.sw);

					//서버를 재로드 하기 

					//location.reload(true);

					//댓글영역 div 만 새로고침

				 
						location.reload(); 

					},

			error : function(xhr) {

					alert("상태 : " + xhr.status);
									},
			dataType : 'json'
			})

	})



		//PDF 버튼을 누르면 넘어간다. 

		$('#savePdf').on('click', function(){
			
			var rbcod = $('.pcontent').attr('id');
			//var filename = $('.recipegif').attr('id');
			console.log("rbcod 검사 : " +  rbcod )
			//jsp 를 만들어줘서 
			location.href='<%=request.getContextPath()%>/recipe/recipepdfaction.do?rbcod=' + rbcod
				//?content=' + content1
			
			
			


		});

	 

	 //신고하기 버튼

	 

	 $('.alert1').on('click' , function(){
		 
		 var rbcod = $('.mainimg').attr("id");
		 console.log(rbcod);
		 $.ajax({  
			 url :  '<%=request.getContextPath()%>/recipe/recipeAlert.do',
			 type : 'post',
			 data : {
				 'rbcod' : rbcod
				 
			 },
			 success : function(res) {

					alert(res.sw);
					location.reload(); 
			 }, 		
			 error : function(xhr) {

					alert("상태 : " + xhr.status);

			},

			dataType : 'json'
	
		
		 })
	 })
//이수정수정	 
	 
//댓글 수정 버튼

	//댓글 수정버튼 클릭
	$(".updateReply").on("click", function(){
		console.log("==>" +  $(this).parent().parent().find(".replyCont").text().trim());
		
		$("#ba_cod").val($(this).attr("id"));
		$("#replcontupdate").val($(this).parent().parent().find(".replyCont").text().trim());
		$("#replyUpdateModal").modal('show');
	});
 
	 //수정된 댓글 저장 버튼 클릭 
 	$('#savereply').on('click' , function(){
//  		alert("시험");
		var bacod =  $("#ba_cod").val();
		
		var updateCont = $('#replcontupdate').val();
		console.log(bacod);
		
		
		$.ajax({
			url : '<%=request.getContextPath()%>/recipe/recipereplyupdate.do',
			type : 'post',
			data : {
				'bacod' : bacod,
				//수정 내용 (update) 
				'cont' : updateCont
			} , 
			success : function(res){
				alert(res.sw);
				$('#modal2').modal("hide"); 
				//서버 재 업로드 
				location.reload(true);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
			
			
			
		})
		
		
	})   
	

//이수정수정	
	
	//댓글 삭제 버튼
	$('.deleteReply').on('click' , function(){
		
		//버튼
		var bacod = $(this).attr('id'); 
		console.log(bacod);
		
		$.ajax({
			url : '<%=request.getContextPath()%>/recipe/recipereplydelete.do',
			type : 'post',
			data : {
				'bacod' : bacod
			} , 
			success : function(res){
				alert(res.sw);
				//서버 재 업로드 
				location.reload(true);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
			
						
		})
	})
	
	
	
	//레시피 삭제 버튼
	
	$('.deleteRecipe').on('click' , function(){
		
		var rbcod = $(this).attr('id'); 
		console.log(rbcod);
		location.href='<%=request.getContextPath()%>/recipe/recipeDelete.do?rbcod=' + rbcod;
		
		

	})
	
	
	//레시피 수정 버튼클릭하면 원래 내용을 띄워주기
	$('.updateRecipe').on('click' , function(){
			
		//textarea 아이디 텍스트에 레시피 글을 쓴 내용을 입력하겠다.
		
		//RB_CONTENT 를 얻어오기 
		
		console.log($('.pcontent').text().trim());
		//pdf_wrap 의 p 태그 
	 	$("#recipecontupdate").val($('.pcontent').text().trim()); 
		
		
		$('#RecipeUpdateModal').modal('show'); 
		
		
	})
	
	//레시피 수정버튼 눌러서 저장 누르면 내용이 db에 저장
	$('.saveRecipe').on('click' , function(){
		var rbcod2 = $(this).attr('id'); 
		
		var updateContent = $('#recipecontupdate').val(); 
		console.log(rbcod2);
		console.log(updateContent);
		
		$.ajax({
		
			url : '<%=request.getContextPath()%>/recipe/recipeUpdate.do',
			type : 'post',
			data : {
				'rbcod' : rbcod2,
				//수정 내용 (update) 
				'cont' : updateContent
			} , 
			success : function(res){
				alert(res.sw);
				$('#modal2').modal("hide"); 
				//서버 재 업로드 
				location.reload(true);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
			
			
		})
		
		
		
		
		
		
		
		
		
	})
	
	
	
	
	})
	
	
	
	

</script>



<body>
<div id="header">
            <div id="header_content">
                <input type="hidden" name="loginConfirm" value="">
                <label for="menuCheck" class="sidemenu_button">
                    <span class="icon_bar"></span>
              
                </label>
                <a class="logo">
                    <img src="../image/logo.png" style="height: 40px;">
                </a>
                <label for="cartCheck" class="cart_button">
                    <span>0</span>
                </label>
                <div id="header_login_group">
                <%
                	String id = (String)session.getAttribute("id");
                		request.setAttribute("id", id);
                %>
                    <a href="<%=request.getContextPath()%>/mypage/Mypagemain.do">마이페이지</a>
                    <a href="<%=request.getContextPath()%>/cookmarket/Cookmarket.do">로그아웃</a>
                    <a href="<%=request.getContextPath()%>/mypage/Coinmain.do">충전소</a>
                </div>
            </div>

     
            <div id="nav">
                <div id="nav_content">
                    <input type="checkbox" id="Main_category" class="inputhidden">
                    <label for="Main_category" class="Main_category_btn">
                  
					<!-- 수정부분 식자재 경로 넣었고, 이벤트 삭제했습니다 -->
                    </label>
                    <div class="nav_set">
                        <a href="<%=request.getContextPath() %>/grocery/Foodmain.do" class="nav_new">식자재</a>
                        <a href="<%=request.getContextPath() %>/class/classList.do" class="nav_best">클래스</a>
                        <a href="<%=request.getContextPath() %>/recipe/Recipemain.do" class="nav_event">레시피</a>
                    </div>
                    
                    <div class="nav_search">
                        <img src="/public/img/shop/searchIcon.png" alt="">
                    </div>
                    <div class="search_box_goods">
                        <div class="search_box_header">
                            <span>무엇을 찾고 계신가요?</span>
                            <span class="closeSearchBox"><img src="/public/img/shop/close.png" alt=""></span>
                        </div>
                        <form method="GET" id="sdhSearch" action="/sdhsearch/">
                            <div class="search_box_input">
                                <input type="text" id="" name="searchText" value="" placeholder="제품명 혹은 양조장명을 입력해주세요">
                                <button>
                                    <img src="/public/img/shop/searchIcon.png" alt="">
                                </button>
                            </div>
                        </form>
                    
                    </div>
                    <input type="search" id="nav_search_pc" name="nav_search_pc" placeholder="검색" value="" onkeypress="if(event.keyCode===13) {sdhsearch();}">
                    <input type="checkbox" id="cart_pc" class="inputhidden">

                    
<!--                     <label for="cartCheck" class="cart_pc_btn" onclick="reTotalPrice('');" style="position:fixed;"> -->
<!--                         <img src="https://sooldamhwa.com/public/img/shop/cart_png.png" alt=""> -->
<!--                         <span>0</span> -->
<!--                     </label> -->
                </div>
            </div>
        </div>




	<%

		RecipeVO oneRecipe = (RecipeVO) request.getAttribute("oneRecipe");



		//작성자

		String id2 = oneRecipe.getId();
		String sessionId = (String)session.getAttribute("id");
		
		//세션사용실제로 할때는 이부분 없애줘야 한다. 
		//String sessionId = "coral";

		//추천수

		int comend = oneRecipe.getRb_comend();



		//제목

		String title = oneRecipe.getRb_title();

		//내용

		String content = oneRecipe.getRb_content();



		//댓글 등록을 위해 원글 코드가 필요하다. 

		String rbcod = oneRecipe.getRb_cod();

		String filename = oneRecipe.getFilename();

		//댓글 여러개 가지고 오기 전체 행 여러개 가지고 오기  

		List<RecipeReviewVO> replyList = (List<RecipeReviewVO>) request.getAttribute("replylist"); //내용

	%>



	



   <br><br>

	<!-- 메인 body -->

	<div class="container-fluid text-center">

		<div class="row content">

		

	



					

			

				
					
				
				<br>
				
			
				<img src="<%=request.getContextPath() %>/image/Vanilla-1s-280px (7).gif	"  class="recipegif" id="filename"><br>	
				<img class="mainimg" src="<%=request.getContextPath() %>/image/<%=oneRecipe.getFilename()%>"  id="<%=oneRecipe.getRb_cod()%>" >	
				
				
				
				
					<h1><%=title%></h1>
				
				
									<hr>
				
					<h3>레시피 내용</h3>
					
				
					<div class="pcontent"  style="white-space:pre;" id="<%=rbcod%>" ><%=content%></div><br>
			 
			





				

				<!-- 신고하기버튼 -->
				<input type="button" class="btn btn-warning alert1 " value="신고하기">
			

				<label><input type="checkbox" name="check" value="부적절한 컨텐츠">부적절한컨텐츠</label>

				<label><input type="checkbox" name="check" value="광고">광고</label>

				<label><input type="checkbox" name="check" value="도배">도배</label>

				<label><input type="checkbox" name="check" value="기타">기타</label>
				<br><br>

				<!-- PDF 저장하기 버튼 -->

				<button type="button" class="btn btn-primary" id="savePdf">PDF 저장</button><br><br>
				
				
				
				
				
				

				

  

				<div class="reply">

					<img src="<%=request.getContextPath() %>/image/icon-1.1s-47px.gif" id="peachimg" src="피치"  >
					<h3>댓글</h3>
					<img src="<%=request.getContextPath() %>/image/icon-1.1s-47px.gif" id="peachimg" src="피치"  >





					<div class="container" id="replydiv">



						<table class="table">

							<thead>

								<tr>

									<th style="width: 15%" id="replyid">아이디</th>

									<th id="replycont">댓글</th>

									<th>작성시간</th>

									<th>

									<th>

								</tr>

							</thead>



							<tbody>



								<tr class="success">

									<td><span>댓글을 입력하세요</span></td>

									<td><textarea id="text" rows="5" cols="30"></textarea></td>

									<!--  <td><input type="text" id="replycont" style="width:800px;"></td> -->

									<td><span><input type="button" id="submitReply" 

											value="댓글등록" class="btn btn-info btn-xsm"></span></td>

									<td><span></span></td>

									<td><span></span></td>

								</tr>





								<%

									String[] replyColor = { "success", "danger", "info", "warning", "active" };

									int colorIndex = 0;

									for (int i = 0; i < replyList.size(); i++) {

										colorIndex = (int) (Math.random() * 5);

										// 			String idreply = replyList.get(i)[0];

										// 			String contentreply = replyList.get(i)[1];



										String replyId = replyList.get(i).getId();

										String replyCont = replyList.get(i).getBa_content();

										String replyDate = replyList.get(i).getBa_date();

								%>

								<tr class="<%=replyColor[colorIndex]%>">

									<td id="forid"><%=replyId%></td>

									<td class="replyCont"><%=replyCont%></td>

									<td class="ForBacod"><%=replyDate%></td>
<!-- 수정이수정 -->
									<td>
									<% 
									
									
									
									
									
									
									if(replyId.equals(sessionId)){
									%>

									<input type="button" value="삭제" class="btn btn-info btn-xsm deleteReply" id="<%=replyList.get(i).getBa_cod() %>">
									<input type="button" value="수정" id="<%=replyList.get(i).getBa_cod() %>" class="btn btn-info btn-xsm updateReply"> 
									
									<% } %>
									
									
									<%-- <input type="button" value="수정" class="updateReply" id="<%=replyList.get(i).getBa_cod() %>">  --%>
									
									<!-- 
 -->
									<div class="modal fade" id="replyUpdateModal" role="dialog">
									    <div class="modal-dialog modal-lg">

     									 <div class="modal-content">

       										 <div class="modal-header">

         										 <button type="button" class="close" data-dismiss="modal">&times;</button>

          										 <h4 class="modal-title">Modal Header</h4>

        									</div>

        								<div class="modal-body">

          								<h7>댓글 수정하기</h7>
										<form id="rform">
          									<label>댓글입력</label><br>
          									<textarea cols="40" rows="5" id="replcontupdate"></textarea><br><br>
          									<input type="hidden" id="ba_cod" value="">
          									<input type="button" value="댓글 저장하기" id="savereply">
           								</form>
  
        								</div>

       							 			<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        									</div>
      									</div>

    									</div>
									</div>
									
									</td>
									<td></td>

								</tr>

								<%

									}

								%>

							</tbody>

						</table>

					</div>



				</div>

				<!-- reply 끝 -->
				
				<!-- 삭제 수정 -->
				
				
				<br>
				<br>
				
				<h3>-</h3>
			
				<%
				if(id2.equals(sessionId)){
				%>
				<img src="<%=request.getContextPath() %>/image/Heart-1s-200px.gif" id="heartimg" src="하트"  >
				<input type="button" value="레시피 삭제" id="<%=oneRecipe.getRb_cod()%>" class="deleteRecipe btn btn-primary" >
				<input type="button" value="레시피 수정" id="<%=oneRecipe.getRb_cod()%>" class="updateRecipe btn btn-primary">
				<img src="<%=request.getContextPath() %>/image/Heart-1s-200px.gif" id="heartimg" src="하트"  >
				<%} %>
				
				<div class="modal fade" id="RecipeUpdateModal" role="dialog">
									    <div class="modal-dialog modal-lg">

     									 <div class="modal-content">
       										 <div class="modal-header">

         										 <button type="button" class="close" data-dismiss="modal">&times;</button>

          										 <h4 class="modal-title">레시피 수정하기</h4>

        									</div>

        								<div class="modal-body">

          								<h7>레시피 게시글 수정하기</h7>
										<form id="aform">
          									<label>글 입력</label><br>
          									<textarea cols="70" rows="30" id="recipecontupdate"></textarea><br><br>
          									<input type="hidden" id="ba_cod2" value="">
          									<input type="button" value="레시피 저장하기" class="saveRecipe" id="<%=oneRecipe.getRb_cod()%>">
           								</form>
  
        								</div>

       							 			<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        									</div>
      									</div>

    									</div>
									</div>
				
				<br>
				<h3>-</h3>
				

			</div>





			<!-- 수정이수정3 메인오른쪽 두줄 지움 -->

		</div>

	






</body>

</html>