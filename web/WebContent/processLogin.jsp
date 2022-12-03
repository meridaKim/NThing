<%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-11-28
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="main.java.dto.User" %>
<%@ page import="java.sql.ResultSet" %>
<%@include file="dbconn.jsp"%>

  <%
    request.setCharacterEncoding("utf-8");
    String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");
    PreparedStatement pstmt =null;
    ResultSet rs = null;
    String sql = "select * from user";
    pstmt = conn.prepareStatement(sql);
    rs =pstmt.executeQuery();
    while (rs.next()) {
      String user_name = rs.getString(1);
      String user_psw = rs.getString(2);
      if (rs.getString(1).equals(user_id)&& user_id !=null &&rs.getString(2).equals(user_pw) && user_pw != null) {
        session.setAttribute("user_id", user_name);
          session.setAttribute("user_pw", user_psw);
          response.sendRedirect("welcome.jsp");
        } else {
          out.print("<script>alert('NThinger가 아닙니다!');  location.href='welcome.jsp'</script>");

        }
    }
    if (pstmt !=null)
      pstmt.close();
    if(conn != null)
      conn.close();
  %>

<%--//    if (session.getAttribute("user_id")!= null) {--%>
<%--//--%>
<%--//      user_id = (String) session.getAttribute("user_id");--%>
<%--//--%>
<%--//    }else{--%>
<%--//      session.setAttribute("user_id");--%>
<%--//    }--%>
<%--//--%>
<%--//    if (request.getParameter("user_pw") != null) {--%>
<%--//      user_pw = (String) request.getParameter("user_pw");--%>
<%--//    }--%>
<%--//--%>
<%--////    PreparedStatement pstmt =null;--%>
<%--//--%>
<%--////    pstmt = conn.prepareStatement(sql);--%>
<%--//    pstmt.setString(1, user_id);--%>
<%--//    pstmt.setString(2, user_pw);--%>
<%--//    pstmt.executeUpdate();--%>
<%--//--%>
<%--//--%>
<%--//    response.sendRedirect("nthings.jsp");--%>


