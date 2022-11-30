<%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-11-27
  Time: 오후 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="main.java.dto.NThing"%>
<%@ page import="main.java.dao.NThingRepository"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page errorPage="exceptionNoPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>NThing 목록</title>
</head>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">NThing List</h1>
        <p>엔띵러들과 함께 공구해요!</p>
    </div>
</div>
<%--<%--%>
<%--    NThingRepository dao = NThingRepository.getInstance();--%>
<%--    ArrayList<NThing> listOfNThings = dao.getAllNThing();--%>
<%--%>--%>
<%@ include file="dbconn.jsp"%>
<%
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "SELECT * FROM nthings";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    while (rs.next()) {
%>
<div class="container">
<%--    <%--%>
<%--        for (int i = 0; i < listOfNThings.size(); i++) {--%>
<%--            NThing nThing = listOfNThings.get(i);--%>
<%--    %>--%>
    <div class="row" align="left">
        <div class="col-md-3">
            <img src="./resources/images/<%=rs.getString("n_fileName")%>"
                 style="width: 80%" />
        </div>
        <div class="col-md-6">
            <h3><%=rs.getString("n_name")%></h3>
            <p><%=rs.getString("n_category")%></p>
            <p><%=rs.getString("n_description")%></p>
            <p><%=rs.getString("n_writer")+ " | 원가 : "  + rs.getString("n_unitPrice")%>원
            </p>
            <p>할인율: <%=rs.getString("n_totalSalePercent")%>%</p>
            <p><%=rs.getString("n_description")%></p>
            <%
                int person = (Integer.parseInt(rs.getString("n_nthinger")))+1;
                int saleprice = Integer.parseInt(rs.getString("n_unitPrice")) / person;

            %>
            <p><h4>할인가 : <%=saleprice%>원</h4></p>
            <a href="nthing.jsp?NThingId=<%=rs.getString("n_id")%>"
               class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a>
        </div>
    </div>
    <hr style="border: grey 1px dashed">
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
    <%
        }
        if (rs != null)
            rs.close();
        if (pstmt != null)
            pstmt.close();
        if (conn != null)
            conn.close();
    %>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>


