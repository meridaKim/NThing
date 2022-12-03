<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "main.java.dto.NThing" %>
<%@ page import = "main.java.dao.NThingRepository" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<%@ include file="dbconn.jsp"%>
	<%

		String cartId = session.getId();
		String NThingId = request.getParameter("NThingId");
		if(NThingId != null){
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM nthings WHERE n_id = 9";
		pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1, NThingId);

		rs = pstmt.executeQuery();

		if (rs.next()) {
			sql = "insert into nthingcart (n_id, n_name,n_unitPrice,n_nthinger) select n_id, n_name, n_unitPrice, n_nthinger from nthings WHERE n_id=9";
			pstmt = conn.prepareStatement(sql);
//			int nthingid = Integer.parseInt(NThingId);
//			pstmt.setInt(1,nthingid);
			pstmt.executeUpdate();

	%>
<meta charset="UTF-8">
<title>장바구니</title>

</head>
<body>

<%@ include file="menu.jsp" %>


	<div class="container">
		<h1 class = "display-3" style="font-family: Gugi">장바구니</h1>
        //로그인 세션 유지
		<%
			request.setCharacterEncoding("utf-8");
			String user_id = (String) session.getAttribute("user_id"); //id라는 String형으로 session을 받아옴
			if(user_id!=null){
		%>
		<h3>
			Hi! <%=(String)session.getAttribute("user_id") %>
		</h3>
		<a href="logout.jsp">Logout</a>
		<%
		}else{
		%>
		<script>
			alert("로그인 후 이용해주세요!")
			location.href ='login.jsp';
		</script>
		<%
			}
		%>
	</div>


<div class="container">
	<div class="row">
		<table width="100%">
			<tr>
				<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
				<td align="right"><a href="./paymentInfo.jsp?NThingId=<%=rs.getString("n_id")%>&&cartId=<%=cartId%>" class="btn btn-success">주문하기</a></td>
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
<%--			<%--%>
<%--//			int sum = 0;--%>
<%--//			ArrayList<NThing> cartList = (ArrayList<NThing>)session.getAttribute("cartlist");--%>
<%--//			if(cartList == null)--%>
<%--//				cartList = new ArrayList<NThing>();--%>
<%--//			for(int i=0; i<cartList.size(); i++){--%>
<%--//				NThing nThing = cartList.get(i);--%>
<%--//				int total = nThing.getUnitPrice() * nThing.getQuantity();--%>
<%--//				sum += total;--%>
<%--			%>--%>
			<tr>
				<td><%=rs.getString("n_id")%> - <%=rs.getString("n_name") %></td>
				<%
					int person = (Integer.parseInt(rs.getString("n_nthinger")))+1;
					int saleprice = Integer.parseInt(rs.getString("n_unitPrice")) / person;

				%>
				<td><%=saleprice%></td>
				<td>1</td>
<%--				<td><%=total %></td>--%>
				<td><a href="./removeCart.jsp?NThingId=<%=rs.getString("n_id")%>&&cartId=<%=cartId%>" class="badge badge-danger"> 삭제</a></td>
				
			</tr>
<%--			<%--%>
<%--			}--%>
<%--			%>--%>
			<tr>
				<th></th>
				<th></th>
				<th>총액</th>
<%--				<th><%=sum %></th>--%>
				<th></th>
			</tr>
		</table>
		<a href="nthings.jsp" class="btn btn-secondary">&laquo; 쇼핑</a>
	</div>
	<hr>
</div>
<%}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
		}
%>
</body>
</html>