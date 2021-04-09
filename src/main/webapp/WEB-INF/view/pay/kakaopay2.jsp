<%@page import="middle.market.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>

	<%
		UserVO vo = (UserVO)request.getAttribute("vo");
		int money = (Integer)request.getAttribute("money");
	%>
	
<script>
$(function(){
	

	var IMP = window.IMP;
	IMP.init('imp74475583');
	
	
	IMP.request_pay({
	    pg : 'kakaopay',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:포인트충전',
	    amount : <%=money%>, //판매 가격
	    buyer_email : '<%=vo.getEmail()%>',
	    buyer_name : '<%=vo.getName()%>',
	    buyer_tel : '<%=vo.getPhone()%>',
	    buyer_addr : '<%=vo.getAddr1()%><%= vo.getAddr2()%>',
		buyer_postcode : '<%=vo.getZip()%>'
		},  function(rsp) {
		    if ( rsp.success ) {
		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	jQuery.ajax({
		    		url: "<%=request.getContextPath()%>/pay/Savapoint.do", //cross-domain error가 발생하지 않도록 주의해주세요
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {"money" :<%=session.getAttribute("mon")%>}
		    	}).done(function(data) {
		    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    		 if ( everythings_fine ) {
		    			var msg = '결제가 완료되었습니다.';
		    			alert(msg);
		    			
		    			/*msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num; */
		    			
		    		} else {
		    			//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		} 
		    	});
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        
		        alert(msg);
		    }
		    location.href='<%=request.getContextPath()%>/mypage/Coinmain.do';
		});
})
	
	<%-- 	IMP.request_pay({
		 pg : 'kakaopay',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:포인트충전',
		    amount : <%=money%>,
		    buyer_email : '<%=vo.getEmail()%>',
		    buyer_name : '<%=vo.getName()%>',
		    buyer_tel : '<%=vo.getPhone()%>',
		    buyer_addr : '<%= vo.getAddr2()%>',
		    buyer_postcode : '<%=vo.getZip()%>'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
/* 		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num; */
		        <%request.setAttribute("money", money);%>
		        location.href='<%=request.getContextPath()%>/pay/Savapoint.do'
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }

		    alert(msg);
		}); --%>
	
</script>
</head>
<body>


</body>
</html>