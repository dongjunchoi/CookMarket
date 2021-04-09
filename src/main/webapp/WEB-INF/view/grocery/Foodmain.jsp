<%@page import="middle.market.vo.GroceryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" class="">

<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="-1" />
	<meta name="robots" content="noindex, nofollow" />
	<meta name="robots" content="noarchive" />
	<meta name="keywords" content="">
	<meta name="google-site-verification" content="3eLg1zfxeZ_oO6oOOsvIxbtcW-FtDsViPVm7-CYOl8w" />
	<link rel="stylesheet" href="../public/shopstyle.css?ver=1607311742">
	<link rel="stylesheet" href="../public/stylep.css?ver=887788">
	<link rel="stylesheet" href="../public/font-awesome.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="../js/jquery-latest.min.js"></script>
	<script src="../js/jquery.cookie.js"></script>
	<script src="../js/swiper.min.js"></script>
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-131050684-1"></script>
	<link rel="stylesheet" type="text/css" href="https://recipe1.ezmember.co.kr/static/css/bootstrap_20200413.css" />
	<link rel="stylesheet" type="text/css" href="/static/css/font.css" />
	<link rel="stylesheet" type="text/css" href="/static/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="https://recipe1.ezmember.co.kr/static/css/ez_recipe_20201015.css" />
	<link rel="stylesheet" type="text/css" href="https://recipe1.ezmember.co.kr/static/css/store_20201109.css" />
	<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
	<link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon.png" rel="apple-touch-icon" />
	<link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-76x76.png" rel="apple-touch-icon" sizes="76x76" />
	<link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-120x120.png" rel="apple-touch-icon" sizes="120x120" />
	<link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-152x152.png" rel="apple-touch-icon" sizes="152x152" />
	<link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-180x180.png" rel="apple-touch-icon" sizes="180x180" />
	<link href="https://recipe1.ezmember.co.kr/img/icons/icon-hires.png" rel="icon" sizes="192x192" />
	<link href="https://recipe1.ezmember.co.kr/img/icons/icon-normal.png" rel="icon" sizes="128x128" />
	<script type="text/javascript" src="https://recipe1.ezmember.co.kr/static/js/jquery-1.11.2.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="https://recipe1.ezmember.co.kr/static/js/trace.min_20200730.js" charset="utf-8"></script>
	<script type="text/javascript" src="//static.criteo.net/js/ld/publishertag.js"></script>
	<script type="text/javascript"></script>
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script>
	<script src="https://cdn.megadata.co.kr/js/en_script/3.6/enliple_min3.6.js" defer="defer" onload="mobRf()"></script>
	
	<title>쿡마켓 식자재</title>
</head>
<body style="background-color : #FFF;">

