<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    <%
    	String resId = (String) request.getAttribute("resId");
    	if(resId != null){
    %>
    		{ "sw" : "사용 불가 ID" }
	
	<% } else { %>
    
    		{ "sw" : "사용 가능 ID" }
	
	<%  } %>