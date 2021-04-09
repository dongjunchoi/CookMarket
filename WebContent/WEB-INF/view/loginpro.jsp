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
%>

<script>
	location.href ="${pageContext.request.contextPath }/cookmarket/Cookmarketmain.do";
</script>
</body>
</html>