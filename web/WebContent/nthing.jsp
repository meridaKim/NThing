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
<%--<%@ page errorPage="exceptionNoNThingId.jsp" %>--%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="nThingDAO" class="main.java.dao.NThingRepository" scope="session"/>
<html>
<head>
<%--    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />--%>
    <title>상품 상세 정보</title>
</head>
<script type="text/javascript">
    function addToCart(){
        if(confirm("해당 제품을 장바구니에 추가하시겠습니까?")){
            document.addForm.submit();
        }else{
            document.addForm.reset();
        }
    }
</script>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">상품 정보</h1>
    </div>
</div>
<%--<%--%>
<%--    String NThingId = request.getParameter("NThingId");--%>
<%--    NThingRepository dao = NThingRepository.getInstance();--%>
<%--    NThing nThing = dao.getNThingById(NThingId);--%>
<%--%>--%>
<%@ include file="dbconn.jsp"%>
<%
    String NThingId = request.getParameter("NThingId");

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
            <h3><b>제품 분류 코드:</b><span class="badge badge-danger"> <%=rs.getString("n_category")%></span></h3>
            <p><b>제품명: </b><%=rs.getString("n_name")%>
            <p><b>제품 아이디: </b><%=rs.getString("n_id")%>
            <p>
                <b>작성자</b> :
                    <%=rs.getString("n_writer")%>
                				<p>
                					<b>재고수</b> :
                					<%=rs.getString("n_unitsInStock")%>
            <p>
                <b>할인율</b> :
            <%=rs.getString("n_totalSalePercent")%>%</p>
            <p>
                <b>작성일자</b> :
                    <%=rs.getString("n_writeDate")%>
            <p>
                <b>원가</b> :
                    <%=rs.getString("n_unitPrice")%>
                <%
                int saleprice = Integer.parseInt(rs.getString("n_unitPrice")) / (Integer.parseInt(rs.getString("n_nthinger")+1));
            %>
            <h4>할인가 <%=saleprice%>원
            </h4>



            <p>	<form name="addForm" action="./addCart.jsp?NThingId=<%=rs.getString("n_id")%>" method="post"></form>
            <a href="#" class="btn btn-info" onclick="addToCart()"> 제품 주문 &raquo;</a>
            <a href="cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
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