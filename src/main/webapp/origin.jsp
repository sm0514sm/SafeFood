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
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
<title>SafeFood - 원산지 정보</title>
</head>

<body role="document">
	<jsp:include page="header.jsp" />
	<div class="header-margin" style="margin-top: 150px;"></div>
	<section class="dashboard section">
		<!-- Container Start -->
		<div class="container">
			<!-- Row Start -->
			<div class="row">
				<div class="col-md-12">
					<div class="widget dashboard-container my-adslist">
						<h3 class="widget-header min-title"> 국내산 식품 정보 </h3>
						<table class="table table-responsive product-dashboard-table" style="width:800px; border: 1.5px solid #e1f5fe;">
							<tr style="text-align: center; background-color:#e1f5fe;">
								<th>Image</th>
								<th>Product</th>
								<th>Maker</th>
								<th>Origin</th>
							</tr>
							<c:forEach items="${list}" var="food" varStatus="status">
								<tr>
									<td width="200" style="text-align: center; vertical-align: middle;"><img src="${food.img}" width="150" height="150"/></td>
									<td width="200"  style="text-align: center; background-color:#e1f5fe; vertical-align: middle;">${food.name}</td>
									<td width="200"  style="text-align: center; vertical-align: middle;">${food.maker}</td>
									<td width="200"  style="text-align: center; background-color:#e1f5fe; vertical-align: middle;">국내산</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	

	<jsp:include page="footer.jsp"/>
</body>
</html>