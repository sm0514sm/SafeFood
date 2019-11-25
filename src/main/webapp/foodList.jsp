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
<style>
th, td {
	padding-top: 2px !important;
	padding-bottom: 2px !important;
}
</style>
</head>

<body role="document">
	<jsp:include page="header.jsp" />
	<div class="header-margin" style="margin-top: 150px;"></div>
	<%-- <jsp:include page="jumbotron.jsp" /> --%>

	<div class="container theme-showcase" role="main" id="contents">
		<h3 class="widget-header min-title">Food List</h3>
		<!-- <h5 style="text-align:right">조회순 정렬</h5> -->
		
		<div class="row">
			<c:forEach items="${list}" var="food" varStatus="status">
				<div class="col-md-6">
					<table class="table table-responsive product-dashboard-table" style="border: 1.5px solid #e1f5fe;">
						<tr style="text-align: center; background-color: #e1f5fe; height: 50px;">
							<th width="200" style="vertical-align: middle; !important">Image</th>
							<th width="350" style="vertical-align: middle; !important">Product</th>
							<th width="200" class="text-center" style="vertical-align: middle; !important">Maker</th>
						</tr>

						<tr style="text-align: center;">
							<td rowspan="3" class="product-thumb" style="vertical-align: middle; !important">
								<a href="foodDetail.do?code=${food.code}"><img id="image" class="img-responsive" alt="${food.name} poster" src="img/${food.name}.jpg" style="width: 150px;"></a>
							</td>
							<td style="vertical-align: middle; !important">${food.name}</td>
							<td style="vertical-align: middle; !important">${food.maker}</td>

						</tr>

						<tr style="text-align: center; background-color: #e1f5fe;">
							<th width="350" style="vertical-align: middle; !important">Allergy</th>
							<th width="200" style="vertical-align: middle; !important">Calory</th>
						</tr>

						<tr style="text-align: center;">
							<td style="vertical-align: middle; !important">${food.allergy}</td>
							<td style="vertical-align: middle; !important">${food.calory}</td>
						</tr>
						<%-- <p>
							<c:if test="${not empty sessionScope.id}">
								<a class="btn btn-primary" href="ingestion.do?code=${food.code}"
									role="button">추가</a>\
							<a class="btn btn-primary" href="#" role="button">찜</a>
							</c:if>
						</p> --%>
					</table>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>