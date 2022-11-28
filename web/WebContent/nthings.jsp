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
<%
    NThingRepository dao = NThingRepository.getInstance();
    ArrayList<NThing> listOfNThings = dao.getAllNThing();
%>
<div class="container">
    <%
        for (int i = 0; i < listOfNThings.size(); i++) {
            NThing nThing = listOfNThings.get(i);
    %>
    <div class="row" align="left">
        <div class="col-md-3">
            <img src="./resources/images/<%=nThing.getFilename()%>"
                 style="width: 80%" />
        </div>
        <div class="col-md-6">
            <h3><%=nThing.getNThingName()%></h3>
            <p><%=nThing.getDescription()%>
            <p><%=nThing.getWriter() + " | "  + nThing.getUnitPrice()%>원
            </p>
            <a href="nthing.jsp?NThingId=<%=nThing.getNThingId()%>"
               class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a>
        </div>
    </div>
    <hr style="border: grey 1px dashed">
    <%
        }
    %>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>


