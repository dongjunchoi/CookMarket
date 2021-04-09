<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원가입</title>
	<script  src="./js/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	
	<script src="./js/jquery.serializejson.min.js"></script>
	<script src="./js/userreg.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	.container h2{
		text-align: center;
	}
	#field{
		border: 1px solid red;
	}
	.control-label{
		margin-left: 20%;
	}
	.col-sm-offset-2{
		margin-left: 30%;
	}
</style>

<script>
	$(function(){
		$('#idCk').text("*필수항목").css("color", "red");
		$('#pwCk').text("*필수항목").css("color", "red");
		$('#phoneCk').text("*필수항목").css("color", "red");
		$('#mailCk').text("*필수항목").css("color", "red");
		//취소 버튼(초기화)
		$('#clear').on('click', function(){
			document.location.reload(true);
		})
		
		//아이디 정규식
		$('#id').keyup(function(){
			if(!idcheck()){ return false; }
		})
		//아이디 중복체크
		$('#idbtn').on('click', function(){
			if(!idcheck()){ return false; }
			$.ajax({
				url : '${pageContext.request.contextPath }/IdCheck.do',
				type : 'post',
				data : { "id" : idvalue },
				success : function(res){
					$('#idspan').html(res.sw).css('color','red');
				},
				error : function(xhr){
					alert("상태 : " +xhr.status);
				},
				dataType : 'json'
			})
		})
		
		//비밀번호 정규식 체크
		$('#pwd').keyup(function(){
			if(!pwdcheck()){ return false; }
		})
		//비밀번호 일치여부
		$('#pwd2').keyup(function(){
			if(!pwdcheck()){ return false; }
		})
		
		//전화번호 정규식
		$('#phone').keyup(function(){
			if(!phonecheck()){ return false; }
		})
		
		//email 정규식
		$('#email').keyup(function(){
			if(!mailcheck()){ return false; }
		})
		
		//우편번호 검색
		$('#zips').on('click', function(){
			 new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			            var addr = ''; // 주소 변수
                		 //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('zip').value = data.zonecode;
                        document.getElementById("add1").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("add2").focus();
			        }
			 }).open();
		})
		//가입-회원가입 신청
		$('#joinbtn').on('click',function(){
			if(!regcheck()){ return false; }
			
			idvalue = $('#id').val().trim();
			$.ajax({
				url : '${pageContext.request.contextPath }/LoginJoin.do',
				data : $('#joinform').serializeJSON(),
				type : 'post',
				success : function(res){
					alert(idvalue + "님 " +res.sw);
					if(res.sw=="가입성공"){
						$('#clear').hide();
						location.href="main.do";
					}
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
			
		})
		
		
		
	})
</script>

</head>

<body>
	<div class="box1">

		<div id="result1">
			<div class="container">
				<h2>회원가입</h2>
				<fieldset id="field">
					<br>
					<form id="joinform" class="form-horizontal">
					
						<!-- id -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="id">아이디<br>
								<span id="idCk"></span></label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
							</div>
							<input id="idbtn" class="btn btn-warning" type="button" value="중복검사"> <span id=idspan></span>
						</div>
						
						<!-- pass -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">비밀번호<br>
								<span id="pwCk"></span></label>
							<div class="col-sm-4">
								<input type="password" class="form-control" id="pwd"
									placeholder="password 8~12(영대소문자,숫자,특수문자)" name="pass">
							</div>
						</div>
						<!-- pass확인 -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd2">비밀번호 확인<br>
								<span id="pwreCk"></span></label>
							<div class="col-sm-4">
								<input type="password" class="form-control" id="pwd2"
									placeholder="Enter password" name="pass2">
							</div>
						</div>
						<!-- 이름 -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="name">이름<br>
								<span id="nmCk"></span></label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="name"
									placeholder="Enter name" name="name">
							</div>
						</div>
						<!-- phone -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="phone">전화번호<br><span id="phoneCk"></span></label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="phone" placeholder="000-0000-0000" name="phone">
							</div>
						</div>
						<!-- email -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="email">Email<br>
								<span id="mailCk"></span></label>
							<div class="col-sm-2">
								<input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
							</div>
							<div>
								<p style="float: left;">@</p>
							</div>
							<div class="col-sm-2">
								<select class="form-control" id="mails" name="mails">
									<option value="none">직접입력</option>
									<option value="naver" selected="selected">naver.com</option>
									<option value="daum">daum.net</option>
									<option value="hanmail">hanmail.com</option>
									<option value="google">gmail.com</option>
								</select>
							</div>
							<span id="checked"></span>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2" for="zip">우편번호</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="zip" placeholder="Enter zip" name="zip">
							</div>
							
							<!-- modal -->
							<input id="zips" class="btn btn-success" type="button" value="우편번호검색">
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2" for="add1">주소</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="add1" placeholder="Enter add1" name="add1">
							</div>
							<span id="checked"></span>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2" for="add2">상세주소<br>
								<span id="addrCk"></span></label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="add2" placeholder="Enter add2" name="add2">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label><input type="checkbox" name="remember">
										Remember me</label>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button id="joinbtn" type="button" class="btn btn-info">가입</button>
								<button id="clear" type="reset" class="btn btn-info">취소</button>
								<span id="joinspan"></span>
							</div>
						</div>
					</form>
			</fieldset>
			</div>
		</div>
	</div>
	
	

</body>
</html>