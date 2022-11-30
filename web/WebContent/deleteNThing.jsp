<%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-11-30
  Time: 오전 1:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
    String NThingId = request.getParameter("NThingId");

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String sql = "SELECT * FROM nthings";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        sql = "DELETE FROM nthings WHERE n_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,NThingId);
        pstmt.executeUpdate();
    } else
        out.println("일치하는 제품이 없습니다");

    if (rs != null)
        rs.close();
    if (pstmt != null)
        pstmt.close();
    if (conn != null)
        conn.close();

    response.sendRedirect("editNThing.jsp?edit=delete");
%>