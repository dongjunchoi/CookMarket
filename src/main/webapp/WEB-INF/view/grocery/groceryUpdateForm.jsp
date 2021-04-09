
<%@page import="middle.market.vo.GroceryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnList").on("click", function(){
		location.href = "<%=request.getContextPath()%>/grocery/groceryList.do";
	});
});

</script>


</head>
<body>
<div class="container">
<%
	GroceryVO groceryVo = (GroceryVO)request.getAttribute("groceryVo");
%>

<h2>식품 정보 수정 폼</h2>
<form id="groceryForm" method="post" 
	   action="<%=request.getContextPath()%>/grocery/groceryUpdate.do">
	   <input type="hidden" name="grocery_cod" id="grocery_cod" value="<%=groceryVo.getGrocery_cod() %>">
 <table class="table">
<tbody>

	<tr>
		<td>식료품코드</td>
		<td><%=groceryVo.getGrocery_cod() %></td>
	</tr>
	<tr>
		<td>식료품명</td>
		<td>
			<input type="text" name="g_name" id="g_name" value="<%=groceryVo.getG_name() %>">
		</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>
			<input type="text" name="g_price" id="g_price" value="<%=groceryVo.getG_price() %>">
		</td>
	</tr>
	<tr>
		<td>판매자코드</td>
		<td>
			<input type="text" name="seller_cod" id="seller_cod" value="<%=groceryVo.getSeller_cod() %>">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="저장">
			<input type="reset" value="취소">
			<input type="button" value="식품목록" id="btnList">
		</td>
	</tr>
</tbody>
</table>
</form>
</div>
</body>
</html>