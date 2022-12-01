<%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-11-29
  Time: 오후 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <title>수정할 게시글 선택하기</title>
    <script type="text/javascript">
        function deleteConfirm(NThingId) {
            if (confirm("해당 도서를 삭제합니다!!") == true)
                location.href = "./deleteNThing.jsp?NThingId=" + NThingId;
            else
                return;
        }
    </script>
</head>
<%
    String edit = request.getParameter("edit");
%>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">게시글 선택수정</h1>
    </div>
</div>
<div class="container">
    <%@ include file="dbconn.jsp"%>
    <%
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM nthings";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        while (rs.next()) {
    %>
    <div class="row">
        <div class="col-md-3" align="center">
            <img src="./resources/images/<%=rs.getString("n_fileName")%>"
                 style="width: 50%">
        </div>
        <div class="col-md-7">
            <p><h5><b>[<%=rs.getString("n_category")%>] <%=rs.getString("n_name")%></b></h5>
            <p style="padding-top: 20px"><%=rs.getString("n_description")%>...
            <p><%=rs.getString("n_writer")%> | <%=rs.getString("n_writeDate")%> | <%=rs.getString("n_unitPrice")%>원
        </div>
        <div class="col-md-2" style="padding-top: 70px">
            <p><%
					if (edit.equals("update")) {
				%>
                <a href="./updateNThing.jsp?NThingId=<%=rs.getString("n_id")%>"
                   class="btn btn-success" role="button">수정하기 &raquo;</a>
                    <%
					}else if (edit.equals("delete")) {
				%>
                <a href="#" onclick="deleteConfirm('<%=rs.getString("n_id")%>')"
                   class="btn btn-danger" role="button">삭제 &raquo;</a>
                    <%
					}
				%>
        </div>
    </div>
    <hr>
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