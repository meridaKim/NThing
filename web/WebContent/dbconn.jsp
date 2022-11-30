<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-11-29
  Time: 오후 10:04
  To change this template use File | Settings | File Templates.
--%>
<%
    Connection conn = null;

    try{
        String dbURL = "jdbc:mysql://localhost:3306/nthing?useSSL=false&serverTimezone=UTC";
        String dbID = "root";
        String dbPassword = "347858Kkk!";
        Class.forName("com.mysql.cj.jdbc.Driver");
       conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
    } catch (Exception e) {
        out.println("데이터베이스 연결이 실패했습니다.");
        out.println("SQLException: "+ e.getMessage());

    }
%>
