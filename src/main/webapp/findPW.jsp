<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../favicon.ico">

<title>회원 가입</title>

<!-- Bootstrap core CSS -->
<link href="../dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="../dist/css/bootstrap-theme.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="theme.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
</style>
</head>

<body role="document">
	<jsp:include page="navBar.jsp" />
	<jsp:include page="jumbotron.jsp" />

	<div class="container">
		<div class="container theme-showcase" role="main"></div>
		<div class="card card-register mx-auto mt-5">
			<h4 align="center">비밀번호 찾기</h4>
			<h6 align="center">이번에만 특별히 꽁짜로 가르쳐 드림</h6>
			<div class="card-body">
				<form method="post" action="searchPW.do">
					<div class="form-group">
						<div class="form-label-group">
							<label for="inputId">아이디</label>
							<input type="text" id="id"	name="id" class="form-control" placeholder="ID" required="required" value="${id}">
						</div>
					</div>
					<div class="form-group">
						<div class="form-row">
							<div class="form-label-group">
								<label for="inputPassword">Password</label> 
								<input name="pw"
									type="text" id="inputPassword" class="form-control"
									placeholder="Password" value="${pw}" readonly>
							</div>
						</div>
					</div>
					<input type="submit" class="btn btn-primary btn-block" value="비밀번호 찾기">
				</form>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>




	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<script src="../../assets/js/docs.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
