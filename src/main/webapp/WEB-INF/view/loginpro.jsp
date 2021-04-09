<%@page import="middle.market.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	
	UserVO vo = (UserVO)request.getAttribute("vo");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	session.setAttribute("id", vo.getId());
	session.setAttribute("name", vo.getName());
	session.setAttribute("point", vo.getPoint());
	session.setAttribute("gradecode", vo.getGradecode());
%>

<script>
	location.href ="<%= request.getContextPath()%>/cookmarket/Cookmarketmain.do";
</script>
</body>
</html>