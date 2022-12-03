<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	Cookie cartId = new Cookie("payment_cartId", URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
	Cookie name = new Cookie("payment_name", URLEncoder.encode(request.getParameter("name"),"utf-8"));
	Cookie paymentDate = new Cookie("paymentDate", URLEncoder.encode(request.getParameter("paymentDate"),"utf-8"));


	
	cartId.setMaxAge(24 * 60 * 60);
	name.setMaxAge(24 * 60 * 60);


	
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(paymentDate);

	
	response.sendRedirect("orderConfirmation.jsp");
%>