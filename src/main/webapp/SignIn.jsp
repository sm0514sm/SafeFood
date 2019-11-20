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
			<h4 align="center">회원가입</h4>
			<div class="card-body">
				<form method="post" action="signIn.do">
					<div class="form-group">
						<div class="form-label-group">
							<label for="inputId">아이디</label> <input type="text" id="id"
								name="id" class="form-control" placeholder="ID"
								required="required">
						</div>
					</div>

					<div class="form-group">
						<div class="form-row">
							<div class="form-label-group">
								<label for="inputPassword">Password</label> <input name="pw"
									type="password" id="inputPassword" class="form-control"
									placeholder="Password" required="required">
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="form-label-group">
							<label for="inputName">이름</label> <input type="text" name="name"
								id="name" class="form-control" placeholder="name">
						</div>
					</div>

					<div class="form-group">
						<div class="form-label-group">
							<label for="inputEmail">Email address</label> <input type="email"
								name="email" id="email" class="form-control"
								placeholder="Email address">
						</div>
					</div>

					<div class="form-group">
						<div class="form-label-group">
							<label for="inputAddress">주소</label> <input type="text"
								name="address" id="address" class="form-control"
								placeholder="address">
						</div>
					</div>

					<div class="form-group">
						<div class="form-label-group">
							<label for="inputPhone">전화번호</label> <input type="text"
								name="phone" id="phone" class="form-control"
								placeholder="phonenumber">
						</div>
					</div>

					<div class="form-group">
						<div class="form-label-group">

							<div class="form-group row">
								<div class="col-sm-2">Checkbox</div>
								<div class="col-sm-10">
									<div class="form-check">
										<input class="form-check-input" type="checkbox"
											id="gridCheck1" name="allergy" value="대두"> <label
											class="form-check-label" for="gridCheck1"> 대두 </label>
										&nbsp;&nbsp;&nbsp; <input class="form-check-input"
											type="checkbox" id="gridCheck2" name="allergy" value="땅콩">
										<label> 땅콩 </label> &nbsp;&nbsp;&nbsp; <input
											class="form-check-input" type="checkbox" id="gridCheck2"
											name="allergy" value="우유"> <label
											class="form-check-label" for="gridCheck1"> 우유 </label>
										&nbsp;&nbsp;&nbsp; <input class="form-check-input"
											type="checkbox" id="gridCheck2" name="allergy" value="게">
										<label class="form-check-label" for="gridCheck1"> 게 </label> <br>
										<input class="form-check-input" type="checkbox"
											id="gridCheck2" name="allergy" value="새우"> <label
											class="form-check-label" for="gridCheck1"> 새우 </label>
										&nbsp;&nbsp;&nbsp; <input class="form-check-input"
											type="checkbox" id="gridCheck2" name="allergy" value="참치">
										<label class="form-check-label" for="gridCheck1"> 참치 </label>
										&nbsp;&nbsp;&nbsp; <input class="form-check-input"
											type="checkbox" id="gridCheck2" name="allergy" value="연어">
										<label class="form-check-label" for="gridCheck1"> 연어 </label>
										&nbsp;&nbsp;&nbsp; <input class="form-check-input"
											type="checkbox" id="gridCheck2" name="allergy" value="쑥">
										<label class="form-check-label" for="gridCheck1"> 쑥 </label> <br>
										<input class="form-check-input" type="checkbox"
											id="gridCheck2" name="allergy" value="소고기"> <label
											class="form-check-label" for="gridCheck1"> 소고기 </label>
										&nbsp;&nbsp;&nbsp; <input class="form-check-input"
											type="checkbox" id="gridCheck2" name="allergy" value="닭고기">
										<label class="form-check-label" for="gridCheck1"> 닭고기
										</label> &nbsp;&nbsp;&nbsp; <input class="form-check-input"
											type="checkbox" id="gridCheck2" name="allergy" value="돼지고기">
										<label class="form-check-label" for="gridCheck1"> 돼지고기
										</label> <br> <input class="form-check-input" type="checkbox"
											id="gridCheck2" name="allergy" value="복숭아"> <label
											class="form-check-label" for="gridCheck1"> 복숭아 </label>
										&nbsp;&nbsp;&nbsp; <input class="form-check-input"
											type="checkbox" id="gridCheck2" name="allergy" value="민들레">
										<label class="form-check-label" for="gridCheck1"> 민들레
										</label> &nbsp;&nbsp;&nbsp; <input class="form-check-input"
											type="checkbox" id="gridCheck2" name="allergy" value="계란흰자">
										<label class="form-check-label" for="gridCheck1"> 계란흰자
										</label>
									</div>
								</div>
							</div>

						</div>
					</div>

					<input type="submit" class="btn btn-primary btn-block" value="등록">
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="login.html">Login Page</a> 
					<a class="d-block small" href="forgot-password.html">Forgot Password?</a>
				</div>
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
