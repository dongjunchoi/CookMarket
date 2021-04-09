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
    
    #recipegif {
    width : 300px;
    height : 200px;
    
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



		//PDF 생성하기

		$('#savePdf').on('click', function(){

			//PrintDiv(null);
			
			//pdf_wrap 을 canvas 객체로 변환
			var div = $('#pdf_wrap')[0];
			console.log(div.innerHTML);
			
			 html2canvas($('#pdf_wrap')[0]).then(function(canvas){

				//캔버스를 이미지로 변환
				downloadURI(canvas, "testImg.png");

				var imgData = canvas.toDataURL('image/png'); 
				

				//이미지 가로 길이

				var imgWidth = 190; 

				//출력 페이지 세로 길이 계산  A4 기준

				var pageHeight = imgWidth * 1.414;

				var imgHeight = canvas.height*imgWidth/canvas.width; 

				var heightLeft = imgHeight;

				var margin = 0; // 출력 페이지 여백설정

				var doc = new jsPDF('p', 'mm');

				var position = 0;
				
				console.log("imgHeight  : " + imgHeight  + ",  heightLeft: " + heightLeft + ",  pageHeight : " + pageHeight );

				console.log(" canvas.height  : " +  canvas.height  + ", canvas.width: " + canvas.width );


				//첫 페이지 출력

				//이미지를 기반으로 pdf 생성

				doc.addImage(imgData, 'PNG' , margin , position, imgWidth, imgHeight );

				heightLeft -= pageHeight;

				console.log("imgHeight  : " + imgHeight  + ",  heightLeft: " + heightLeft + ",  pageHeight : " + pageHeight );
				//한 페이지 이상일 경우 루프를 돌면서 출력한다.

				while (heightLeft >= 20) {

	       			position = heightLeft - imgHeight;

	        		doc.addPage();

	        		doc.addImage(imgData, 'png', 0, position, imgWidth, imgHeight);

	        		heightLeft -= pageHeight;
	    		}
				//pdf 저장 
				doc.save('file.pdf') 
			}); 
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
		location.href='<%=request.getContextPath()%>/recipe/recipeDelete.do?rbcod=' + rbcod
		
		

	})
	
	
	//레시피 수정 버튼클릭하면 원래 내용을 띄워주기
	$('.updateRecipe').on('click' , function(){
			
		//textarea 아이디 텍스트에 레시피 글을 쓴 내용을 입력하겠다.
		
		//RB_CONTENT 를 얻어오기 
		
		console.log($('#pcontent').text().trim());
		//pdf_wrap 의 p 태그 
	 	$("#recipecontupdate").val($('#pcontent').text().trim()); 
		
		
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
	
	//이미지(png)로 다운로드
function PrintDiv(div){
	div = $('#pdf_wrap')[0]
	html2canvas(div).then(function(canvas){
		var myImage = canvas.toDataURL();
		downloadURI(myImage, "저장이미지이름.png") 
	});
}

function downloadURI(uri, name){
	var link = document.createElement("a")
	link.download = name;
	link.href = uri;
//	document.body.appendChild(link);
	document.body.appendChild(uri);
//	link.click();
}

</script>



<body>



	<%

		RecipeVO oneRecipe = (RecipeVO) request.getAttribute("oneRecipe");



		//작성자

		String id = oneRecipe.getId();
		String sessionId = (String)session.getAttribute("id");
		
		//세션사용실제로 할때는 이부분 없애줘야 한다. 
		sessionId = "coral";

		//추천수

		int comend = oneRecipe.getRb_comend();



		//제목

		String title = oneRecipe.getRb_title();

		//내용

		String content = oneRecipe.getRb_content();



		//댓글 등록을 위해 원글 코드가 필요하다. 

		String rbcod = oneRecipe.getRb_cod();



		//댓글 여러개 가지고 오기 전체 행 여러개 가지고 오기  

		List<RecipeReviewVO> replyList = (List<RecipeReviewVO>) request.getAttribute("replylist"); //내용

	%>





   <br><br>

	<!-- 메인 body -->

	<div class="container-fluid text-center">

		<div class="row content">

			<!-- 수정이수정3 여기 두줄 지움 -->

	

				<!--  <video src="" width="600" height="500" controls autoplay>비디오가로딩중입니다.</video> -->

					

				<!-- 메인부분이면서 pdf 에 저장할 부분 -->

				
					
				
				<br>
				
				<div id="pdf_wrap">	
				<img src="<%=request.getContextPath() %>/image/Vanilla-1s-280px (2).gif	"  id="recipegif"><br><br>
					
				
				
				<img class="mainimg" src="<%=request.getContextPath() %>/image/<%=oneRecipe.getFilename()%>"  id="<%=oneRecipe.getRb_cod()%>" >	
				
				
				
				
					<h1><%=title%></h1>
				
				
									<hr>
				
					<h3>레시피 내용</h3>
					
				
					<div id="pcontent"  style="white-space:pre;" ><%=content%></div>
			 
				</div>	





				

				<!-- 신고하기버튼 -->
				<input type="button" class="btn btn-warning alert1 " value="신고하기">
			

				<label><input type="checkbox" name="check" value="부적절한 컨텐츠">부적절한컨텐츠</label>

				<label><input type="checkbox" name="check" value="광고">광고</label>

				<label><input type="checkbox" name="check" value="도배">도배</label>

				<label><input type="checkbox" name="check" value="기타">기타</label>
				<br><br>

				<!-- PDF 저장하기 버튼 -->

				<button type="button" class="btn btn-primary" id="savePdf">PDF 저장</button>
				
				
				
				
				
				

				



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
				if(id.equals(sessionId)){
				%>
				<input type="button" value="레시피 삭제" id="<%=oneRecipe.getRb_cod()%>" class="deleteRecipe btn btn-primary" >
				<input type="button" value="레시피 수정" id="<%=oneRecipe.getRb_cod()%>" class="updateRecipe btn btn-primary">
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

	



<!-- FOOTER 지움 수정이수정3 -->


</body>

</html>