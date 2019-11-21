<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="dist/css/bootstrap-theme.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="theme.css" rel="stylesheet">
<script type="text/javascript">
	function login() {
		var frm = document.getElementById("loginForm");
		frm.submit();
	}
</script>

</head>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav" style=>
				<li><a class="navbar-brand" href="index.do">Safe Food</a>
				<li><a href="user.test">공지 사항</a></li>
				<li><a href="foodList.do">상품 정보</a></li>
				<li><a href="#contact">베스트 섭취 정보</a></li>
				<li><a href="CaloryFood.jsp">칼로리별 섭취</a>
				<li><a href="/dist/index.html">Q&A</a></li>
				<c:choose>
					<c:when test="${sessionScope.id != null}">
					<li><a href="ingestionList.do">내 섭취 정보</a></li>
					<li><a href="#contact">예상 섭취 정보</a></li>
					</c:when>
				</c:choose>
			</ul>
			<form class="navbar-form navbar-right" method="post" action="login.do" id="loginForm">
			<c:choose>
				<c:when test="${sessionScope.id == null}">
							<div class="form-group">
							<input type='hidden' name="action">
								<input type="text" name='id' placeholder="ID" class="form-control">
								<input type="password" name='pw' placeholder="Password"	class="form-control">
								<a class="btn btn-primary" href="javascript:login()" role="button">Login</a>
								<a class="btn btn-primary" href="SignIn.jsp" role="button">Signin</a>
								<a class="btn btn-primary" href="findPW.do" role="button">forgot PassWord?</a>
							</div>
				</c:when>
				<c:otherwise>
				<div class="form-group">
					<a class="btn btn-primary">${sessionScope.id } 님 환영합니다</a> 
					<a class="btn btn-primary" href="userInfo.do" role="button">Modify</a> 
					<a class="btn btn-primary" href="logout.do" role="button">Logout</a>
				</div>
				</c:otherwise>
			</c:choose>
			</form>
		</div>
		<!--/.navbar-collapse -->
		
		<c:if test="${not empty msg}">
			<script>alert('${msg}')</script>
		</c:if>
	</div>
</nav>