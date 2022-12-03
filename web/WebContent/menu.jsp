<%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-11-27
  Time: 오후 2:18
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
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
    <link href="https://fonts.googleapis.com/css?family=Gugi:400" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script></head>
<style>
    .logo{
        font-size: 50px;
    }
</style>
<body class="main-layout">
<div id="myNav" class="menu_sid">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <div class="menu_sid-content">
        <a href="./welcome.jsp"style="font-family: Gugi">Home</a>
        <a href="./nthings.jsp"style="font-family: Gugi">NThing 둘러보기</a>
        <a href="./addNThing.jsp"style="font-family: Gugi">NThing할 제품 등록하기</a>
        <a href="./editNThing.jsp?edit=update"style="font-family: Gugi">게시글 수정</a>
        <a href="./editNThing.jsp?edit=delete"style="font-family: Gugi">게시글 삭제</a>
    </div>
</div>
<header>
    <!-- header inner -->
    <div class="header">
        <div class="menu_sitbar">
            <ul class="menu">
                <li><button type="button" >
                    <img style="" onclick="openNav()" src="./resources/images/menu_icon.png" alt="#"/>
                </button>
                </li>
            </ul>
            <ul class="social_icon">
                <li><a href="javascript:void(0)"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                <li><a href="javascript:void(0)"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                <li><a href="javascript:void(0)"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
            </ul>
        </div>
        <div class="header_full_bg">
            <div class="header_top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="logo" style="font-family: Gugi" >
                                <a href="welcome.jsp" alt="welcome.jsp"/><h1>엔띵</h1></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="banner">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="banner_text">

                                <h1 style="font-family: Gugi">무엇이든지<br> 어느 것이든지<br>엔띵!</h1>
                                <a class="get_btn" href="nthings.jsp" role="button" >엔띵 둘러보기</a><a class="get_btn" href="login.jsp" role="button">로그인하기</a>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <img class="bann_img" src="./resources/images/nthingbanner.png" alt="#"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</header>
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

