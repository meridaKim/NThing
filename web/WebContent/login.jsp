<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">로그인</h1>
	</div>
</div>
<div class="container" align="center">
	<div class="col-md-4 cold-md-offset-4">
		<h3 class="form-singin-heading">Please sign in</h3>
		<%
			String error = request.getParameter("error");
			if(error != null){
				out.println("<div class='alert alert-danger'>");
				out.println("아이디와 비밀번호를 확인해주세요.");
				out.println("</div>");
			}
		%>
		<form class="form-signin" action="processLogin.jsp" method="post">
			<div class="form-group">
				<label class="sr-only">user_id</label>
				<input type="text" class="form-control" placeholder="user_id" name='user_id' required autofocus>
			</div>
			<div class="form-group">
				<label class="sr-only">user_pw</label>
				<input type="password" class="form-control" placeholder="user_pw" name='user_pw' required>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</div>
		</form>
	</div>
</div>

<input type="button" value="getCookList" onclick="location.href='session_info.jsp'">
</body>
</html>
