<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css" />
<title>주문 완료</title>
</head>
<body>
	<%
		String payment_cartId ="";
		String payment_name ="";
		String paymentDate ="";

		
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if (n.equals("payment_cartId"))
					payment_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if (n.equals("paymentDate"))
					paymentDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
		}
	%>
	<jsp:include page="menu.jsp" />

		<div class="container">
			<h1 class="display-3" style="font-family: Gugi;">주문 완료</h1>
		</div>

	<div class="container">
		<h2 class="alert alert-danger">엔띵러에게 엔띵 신청이 완료되었습니다!</h2>
		<p> 주문은 <%	out.println(paymentDate); %>에 발송될 예정입니다!
		<p> 주문번호 : <% out.println(payment_cartId); %>
	</div>
	<div class="container">
		<p> <a href="./nthings.jsp" class="btn btn-secondary">&laquo; 상품 목록</a>
	</div>
</body>
</html>
<%
	session.invalidate();
	
	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if (n.equals("payment_cartId"))
			thisCookie.setMaxAge(0);
		if (n.equals("payment_name"))
			thisCookie.setMaxAge(0);
		if (n.equals("paymentDate"))
			thisCookie.setMaxAge(0);
		response.addCookie(thisCookie);
	}
%>