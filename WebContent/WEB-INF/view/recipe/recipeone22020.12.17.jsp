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

					//????????? ????????? ?????? 

					//location.reload(true);

					//???????????? div ??? ????????????

				 
						location.reload(); 

					},

			error : function(xhr) {

					alert("?????? : " + xhr.status);
									},
			dataType : 'json'
			})

	})



		//PDF ????????????

		$('#savePdf').on('click', function(){

			//PrintDiv(null);
			
			//pdf_wrap ??? canvas ????????? ??????
			var div = $('#pdf_wrap')[0];
			console.log(div.innerHTML);
			
			 html2canvas($('#pdf_wrap')[0]).then(function(canvas){

				//???????????? ???????????? ??????
				downloadURI(canvas, "testImg.png");

				var imgData = canvas.toDataURL('image/png'); 
				

				//????????? ?????? ??????

				var imgWidth = 190; 

				//?????? ????????? ?????? ?????? ??????  A4 ??????

				var pageHeight = imgWidth * 1.414;

				var imgHeight = canvas.height*imgWidth/canvas.width; 

				var heightLeft = imgHeight;

				var margin = 0; // ?????? ????????? ????????????

				var doc = new jsPDF('p', 'mm');

				var position = 0;
				
				console.log("imgHeight  : " + imgHeight  + ",  heightLeft: " + heightLeft + ",  pageHeight : " + pageHeight );

				console.log(" canvas.height  : " +  canvas.height  + ", canvas.width: " + canvas.width );


				//??? ????????? ??????

				//???????????? ???????????? pdf ??????

				doc.addImage(imgData, 'PNG' , margin , position, imgWidth, imgHeight );

				heightLeft -= pageHeight;

				console.log("imgHeight  : " + imgHeight  + ",  heightLeft: " + heightLeft + ",  pageHeight : " + pageHeight );
				//??? ????????? ????????? ?????? ????????? ????????? ????????????.

				while (heightLeft >= 20) {

	       			position = heightLeft - imgHeight;

	        		doc.addPage();

	        		doc.addImage(imgData, 'png', 0, position, imgWidth, imgHeight);

	        		heightLeft -= pageHeight;
	    		}
				//pdf ?????? 
				doc.save('file.pdf') 
			}); 
		});

	 

	 //???????????? ??????

	 

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

					alert("?????? : " + xhr.status);

			},

			dataType : 'json'
	
		
		 })
	 })
//???????????????	 
	 
//?????? ?????? ??????

	//?????? ???????????? ??????
	$(".updateReply").on("click", function(){
		console.log("==>" +  $(this).parent().parent().find(".replyCont").text().trim());
		
		$("#ba_cod").val($(this).attr("id"));
		$("#replcontupdate").val($(this).parent().parent().find(".replyCont").text().trim());
		$("#replyUpdateModal").modal('show');
	});
 
	 //????????? ?????? ?????? ?????? ?????? 
 	$('#savereply').on('click' , function(){
//  		alert("??????");
		var bacod =  $("#ba_cod").val();
		
		var updateCont = $('#replcontupdate').val();
		console.log(bacod);
		
		
		$.ajax({
			url : '<%=request.getContextPath()%>/recipe/recipereplyupdate.do',
			type : 'post',
			data : {
				'bacod' : bacod,
				//?????? ?????? (update) 
				'cont' : updateCont
			} , 
			success : function(res){
				alert(res.sw);
				$('#modal2').modal("hide"); 
				//?????? ??? ????????? 
				location.reload(true);
			},
			error : function(xhr){
				alert("?????? : " + xhr.status);
			},
			dataType : 'json'
			
			
			
		})
		
		
	})   
	

//???????????????	
	
	//?????? ?????? ??????
	$('.deleteReply').on('click' , function(){
		
		//??????
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
				//?????? ??? ????????? 
				location.reload(true);
			},
			error : function(xhr){
				alert("?????? : " + xhr.status);
			},
			dataType : 'json'
			
						
		})
	})
	
	
	
	//????????? ?????? ??????
	
	$('.deleteRecipe').on('click' , function(){
		
		var rbcod = $(this).attr('id'); 
		console.log(rbcod);
		location.href='<%=request.getContextPath()%>/recipe/recipeDelete.do?rbcod=' + rbcod
		
		

	})
	
	
	//????????? ?????? ?????????????????? ?????? ????????? ????????????
	$('.updateRecipe').on('click' , function(){
			
		//textarea ????????? ???????????? ????????? ?????? ??? ????????? ???????????????.
		
		//RB_CONTENT ??? ???????????? 
		
		console.log($('#pcontent').text().trim());
		//pdf_wrap ??? p ?????? 
	 	$("#recipecontupdate").val($('#pcontent').text().trim()); 
		
		
		$('#RecipeUpdateModal').modal('show'); 
		
		
	})
	
	//????????? ???????????? ????????? ?????? ????????? ????????? db??? ??????
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
				//?????? ?????? (update) 
				'cont' : updateContent
			} , 
			success : function(res){
				alert(res.sw);
				$('#modal2').modal("hide"); 
				//?????? ??? ????????? 
				location.reload(true);
			},
			error : function(xhr){
				alert("?????? : " + xhr.status);
			},
			dataType : 'json'
			
			
		})
		
		
		
		
		
		
		
		
		
	})
	
	
	
	
	})
	
	//?????????(png)??? ????????????
