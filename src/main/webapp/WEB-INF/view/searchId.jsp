<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	String resId = (String) request.getAttribute("resId");
    	if(resId != null){
    %>
    		{ "sw" : "인증번호가 발송되었습니다."}
	
	<% } else { %>
    
    		{ "sw" : "회원 정보를 확인해주세요" }
	
	<%  } %>