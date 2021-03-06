<%@page import="middle.market.vo.UserVO"%>
<%@page import="middle.market.vo.OrderVO"%>
<%@page import="middle.market.vo.ChargeVO"%>
<%@page import="java.util.List"%>
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
    <link rel="mask-icon" href="../public/favicon/safari-pinned-tab.svg" color="#000000">
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="../public/js/jquery-latest.min.js"></script>
    <script src="../public/js/jquery.cookie.js"></script>
    <script src="../public/js/swiper.min.js"></script>
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-131050684-1"></script>
    
  <style>
.co1{
text-align: center;
}
</style>

    <title>????????? ???????????????</title>
</head>

<body>
     <div id="wrap">
        <div id="header">
            <div id="header_content">
                <input type="hidden" name="loginConfirm" value="">
                <label for="menuCheck" class="sidemenu_button">
                    <span class="icon_bar"></span>
                </label>
     
                <a class="logo" href="<%=request.getContextPath() %>/cookmarket/Cookmarketmain.do">
                    <img src="../image/logo.png">
                </a>
                <label for="cartCheck" class="cart_button" onclick="reTotalPrice('');">
                    <img src="/public/img/shop/cart_png.png">
                    <span>0</span>
                </label>
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
            
            <!-- cart start -->
            <form id="cartOrderFrom" action="/order/" method="POST">
                <input type="hidden" id="orderType" name="orderType" value="cart">
                <input type="checkbox" id="cartCheck" class="inputhidden">
                <label for="cartCheck" id="sidemenu_bg"></label>
                <!-- ???????????? ???????????? 2020-04-20 -->
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
                        <a href="/dashboard/recommendSDH/" class="nav_suggest">?????? ?????? ?????????????</a>
                        <div class="cart_img"><img src="/public/img/shop/cart_png.png"></div>
                        <div id="cart_length">
                            <div>0</div>
                        </div>
                    </div>
                    <div class="cart_content_event">
                        <a href="/shop/shopList/category_best/" class="nav_best">??????????????? ????????????!</a>
                    </div>
                    <div class="cart_content">
                        <div class="cartblank"></div>
                        <div class="cart_content_brewery">??????????????? ???????????????.</div>                                        </div>
                    </div>
            </form>


            <!-- ???????????? end -->

            <div id="nav">
                <div id="nav_content">
                    <input type="checkbox" id="Main_category" class="inputhidden">
                    <label for="Main_category" class="Main_category_btn">
                       
                    </label>
                     <div class="nav_set">
                    	<a href="<%=request.getContextPath() %>/grocery/Foodmain.do" class="nav_new">?????????</a>
                        <a href="<%=request.getContextPath() %>/class/Classmain.do" class="nav_best">?????????</a>
                        <a href="<%=request.getContextPath() %>/recipe/Recipemain.do" class="nav_event">?????????</a>
                    </div>
                    <div class="nav_search">
                        <img src="/public/img/shop/searchIcon.png" alt="">
                    </div>
                    <div class="search_box_goods">
                        <div class="search_box_header">
                            <span>????????? ?????? ?????????????</span>
                            <span class="closeSearchBox"><img src="/public/img/shop/close.png" alt=""></span>
                        </div>
                        <form method="GET" id="sdhSearch" action="/sdhsearch/">
                            <div class="search_box_input">
                                <input type="text" id="" name="searchText" value="" placeholder="???????????? ??????????????????">
                                <button>
                                    <img src="/public/img/shop/searchIcon.png" alt="">
                                </button>
                            </div>
                        </form>
                        <div class="search_box_list">
                            <span>??????</span>
                            <ul>
                                <li>??????</li>
                            </ul>
                        </div>
                        <div class="search_box_list">
                            <span>????????????</span>
                            <ul>
                                <li>??????</li>
                            </ul>
                        </div>
                    </div>
                    <input type="search" id="nav_search_pc" name="nav_search_pc" placeholder="??????" value="" onkeypress="if(event.keyCode===13) {sdhsearch();}">
                    <input type="checkbox" id="cart_pc" class="inputhidden">

                    
                    <label for="cartCheck" class="cart_pc_btn" onclick="reTotalPrice('30876');" style="position:fixed;">
                        <img src="/public/img/shop/cart_png.png" alt="">
                        <span>0</span>
                    </label>
                </div>
            </div>
        </div>
        <%
        	UserVO uservo = (UserVO)request.getAttribute("vo");
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
                <span><%=uservo.getPoint() %></span>
            </div>
        </div>
    </div>

        <div class="my_side_menu pc">
			<!-- 	<a href="????????????.jsp"><span>????????????</span><span></span></a> --> 
				<%-- <a href="<%=request.getContextPath()%>/mypage/Shopbagmain.do"><span>????????????</span><span></span></a> --%> 
				<a href="<%=request.getContextPath()%>/user/Myinformation.do"><span>?????????</span><span></span></a>
				<a href="<%=request.getContextPath()%>/mypage/Coinmain.do"><span>????????? ?????????</span><span></span></a>
			    <a href="<%=request.getContextPath()%>/qnaboard/Qnaboard.do"><span>???????????????</span><span></span></a>
    </div>

