<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int res = (Integer)request.getAttribute("res");



	if (res > 0) {

%>



{ "sw" : "신고되었습니다. 관리자가 확인할 때까지 기다려 주세요"}

<%

	} else {

%>



{ "sw" : "오류가 발생했습니다. 다시한번 시도해주세요."}



<%

	}

%>

    