<%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-11-27
  Time: 오후 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="main.java.dto.NThing"%>
<%@ page import="main.java.dao.NThingRepository"%>
<%@ page errorPage="exceptionNoNThingId.jsp" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="nThingDAO" class="main.java.dao.NThingRepository" scope="session"/>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    <title>상품 상세 정보</title>
</head>
<script type="text/javascript">
    function addToCart(){
        var user_id = '<%=(String)session.getAttribute("user_id")%>';
        if(confirm("해당 제품을 장바구니에 추가하시겠습니까?")){
           if(user_id=="null"){
               confirm("로그인이 필요합니다.")
               location.href("login.jsp");
           }
           else{
               document.addForm.submit();
        }
        }
    }
</script>
<body>
<jsp:include page="menu.jsp" />
    <div class="container">
        <h1 class="display-3"style="font-family: Gugi">상품 정보</h1>
    </div>
<%--<%--%>
<%--    String NThingId = request.getParameter("NThingId");--%>
<%--    NThingRepository dao = NThingRepository.getInstance();--%>
<%--    NThing nThing = dao.getNThingById(NThingId);--%>
<%--%>--%>
<%@ include file="dbconn.jsp"%>
<%
    String NThingId = request.getParameter("NThingId");
    if(NThingId == null || NThingId.trim().equals("")) {
        response.sendRedirect("exceptionNoNThingId.jsp");
        return;
    }
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String sql = "SELECT * FROM nthings WHERE n_id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, NThingId);
    rs = pstmt.executeQuery();
    if (rs.next()) {
%>
<div class="container">
    <div class="row">
        <div class="col-md-5">
            <img src="./resources/images/<%=rs.getString("n_fileName")%>"
                 style="width: 80%">
        </div>
        <div class="col-md-6">
            <h3>제품 분류 코드:<span class="badge badge-danger"> <%=rs.getString("n_category")%></span></h3>
            <p>제품명: <b><%=rs.getString("n_name")%></b>
            <p>제품 아이디: <b><%=rs.getString("n_id")%></b>
            <p>작성한 엔띵러 : <b><%=rs.getString("n_writer")%>님</b>
            <p>재고수 : <b><%=rs.getString("n_unitsInStock")%></b>
            <p>공구 인원 수 : <b><span class="badge badge-info"><%=rs.getString("n_nthinger")%></span>명</b></p>
            <p>할인율 :<b><%=rs.getString("n_totalSalePercent")%>%</b></p>
            <p>작성일자 :
                <b><%=rs.getString("n_writeDate")%></b>
            <p>원가 :<b><%=rs.getString("n_unitPrice")%>원</b>
                <%
                int person = (Integer.parseInt(rs.getString("n_nthinger")))+1;
                int saleprice = Integer.parseInt(rs.getString("n_unitPrice")) / person;

            %>
            <p><b><%=rs.getString("n_description")%></b></p>
            <h4>엔띵하면 <b><%=saleprice%>원!</b></h4>
            <p>	<form name="addForm" action="./addCart.jsp?NThingId=<%=rs.getString("n_id")%>" method="post"></form>
            <a href="cart.jsp?NThingId=<%=rs.getString("n_id")%>" class="btn btn-info" onclick="addToCart()">엔띵할래요!&raquo;</a>
            <a href="cart.jsp" class="btn btn-warning">담아둔 엔띵 제품 보기&raquo;</a>
            <a href="nthings.jsp" class="btn btn-secondary">제품 목록 &raquo;</a>
        </div>

    </div>
    <hr>
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
<jsp:include page="footer.jsp" />
</body>
</html>
</body>
</html>