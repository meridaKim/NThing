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
<%
    String NThingId = request.getParameter("NThingId");
    NThingRepository dao = NThingRepository.getInstance();
    NThing nThing = dao.getNThingById(NThingId);
%>
<div class="container">
    <div class="row">
        <div class="col-md-5">
            <img src="./resources/images/<%=nThing.getFilename()%>"
                 style="width: 80%">
        </div>
        <div class="col-md-6">
            <h3><%=nThing.getNThingName()%></h3>
            <p><%=nThing.getDescription()%>
            <p>
                <b>제품 분류 코드:</b><span class="badge badge-danger"> <%=nThing.getNThingId()%></span>
            <p>
                <b>작성자</b> :
                    <%=nThing.getWriter()%>
                				<p>
                					<b>재고수</b> :
                					<%=nThing.getUnitsInStock()%>
            <p>
                <b>할인율</b> :
                    <%=nThing.getTotalSalePercent()%>
            <p>
                <b>작성일자</b> :
                    <%=nThing.getWriteDate()%>
            <h4><%=nThing.getUnitPrice()%>원
            </h4>
            <p>	<form name="addForm" action="./addCart.jsp?id=<%=nThing.getNThingId()%>" method="post"></form>
            <a href="#" class="btn btn-info" onclick="addToCart()"> 제품 주문 &raquo;</a>
            <a href="cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
            <a href="nthings.jsp" class="btn btn-secondary">제품 목록 &raquo;</a>
        </div>

    </div>
    <hr>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
</body>
</html>

