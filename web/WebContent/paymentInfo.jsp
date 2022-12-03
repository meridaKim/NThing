<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css" />
<title>결제 신청 내역</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
		<div class="container">
			<h1 class="display-3" style="font-family: Gugi">결제 내역</h1>
		</div>

	<div class="container">
		<form action="processPaymentInfo.jsp" class="form-horizontal" method="post">
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId") %>" />
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">결제일</label>
				<div class="col-sm-3">
					<input name="paymentDate" type="text" class="form-control" />(yyyy/mm/dd)
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>" class="btn btn-secondary" role="button">이전</a>
					<input type="submit" class="btn btn-primary" value="등록" />
					<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>