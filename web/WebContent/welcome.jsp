<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Welcome</title>
<%--    <link rel="stylesheet" href=".//resources//css//bootstrap.min.css"/>--%>
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>pro</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="./resources/css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="./resources/css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="./resources/images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="./resources/css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script></head>
<%!String str1 = "무엇이든지, 얼마든지 NTHING!";
    String str2 = "Share Everything! Anything! NThing!";%>
<body class="main-layout">
<%--<div class="loader_bg">--%>
<%--    <div class="loader"><img src="./resources/images/loading.gif" alt="#"/></div>--%>
<%--</div>--%>
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
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<script src="./resources/js/jquery-3.0.0.min.js"></script>
<!-- sidebar -->
<script src="./resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="./resources/js/custom.js"></script>
<script>
    function openNav() {
        document.getElementById("myNav").style.width = "100%";
    }

    function closeNav() {
        document.getElementById("myNav").style.width = "0%";
    }
</script>