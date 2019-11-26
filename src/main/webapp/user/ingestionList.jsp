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

<title>섭취 목록</title>

</head>

<body role="document">
	<jsp:include page="../header.jsp" />
	<div class="header-margin" style="margin-top: 150px;"></div>

	<%-- <div class="container theme-showcase" role="main" id="contents">
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
		</div> --%>
	</div>
	<section class="dashboard section">
		<!-- Container Start -->
		<div class="container">
			<!-- Row Start -->
			<div class="row">
				<!-- Recently Favorited -->
				<div class="widget dashboard-container my-adslist">
					<c:if test="${not empty list}">
						<h3 class="widget-header min-title">내 섭취 정보</h3>
					</c:if>
					<table class="table table-responsive product-dashboard-table">
						<c:forEach items="${list}" var="food">
							<thead>
								<tr style="text-align: center; background-color:#e1f5fe;">
									<th width="200">Image</th>
									<th>Product Title</th>
									<th class="text-center">섭취일</th>
									<th class="text-center">칼로리</th>
									<!-- <th class="text-center">알레르기 성분</th> -->
									<th class="text-center">삭제</th>
								</tr>
							</thead>

							<tr style="text-align: center;">
								<td rowspan="2" class="product-thumb" style="vertical-align: middle; !important"><a class="navbar-brand"
									href="searchDetail.do?code=${food.code}"> <img
										width="150px;" height="auto" src="img/${food.foodName}.jpg"
										alt="image description" />
								</a></td>
								<td class="product-details" style="vertical-align: middle; !important"><a
									href="searchDetail.do?code=${food.code}">${food.foodName}</a></td>
								<td style="vertical-align: middle; !important">${food.ingdate}</td>
								<td style="vertical-align: middle; !important">${food.allergy}</td>
								<%-- <td style="vertical-align: middle; !important">${f.allergy}</td> --%>
								<td style="vertical-align: middle; !important"><a href="removeIng.do?ino=${food.ino }">삭제</a></td>
							</tr>
							<tr style="text-align: center;">
								<td colspan="4" style="vertical-align: middle; !important"><div style="display: inline-block;  overflow: hidden; text-overflow: ellipsis; white-space: normal; line-height: 1.2; text-align: left; word-wrap: break-word; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;
								">${food.material}</div></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<!-- Row End -->
		</div>
		<div style="margin:auto;">
			<a class="btn btn-primary" href="showGraph.do" role="button">섭취정보 그래프로 보기</a>
		</div>
		<!-- Container End -->
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>