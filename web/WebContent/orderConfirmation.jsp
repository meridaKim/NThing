<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.java.dto.NThing" %>
<%@ page import="main.java.dao.NThingRepository" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String cartId = session.getId();
	String NThingId = request.getParameter("NThingId");

	String payment_cartId ="";
	String payment_name="";
	String paymentDate ="";

	Cookie[] cookies = request.getCookies();

	if(cookies != null) {
		for (int i = 0; i< cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if(n.equals("payment_cartId"))
				payment_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			if(n.equals("payment_name"))
				payment_name = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			if(n.equals("paymentDate"))
				paymentDate = URLDecoder.decode((thisCookie.getValue()),"utf-8");

		}
	}
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM nthings WHERE n_id = 9";
	pstmt = conn.prepareStatement(sql);
//	pstmt.setString(1,NThingId);

	rs = pstmt.executeQuery();
	if (rs.next()) {




%>
<html>
<head>
<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css" />
<title>결제 신청 완료</title>
</head>
<body>

<%
//		String NThingId = request.getParameter("NThingId");
//		String dbId = request.getParameter("dbId");
//		String userId = request.getParameter("userId");

%>
	<jsp:include page="menu.jsp" />

		<div class="container">
			<h1 class="display-3" style="font-family: Gugi">결제 내역</h1>

	
	<div class="container col-8 alert alert-info">
		<div class="text-center" >
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong> 성명 : <% out.println(payment_name); %>	</strong>
			</div>
			<div class="col-4" align="right">
				<p>	<em>결제일자: <%out.println(paymentDate); %></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">제품</th>
					<th class="text-center">#</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>


				<tr>
					<td class="text-center"><em><%=rs.getString("n_name") %></em></td>
					<td class="text-center">1</td>
					<%
						int person = (Integer.parseInt(rs.getString("n_nthinger")))+1;
						int saleprice = Integer.parseInt(rs.getString("n_unitPrice")) / person;

					%>
					<td class="text-center"><%=saleprice%>원</td>

					<td class="text-center"><%=saleprice %>원</td>
				</tr>

					<td></td>
					<td></td>
					<td class="text-right"><strong>총액: </strong></td>
					<td class="text-center text-danger"><strong><%=saleprice %></strong></td>
				</tr>
			</table>
			
			<a href="paymentInfo.jsp?cartId=<%=payment_cartId%>" class="btn btn-secondary" role="button">이전</a>
			<a href="thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
			<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
		</div>
	</div>
		</div>
</body>
<%}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
%>
</html>