</div><div class="my_container myDamhwa_MemberInfo">
  <div class="myDamhwa_MemberInfo_Buyer">
    <div class="">
      <span>?????????</span>
    </div>
					<div class="">
						<div class="Question_btn fnq" style="width: 100%;">
							<div class="my_wrapper">
								<div class="my_title pc">?????????</div>

								<div class="my_content coupon">
									<div class="my_section">
										<div class="my_sub_title">????????? ??????</div>
										<table class="table table-hover">
											<thead>
												<tr>
													<th>????????????</th>
													<th>?????????</th>
												</tr>
											</thead>
											<tbody>
<%
		List<ChargeVO> charList = (List<ChargeVO>)request.getAttribute("clist");
		for(ChargeVO vo : charList){
%>
												<tr>
													<!-- <th scope="row"> -->
													<td><%=vo.getCharge_date()%></td>
													<td><%=vo.getCharge()%></td>
												</tr>
<%		
		}
%>
							</tbody>
										</table>
										<hr style="border: 2px,solid,red;">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>????????????</th>
													<th>??????(?????????)</th>
													<th>?????????(????????????)</th>
												</tr>
											</thead>
											<tbody>
 <%
	List<OrderVO> orderList = (List<OrderVO>)request.getAttribute("olist");

	for(OrderVO vo : orderList){
%>
												<tr>
													<th scope="row">
													<td><%=vo.getPay_date()%></td>
													<td><%=vo.getPr_name()%></td>
													<td><%=vo.getOrder_price()%></td>
												</tr>
<%		
	}
%>
											</tbody>
										</table>
										
									</div>
								</div>
							</div>
							<button id="chargebut"type="button" class="OneToOneQuestion_btn">????????????</button>
						</div>
					</div>
				</div>
</div>
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

 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">????????????</h4>
        </div>
        <div class="modal-body">
						<div class="form-group">
						<img alt="?????????" src="https://img.hankyung.com/photo/202003/AA.22035045.1.jpg">
							<label for="sel1">????????????</label> 
							<input type="text" name="money"id="test123" placeholder="????????????">
<!-- 							<select	class="form-control" name="paycoin" id="paycoin"> -->
<!-- 								<option value="1000">1000???</option> -->
<!-- 								<option value="5000">5000???</option> -->
<!-- 								<option value="10000">10000???</option> -->
<!-- 								<option value="50000">50000???</option> -->
<!-- 							</select> -->
						</div>
					</div>
        <div class="modal-footer">
          <input type="image" id="payment"src="https://thumb.mt.co.kr/06/2020/09/2020090918034564423_1.jpg/dims/optimize/" class="btn btn-default" data-dismiss="modal" style="border: none;width: 100px;">
          <input type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='<%=request.getContextPath()%>/pay/pay.do'"value="?????????">
          <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
        </div>
      </div>
    </div>
  </div>
  
  <script>
  $(function(){
	  $('#chargebut').on('click',function(){
		  $('#myModal').modal('show');
	  })
	  $('#payment').on('click',function(){
 		  money = $('#test123').val();
 		  location.href='<%=request.getContextPath()%>/pay/pay.do?money='+money;
<%-- 		  $.ajax({
				url : "<%=request.getContextPath()%>/pay/pay.do",
				type : "get",
				data : {"money" : money},
				dataType : "json",
				success : function(res){
					alert(res);
				},
				error : function(xhr){
					alert("?????? - ????????? : " + xhr.status);
				}
			}) --%>
		 
	  })
  })
  </script>

</body>
</html>

