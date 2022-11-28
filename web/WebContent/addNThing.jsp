<%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-11-27
  Time: 오후 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script type="text/javascript" src="./resources/js/validation.js"></script>
    <title>상품 등록</title>

</head>
<body>

<fmt:setLocale value='<%=request.getParameter("language") %>' />
    <fmt:bundle basename="main.java.bundle.message">

    <%@ include file="menu.jsp" %>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3"><fmt:message key="title"/></h1>
        </div>
    </div>
    <div class="container">
        <div class="text-right">
            <a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
            <a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
        </div>
        <form name="newNThing" action="processAddNThing.jsp" class="form-horizontal" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="NThingId"/></label>
                <div class="col-sm-3">
                    <input type="text" id="NThingId" name="NThingId" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="NThingName"/></label>
                <div class="col-sm-3">
                    <input type="text" id="NThingName" name="NThingName" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="unitPrice"/></label>
                <div class="col-sm-3">
                    <input type="text" id="unitPrice" name="unitPrice" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="writer"/></label>
                <div class="col-sm-3">
                    <input type="text" name="writer" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="writeDate"/></label>
                <div class="col-sm-3">
                    <input type="text" name="writeDate" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="totalSalePercent"/></label>
                <div class="col-sm-3">
                    <input type="text" name="totalSalePercent" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="description"/></label>
                <div class="col-sm-5">
                    <textarea name="description" cols="50" rows="2" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="category"/></label>
                <div class="col-sm-3">
                    <input type="text" name="category" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
                <div class="col-sm-3">
                    <input type="text" id="unitsInStock" name="unitsInstock" class="form-control">
                </div>
            </div>
                <%--		<div class="form-group row">--%>
                <%--			<label class="col-sm-2"><fmt:message key="condition"/></label>--%>
                <%--			<div class="col-sm-5">--%>
                <%--				<input type="radio" name="condition" value="New " >--%>
                <%--				신규 제품--%>
                <%--				<input type="radio" name="condition" value="Old ">--%>
                <%--				중고 제품--%>
                <%--				<input type="radio" name="condition" value="Refurbished">--%>
                <%--				재생 제품--%>
                <%--			</div>--%>
                <%--		</div>--%>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="siteName"/></label>
                <div class="col-sm-3">
                    <input type="text" name="siteName" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="NThingImage"/></label>
                <div class="col-sm-5">
                    <input type="file" name="NThingImage" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="button" class="btn btn-primary" value='<fmt:message key="button"/>' onclick="CheckAddNThing()">
                </div>
            </div>
        </form>
    </div>
    </fmt:bundle>

</body>
</html>