function PrintDiv(div){
	div = $('#pdf_wrap')[0]
	html2canvas(div).then(function(canvas){
		var myImage = canvas.toDataURL();
		downloadURI(myImage, "?????????????????????.png") 
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



		//?????????

		String id = oneRecipe.getId();
		String sessionId = (String)session.getAttribute("id");
		
		//????????????????????? ????????? ????????? ???????????? ??????. 
		sessionId = "coral";

		//?????????

		int comend = oneRecipe.getRb_comend();



		//??????

		String title = oneRecipe.getRb_title();

		//??????

		String content = oneRecipe.getRb_content();



		//?????? ????????? ?????? ?????? ????????? ????????????. 

		String rbcod = oneRecipe.getRb_cod();



		//?????? ????????? ????????? ?????? ?????? ??? ????????? ????????? ??????  

		List<RecipeReviewVO> replyList = (List<RecipeReviewVO>) request.getAttribute("replylist"); //??????

	%>





   <br><br>

	<!-- ?????? body -->

	<div class="container-fluid text-center">

		<div class="row content">

			<!-- ???????????????3 ?????? ?????? ?????? -->

	

				<!--  <video src="" width="600" height="500" controls autoplay>??????????????????????????????.</video> -->

					

				<!-- ????????????????????? pdf ??? ????????? ?????? -->

				
					
				
				<br>
				
				<div id="pdf_wrap">	
				<img src="<%=request.getContextPath() %>/image/Vanilla-1s-280px (2).gif	"  id="recipegif"><br><br>
					
				
				
				<img class="mainimg" src="<%=request.getContextPath() %>/image/<%=oneRecipe.getFilename()%>"  id="<%=oneRecipe.getRb_cod()%>" >	
				
				
				
				
					<h1><%=title%></h1>
				
				
									<hr>
				
					<h3>????????? ??????</h3>
					
				
					<div id="pcontent"  style="white-space:pre;" ><%=content%></div>
			 
				</div>	





				

				<!-- ?????????????????? -->
				<input type="button" class="btn btn-warning alert1 " value="????????????">
			

				<label><input type="checkbox" name="check" value="???????????? ?????????">?????????????????????</label>

				<label><input type="checkbox" name="check" value="??????">??????</label>

				<label><input type="checkbox" name="check" value="??????">??????</label>

				<label><input type="checkbox" name="check" value="??????">??????</label>
				<br><br>

				<!-- PDF ???????????? ?????? -->

				<button type="button" class="btn btn-primary" id="savePdf">PDF ??????</button>
				
				
				
				
				
				

				



				<div class="reply">

					<h3>??????</h3>





					<div class="container" id="replydiv">



						<table class="table">

							<thead>

								<tr>

									<th style="width: 15%" id="replyid">?????????</th>

									<th id="replycont">??????</th>

									<th>????????????</th>

									<th>

									<th>

								</tr>

							</thead>



							<tbody>



								<tr class="success">

									<td><span>????????? ???????????????</span></td>

									<td><textarea id="text" rows="5" cols="30"></textarea></td>

									<!--  <td><input type="text" id="replycont" style="width:800px;"></td> -->

									<td><span><input type="button" id="submitReply" 

											value="????????????"></span></td>

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
<!-- ??????????????? -->
									<td>
									<% 
									
									
									
									
									
									
									if(replyId.equals(sessionId)){
									%>

									<input type="button" value="??????" class="btn btn-info btn-xsm deleteReply" id="<%=replyList.get(i).getBa_cod() %>">
									<input type="button" value="??????" id="<%=replyList.get(i).getBa_cod() %>" class="btn btn-info btn-xsm updateReply"> 
									
									<% } %>
									
									
									<%-- <input type="button" value="??????" class="updateReply" id="<%=replyList.get(i).getBa_cod() %>">  --%>
									
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

          								<h7>?????? ????????????</h7>
										<form id="rform">
          									<label>????????????</label><br>
          									<textarea cols="40" rows="5" id="replcontupdate"></textarea><br><br>
          									<input type="hidden" id="ba_cod" value="">
          									<input type="button" value="?????? ????????????" id="savereply">
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

				<!-- reply ??? -->
				
				<!-- ?????? ?????? -->
				
				
				<br>
				<br>
				
				<h3>-</h3>
			
				<%
				if(id.equals(sessionId)){
				%>
				<input type="button" value="????????? ??????" id="<%=oneRecipe.getRb_cod()%>" class="deleteRecipe btn btn-primary" >
				<input type="button" value="????????? ??????" id="<%=oneRecipe.getRb_cod()%>" class="updateRecipe btn btn-primary">
				<%} %>
				
				<div class="modal fade" id="RecipeUpdateModal" role="dialog">
									    <div class="modal-dialog modal-lg">

     									 <div class="modal-content">

       										 <div class="modal-header">

         										 <button type="button" class="close" data-dismiss="modal">&times;</button>

          										 <h4 class="modal-title">????????? ????????????</h4>

        									</div>

        								<div class="modal-body">

          								<h7>????????? ????????? ????????????</h7>
										<form id="aform">
          									<label>??? ??????</label><br>
          									<textarea cols="70" rows="30" id="recipecontupdate"></textarea><br><br>
          									<input type="hidden" id="ba_cod2" value="">
          									<input type="button" value="????????? ????????????" class="saveRecipe" id="<%=oneRecipe.getRb_cod()%>">
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





			<!-- ???????????????3 ??????????????? ?????? ?????? -->

		</div>

	



<!-- FOOTER ?????? ???????????????3 -->


</body>

</html>