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

	String sql = "SELECT * FROM nthings WHERE n_id = 9";
	pstmt = conn.prepareStatement(sql);
//	int nthingid = Integer.parseInt(NThingId);
//	pstmt.setInt(1, nthingid);
	rs = pstmt.executeQuery();

			if (rs.next()) {
				 sql = "insert into nthingcart (n_id, n_name,n_unitPrice,n_nthinger) select n_id, n_name, n_unitPrice, n_nthinger from nthings WHERE n_id=9";
				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1,nthingid);
				pstmt.executeUpdate();
			}

		response.sendRedirect("cart.jsp");

%>