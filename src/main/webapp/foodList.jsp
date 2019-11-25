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

<title>상품 목록</title>

<link rel="icon" href="../favicon.ico">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="theme.css">

<!-- add -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/slicknav.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Nanum+Gothic|Nanum+Gothic+Coding|Sunflower:300&display=swap">

</head>

<body role="document">
	<jsp:include page="header.jsp" />
	<div class="header-margin" style="margin-top: 150px;"></div>
	<%-- <jsp:include page="jumbotron.jsp" /> --%>

	<div class="container theme-showcase" role="main" id="contents">
		<div class="row">
			<c:forEach items="${list}" var="food" varStatus="status">
				<div class="col-md-2">
					<section>
						<a href="foodDetail.do?code=${food.code}"> <img id="image"
							class="img-responsive" alt="${food.name} poster"
							src="img/${food.name}.jpg" style="width: 150px;">
						</a>
					</section>
				</div>
				<div class="col-md-4">
					<h3>${food.name}</h3>

					<table class="table table-condensed">
						<tbody>
							<tr>
								<td>제품명</td>
								<td colspan="2">${food.name}</td>
							</tr>
							<tr>
								<td>제조사</td>
								<td colspan="2">${food.maker}</td>
							</tr>
							<tr>
								<td>알레르기 성분</td>
								<td colspan="2">${food.allergy}</td>
							</tr>
						</tbody>
					</table>
					<p>
						<c:if test="${not empty sessionScope.id}">
							<a class="btn btn-primary" href="ingestion.do?code=${food.code}"
								role="button">추가</a>\
						<a class="btn btn-primary" href="#" role="button">찜</a>
						</c:if>
					</p>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>