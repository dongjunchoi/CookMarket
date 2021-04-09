<%@page import="middle.market.vo.GroceryVO"%>
<%@page import="middle.market.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>쿡결제</title>
<link rel="shortcut icon" href="https://ssl.pstatic.net/static.checkout/layout/202012171619/images/customer/favicon.ico" />
<link type="text/css" rel="stylesheet" href="https://ssl.pstatic.net/static.checkout/layout/202012171619/css/customer/chk_n_common.css">
<link type="text/css" rel="stylesheet" href="//img.pay.naver.net/o/wstatic/css/service/front/order/ordersheet.css?1607915457147">
<link type="text/css" rel="stylesheet" href="//img.pay.naver.net/o/wstatic/css/service/front/order/layerpopup.css?1607915457147">
<script type="text/javascript" charset="utf-8">
// 	document.domain = "naver.com";
</script>
</head>
<body>
	<!-- container -->
	<div id="container">
		<!-- content -->
		<div id="order" class="order_sc _root _cartDiv">
			<div class="order_header">
				<h3 class="order_payment">
					<span class="blind">주문/결제</span>
				</h3>
				<ol class="process">
					<li class="on"><em class="pro2"><span class="blind">주문/결제</span></em></li>
					<li><em class="pro3"><span class="blind">주문완료</span></em></li>
				</ol>
			</div>


				<div class="order_content">
					<div class="product_area">
						<span class="top_line"></span>
						<table cellspacing="0" class="tb_products">
							<caption>주문내역</caption>
							<colgroup>
								<col width="500">
								<col width="120">
								<col width="50">
								<col width="120">
								<col width="110">
								<col>
							</colgroup>
							<thead class="point_plus">
								<tr>
									<th scope="col" class="product">상품정보</th>
									<th scope="col">배송비</th>
									<th scope="col">수량</th>
									<th scope="col">가격</th>
									<th scope="col" class="col_price">주문금액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
<!-- ~~~~~~~~~~~~~~~~~~~~상품정보~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<%
	GroceryVO vo = (GroceryVO) request.getAttribute("vo2");
%>
									<td><span class="bdr"></span>
										<div class="product_info">
											
											<a href="http://jomad.co.kr/front/php/product.php?product_no=12" class="product_thmb" target="_blank">
												<span class="mask"></span>
													<img src="https://ssl.pstatic.net/checkout.phinf/20191206_148/1575568565783dmJix_JPEG/20019843712.jpg?type=m120" alt="조마드 블루밍나잇 옴므 오드 퍼퓸 광고특가" width="92" height="92">
											</a>
											
											<div class="product_dsc">
<!-- 												<a href="http://jomad.co.kr/front/php/product.php?product_no=12" target="_blank" class="product_name">  -->
<!-- 													<strong>조마드 블루밍나잇 옴므 오드 퍼퓸 광고특가 </strong> -->
													<strong ><%= vo.getG_name() %> </strong>
<!-- 												</a> -->
											</div>
											<span class="vm"></span>
										</div></td>

<!-- ~~~~~~~~~~~~~~~~~~~~배송비~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
									<td rowspan="1">
										<span class="deli_fee">
										<span class="sp_order ico_deli"></span>
											<span class="sum _deliveryPrice2020121762531299">3,000원
												<a href="#"	class="sp_order ico_que _deliveryFeeLayerBtn2020121762531299 _click(nmp.front.order.order_sheet.showLayerDeliveryFee(2020121762264841)) _stopDefault"
													style="display: none;"></a></span>
												<span class="_deliveryPriceText2020121762531299"></span></span></td>

<!-- ~~~~~~~~~~~~~~~~~~~~수량~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
									<td><%=request.getAttribute("count") %>개</td>
<!-- ~~~~~~~~~~~~~~~~~~~~가격~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
									<td>
										<span class="discount"> 
											<span class="_discountAmountText2020121762264841"> <%=vo.getG_price() %></span>
										</span>
									</td>
