<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	int res = (Integer)request.getAttribute("res");



	if (res > 0) {

%>



{ "sw" : "댓글이 삭제되었습니다."}

<%

	} else {

%>



{ "sw" : "댓글이 등록되지 않았습니다 다시한번 시도해주세요."}



<%

	}

%>







