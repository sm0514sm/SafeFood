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
<script src="js/vendor/jquery-1.12.4.min.js"></script>
<style>
th, td {
	padding-top: 2px !important;
	padding-bottom: 2px !important;
}
</style>
</head>

<body role="document">
	<c:if test="${sessionScope.addFlag==true}">
		<script type="text/javascript">
			alert('식품 추가에 성공하였습니다.');		
		</script>
		<c:remove var="addFlag" scope="session"/>
	</c:if>
	<c:if test="${sessionScope.selectFlag==true}">
		<script type="text/javascript">
			alert('식품 찜에 성공하였습니다.');		
		</script>
		<c:remove var="selectFlag" scope="session"/>
	</c:if>

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
								<c:if test="${not empty sessionScope.id}">
									<button type="button" class="btn btn-info btn-sm" onclick="location.href='ingestion.do?code=${food.code}'">추가</button> 
									<button type="button" class="btn btn-info btn-sm" onclick="location.href='selectfood.do?code=${food.code}'">찜</button>
								</c:if>
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
					</table>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>