<!-- ~~~~~~~~~~~~~~~~~~~~총금액~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
									<td class="col_price">
										 <strong><em class="_productOrderPayAmt2020121762264841"><%=request.getAttribute("sum") %></em>원</strong>
									</td>
								</tr>
<!-- ~~~~~~~~~~~~~~~~~~~~!!!!!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
							</tbody>
						</table>
					</div>
					
					<div class="cutting_line">
						<span class="ico_scissors"></span> <span class="shdw_left"></span>
						<span class="shdw_right"></span>
					</div>
					<div class="destination_wrap">
						<div class="deliver_wrap _deliveryInfos _deliveryInfoType">
       					
       					
 <!-- ~~~~~~~~~~~~~~~~~~~배송지정보~~~~~~~~~~~~~~~~~~~~~~ -->      					
       			<%
       				UserVO uservo = (UserVO)request.getAttribute("vo");
       			%>
       			
       			<h4><span class="blind">배송지정보</span></h4>

		        <ul class="addr_list _deliveryPlaces _deliveryPlaces_0" >
			        <li><%= uservo.getName() %></li>
			        
			        <li><%= uservo.getPhone() %></li>
			        
			        <li>(<%= uservo.getZip() %>)<%= uservo.getAddr1() %><%= uservo.getAddr2() %></li>
		        </ul>
		    </div>



 <!-- ~~~~~~~~~~~~~~~~~~~주문자정보~~~~~~~~~~~~~~~~~~~~~~ -->      
 					
					<div class="userinfo_wrap _purchaserInfo">
						<h4>주문자 정보</h4>
						<ul class="user_info">
							<li><%= uservo.getName() %></li>
								<li class="_telNoHighlight ">
									<span class="_memberTelNumber"><%= uservo.getPhone() %></span>
								</li>
								<li>
									<span class="_memberEmailAddress"><%= uservo.getEmail() %></span>
								</li>
						</ul>
					</div>

					<span class="shdw_left"></span> 
						<span class="shdw_right"></span>
					</div>

 <!-- ~~~~~~~~~~~~~~~~~~~포인트~~~~~~~~~~~~~~~~~~~~~~ -->
				<input type="hidden" name="prestigeKey" value="" class="_certificationForm">

				<div class="discount_wrap">
					<div class="discount_info discountPriceInfo">
						<table cellspacing="0" class="tb_discount tb_point">
							<colgroup>
								<col width="139">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th class="main_th">
										<div class="deliver_option_wrap">
											<strong class="req">포인트</strong>
										</div>
									</th>
								</tr>
								<tr>
									<th class="point_balance">보유 포인트</th>
									<td class="point_balance">
										<div class="input_area">
											<span class="value _pointBalance"><%= uservo.getPoint() %></span> 
											<span class="measure">원</span>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

<!-- ~~~~~~~~~~~~~~~~~~~결제~~~~~~~~~~~~~~~~~~~~~~ -->

					<div class="price_sum">
						<h4>포인트 결제금액</h4>
						<div class="sum">
							<strong class="price_sum_title">주문금액</strong>
							<p class="price_sum_detail">
								<em class="_totalPayPrice">32,900</em>원
							</p>
						</div>
						<ul class="calc_list">

							<li><strong>상품금액</strong>
								<p>
									<em class="_totalOrderPrice">29,900</em>원
								</p></li>

							<li><strong>배송비</strong>
								<p>
									<dummy class="_totalDeliveryFeeSign">+</dummy>
									<em class="_totalDeliveryFee">3,000</em>원
								</p></li>
						</ul>
						
						<div class="calc_list total">
							<strong>합계</strong>
							<p>
								<em class="_totalPriceSum">32,900</em>원
							</p>
						</div>
						<br>
							<input type="button" value="결제하기" name="결제하기" id="pay" style="float: right;">
					</div>
					<input type="hidden" class="_totalPayAmount" />

				</div>
			</div>
		</div>

	</div>
</body>
</html>