<%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-11-27
  Time: 오후 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <meta charset="utf-8">
  <title>제품 아이디 오류</title>
</head>

<body>
<%@ include file="menu.jsp" %>

<%!
  String main = "해당 제품이 존재하지 않습니다.";
%>
<div class="jumbotron">
  <div class="container">
    <h2 class = "alert alert-danger"><%=main %></h2>
  </div>
</div>

<div class="container">
  <div class="text-center">
    <p><%=request.getRequestURL() %>?<%=request.getQueryString() %>
    <p> <a href="nthings.jsp" class="btn btn-secondary"> 제품 목록 &raquo;</a>
      <%--<h3><%@ include file="date.jsp" %></h3>--%>
  </div>
</div>
<%@ include file="footer.jsp" %>
</main>

</body>
</html>
