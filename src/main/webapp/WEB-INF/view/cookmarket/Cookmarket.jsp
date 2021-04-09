<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" dir="ltr">
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta charset="utf-8">
    <meta http-equiv="content-type" content="text/html" charset="utf-8">
    <meta name="viewport" content="width=device-width, viewport-fit=cover', initial-scale=1, user-scalable=no, shrink-to-fit=no">
    <meta property="og:type" content="website">

    <meta name="naver-site-verification" content="4b50d2f7153266cc1244c9e6320a62b2ca97d83e"/>
    <link rel="apple-touch-icon" sizes="180x180" href="/public/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/public/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/public/favicon/favicon-16x16.png">
    <link rel="manifest" href="/public/favicon/site.webmanifest">
    <link rel="mask-icon" href="/public/favicon/safari-pinned-tab.svg" color="#000000">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="theme-color" content="#ffffff">
    <link rel="shortcut icon" href="/public/favicon/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/public/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../public/aos.css">
    <link rel="stylesheet" href="../public/common.css?ver=2">
    <link rel="stylesheet" href="../public/font-awesome.min.css">
    <link rel="stylesheet" href="../public/slick.css">
    <link rel="stylesheet" href="../public/video-js.css" rel="stylesheet">
    <title>쿡마켓</title>

    <script src="../js/jquery-latest.min.js"></script>
    <script src="../js/jquery.cookie.js"></script>
    <script src="../js/swiper.min.js"></script>
  
    <script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
    <script type="text/javascript"> kakaoPixel('2697732037242932303').pageView(); </script>

    <script src="../js/jquery-ui.js"></script>
    <script src="https://vjs.zencdn.net/c/video.js"></script>
    <script src="../js/common.js?version=1" charset="utf-8"></script>
    <script src="../js/slick.js" charset="utf-8"></script>
  </head>
  <body>


      <div class="container landing">
        <input type="hidden" id="utm_source" value="" />

        <div class="landing-Mainbanner">
          <div class="width-module">
            <h2 class="title aos-item" data-aos="fade-right" data-aos-anchor-placement="center-bottom" data-aos-duration="1000">오늘부터 당신도<br/>요리사가 될수 있습니다!</h2>
            <span class="sub-title" data-aos="fade-left" data-aos-anchor-placement="center-bottom" data-aos-duration="1000">쿡마켓과 함께 요리를 즐겨보세요.</span>
      <button type="button" onclick="location.href='<%=request.getContextPath() %>/Login.do'" name="button" class="subscribe-btn-clear banner-btn2">이용하기</button>
          </div>
          <div class="mainVideo">
            <video id="video1" autoplay="" muted="" loop="" playsinline="" style="width: 100%">
              <source src="../public/메인동영상.mp4" type="video/mp4">
            </video> 
          </div>
          <div class="mobile-bn">
            <div class="mobileSlide">
              <div class="swiper-wrapper">
                              <div class="swiper-slide" onclick="location.href=''">
                  <img src="/img/19-10-10/20191010143623.jpg" alt="">
                </div>
                              <div class="swiper-slide" onclick="location.href=''">
                  <img src="/img/19-05-15/20190515141909.jpg" alt="">
                </div>
                            </div>
            </div>
          </div>
        </div>
        <div id="lss" class="landing-se-section">
          <div class="width-module">
            <div class="dh-box non-dis-mobile">
              <div class="seImg">
                                  <img src="../image/요리.jpg" alt="">
                              </div>
              <div class="seImg">
                                  <img src="../image/다양한요리클래스.png" alt="">
                              </div>
            </div>

            <div class="dh-box non-dis-pc">
              <div class="seImg">
              <!--수정부분 화면 줄였을때 이미지 나오는 부분 변경-->
              <img src="../image/줄인배경.png" alt="">
                              </div>
            </div>
 
          </div>
          <div class="width-module">
            <div class="dh-box" id="boxex">
              <div class="seTxt" style="padding-top: 25px;">
                <h2>클래스</h2>
                <span>지금 바로 클래스 신청하고 전국각지 양조장의 다양한 <br>요리를 경험하세요
                  <br> <em class="aos-item" data-aos="fade-in">구성:추천 요리클래스, 레시피</em>
                </span>

                <button type="button" onclick="location.href='<%=request.getContextPath() %>/Login.do'" name="button" class="subscribe-btn">이용하기</button>
              </div>
              <div class="seImg">
                                  <img src="../image/클래스.png" alt="">
                              </div>
            </div>
          </div>
        </div>
        <div class="landing-th-section">
          <div class="width-module">
            <div class="second-3-box">
              <div class="aos-item" data-aos="fade-up" data-aos-duration="1000">
                <figure><img src="../image/요리3.png" alt=""></figure>
                <span>다양한 클래스를통해 요리를 실시간으로 배울 수 있습니다&nbsp;<br/> 다양한<em>&nbsp;클래스</em>&nbsp;를통해 쉽게 요리합시다</span>
              </div>
              <div class="aos-item" data-aos="fade-up" data-aos-duration="1000">
                <figure><img src="../image/돈.png" alt=""></figure>
                <span>좋은 퀄리티의 식품을 &nbsp;<br/><em>&nbsp;최저가</em>로 만날수 있습니다</span>
              </div>
              <div class="aos-item" data-aos="fade-up" data-aos-duration="1000">
                <figure><img src="../image/레시피아이콘.png" alt=""></figure>
                <span>내가 좋아하는 레시피를 공유해보세요<br /> <em>요리</em> 더 즐거워 집니다</span>
                  
              </div>
            </div>
          </div>
        </div>
          <div class="landing-fo-section">
            <div class="width-module">
              <div id="lts" class="monthService">
                <div class="monthSection">
                  <h2 data-aos="fade-right" data-aos-anchor-placement="center-bottom" data-aos-duration="1000">누가요즘 마트가서 식자재 구입하니?</h2>
                  <span data-aos="fade-right" data-aos-anchor-placement="center-bottom" data-aos-duration="1000">쿡마켓에서 쉽고 빠르게 구입할 수 있습니다<br/>다양한 재료를 클릭 한번에<b>구매!</b><br/>지금당장 이용하세요.<br/>
                   </span></div>
                <div class="month-deliy">
                  <div style="display:block;">
                                          <img src="../image/식품쇼핑.png" alt="">
                                      </div>
                </div>
              </div>
            </div>
          </div>
        <div class="seviceSection quote">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <h1>&quot;요리 바보인 나도 클래스를 통해 백종원이 될수 있다??&quot;<br>
            </div>
            <div class="swiper-slide">
              <h1>&quot;진짜 요리 레시피 마음에 드는게 없었는데 ㅠㅠ 여기 사이트 너무좋아요&quot;<br>
            </div>
            <div class="swiper-slide">
              <h1>&quot;그저 빛..&quot;<br>
            </div>
            <div class="swiper-slide">
              <h1>&quot;사람들과 레시피를 공유하는 재미가 있네요 ^^>&quot;<br>
            </div>
          </div>
        </div>
        <div class="recentDamhwa">
          <div class="width-module">
            <div class="recent_Damhwa">
              <h2>최근 담화</h2>
              <div class="swiper-wrapper">
                                <div class="swiper-slide">
                  <a href="" target="_blank">
                    <img src="../image/김치찌개.jpg" alt="">
                    <span class="instaTxt"><b>drinker100</b><br>
                    -김치찌개- 
	'내가'요리를 할 수 있다니.. 김치찌개 만드는법 이렇게 쉬웠으면 진작 여기서 배워볼껄 ㅠㅠ 너무좋아요 </span>
                  </a>
                </div>
                                <div class="swiper-slide">
                  <a href="" target="_blank">
                    <img src="../image/된장찌개.jpg" alt="">
                    <span class="instaTxt"><b>leedddiii</b><br>
                    -된장찌개-
                    엄마가 끓여준 된장찌개 맛...! 

