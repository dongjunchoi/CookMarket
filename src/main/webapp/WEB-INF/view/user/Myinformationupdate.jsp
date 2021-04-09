<%@page import="middle.market.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang=ko dir="ltr">

<head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta charset="utf-8">
    <meta http-equiv="content-type" content="text/html" charset="utf-8">
    <meta name="viewport" content="width=device-width, viewport-fit=cover', initial-scale=1, user-scalable=no, shrink-to-fit=no">
    <meta name="naver-site-verification" content="4b50d2f7153266cc1244c9e6320a62b2ca97d83e" />
    <link rel="apple-touch-icon" sizes="180x180" href="/public/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/public/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/public/favicon/favicon-16x16.png">
    <link rel="manifest" href="/public/favicon/site.webmanifest">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="theme-color" content="#ffffff">
    <link rel="stylesheet" href="/public/css/popup.css">
    <link rel="shortcut icon" href="/public/favicon/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/public/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../public/popup.css">
    <link rel="shortcut icon" href="/public/favicon/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/public/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../public/shopstyle.css?ver=1607311742">
    <link rel="stylesheet" href="../public/stylep.css?ver=887788">
    <link rel="stylesheet" href="../public/font-awesome.min.css">
    <script src="../public/js/jquery-latest.min.js"></script>
    <script src="../public/js/jquery.cookie.js"></script>
    <script src="../public/js/swiper.min.js"></script>
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-131050684-1"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <noscript><img height="1" width="1" style="display:none"
                   src="https://www.facebook.com/tr?id=336321937762415&ev=PageView&noscript=1"
        /></noscript>
        <style>
        	.tel_write{
        		width : auto;
        	}
        	.btn-info{
        		background-color: white;
        	}
        </style>
        
        <script>
			$(function(){
				$('#changmail').on('click',function(){
					$('#myModal').modal('show');
				})
				$('#save').on('click',function(){
					email = $('#save').val();
					$(email).append($('#email'))
					
				})
			})
        </script>
    <!-- End Facebook Pixel Code -->
    <title>술담화 :: 찾아오는 인생술</title>
</head>

<body>
        <div id="wrap">
        <div id="header">
            <div id="header_content">
                <input type="hidden" name="loginConfirm" value="">
                <label for="menuCheck" class="sidemenu_button">
                    <span class="icon_bar"></span>
                    <div class="menu">메뉴</div>
                </label>
     
                <a class="logo" href="/shop/">
                    <img src="../image/logo.png">
                </a>
