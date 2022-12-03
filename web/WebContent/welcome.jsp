<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
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
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400" rel="stylesheet">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script></head>
<%--<%!String str1 = "무엇이든지, 얼마든지 NTHING!";--%>
<%--    String str2 = "Share Everything! Anything! NThing!";%>--%>
<%@ include file="menu.jsp" %>


<body class="main-layout">
<div id="protien" class="protien_main">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="titlepage">
                    <%
                        request.setCharacterEncoding("utf-8");
                        String user_id = (String) session.getAttribute("user_id"); //id라는 String형으로 session을 받아옴
                        if(user_id!=null){
                    %>
                    <h3>
                        안녕하세요! <%=(String)session.getAttribute("user_id")%>엔띵러님!
                    </h3>               <a href="logout.jsp">Logout</a>
                    <%
                        }
                    %>
<%--                        }else{--%>
<%--                            %>--%>
<%--                    <script>--%>
<%--                        location.href ='login.jsp';--%>
<%--                    </script>--%>
<%--                    <%--%>


                    <h2 style="font-family: Gugi">함께 엔띵해요</h2>
                </div>
            </div>
        </div>

        <div class="row">
            <%@ include file="dbconn.jsp"%>
            <%
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                String sql = "SELECT * FROM nthings";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()) {
            %>
            <div class="col-md-3 col-sm-6">
                <div class="protien">
                    <figure><img src="./resources/images/<%=rs.getString("n_fileName")%>"style="width: 80%" /></figure>
                    <%
                        int person = (Integer.parseInt(rs.getString("n_nthinger")))+1;
                        int saleprice = Integer.parseInt(rs.getString("n_unitPrice")) / person;

                    %>
                    <h3 style="font-family: Black Han Sans">엔띵하면 <%=saleprice%>원!</h3>
                    <span><%=rs.getString("n_name")%></span>
                    <a class="read_more mar_top" href="nthing.jsp?NThingId=<%=rs.getString("n_id")%>">엔띵하기</a>
                </div>
            </div>
            <%
                }
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            %>
        </div>

    </div>

</div>
</div>
<!-- end our protien  -->
<!-- about -->
<div id="about" class="about">
    <div class="container-fluid">
        <div class="row d_flex">
            <div class="col-md-6">
                <div class="titlepage">
                    <h2>엔띵하고 제품이 있으신가요?</h2>
                    <p>공구할 제품을 직접 게시하고 함께 엔띵해요!</p>
                    <a class="read_more" href="addNThing.jsp"> 엔띵할 제품 등록하기</a>
                </div>
            </div>
            <div class="col-md-6 pad_right0">
                <div class="about_img ">
                    <figure><img src="./resources/images/aboutnthings.png" alt="#"/></figure>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end about -->
<!-- growyhing -->
<div class="growyhing">
    <div class="container">
        <div class="row d_flex">
            <div class="col-md-6">
                <div class="body_img">
                    <figure><img src="./resources/images/sharing.png" align="#"/></figure>
                </div>
            </div>
            <div class="col-md-6">
                <div class="titlepage">
                    <h2>함께 엔띵해요!</h2>
                    <p>로그인하면 제품등록과 제품삭제가 가능해요!</p>
                    <a class="read_more" href="login.jsp"> 로그인하기</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end growyhing -->
<!--  contact -->
<div id="contact" class="contact">
    <div class="container">

        <div class="row">
            <div class="col-md-12">
                <div class="titlepage">
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
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