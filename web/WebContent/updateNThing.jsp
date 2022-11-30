<%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-11-30
  Time: 오전 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <title>게시글 수정</title>
</head>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">게시글 수정</h1>
    </div>
</div>
<%@ include file="dbconn.jsp"%>
<%
    String NThingId = request.getParameter("NThingId");

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String sql = "SELECT * FROM nthings WHERE n_id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, NThingId);
    rs = pstmt.executeQuery();
    if (rs.next()) {
%>
<div class="container">
    <div class="row">
        <div class="col-md-5">
            <img src="./resources/images/<%=rs.getString("n_fileName")%>"
                 style="width: 80%" />
        </div>
        <div class="col-md-7">
            <form name="newNThing" action="./processUpdateNThing.jsp"
                  class="form-horizontal" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                    <label class="col-sm-2">NThingID</label>
                    <div class="col-sm-3">
                        <input type="text" id="NThingId" name="NThingId" class="form-control"
                               value='<%=rs.getString("n_id")%>'>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">분류 코드</label>
                    <div class="col-sm-3">
                        <input type="text" name="category" class="form-control"
                               value='<%=rs.getString("n_category")%>'>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">제품명</label>
                    <div class="col-sm-3">
                        <input type="text" id="NThingName" name="NThingName" class="form-control"
                               value='<%=rs.getString("n_name")%>'>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">원가</label>
                    <div class="col-sm-3">
                        <input type="text" id="unitPrice" name="unitPrice"
                               class="form-control" value='<%=rs.getString("n_unitPrice")%>'>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">총 할인율</label>
                    <div class="col-sm-3">
                        <input type="text" name="totalSalePercent" class="form-control"
                               value='<%=rs.getString("n_totalSalePercent")%>'>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">공구 인원 수</label>
                    <div class="col-sm-3">
                        <input type="text" name="NThinger" class="form-control"
                               value='<%=rs.getString("n_nthinger")%>'>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">작성자</label>
                    <div class="col-sm-3">
                        <input type="text" name="writer" class="form-control"
                               value='<%=rs.getString("n_writer")%>'>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">작성일자</label>
                    <div class="col-sm-3">
                        <input type="text" name="writeDate" class="form-control"
                               value='<%=rs.getString("n_writeDate")%>'>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">상세정보</label>
                    <div class="col-sm-5">
							<textarea name="description" cols="50" rows="2"
                                      class="form-control" placeholder="100자 이상 적어주세요"><%=rs.getString("n_description")%></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">재고수</label>
                    <div class="col-sm-3">
                        <input type="text" id="unitsInStock" name="unitsInStock"
                               class="form-control" value='<%=rs.getString("n_unitsInStock")%>'>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">이미지</label>
                    <div class="col-sm-5">
                        <input type="file" name="NThingImage" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-offset-2 col-sm-10 ">
                        <input type="submit" class="btn btn-primary" value="등록">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%
    }
    if (rs != null)
        rs.close();
    if (pstmt != null)
        pstmt.close();
    if (conn != null)
        conn.close();
%>
</body>
</html>