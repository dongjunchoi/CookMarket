<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	String resemail = (String) request.getAttribute("authKey");
    	request.setAttribute("result", resemail);
    
    	if(resemail != null){
    %>
    		{ "sw" : "전송 성공" }
	
	<% } else { %>
    
    		{ "sw" : "전송 실패" }
	
	<%  } %>