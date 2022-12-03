<%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-12-01
  Time: 오후 6:51
  To change this template use File | Settings | File Templates.
--%>

<%
  request.setCharacterEncoding("utf-8");
  String user_id = (String) session.getAttribute("user_id"); //id라는 String형으로 session을 받아옴

%>
<h3>

  안녕하세요! <%=(String)session.getAttribute("user_id") %>엔띵러!
</h3>
<a href="logout.jsp">Logout</a>
</body>
</html>
