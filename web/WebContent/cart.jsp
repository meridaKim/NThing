<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "main.java.dto.NThing" %>
<%@ page import = "main.java.dao.NThingRepository" %>

<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%
String cartId = session.getId();
%>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class = "display-3">장바구니</h1>
	</div>
</div>

<div class="container">
	<div class="row">
		<table width="100%">
			<tr>
				<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-danger">삭제하기</a></td>
				<td align="right"><a href="./shippingInfo.jsp?cartId=<%=cartId %>" class="btn btn-success">주문하기</a></td>
			</tr>
		</table>
	</div>
	<div style="padding-top: 50px">
		<table class="table table-hover">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>				
			</tr>
			<%
			int sum = 0;
			ArrayList<NThing> cartList = (ArrayList<NThing>)session.getAttribute("cartlist");
			if(cartList == null)
				cartList = new ArrayList<NThing>();
			for(int i=0; i<cartList.size(); i++){
				NThing nThing = cartList.get(i);
				int total = nThing.getUnitPrice() * nThing.getQuantity();
				sum += total;
			%>
			<tr>
				<td><%=nThing.getNThingId()%> - <%=nThing.getNThingName() %></td>
				<td><%=nThing.getUnitPrice() %></td>
				<td><%=nThing.getQuantity() %></td>
				<td><%=total %></td>
				<td><a href="./removeCart.jsp?id=<%=nThing.getNThingId()%>" class="badge badge-danger"> 삭제</a></td>
				
			</tr>
			<%
			}
			%>
			<tr>
				<th></th>
				<th></th>
				<th>총액</th>
				<th><%=sum %></th>
				<th></th>
			</tr>
		</table>
		<a href="nthings.jsp" class="btn btn-secondary">&laquo; 쇼핑</a>
	</div>
	<hr>
</div>
<%@ include file="footer.jsp" %>

</body>
</html>