<%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-12-01
  Time: 오후 6:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%@ include file="menu.jsp" %>
<body>
<%
  String user_id = (String) session.getAttribute("user_id"); //id라는 String형으로 session을 받아옴

%>
<h3>
  <%=(String)session.getAttribute("user_id") %>님 반갑습니다!
</h3>
<%@ include file="welcome.jsp" %>
<a href="logout.jsp">Logout</a>
</body>
<%@ include file="footer.jsp" %>
</html>
