<%@page import="middle.market.vo.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="middle.market.vo.NoticeVO"%>
<%@page import="java.net.URLEncoder"%>
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
    <meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
              <!--   <label for="cartCheck" class="cart_button" onclick="reTotalPrice('');">
                    <img src="/public/img/shop/cart_png.png">
                    <span>0</span>
                </label> -->
                <div id="header_login_group">
                    <a href="<%=request.getContextPath() %>/mypage/Mypagemain.do">???????????????</a>
                    <a href="<%=request.getContextPath() %>/cookmarket/Cookmarket.do">????????????</a>
                    <a href="<%=request.getContextPath()%>/mypage/Coinmain.do">?????????</a>
                </div>
            </div>
            <input type="checkbox" id="menuCheck" class="inputhidden">
            <label for="menuCheck" id="sidemenu_bg"></label>
            <div id="sidemenu">
                <div class="sidemenu_content">
                                            <div class="sidemenu_login_top">
                            <div class="sidemenu_login_top_icon"><img src="/public/img/shop/register_icon.png"></div>
                            <div class="sidemenu_login_top_info">
                                <span class="sidemenu_login_userName"><%=session.getAttribute("name") %> ?????????</span>
                                <span class="sidemenu_login_userPoint">?????? ?????? ?????????: <%=session.getAttribute("point") %></span>
                                <a href="/dashboard/myDamhwa/" class="sidemenu_login_mypage">???????????????</a>
                                <button onclick="location.href='<%=request.getContextPath() %>/cookmarket/Cookmarket.do'" class="sidemenu_login_logout">????????????</button>
                            </div>
                        </div>
                </div>
            </div>
            <!-- sidemenu end -->
            <!-- cart start -->
<!--             <form id="cartOrderFrom" action="/order/" method="POST">
                <input type="hidden" id="orderType" name="orderType" value="cart">
                <input type="checkbox" id="cartCheck" class="inputhidden">
                <label for="cartCheck" id="sidemenu_bg"></label>
                ???????????? ???????????? 2020-04-20
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
                            <div></div>
                        </div>
                    </div>
                    <div class="cart_content_event">
                        <a href="/shop/shopList/category_best/" class="nav_best">??????????????? ????????????!</a>
                    </div>
                    <div class="cart_content">
                        <div class="cartblank"></div>
                                                                                            <ul class="cart_content_brewery">

                                        <div class="cart_content_brewery_title">
                                            <div class="cart_content_breweryName" onclick="location.href='/brewery/brewerydetail/35'">
                                                <div>?????????:</div>
                                                <div>????????? ?????????</div>
                                            </div>
                                        <div class="cart_content_breweryDeliverycost"><div>?????????:</div><div>4,000???</div></div></div><div class="delivery_free">*70,000??? ?????? ?????? ??? ????????? ??????</div><input type="hidden" name="baCGUID" value="35"><input type="hidden" name="cUpfree" value="70000">                                        <li>
                                            <input type="hidden" name="stbGUID" value="4000">?????? ?????????
                                            <input type="hidden" name="oPriceEa35" value="28000">
                                            <input type="hidden" name="bGUID" value="26634">
                                            <span class="cart_content_productName">???????????? 1??? ????????????</span>
                                            <div class="cart_content_productSet1">
                                                ????????????:
                                                <span>[750mL] ???????????? 1??? ???????????? </span>
                                            </div>
                                            <span class="cart_deleteIcon" onclick="deleteBasket(0,this)"></span>
                                            <div class="vwrap">
                                                <img src="https://sooldamhwa-static-file.s3.ap-northeast-2.amazonaws.com/img/prdouct/20191004153113.jpg">
                                                <div class="cart_content_productQty">
                                                    <div>??????</div>
                                                    <div>
                                                        <em class="hUp" onclick="hUp(0,0,28000)">
                                                            <div class="arrow-up"></div>
                                                        </em>
                                                        <input type="text" name="bEa" value="1" readonly>???
                                                        <em class="hDown" onclick="hDown(0,0,28000)">
                                                            <div class="arrow-down"></div>
                                                        </em>
                                                    </div>
                                                </div>
                                                <div class="cart_productInfo">
                                                    <div class="cart_content_productSet">
                                                        <div>????????????:</div>
                                                        <span>[750mL] ???????????? 1??? ???????????? </span>
                                                    </div>
                                                    <div class="cart_content_productPrice">25,200???</div>
                                                </div>
                                            </div>
                                        </li>
                                </ul><script src="/public/js/basket.js"></script>                                        </div>
                    </div>
            </form> -->
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

                    
<!--                     <label for="cartCheck" class="cart_pc_btn" onclick="reTotalPrice('30876');" style="position:fixed;">
                        <img src="/public/img/shop/cart_png.png" alt="">
                        <span>1</span>
                    </label> -->
                </div>
            </div>
        </div>

        <!-- PC?????? header end -->
        <!-- 20200420 ????????? ?????? ?????? -->
        <% UserVO vo = (UserVO)request.getAttribute("vo"); %>
        <div id="content" class="dashboard"> 
        <div class="pc">
    <div class="myDamhwa_profile">
    <div class="my_profile_title pc">?????? ??????</div>
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
            <div class="myDamhwa_profile_info_Subscribe">
            <div class="myDamhwa_profile_info_point">
                <span>???????????? ?????????:</span>
                <span><%=vo.getPoint() %></span>
            </div>
        </div>
    </div>

        <div class="my_side_menu pc">
				<!-- <a href="????????????.jsp"><span>????????????</span><span></span></a>  -->
				<%-- <a href="<%=request.getContextPath()%>/mypage/Shopbagmain.do"><span>????????????</span><span></span></a> --%> 
				<a href="<%=request.getContextPath()%>/user/Myinformation.do"><span>?????????</span><span></span></a>
				<a href="<%=request.getContextPath()%>/mypage/Coinmain.do"><span>????????? ?????????</span><span></span></a>
			    <a href="<%=request.getContextPath()%>/qnaboard/Qnaboard.do"><span>???????????????</span><span></span></a>
			</div>
