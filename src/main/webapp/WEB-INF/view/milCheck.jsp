<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String resemail = (String) request.getAttribute("authKey");
    	if(resemail != null){
    %>
    		{ "sw" : "인증번호 일치" }
	
	<% } else { %>
    
    		{ "sw" : "인증번호 틀림" }
	
	<%  } %>