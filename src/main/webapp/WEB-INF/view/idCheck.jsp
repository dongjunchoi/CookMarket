<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    <%
    	String resId = (String) request.getAttribute("resId");
    	if(resId != null){
    %>
    		{ "sw" : "��� �Ұ� ID" }
	
	<% } else { %>
    
    		{ "sw" : "��� ���� ID" }
	
	<%  } %>