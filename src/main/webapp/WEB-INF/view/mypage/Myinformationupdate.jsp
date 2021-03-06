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
    
    <script>
    	$(function(){
    		$('#addrsave').on('click',function(){
    		id = <% session.getAttribute("id");%>
    		zip = $('#zip').val();
    		add1 = $('#add1').val();
    		add2 = $('#add2').val();
    			$.ajax({
    				url : '<%=request.getContextPath()%>/user/AddrUpdate.do',
    				data : {"zip":zip, "add1":add1, "add2":add2},
    				type : 'post',
    				success : function(res){
    					alert("????????????");
    				},
    				error : function(xhr){
    					alert("????????????");
    					//alert("?????? : " + xhr.status);
    				},
    				dataType : 'json'
    			})			    			
    		})
    	})
    </script>
    
    <title>???????????????</title>
</head>

<body>
        <div id="wrap">
        <div id="header">
            <div id="header_content">
                <input type="hidden" name="loginConfirm" value="">
                <label for="menuCheck" class="sidemenu_button">
                    <span class="icon_bar"></span>
                    <div class="menu">??????</div>
                </label>
     
                <a class="logo" href="<%=request.getContextPath() %>/cookmarket/Cookmarketmain.do">
                    <img src="../image/logo.png">
                </a>
<!--                 <label for="cartCheck" class="cart_button" onclick="reTotalPrice('');">
                    <img src="/public/img/shop/cart_png.png">
                    <span>0</span>
                </label> -->
                <div id="header_login_group">
                    <a href="<%=request.getContextPath() %>/mypage/Mypagemain.do">???????????????</a>
                    <a href="<%=request.getContextPath() %>/cookmarket/Cookmarket.do">????????????</a>
                    <a href="<%=request.getContextPath()%>/mypage/Coinmain.do">?????????</a>
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
                                <span class="sidemenu_login_userName"><%=session.getAttribute("name") %> ?????????</span>
                                <a href="/dashboard/myDamhwa/" class="sidemenu_login_mypage">??? ??????</a>
                                <button onclick="location.href='/login/logout'" class="sidemenu_login_logout">????????????</button>
                            </div>
                        </div>
                </div>
            </div>
            <!-- sidemenu end -->
            
          <!--   <!-- cart start -->
            <form id="cartOrderFrom" action="/order/" method="POST">
                <input type="hidden" id="orderType" name="orderType" value="cart">
                <input type="checkbox" id="cartCheck" class="inputhidden">
                <label for="cartCheck" id="sidemenu_bg"></label>
                <div id="cart">
                    <input type="hidden" id="cartuGUID" name="cartuGUID" value="30876">                    <div class="baskitTotalPrice">
                        <span>?????? ??? ?????? ??????</span>
                        <span id="baskitTotalPrice">0???</span>
                        <div class="TotalPriceIcon"><img src="/public/img/shop/calculator.png"></div>
                    </div>
                    <button type="button" id="cartBtnSubmit" class="buyBtn" name="button">
                        ????????????
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
            </form>
            ???????????? end -->
            
            
            <div id="nav">
                <div id="nav_content">
                    <input type="checkbox" id="Main_category" class="inputhidden">
                    <div class="nav_set">
                        <a href="<%=request.getContextPath() %>/grocery/Foodmain.do" class="nav_new">?????????</a>
                        <a href="<%=request.getContextPath() %>/class/Classmain.do" class="nav_best">?????????</a>
                        <a href="<%=request.getContextPath() %>/recipe/Recipemain.do" class="nav_event">?????????</a>
                    </div>
                    
                    <!-- <label for="cartCheck" class="cart_pc_btn" onclick="reTotalPrice('30876');" style="position:fixed;">
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
          <div class="my_profile_title pc">??? ??????</div>
    <div class="my_profile_group">
        <div class="myDamhwa_profile_icon">
		<img src="../image/??????????????????.png">
        </div>
        <div class="my_profile_name pc">
            <span><%=session.getAttribute("name") %></span>
            <span>???</span>
        </div>
        <div class="myDamhwa_profile_info">
            <div class="myDamhwa_profile_info_Name mobile">
                <span><%=session.getAttribute("name") %></span>
                <span>???</span>
            </div>
            <div class="myDamhwa_profile_info_Class">
                <span>????????????:</span>
                <span>????????????</span>
            </div>
            <div class="myDamhwa_profile_info_point">
                <span>???????????? ?????????:</span>
                <span><%=vo.getPoint() %></span>
            </div>
        </div>
    </div>

    		<div class="my_side_menu pc">
				<!-- <a href="????????????.jsp"><span>????????????</span><span></span></a> --> 
				<%-- <a href="<%=request.getContextPath()%>/mypage/Shopbagmain.do"><span>????????????</span><span></span></a> --%>  
				<a href="<%=request.getContextPath()%>/user/Myinformation.do"><span>?????????</span><span></span></a>
				<a href="<%=request.getContextPath()%>/mypage/Coinmain.do"><span>????????? ?????????</span><span></span></a>
			    <a href="<%=request.getContextPath()%>/qnaboard/Qnaboard.do"><span>???????????????</span><span></span></a>
			</div>

