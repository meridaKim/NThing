<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="main.java.dto.NThing" %>
<%@ page import="main.java.dao.NThingRepository" %>

<%
String cartId= request.getParameter("cartId");
if(cartId == null || cartId.trim().equals("")){
	response.sendRedirect("cart.jsp");
	return;
}

session.invalidate();

response.sendRedirect("cart.jsp");

%>