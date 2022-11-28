<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Welcome</title>
<%--    <link rel="stylesheet" href=".//resources//css//bootstrap.min.css"/>--%>
</head>
<%!String str1 = "무엇이든지, 얼마든지 NTHING!";
    String str2 = "Share Everything! Anything! NThing!";%>
<body>
<%@ include file="menu.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            <b> <%=str1%>
            </b>
        </h1>
    </div>
</div>
<div class="container">
    <div class="text-center">
        <h3>
            <%=str2 %>
        </h3>

    </div>
    <hr>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>