<%@ page import="java.io.PrintWriter" %>
<%@ page import="main.java.dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-11-28
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <%
    request.setCharacterEncoding("utf-8");
    String userID = null;
    String userPassword = null;

    if (request.getParameter("userID") != null) {
      userID = (String) request.getParameter("userID");
    }

    if (request.getParameter("userPassword") != null) {
      userPassword = (String) request.getParameter("userPassword");
    }

//    if (userID == null || userPassword == null) {
//      PrintWriter script = response.getWriter();
//      script.println("<script>");
//      script.println("alert('입력이 안 된 사항이 있습니다.')");
//      script.println("</script>");
//      script.close();
//      return;
//    }

    UserDao userDao = new UserDao();
    int result = userDao.join(userID, userPassword);
    if (result == 1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('회원가입에 성공했습니다.')");
      script.println("location.href='nthings.jsp';");
      script.println("</script>");
      script.close();
      return;
    }
  %>
</body>
</html>
