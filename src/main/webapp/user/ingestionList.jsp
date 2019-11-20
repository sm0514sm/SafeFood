<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<title>섭취 목록</title>

<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="dist/css/bootstrap-theme.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="theme.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body role="document">
	<jsp:include page="../navBar.jsp" />
	<jsp:include page="../jumbotron.jsp" />

	<div class="container theme-showcase" role="main" id="contents">
		<table class="table table-condensed">
			<c:forEach items="${list}" var="ingestion">
				<tr>
					<td>${ingestion.id}</td>
					<td>${ingestion.foodName}</td>
					<td>${ingestion.ingdate}</td>
					<td>${ingestion.material}</td>
					<td><a href="removeIng.do?ino=${ingestion.ino }">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		<!-- 이거 가운데 정렬 해주라 -->
		<div style="margin:auto;">
			<a class="btn btn-primary" href="showGraph.do" role="button">섭취정보 그래프로 보기</a>
		</div>
	</div>
</body>
</html>