<!--                 <label for="cartCheck" class="cart_button" onclick="reTotalPrice('');">
                    <img src="/public/img/shop/cart_png.png">
                    <span>0</span>
                </label> -->
                <div id="header_login_group">
                    <a href="<%=request.getContextPath() %>/mypage/Mypagemain.do">마이페이지</a><a href="<%=request.getContextPath() %>/cookmarket/Cookmarket.do">로그아웃</a><a href="충전소메인.html">충전소</a>
                </div>
            </div>
            <!-- sidemenu start -->
            <input type="checkbox" id="menuCheck" class="inputhidden">
            <label for="menuCheck" id="sidemenu_bg"></label>
            <div id="sidemenu">
                <div class="sidemenu_content">
                                            <div class="sidemenu_login_top">
                            <div class="sidemenu_login_top_icon"><img src="/public/img/shop/register_icon.png"></div>
                            <div class="sidemenu_login_top_info">
                                <span class="sidemenu_login_userName"><%=session.getAttribute("name") %> 회원님</span>
                                <a href="/dashboard/myDamhwa/" class="sidemenu_login_mypage">내 정보</a>
                                <button onclick="location.href='/login/logout'" class="sidemenu_login_logout">로그아웃</button>
                            </div>
                        </div>
                </div>
            </div>
            <!-- sidemenu end -->
            <!-- cart start -->
 <!--            <form id="cartOrderFrom" action="/order/" method="POST">
                <input type="hidden" id="orderType" name="orderType" value="cart">
                <input type="checkbox" id="cartCheck" class="inputhidden">
                <label for="cartCheck" id="sidemenu_bg"></label>
                <div id="cart">
                    <input type="hidden" id="cartuGUID" name="cartuGUID" value="30876">                    <div class="baskitTotalPrice">
                        <span>현재 총 구매 가격</span>
                        <span id="baskitTotalPrice">0원</span>
                        <div class="TotalPriceIcon"><img src="/public/img/shop/calculator.png"></div>
                    </div>
                    <button type="button" id="cartBtnSubmit" class="buyBtn" name="button">
                        구매하기
                        <div class="TotalPriceIcon">
                            <img src="/public/img/shop/calculator.png">
                        </div>
                    </button>
                    <div class="cart_top">
                        <div class="cart_img"><img src="/public/img/shop/cart_png.png"></div>
                        <div id="cart_length">
                            <div>1</div>
                        </div>
                    </div>
                    <div class="cart_content_event">
                    </div>
                    <div class="cart_content">
                        <div class="cartblank"></div>
                     <script src="/public/js/basket.js"></script>
                    </div>
                    </div>
            </form> -->
            <!-- 장바구니 end -->
            
            
            <div id="nav">
                <div id="nav_content">
                    <input type="checkbox" id="Main_category" class="inputhidden">
                    <div class="nav_set">
                        <a href="<%=request.getContextPath() %>/food/Foodmain.do" class="nav_new">식자재</a>
                        <a href="<%=request.getContextPath() %>/class/Classmain.do" class="nav_best">클래스</a>
                       	<a href="<%=request.getContextPath() %>/event/Eventmain.do" class="nav_HowToUse">이벤트</a>
                        <a href="<%=request.getContextPath() %>/recipe/Recipemain.do" class="nav_event">레시피</a>
                    </div>
                    
                  <!--   <label for="cartCheck" class="cart_pc_btn" onclick="reTotalPrice('30876');" style="position:fixed;">
                        <img src="/public/img/shop/cart_png.png" alt="">
                        <span>1</span>
                    </label> -->
                </div>
            </div>
        </div>
            <%
            	UserVO vo = (UserVO)request.getAttribute("vo");
            %>
        <div id="content" class="dashboard"><div class="myDamhwa_profile">
          <div class="my_profile_title pc">내 정보</div>
    <div class="my_profile_group">
        <div class="myDamhwa_profile_icon">
		<img src="../image/내정보아이콘.png">
        </div>
        <div class="my_profile_name pc">
            <span><%=session.getAttribute("name") %></span>
            <span>님</span>
        </div>
        <div class="myDamhwa_profile_info">
            <div class="myDamhwa_profile_info_Name mobile">
                <span><%=session.getAttribute("name") %></span>
                <span>님</span>
            </div>
            <div class="myDamhwa_profile_info_Class">
                <span>회원등급:</span>
                <span>일반회원</span>
            </div>
            <div class="myDamhwa_profile_info_point">
                <span>사용가능 포인트:</span>
                <span><%=vo.getPoint() %></span>
            </div>
        </div>
    </div>

        <div class="my_side_menu pc">
        <a href="주문내역.jsp"><span>주문내역</span><span></span></a>
        <a href="장바구니.jsp"><span>장바구니</span><span></span></a>
        <a href="<%=request.getContextPath() %>/user/Myinformation.do"><span>내정보</span><span></span></a>
        <a href="충전소.jsp"><span>포인트 충전소</span><span></span></a>
        <a href="<%=request.getContextPath() %>/qnaboard/Qnaboard.do"><span>문의게시판</span><span></span></a>
    </div>

</div><div id="modifylayer"></div>
<div class="newPass">
    <div>
        <div>
            <i onclick="closelayer(this)"></i>
            <span>기존 비밀번호 입력</span>
            <input type="password" name="uPass" class="NewPassword1" placeholder="새 비밀번호">
        </div>
        <div>
            <span>새로운 비밀번호 입력</span>
            <input type="password" name="newPass1" class="NewPassword2" placeholder="비밀번호 확인">
        </div>
        <div>
            <span>새로운 비밀번호 다시 입력</span>
            <input type="password" name="newPass2" class="NewPassword2" placeholder="비밀번호 확인">
        </div>
        <button onclick="password_edit()" class="password_edit_btn">확인</button>
    </div>
