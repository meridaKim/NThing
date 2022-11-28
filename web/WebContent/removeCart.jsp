<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.java.dto.NThing" %>
<%@ page import="main.java.dao.NThingRepository" %>

<%
String NThingId = request.getParameter("NThingId");
if(NThingId == null || NThingId.trim().equals("")){
	response.sendRedirect("nthings.jsp");
	return;
}

	NThingRepository dao = NThingRepository.getInstance();

	NThing nThing = dao.getNThingById(NThingId);
if(nThing == null){
	response.sendRedirect("exceptionNoNThingId.jsp");
}

ArrayList<NThing> cartList = (ArrayList<NThing>)session.getAttribute("cartlist");
	NThing goodsQnt = new NThing();
for(int i=0; i<cartList.size(); i++){
	goodsQnt = cartList.get(i);
	if(goodsQnt.getNThingId().equals(NThingId)){
		cartList.remove(goodsQnt);
	}
}

response.sendRedirect("cart.jsp");
%>