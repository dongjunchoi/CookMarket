<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang=ko dir="ltr">

<head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta charset="utf-8">
    <meta http-equiv="content-type" content="text/html" charset="utf-8">
    <meta name="viewport" content="width=device-width, viewport-fit=cover', initial-scale=1, user-scalable=no, shrink-to-fit=no">
    <meta name="description" content="매달 전국각지의 양조장에서 오는 다양한 종류의 전통주를 경험하세요!">
    <meta name="naver-site-verification" content="4b50d2f7153266cc1244c9e6320a62b2ca97d83e" />
    <meta property="product:brand" content="술담화">
    <meta property="product:availability" content="in stock">
    <meta property="product:condition" content="new">
    <meta property="product:price:amount" content="49,000">
    <meta property="product:price:currency" content="KRW">
    <meta property="product:retailer_item_id" content="165">
    <meta property="og:type" content="website">
    <meta property="og:title" content="찾아오는 인생술, 술담화">
    <meta property="og:description" content="매달 전국각지의 양조장에서 오는 다양한 종류의 전통주를 경험하세요!">
    <meta property="og:image" content="https://sooldamhwa-static-file.s3.ap-northeast-2.amazonaws.com/seo_logo.png">
    <meta property="og:url" content="https://sooldamhwa.com">
    <link rel="apple-touch-icon" sizes="180x180" href="/public/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/public/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/public/favicon/favicon-16x16.png">
    <link rel="manifest" href="/public/favicon/site.webmanifest">
    <link rel="mask-icon" href="/public/favicon/safari-pinned-tab.svg" color="#000000">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="theme-color" content="#ffffff">
    <link rel="stylesheet" href="../public/popup.css">
    <link rel="shortcut icon" href="/public/favicon/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/public/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../public/shopstyle.css?ver=1607311742">
    <link rel="stylesheet" href="../public/stylep.css?ver=887788">
    <link rel="stylesheet" href="../public/font-awesome.min.css">
    <script src="../public/js/jquery-latest.min.js"></script>
    <script src="../public/js/jquery.cookie.js"></script>
    <script src="../public/js/swiper.min.js"></script>

    <title>쿡마켓 구매</title>
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
                <a href="/home/" id="header_subs_pc">
                </a>
                <a class="logo" href="<%=request.getContextPath() %>/cookmarket/Cookmarketmain.do">
                       <img src="../image/logo.png">
                </a>
                <label for="cartCheck" class="cart_button" onclick="reTotalPrice('');">
                    <img src="/public/img/shop/cart_png.png">
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
            <!-- sidemenu start -->
            <input type="checkbox" id="menuCheck" class="inputhidden">
            <label for="menuCheck" id="sidemenu_bg"></label>
            <div id="sidemenu">
            </div>
            <!-- sidemenu end -->
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
                        <div class="TotalPriceIcon"><img src="/public/img/shop/calculator.png"></div>
                    </div>
                    <button type="button" id="cartBtnSubmit" class="buyBtn" name="button">
                        구매하기
                        <div class="TotalPriceIcon">
                            <img src="/public/img/shop/calculator.png">
                        </div>
                    </button>
                    <div class="cart_top">
                        <a href="/dashboard/recommendSDH/" class="nav_suggest">추천 퀴즈 해볼까요?</a>
                        <div class="cart_img"><img src="/public/img/shop/cart_png.png"></div>
                        <div id="cart_length">
                            <div>0</div>
                        </div>
                    </div>
                    <div class="cart_content_event">
                        <a href="/shop/shopList/category_best/" class="nav_best">베스트셀러 만나보기!</a>
                    </div>
                    <div class="cart_content">
                        <div class="cartblank"></div>
                        <div class="cart_content_brewery">장바구니가 비었습니다.</div>                                        </div>
                    </div>
            </form>


            <!-- 장바구니 end -->

                            <!-- 장바구니담기 시작 -->
                <form id="detailCartSubmit" action="/order" method="POST">
                    <input type="hidden" id="orderType" name="orderType" value="singleCart">
                    <input type="hidden" id="pGUID" name="pGUID" value="165">
                    <input type="hidden" id="cGUID" name="cGUID" value="13">
                    <input type="hidden" id="oDeliPrice" name="oDeliPrice" value="">
                    <input type="hidden" id="oDeliPriceCode" name="oDeliPriceCode" value="">
                    <input type="hidden" id="oOption" name="oOption" value="">
                    <input type="hidden" id="oEa" name="oEa" value="">
                    <input type="hidden" id="totalPrice" name="totalPrice" value="">
                    <input type="hidden" id="uGUID" name="uGUID" value="">
                    <input type="hidden" id="teakbaeFree" name="teakbaeFree" value="">
                    <input type="checkbox" id="detailPage_cart_btn" class="inputhidden">
                    <label for="detailPage_cart_btn" id="sidemenu_bg"></label>
                    <div id="detailPage_cart">
                        <div class="detailPage_cart_button">
                            <div>
                                <label class="addCartBtn" for="detailPage_cart_btn">장바구니 담기<span></span></label>
                            </div>
                        </div>
                       <div class="detailPage_cart_content">
                            <div class="detailPage_cart_brewery_event">
                                                            </div>
                           <div class="shop_dtl_cart_option_pc">수량</div>
                            <div class="detailPage_cart_count">
                                <div class="triangle_left"></div>
                                <span id="detailPage_ea" data-ea="1">1</span>
                                <div class="triangle_right"></div>
                            </div>
                            <div class="detailPage_cart_detailPrice">
                                <div class="productPrice">
                                    <span>상품가격</span>
                                    <span id="detailPage_price" data-price="41,650">41,650원</span>
                                </div>
                                <div class="deliveryCost">
                                    <span>배송비</span>
                                    <span data-id="0" data-price="0" id="detailPage_deli">0원</span>
                                </div>
                            </div>
                            <div class="shop_dtl_cart_free_shipping">
                                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;쿡마켓</span>  </div>
                            <div class="detailPage_cart_sendInfo">
                                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;이용해주셔서 감사합니다!</span>
                            </div>
                            <div class="shop_dtl_cart_btn_pc detailPage_cart_Buybtn">

                           <button type="button" id="initOrder" class="detailPage_cart_buy" onclick="submitOrder()">바로<br>구매하기</button>
                            </div>
                            <div class="detailPage_cart_priceInfo">
                                <span>총 구매가격</span>
                                <div>?</div>
                                <span id="detailPage_totalPrice" data-price="41,650">41,650원</span>
                            </div>
                            <div class="detailPage_cart_Buybtn">
                     <button type="button" id="addBasket" class="detailPage_cart_add" onclick="addToCart(49000,165,50000)">장바구니 담기</button>
                   <button type="button" id="initOrder" class="detailPage_cart_buy" onclick="submitOrder()">바로 구매하기</button>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- 장바구니담기 끝 -->
            
            <div id="nav">
                <div id="nav_content">
                    <input type="checkbox" id="Main_category" class="inputhidden">
                    <label for="Main_category" class="Main_category_btn">
   
                        <div class="category_content">
                            <ul>
                            </ul>
                            <ul>
                 
                            </ul>
                            <ul>
                            </ul>
                        </div>
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
                        <img src="/public/img/shop/cart_png.png" alt="">
                        <span>0</span>
                    </label>
                </div>
            </div>
        </div>

        <!-- PC버전 header end -->
        <!-- 20200420 황선주 수정 확인 -->
        <div id="content" class="shop"><div class="detailPage">
    <div class="shop_dtl_top">
        <div class="detailPage_img">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="https://recipe1.ezmember.co.kr/cache/data/goods/19/10/43/1000003350/1000003350_detail_068.jpg">
                </div>
                            </div>
        </div>
        <div class="shop_dtl_card">
            <div class="detailPage_info01">
                <p class="detail_title">쿡마켓에서 파는 100% 국내산 장군차 김치</p>
                <p class="detail_subtitle">엄마의 손만이 딱!</p>
                <p class="detail_tag">#쿡마켓 #김치 #새해선물</p>
            <div class="detailPage_info02">
                <div class="detail_kinds">국내산 천일염</div>
                <div class="detail_material">숙성 발효시킨 액젓</div>
                <div class="detail_delivery">국내산 천일염</div>
                <div class="detail_delivery">국내산 고춧가루</div>
            </div>
                <div class="detail_Price">
   			 <p class="detail_price01"><span>판매 가격</span></p>
                   </div>
   				   <div class="detail_SalePrice">
                        <p class="detail_price02">41,650원</p>
                    </div>
                            </div>
        </div>
    </div>
        <div class="detailPage_info04">
        <!-- product information -->
        		
						
            <div id="brewery_prev" class="prevBtn"><span></span></div>
            <div id="brewery_next" class="nextBtn"><span></span></div>
        </div>
    </div>
    <div class="detailPage_info06">
        <!-- 전통주 추천 서비스 -->
        <div class="detailPage_rec"><span>어느 전통주를 사야 하실 지 모르시겠다구요?<br>당신에게 꼭 맞는 전통주를 추천해드려요</span></div>
        <div>
            <div class="detailPage_rec_bottom" onclick="location.href='/dashboard/recommendSDH/';">
                <img src="/public/img/shop/detail/rec_m@3x.png">
                <h2>추천 서비스</h2>
            </div>
        </div>
    </div>

    </div>
    
</div>


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
