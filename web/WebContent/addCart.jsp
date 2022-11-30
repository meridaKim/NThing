<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.java.dto.NThing" %>
<%@ page import="main.java.dao.NThingRepository" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ include file="dbconn.jsp"%>
<%
String NThingId = request.getParameter("NThingId");
if(NThingId == null || NThingId.trim().equals("")){
	response.sendRedirect("nthings.jsp");
	return;
}
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM nthings WHERE n_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, NThingId);
	rs = pstmt.executeQuery();
	if (rs.next()) {

		if (rs.getString("n_id") == null) {
			response.sendRedirect("exceptionNoNThingId.jsp");
		}

		ArrayList<NThing> goodsList = dao.getAllNThing();
		NThing goods = new NThing();
		for (int i = 0; i < goodsList.size(); i++) {
			goods = goodsList.get(i);
			if (goods.getNThingId().equals(NThingId)) {
				break;
			}
		}

		ArrayList<NThing> list = (ArrayList<NThing>) session.getAttribute("cartlist");
		if (list == null) {
			list = new ArrayList<NThing>();
			session.setAttribute("cartlist", list);
		}

		int cnt = 0;
		NThing goodsQnt = new NThing();
		for (int i = 0; i < list.size(); i++) {
			goodsQnt = list.get(i);
			if (goodsQnt.getNThingId().equals(NThingId)) {
				cnt++;
				int orderQuantity = goodsQnt.getQuantity() + 1;
				goodsQnt.setQuantity(orderQuantity);
			}
		}

		if (cnt == 0) {
			goods.setQuantity(1);
			list.add(goods);
		}

		response.sendRedirect("nthing.jsp?NThingId=" + NThingId);
	}
%>