</div>
<div class="newEmail">
    <div>
        <div>
            <i onclick="closelayer(this)"></i>
            <span>새로운 이메일 입력</span>
            <input type="text" name="newEmail" value="">
        </div>
        <div>
            <span>새로운 이메일 다시 입력</span>
            <input type="text" name="confirmEmail" value="">
        </div>
        <span onclick="overlapConfirm()">이메일 중복 확인</span>
        <button onclick="email_edit()" class="password_edit_btn">확인</button>
    </div>
</div>
<input type="hidden" name="uGUID" value="30876">
<input type="hidden" name="point" value="0">
<input type="hidden" name="uMEmail" value="">
<div class="my_container myDamhwa_MemberInfo">
				<div class="myDamhwa_MemberInfo_Buyer_edit">
					<div>
						<span>회원정보</span>
					</div>
					<div class="memberInfo-tab">
						<span>회원정보 수정</span>
						<button onclick="userInfoModify()">저장</button>
					</div>
					<div>
						<span>회원명 : <%=session.getAttribute("name")%></span>
					</div>
						<div>
							<span>이메일</span>
						<div>
							<span id="email"><%=vo.getEmail()%></span>
							<input type="button" id="changmail" class="password_edit_btn" value="변경하기">
						</div>
					</div>
					<div>
						<span>연락처</span>
						<div>
							<input type="tel" name="uMPhone" class="tel_write"
								value="<%=vo.getPhone()%>">
							<button class="tel_edit_btn"
								onclick="alert('연락처 변경하시려면 1:1 문의해주세요')">변경하기</button>
						</div>
					</div>
					</div>
					<div>
						<span>
							<a href="<%= request.getContextPath()%>/user/deleteUser.do">탈퇴하기</a>
						</span>
					</div>
				</div>
				<div class="myDamhwa_MemberInfo_Buyer_edit">
        <div style="margin:0"></div>
        <div class="memberInfo-tab">
            <span>배송정보 수정</span>
            <button onclick="orderSaveInfo()">저장</button>
        </div>
        <div>
            <span>우편번호</span>
            <span>
                <input type="text" name="zone_code" style="" value="<%= vo.getZip() %>">
                <input type="button" id="zips" value="우편번호 검색">
                <script type="text/javascript">
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
                </script>
            </span>
        </div>
        <div>
            <span>주소</span>
            <span>
                <input type="text" name="addr01" value="<%= vo.getAddr1() %>">
            </span>
        </div>
        <div>
            <span>상세주소</span>
            <span>
                <input type="text" name="addr02" value="<%=vo.getAddr2()%>">
            </span>
        </div>
        <div>
            <span>배송특이사항</span>
            <span>
                <textarea name="memo" cols="30" rows="3"></textarea>
            </span>
        </div>
    </div>
    </div></div>
<div id="footer">
    <div class="">
        <div class="footer-social">
        </div>
    </div>
    <div class="">
      <ul class="footer-bar">
      </ul>
    </div>
    <div class="damhwaInfo">
      <div class="pcfooter_left">
        <div class="infoNum info02">
            <p>쿡마켓을 이용해주셔서 감사합니다.</p>
            <p>평일 10:00-18:00, 주말 휴무</p>
        </div>
        <div class="info01">
          <p>쿡마켓은 5명의 관리자가 운영하고있습니다.</p>
          <p></p>
        </div>
  
    
      </div>
      <div class="pcfooter_right">
        <div class="info00">
          <p>대덕인재개발원</p>
          <p>402호</p>
          <p>대장: 김건호</p>
          <p>3조 화이팅</p>
        </div>

      </div>
    </div>
  </div>
</div>

  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">이메일 변경</h4>
        </div>
        <div class="modal-body">
          <input type="text" placeholder="이메일 입력">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="svae">저장</button>
        </div>
      </div>
    </div>
  </div>

</body>
</html>