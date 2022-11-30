<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="utf-8">
<title>NThing</title>
</head>

<body>
<%@ include file="menu.jsp" %>

<%!
String main = "요청하신 페이지가 존재하지 않습니다.";
%>
<div class="jumbotron">
	<div class="container">
		<h2 class = "display-3"><%=main %></h2>
	</div>
</div>

<main role="main">
<div class="container">
	<div class="text-center">
		<p><%=request.getRequestURL() %>?<%=request.getQueryString() %>
		<p> <a href="./nthings.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
		<%--<h3><%@ include file="date.jsp" %></h3>--%>
	</div>
</div>
<%@ include file="footer.jsp" %>
</main>

</body>
</html>