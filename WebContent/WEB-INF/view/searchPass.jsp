<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <%
    	String resPass = (String) request.getAttribute("resPass");
    	if(resPass != null){
    		request.setAttribute("resPass", resPass);
    %>
    		{ "sw" : "인증번호가 발송되었습니다."}
	
	<% } else { %>
    
    		{ "sw" : "회원 정보를 확인해주세요" }
	
	<%  } %>