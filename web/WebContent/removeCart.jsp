<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.java.dto.NThing" %>
<%@ page import="main.java.dao.NThingRepository" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%@ include file="dbconn.jsp"%>

<%

	String NThingId = request.getParameter("NThingId");
if(NThingId == null || NThingId.trim().equals("")){
	response.sendRedirect("nthings.jsp");
	return;
}
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "SELECT * FROM nthingcart WHERE n_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, NThingId);
	rs = pstmt.executeQuery();

	int nthingid = Integer.parseInt(NThingId);
	if (rs.next()) {
		sql = "delete from nthingcart WHERE n_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, nthingid);
		pstmt.executeUpdate();
	}

	response.sendRedirect("cart.jsp");

%>