<div id="wrap">
        <div id="header">
            <div id="header_content">
                <input type="hidden" name="loginConfirm" value="">
                <label for="menuCheck" class="sidemenu_button">
                    <span class="icon_bar"></span>
              
                </label>
     		<!--수정부분 로고에 uri 없앰-->
                <a class="logo"></a>
                <label for="cartCheck" class="cart_button">
                    <img src="../image/카트.png">
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
            <!-- cart start -->
            <form id="cartOrderFrom" action="/order/" method="POST">
                <input type="hidden" id="orderType" name="orderType" value="cart">
                <input type="checkbox" id="cartCheck" class="inputhidden">
                <label for="cartCheck" id="sidemenu_bg"></label>
                <!-- 민규수정 장바구니 2020-04-20 -->
                
                <div id="cart">
                                        <div class="baskitTotalPrice">
                        <span>현재 총 구매 가격</span>
                        <span id="baskitTotalPrice">0원</span>
                        <!--수정부분 이미지 넣었습니다 구매하기-->
                        <div class="TotalPriceIcon"><img src="../image/구매하기.png"></div>
                    </div>
                    <button type="button" id="cartBtnSubmit" class="buyBtn" name="button">
                      			  구매하기
                        <div class="TotalPriceIcon"  onclick="<%=request.getContextPath() %>/pay/pay.do'">
                            <img src="../image/구매하기.png">
                        </div>
                    </button>
                    <div class="cart_top">
                        <a class="nav_suggest">쿡마켓</a>
                            <!--수정부분 이미지 넣었습니다 카트-->
                        <div class="cart_img"><img src="../image/카트1.png"></div>
                        <div id="cart_length">
                            <div>0</div>
                        </div>
                    </div>
                    <div class="cart_content_event">
                        <a href="/shop/shopList/category_best/" class="nav_best">장바구니</a>
                    </div>
                    <div class="cart_content">
                        <div class="cartblank"></div>
                        <div class="cart_content_brewery">장바구니가 비었습니다.</div>                                        </div>
                    </div>
            </form>


            <!-- 장바구니 end -->
     
            <div id="nav">
                <div id="nav_content">
                    <input type="checkbox" id="Main_category" class="inputhidden">
                    <label for="Main_category" class="Main_category_btn">
                  

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
                        <div class="search_box_list">
                            <span>술담화 추천</span>
                            <ul>
                                <li>검색</li>
                            </ul>
                        </div>
                        <div class="search_box_list">
                            <span>최근검색</span>
                            <ul>
                                <li>검색</li>
                            </ul>
                        </div>
                    </div>
                    <input type="search" id="nav_search_pc" name="nav_search_pc" placeholder="검색" value="" onkeypress="if(event.keyCode===13) {sdhsearch();}">
                    <input type="checkbox" id="cart_pc" class="inputhidden">

                    
                    <label for="cartCheck" class="cart_pc_btn" onclick="reTotalPrice('');" style="position:fixed;">
                        <img src="https://sooldamhwa.com/public/img/shop/cart_png.png" alt="">
                        <span>0</span>
                    </label>
                </div>
            </div>
        </div>


<div class="s_contents">
			<br><br>
        <div class="s_list_ea" style="margin:40px 0 0; text-align:center; height:45px;"><div style="font-size:15pt; padding-bottom:15px;display:inline;">추천상품</div>

    </div>
    </div>

		<div class="s_list">
			<ul class="goods_list_unity">

		<%
			List<GroceryVO> list = (List<GroceryVO>) request.getAttribute("list");

			for (GroceryVO vo : list) {
		%>
				<li>
					<div class="unity_pic">
						<a href="<%=request.getContextPath()%>/pay/paymain.do?cod=<%=vo.getGrocery_cod() %>">
							<img src="<%=request.getContextPath()%>/image/<%=vo.getFilename()%>"></a>
					</div>
					<div class="unity_cont">
						<p class="cont_tit line2">
							<a href="<%=request.getContextPath()%>/pay/paymain.do"><%=vo.getG_name()%></a>
						</p>
						<div class="price_box">
							<strong class="price"><%=vo.getG_price() %><small>원</small></strong> <span
								class="buyer">6,522개 구매</span>
						</div>
						<p class="cont_star">
							<span class="star_img" style="font-size: 0; vertical-align: -4px;">
									<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png">
									<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png">
									<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png">
									<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png">
									<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png">
							</span> <span class="star_ea">(100)</span>
						</p>
					</div>
				</li>
				<%
					}
				%>
			</ul>
			<nav class="text-center">
				<ul class="pagination">
					<li class="active"><a
						href="/shop/index.html?sort=order&tag=%EA%B0%84%EC%8B%9D&page=1">1</a></li>
					<li><a
						href="/shop/index.html?sort=order&tag=%EA%B0%84%EC%8B%9D&page=2">2</a></li>
					<li><a
						href="/shop/index.html?sort=order&tag=%EA%B0%84%EC%8B%9D&page=3">3</a></li>
					<li><a
						href="/shop/index.html?sort=order&tag=%EA%B0%84%EC%8B%9D&page=4">4</a></li>
					<li><a
						href="/shop/index.html?sort=order&tag=%EA%B0%84%EC%8B%9D&page=5">5</a></li>
				</ul>
			</nav>
		</div>
		<!-- /container -->

<div id="footer">
		<div class="">
			<div class="footer-social"></div>
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
</body>
</html>


</body>
</html>