</span>
                  </a>
                </div>
                                <div class="swiper-slide">
                  <a href="" target="_blank">
                    <img src="../image/떡볶이.jpg" alt="">
                    <span class="instaTxt"><b>ssomin_k</b><br>
                    
	학교앞에서 파는 떡볶이 집보다 맛있어요 ㅎㅎ 여러분도 김건호 강사님 클래스 신청해서 요리 배워보세요^^</span>
                  </a>
                </div>
                                <div class="swiper-slide">
                  <a href="" target="_blank">
                    <img src="../image/마늘조림.jpg" alt="">
                    <span class="instaTxt"><b>me9mi_hye</b><br>
                    간단한 재료와 간단한 방법으로 맛있는 마늘조림 만들어보았습니다 ㅎㅎ 잘했나요?</span>
                  </a>
                </div>
                                <div class="swiper-slide">
                  <a href="" target="_blank">
                    <img src="../image/멸치볶음.jpg" alt="">
                    <span class="instaTxt"><b>_ksh_0727_</b><br>
                    이제 반찬가게에서 안사두 되겠어요ㅋㅋ 너무 좋아요 쿡마켓 ^^> 
                    </span>
                  </a>
                </div>
                                <div class="swiper-slide">
                  <a href="" target="_blank">
                    <img src="../image/쏘야.jpg" alt="">
                    <span class="instaTxt"><b>childhood_me</b><br>
                    ㄹㅇ군대 쏘야 맛 이랑 진짜 똑같음... 이거 레시피 게시판 올린 사람 최소 군필
                    </span>
                  </a>
                </div>
                                <div class="swiper-slide">
                  <a href="" target="_blank">
                    <img src="../image/오므라이스.jpg" alt="">
                    <span class="instaTxt"><b>woo_ji_young__</b><br>
                    ❤❤❤❤❤❤❤❤❤오므라이스❤❤❤❤❤❤❤❤❤</span>
                  </a>
                </div>
                                <div class="swiper-slide">
                  <a href="" target="_blank">
                    <img src="../image/파스타.jpg" alt="">
                    <span class="instaTxt"><b>soyoung0606</b><br>
                    클래스 신청하면 내손도 백종원이 될 수 있다??? 진짜 파스타 만드는게 이렇게 쉬웠나..
                    </span>
                  </a>
                </div>
                            </div>
          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
        <div class="landing-leftSection">
          <div class="leftDay">
            <h2>아직도 고민하십니까?</h2>
            <figure class="dayIcon">
                          </figure>
            <span class="aos-item" data-aos="fade-in"><b>더이상!</b> 고민하지마세요<br>당장 이용하세요</span>
            
            <!-- 수정부분 로그인으로 가는 경로 추가했습니다 -->
            <button type="button" onclick="location.href='<%=request.getContextPath() %>/Login.do'" name="button" class="subscribe-btn">이용하기</button>
          </div>
          <div class="sdh-story">
            <div class="width-module">
              <h3>쿡마캣 이란</h3>
              <input type="radio" id="sdh-story-01" name="sdh-story">
              <label for="sdh-story-01">
                <span>클래스가 뭔가요?</span>
                <i class="fa fa-angle-up" aria-hidden="true"></i>
              </label>
              <div class="sdh-story-content-01">
                <span>클래스란 전문 요리 강사와 함께 실시간 대면으로 만나 요리를 배우는 서비스를 말합니다.</span>
                  <span>회원가입 및 로그인을 거쳐 본인이 원하는 클래스를 신청하면 이용하실 수 있습니다.</span>
             		
              </div>
              <input type="radio" id="sdh-story-02" name="sdh-story">
              <label for="sdh-story-02">
                <span>레시피란 뭔가요?</span><i class="fa fa-angle-up" aria-hidden="true"></i>
                <!-- 수정부분 이벤트 관련 소스 제거했습니다 -->
              </label>
              <div class="sdh-story-content-02">
                <span>레시피는 쿡마켓 사이트를 이용하는 모든 사람들이 자신만의 요리 레시피를 서로 공유하고 소통하는 서비스를 말합니다.</span>
              </div>
              <input type="radio" id="sdh-story-03" name="sdh-story">
              <input type="radio" id="sdh-story-04" name="sdh-story">
              <label for="sdh-story-04">
                <span>결제는 어떻게 되나요?</span><i class="fa fa-angle-up" aria-hidden="true"></i>
              </label>
              <div class="sdh-story-content-04">
                <span>결제는 충전소에서 카카오페이를 사용하고, 돈을 충전시 포인트로 변환되어 다양한 서비스를 이용하실 수 있습니다.</span>
              </div>
              <input type="radio" id="sdh-story-05" name="sdh-story">
              <label for="sdh-story-05">
                <span>식자재는 뭔가요?</span><i class="fa fa-angle-up" aria-hidden="true"></i>
              </label>
              <div class="sdh-story-content-05">
                <span>식자재는 직접 마트에 가지않고 온라인으로 자신이 구매하고싶은 식자재를 검색하고, 선택하여 구입하는 서비스를 말합니다.</span>
              </div>
              <input type="radio" id="sdh-story-06" name="sdh-story">
            </div>
          </div>

        </div>
      </div>

      

      <script src="../js/aos.js" charset="utf-8"></script>
      <script type="text/javascript">
        $("#closePopup").click(function(){
          $("#main_popup").hide('fade');
        });
        $(document).on('ready', function() {
          $(".sGoods-slider").show();
          $(".regular").slick({
            dots: false,infinite: false,speed: 300,variableWidth:true,arrows: false,
            responsive: [{breakpoint: 2000,settings: {arrows: false,slidesToShow: 3,}},
              {breakpoint: 600,settings: {arrows: false,slidesToShow: 4,slidesToScroll: 4}},
              {breakpoint: 480,settings: {infinite: true,arrows: false,slidesToShow: 2,slidesToScroll: 1}}]
          });

          var utm_source = $ ("#utm_source").val();
          
          if(utm_source === 'joongang'){
            $.cookie('utm_source', utm_source, { expires: 1 });
          }

        });
        AOS.init({
          easing: 'ease-in-out-sine'
        });

        $


      </script>
      <script src="../js/slider.js"></script>
      <script src="../js/channelTalk.js"></script>
  <div class="footer">
    <div class="width-module">
    <div class="">

    </div>
    <div class="">
      <ul class="footer-bar">
        <li><a>3조</a></li>
        <li><a>김건호</a></li>
        <li><a>최동준</a></li>
        <li><a>유승정</a></li>
        <li><a>이수정</a></li>
 	    <li><a>오제현</a></li>
      </ul>
    </div>
    </div>
    <div class="damhwaInfo">
      <div class="pcfooter_left">
        <div class="infoNum info02">
            <p>고객센터: 042-222-8201</p>
            <p>대덕인재 개발원 화이팅!</p>
        </div>
 

      </div>

    </div>
  </div>
</div>