</div></div>

<div class="my_container">
    <div class="my_wrapper fnq">
        <div class="CustomerCenter_title mobile">
            <span>??????&?????? ?????????</span>
        </div>
        <div class="my_title pc">??????&?????? ?????????</div>
        <div class="CustomerCenter_FAQ mobile">
            <span>??????&?????? ?????????</span>
        </div>
        
        <div class="my_fnq_tab">
            <div class="CustomerCenter_FAQ pc">
               ??????&?????? ????????? 
            </div>
            <div class="CustomerCenter_FAQ_kinds">
                <div onclick="location.href='<%=request.getContextPath()%>/qnaboard/Qnaboard.do'"  >??????????????????</div>
                <div onclick="location.href='<%=request.getContextPath() %>/notice/noticeList.do'" class='active' >????????????</div>

            </div>
        </div>
      
        
        <script type="text/javascript">
        
        //???????????? ????????? ???????????? ???????????? ????????? ???????????????
window.onload = function(){
	var noticeAdd = document.getElementById("noticeAdd");
	noticeAdd.onclick = function(){
		location.href = "<%=request.getContextPath()%>/notice/noticeInsertForm.do";
	};
}
</script>

<div>

  <table class="table">
<thead>
  <tr>
  	<th>COD</th><th>??????</th><th>??????</th>
  </tr>
</thead>
<tbody>
	<%
		List<NoticeVO> noticeList = (List<NoticeVO>)request.getAttribute("noticeList");
		
		for(NoticeVO noticeVo : noticeList){
			
	%>
		  
		 <tr class="danger">
			<td><%=noticeVo.getN_code() %></td>
			<td><a href="<%=request.getContextPath()%>/notice/noticeView.do?n_title=<%=URLEncoder.encode(noticeVo.getN_title(), "utf-8") %>"><%=noticeVo.getN_title() %></a></td>
			<td><%=noticeVo.getN_date() %></td>
		</tr>	
	
	<%		
		}
	%>	
	</tbody>
	</table>
</div>
</div> <!-- container ??? -->



 </div> <!-- my_wrapper fnq ??? -->
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

      </div> <!-- pcfooter_right ??? -->
      
    </div> <!-- damhwaInfo ??? -->
  </div> <!-- footer -->

</body>
</html>