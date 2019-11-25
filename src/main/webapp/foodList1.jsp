<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<title>상품 목록</title>

<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">
<link href="dist/css/bootstrap-theme.min.css" rel="stylesheet">

<link href="theme.css" rel="stylesheet">

</head>

<body role="document">
	
	<jsp:include page="navBar.jsp" />
	<jsp:include page="jumbotron.jsp" />

	<div class="container theme-showcase" role="main" id="contents">
		<c:forEach items="${list}" var="food">
			<div class="col-md-2">
				<section>
				<a href="foodDetail.do?code=${food.code}">
					<img id="image" class="img-responsive" alt="${food.name} poster"
						src="img/${food.name}.jpg">
				</a>
				</section>
			</div>
			<div class="col-md-4">
				<h3>${food.name}</h3>
				
				<table class="table table-condensed">
					<tbody>
						<tr>
							<td>제품명</td>
							<td>${food.name}</td>
						</tr>
						<tr>
							<td>제조사</td>
							<td>${food.maker}</td>
						</tr>

						<tr>
							<td>알레르기 성분</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<p>
					<c:if test="${not empty sessionScope.id}">
						<a class="btn btn-primary" href="ingestion.do?code=${food.code}" role="button">추가</a>\
						<a class="btn btn-primary" href="#" role="button">찜</a>
					</c:if>
				</p>
			</div>
		</c:forEach>
	</div>
</body>
</html>