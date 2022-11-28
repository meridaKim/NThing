<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.java.dto.NThing" %>
<%@ page import="main.java.dao.NThingRepository" %>

<%
String id = request.getParameter("id");
if(id == null || id.trim().equals("")){
	response.sendRedirect("nthings.jsp");
	return;
}

NThingRepository dao = NThingRepository.getInstance();

NThing nThing = dao.getNThingById(id);
if(nThing == null){
	response.sendRedirect("exceptionNoNThingId.jsp");
}

ArrayList<NThing> goodsList = dao.getAllNThing();
NThing goods = new NThing();
for(int i=0; i<goodsList.size(); i++){
	goods = goodsList.get(i);
	if(goods.getNThingId().equals(id)){
		break;
	}
}

ArrayList<NThing> list = (ArrayList<NThing>) session.getAttribute("cartlist");
if(list == null){
	list = new ArrayList<NThing>();
	session.setAttribute("cartlist", list);
}

int cnt = 0;
NThing goodsQnt = new NThing();
for(int i=0; i<list.size(); i++){
	goodsQnt = list.get(i);
	if(goodsQnt.getNThingId().equals(id)){
		cnt++;
		int orderQuantity = goodsQnt.getQuantity()+1;
		goodsQnt.setQuantity(orderQuantity);
	}
}

if(cnt == 0){
	goods.setQuantity(1);
	list.add(goods);
}

response.sendRedirect("nthing.jsp?NThingId="+id);

%>