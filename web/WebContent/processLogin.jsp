<%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-11-28
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@include file="dbconn.jsp"%>
<html>
<head>
    <title>processLogin</title>
</head>
<body>
  <%
    request.setCharacterEncoding("utf-8");
    String user_id = null;
    String user_pw = null;

    if (request.getParameter("user_id") != null) {
      user_id = (String) request.getParameter("user_id");
    }

    if (request.getParameter("user_pw") != null) {
      user_pw = (String) request.getParameter("user_pw");
    }

//    if (userID == null || userPassword == null) {
//      PrintWriter script = response.getWriter();
//      script.println("<script>");
//      script.println("alert('입력이 안 된 사항이 있습니다.')");
//      script.println("</script>");
//      script.close();
//      return;
//    }
    PreparedStatement pstmt =null;
    String sql = "insert into user values(?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, user_id);
    pstmt.setString(2, user_pw);
    pstmt.executeUpdate();

    if (pstmt !=null)
      pstmt.close();
    if(conn != null)
      conn.close();
    response.sendRedirect("nthings.jsp");
  %>
</body>
</html>