</div><div id="modifylayer"></div>
<div class="newPass">
    <div>
        <div>
            <i onclick="closelayer(this)"></i>
            <span>?????? ???????????? ??????</span>
            <input type="password" name="uPass" class="NewPassword1" placeholder="??? ????????????">
        </div>
        <div>
            <span>????????? ???????????? ??????</span>
            <input type="password" name="newPass1" class="NewPassword2" placeholder="???????????? ??????">
        </div>
        <div>
            <span>????????? ???????????? ?????? ??????</span>
            <input type="password" name="newPass2" class="NewPassword2" placeholder="???????????? ??????">
        </div>
        <button onclick="password_edit()" class="password_edit_btn">??????</button>
    </div>
</div>
<div class="newEmail">
    <div>
        <div>
            <i onclick="closelayer(this)"></i>
            <span>????????? ????????? ??????</span>
            <input type="text" name="newEmail" value="">
        </div>
        <div>
            <span>????????? ????????? ?????? ??????</span>
            <input type="text" name="confirmEmail" value="">
        </div>
        <span onclick="overlapConfirm()">????????? ?????? ??????</span>
        <button onclick="email_edit()" class="password_edit_btn">??????</button>
    </div>
</div>
<input type="hidden" name="uGUID" value="30876">
<input type="hidden" name="point" value="0">
<input type="hidden" name="uMEmail" value="">
<div class="my_container myDamhwa_MemberInfo">
				<div class="myDamhwa_MemberInfo_Buyer_edit">
					<div>
						<span>????????????</span>
					</div>
					<div class="memberInfo-tab">
						<span>???????????? ??????</span>
						<button onclick="userInfoModify()">??????</button>
					</div>
					<div>
						<span>????????? : <%=session.getAttribute("name")%></span>
					</div>
						<div>
							<span>?????????</span>
						<div>
							<span id="email"><%=vo.getEmail()%></span>
							<input type="button" id="changmail" class="password_edit_btn" value="????????????">
						</div>
					</div>
					<div>
						<span>?????????</span>
						<div>
							<input type="tel" name="uMPhone" class="tel_write" value="<%=vo.getPhone()%>" style="width: auto;">
							<button class="tel_edit_btn"
								onclick="alert('????????? ?????????????????? 1:1 ??????????????????')">????????????</button>
						</div>
					</div>
					<div>
						<span>
							<a href="<%= request.getContextPath()%>/user/deleteUser.do">????????????</a>
						</span>
					</div>
				</div>
				<div class="myDamhwa_MemberInfo_Buyer_edit">
        <div style="margin:0"></div>
        <div class="memberInfo-tab">
            <span>???????????? ??????</span>
            <button id="addrsave">??????</button>
        </div>
        <div>
            <span>????????????</span>
            <span>
                <input type="text" name="zone_code" style="" id="zip" value="<%= vo.getZip() %>">
                 <input type="button" id="zips" value="???????????? ??????">
            </span>
        </div>
        <div>
            <span>??????</span>
            <span>
                <input type="text" name="addr01" id="add1" value="<%= vo.getAddr1() %>">
            </span>
        </div>
        <div>
            <span>????????????</span>
            <span>
                <input type="text" name="addr02" id="add2" value="<%=vo.getAddr2()%>">
            </span>
        </div>
                 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script>
        		$('#zips').on('click', function(){
       			 new daum.Postcode({
       			        oncomplete: function(data) {
       			            // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ???????????????.
       			            // ????????? ???????????? ????????? ???????????? ????????? ?????????.
       			            var addr = ''; // ?????? ??????
                       		 //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
                               if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
                                   addr = data.roadAddress;
                               } else { // ???????????? ?????? ????????? ???????????? ??????(J)
                                   addr = data.jibunAddress;
                               }	
                               // ??????????????? ?????? ????????? ?????? ????????? ?????????.
                               document.getElementById('zip').value = data.zonecode;
                               document.getElementById("add1").value = addr;
                               // ????????? ???????????? ????????? ????????????.
                               document.getElementById("add2").focus();
       			        }
       			 }).open();
       		})                
                </script>
        <div>
            <span>??????????????????</span>
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
            <p>???????????? ?????????????????? ???????????????.</p>
            <p>?????? 10:00-18:00, ?????? ??????</p>
        </div>
        <div class="info01">
          <p>???????????? 5?????? ???????????? ????????????????????????.</p>
          <p></p>
        </div>
  
    
      </div>
      <div class="pcfooter_right">
        <div class="info00">
          <p>?????????????????????</p>
          <p>402???</p>
          <p>??????: ?????????</p>
          <p>3??? ?????????</p>
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
          <h4 class="modal-title">????????? ??????</h4>
        </div>
        <div class="modal-body">
          <input type="text" id="emailinfo" placeholder="????????? ??????">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="svae">??????</button>
        </div>
      </div>
    </div>
  </div>

</body>
</html>