<%@page import="middle.market.vo.ClassVO"%>
<%@page import="middle.market.vo.ClassReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!--   <script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>  -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript"
	src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<style>
body {
	color: #000080;
	background-color: #F0F8FF;
}

footer {
	background-color: #FFB6C1;
	padding: 25px;
}

.container-fluid {
	
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
    width: 1300px;
}

img {
	width: 1000px;
	height: 500px;
}

iframe{
	width : 90%;
	height : 500px;
}

#className{
	color: brown;
    font-size: 6em !important; 
}

#pcontent {
    
    font-size: 30px;
    text-align: left;
    margin-left: 120px;
    color: black;
}


</style>
</head>


 
<script type="text/javascript">
$(function(){
	   
	//삭제버튼 클릭
	$(".btnDelete").on("click", function(){
		var cbcode = $(this).attr('id');
		console.log("검사1jsp : " + cbcode); 
		
		location.href = '<%=request.getContextPath()%>/class/classDelete.do?cbcod=' + cbcode;

	})
	
	 //레시피 수정 버튼클릭하면 원래 내용을 띄워주기
   $('#updateClass').on('click' , function(){ 
      
      $('#replyUpdateModal').modal('show'); 
         
   })

	// 댓글등록
		 
			 replyCont = $('#text').val(); 

			 $('#submitReply').on('click' , function(){
			 
				 var rbcod = $('img').attr("id");
			
				
		        replyContent = $(this).parents(".success").find('#text').val();
		        console.log(replyContent)
				 $.ajax({                                   
			
					url :  '<%=request.getContextPath()%>/class/classReviewInsert.do',
					
					type : 'post',

					data : {

						'replyCont' : replyContent,

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
			 
		//댓글 수정 버튼

			$(".updateReply").on("click", function(){
				console.log("==>" +  $(this).parent().parent().find(".replyCont").text().trim());
				
				$("#ba_cod").val($(this).attr("id"));
				$("#replcontupdate").val($(this).parent().parent().find(".replyCont").text().trim());
				$("#replyUpdateModal").modal('show');
			});
		 
		 	$('#savereply').on('click' , function(){
//		  		alert("시험");
				var bacod =  $("#ba_cod").val();
				
				var updateCont = $('#replcontupdate').val();
				console.log(bacod);
				
				
				$.ajax({
					url : '<%=request.getContextPath()%>/class/classReviewUpdate.do',
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
					url : '<%=request.getContextPath()%>/class/classReviewDelete.do',
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
			
	
});	



</script>


<body>



<%
 ClassVO classView = (ClassVO)request.getAttribute("classVo");
 
 //클래스 이름
 String className = classView.getClass_name();
 //클래스 게시판ID
 String id = classView.getId();

 
 
 //클래스코드
 String sessionId = (String)session.getAttribute("id");
// sessionId = "coral";
 
 String class_cod = classView.getClass_cod();
 //클래스내용
 String content = classView.getCb_content();
 //클래스 가격
 String price = classView.getClass_price();
 //클래스 시작일
 String startDate = classView.getC_startDate();
 //클래스 종료일
 String endDate = classView.getC_endDate();
 //이미지 이름
 String fileName = classView.getFileName();
 //진행여부
 String status = classView.getC_status();

  

//댓글 여러개 가지고 오기 전체 행 여러개 가지고 오기  

List<ClassReviewVO> reviewList = (List<ClassReviewVO>) request.getAttribute("reviewList"); //내용
 
 %>

	<!-- 메인 body -->

	<div class="container-fluid text-center">

		<div class="row content">

			<img src="../upload/<%=classView.getFileName() %>"
				id="<%=classView.getClass_cod()%>">

			<div id="pdf_wrap">
				<h1 id="className"><%=className%></h1>
				<hr>
				<div id="pcontent" style="white-space: pre;">
					<p><%=content%></p><span>개강 :<%=startDate %><br>종강 : <%=endDate %><br>가격 :<%=price %><br>진행여부:<%=status %>
					</span>
				</div>
			</div>
			<div>
				<h1>찾아오시는길</h1>
				<iframe name="ff" src="../public/kakaoMapAPI.html"></iframe>
			</div>

			<div class="reply">

				<h3>댓글</h3>

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
										value="댓글등록"></span></td>

								<td><span></span></td>

								<td><span></span></td>

							</tr>





							<%

									String[] reviewColor = { "success", "danger", "info", "warning", "active" };

									int colorIndex = 0;

									for (int i = 0; i < reviewList.size(); i++) {

										colorIndex = (int) (Math.random() * 5);





										String reviewId = reviewList.get(i).getId();

										String reviewCont = reviewList.get(i).getCr_content();

										String reviewDate = reviewList.get(i).getCr_startDate();
										
										String reviewCod = reviewList.get(i).getCr_cod();

								%>
	
							<tr class="<%=reviewColor[colorIndex]%>">

								<td><%=reviewId%></td>

								<td class="replyCont"><%=reviewCont%></td>

								<td class="ForBacod"><%=reviewDate%></td>
								<!-- 수정이수정 -->
								
								<%if(reviewId.equals(sessionId) || sessionId.equals("admin")){ %>
								<td><input type="button" value="삭제" id="<%=reviewList.get(i).getCr_cod() %>" class="btn btn-info btn-xsm deleteReply">
					 				<input type="button" value="수정" id="<%=reviewList.get(i).getCr_cod() %>" class="btn btn-info btn-xsm updateReply"> 
								<%} %>
									<!-- 
 -->
									<div class="modal fade" id="replyUpdateModal" role="dialog">
										<div class="modal-dialog modal-lg">

											<div class="modal-content">

												<div class="modal-header">

													<button type="button" class="close" data-dismiss="modal">&times;</button>

													<h4 class="modal-title">댓글 수정</h4>

												</div>

												<div class="modal-body">

													<h7>댓글 수정하기</h7>
													<form id="rform">
														<label>댓글입력</label><br>
														<textarea cols="40" rows="5" id="replcontupdate"></textarea>
														<br>
														<br> <input type="hidden" id="ba_cod" value="">
														<input type="button" value="댓글수정하기" id="savereply">
													</form>

												</div>

												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
												</div>
											</div>

										</div>
									</div>
								<td>
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


		


		 <input type="hidden" name="class_cod"  value="<%=class_cod %>">
		
	
<%
	if(id.equals(sessionId) || sessionId.equals("admin")){
%>	
			
 		<button id="<%=classView.getClass_cod() %>" type="button" class="btnDelete btn btn-info btn-xsm" >삭제</button>
<%--  	<button id="<%=classView.getClass_cod() %>" type="button" class="btnDelete btn btn-info btn-xsm" name="class_cod">삭제</button> --%>
    	<button type="button" id="updateClass" class="btn btn-info btn-xsm" data-toggle="modal" data-target="#myModal">클래스수정하기</button>
<%
	}
%>
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-lg">

					<div class="modal-content">

						<div class="modal-header">

							<button type="button" class="close" data-dismiss="modal">&times;</button>

							<h4 class="modal-title">클래스 수정하기</h4>

						</div>

						<div class="modal-body">

							<h7>클래스 수정하기</h7>
							<form id="classUpdateform" method="post"
								action="<%=request.getContextPath()%>/class/classUpdate.do"
								enctype="multipart/form-data">
								<input type="hidden" name="class_cod" id="class_cod"
									value="<%=classView.getClass_cod() %>"> <label>제목</label><input
									type="text" id="ctitle" name="ctitle"><br>
								<br> <label>강사명 </label><span> <%=session.getAttribute("id") %></span><br>
								<br> <label>내용</label><br>
								<textarea name="content" id="content" cols="60" rows="30"></textarea>
								<br>
								<br> <label>시작날짜</label><input type="date" name="startDate"
									id="startDate"><br>
								<br> <label>종료날짜</label><input type="date" name="endDate"
									id="endDate"><br>
								<br> <label>가격</label><input type="text" name="price"
									id="price"><br>
								<br> <label>진행상태</label> <select name="status" id="status">
									<option value="진행중">진행중</option>
									<option value="시작전">시작전</option>
									<option value="종료">종료</option>
								</select> <br> <label>첨부파일</label> <input type="file" name="cfile"
									id="cfile"><br>
								<br> <input type="submit" value="클래스 수정하기" id="updateClass">
							</form>

						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>

			<br>
			<h3>-</h3>


		</div>





		<!-- 수정이수정3 메인오른쪽 두줄 지움 -->

	</div>





	<!-- FOOTER 지움 수정이수정3 -->


</body>

</html>