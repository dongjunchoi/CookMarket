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
    <link rel="mask-icon" href="/public/favicon/safari-pinned-tab.svg" color="#000000">
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
   
   
    <title>마이페이지</title>
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
                <!-- <label for="cartCheck" class="cart_button" onclick="reTotalPrice('');">
                    <img src="/public/img/shop/cart_png.png">
                    <span>0</span>
                </label> -->
                <div id="header_login_group">
                    <a href="<%=request.getContextPath() %>/mypage/Mypagemain.do">마이페이지</a>
                    <a href="<%=request.getContextPath() %>/cookmarket/Cookmarket.do">로그아웃</a>
                    <a href="<%=request.getContextPath()%>/mypage/Coinmain.do">충전소</a>
                </div>
            </div>
            
            <!-- sidemenu start -->
<%--             <input type="checkbox" id="menuCheck" class="inputhidden">
            <label for="menuCheck" id="sidemenu_bg"></label>
            <div id="sidemenu">
                <div class="sidemenu_content">
                                            <div class="sidemenu_login_top">
                            <div class="sidemenu_login_top_icon"><img src="/public/img/shop/register_icon.png"></div>
                            <div class="sidemenu_login_top_info">
                                <span class="sidemenu_login_userName"><%=session.getAttribute("name") %></span>

                                <a href="/dashboard/myDamhwa/" class="sidemenu_login_mypage">내 정보</a>
                                <button onclick="location.href='/login/logout'" class="sidemenu_login_logout">로그아웃</button>
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
                <!-- 민규수정 장바구니 2020-04-20 -->
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
            </form> --%>
            <!-- 장바구니 end -->
            
            
            <div id="nav">
                <div id="nav_content">
                    <input type="checkbox" id="Main_category" class="inputhidden">
                    <label for="Main_category" class="Main_category_btn">
                       
                    </label>
                     <div class="nav_set">
                        <a href="<%=request.getContextPath()%>/grocery/Foodmain.do" class="nav_new">식자재</a>
                        <a href="<%=request.getContextPath() %>/class/Classmain.do" class="nav_best">클래스</a>
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
                                <input type="text" id="" name="searchText" value="" placeholder="제품명을 입력해주세요">
                                <button>
                                    <img src="/public/img/shop/searchIcon.png" alt="">
                                </button>
                            </div>
                        </form>
                        <div class="search_box_list">
                            <span>추천</span>
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

                    
                    <!-- <label for="cartCheck" class="cart_pc_btn" onclick="reTotalPrice('30876');" style="position:fixed;">
                        <img src="/public/img/shop/cart_png.png" alt="">
                        <span>0</span>
                    </label> -->
                </div>
            </div>
        </div>

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
  <%
  	UserVO vo = (UserVO)request.getAttribute("vo");
  %>
                <span><%=vo.getPoint() %></span>
            </div>
        </div>
    </div>

        <div class="my_side_menu pc">
				<!-- <a href="주문내역.jsp"><span>주문내역</span><span></span></a> --> 
				<%-- <a href="<%=request.getContextPath()%>/mypage/Shopbagmain.do"><span>장바구니</span><span></span></a> --%> 
				<a href="<%=request.getContextPath()%>/user/Myinformation.do"><span>내정보</span><span></span></a>
				<a href="<%=request.getContextPath()%>/mypage/Coinmain.do"><span>포인트 충전소</span><span></span></a>
			    <a href="<%=request.getContextPath()%>/qnaboard/Qnaboard.do"><span>문의게시판</span><span></span></a>
		</div>

</div><div class="my_container myDamhwa_MemberInfo">
  <div class="myDamhwa_MemberInfo_Buyer">
  
    <div class="">
      <span>회원정보</span>
      <span onclick="location.href='<%=request.getContextPath() %>/user/Myinformationupdate.do'">수정</span>
    </div>
    <div class="">
      <span>회원명</span>
      <span><%=session.getAttribute("name") %></span>
    </div>
    <div class="">
      <span>비밀번호</span>
      <span>*****</span>
    </div>
    <div class="">
      <span>이메일</span>
      <span><%=vo.getEmail() %></span>
    </div>
    <div class="">
      <span>연락처</span>
      <span><%=vo.getPhone() %></span>
    </div>
  </div>
  <div class="myDamhwa_MemberInfo_Delivery" style="display:none;">
    <div class="myDamhwa_MemberInfo_Delivery01 myDamhwa_MemberInfo_Delivery_content">
      <div class="">
        <span>배송정보</span>
        <span onclick="location.href='/dashboard/myinfoModify/'">수정</span>
      </div>
      <div class="">
        <span>수령인</span>
        <span>김영석</span>
      </div>
      <div class="">
        <span>주소</span>
        <span>서울특별시 강남구 압구정로 29길 71, 현대아파트 10동 1305호</span>
      </div>
      <div class="">
        <span>연락처</span>
        <span>010-7129-4803</span>
      </div>
    </div>
    <div class="myDamhwa_MemberInfo_Delivery02 myDamhwa_MemberInfo_Delivery_content">
      <div class="">
        <span>구독 배송정보</span>
        <span onclick="location.href='/dashboard/myinfoModify/'">수정</span>
      </div>
      <div class="">
        <span>수령인</span>
        <span>김영석</span>
      </div>
      <div class="">
        <span>주소</span>
        <span>서울특별시 강남구 압구정로 29길 71, 현대아파트 10동 1305호</span>
      </div>
      <div class="">
        <span>연락처</span>
        <span>010-7129-4803</span>
      </div>
    </div>
    <span>*결제 이후 변경 시 문의 부탁드립니다</span>
  </div>
  <div class="myDamhwa_MemberInfo_Delivery_edit">

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

