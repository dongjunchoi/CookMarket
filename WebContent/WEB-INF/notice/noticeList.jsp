<%@page import="middle.market.vo.NoticeVO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		List<NoticeVO> noticeList = (List<NoticeVO>)request.getAttribute("noticeList");
		
		for(NoticeVO noticeVo : noticeList){
			
	%>
			<%=noticeVo.getN_code() %>
			<%=noticeVo.getN_title() %>
			<%=noticeVo.getN_content() %>
			<%=noticeVo.getN_name() %>
			<%=noticeVo.getN_date() %>
	<%		
		}
	%>	
</body>
</html>