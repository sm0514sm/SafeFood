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
<title>SafeFood - 원산지 정보</title>
<jsp:include page="link_script.jsp" />
</head>

<body role="document">
	<jsp:include page="header.jsp" />
	<div class="header-margin" style="margin-top: 170px;"></div>
	<section class="dashboard section">
		<!-- Container Start -->
		<div class="container">
			<!-- Row Start -->
			<div class="row">
				<div class="col-md-12">
					<div class="widget dashboard-container my-adslist">
						<h3 class="widget-header min-title">국내산 식품 정보</h3>
						<hr />

						<%--수정하다가 더 급한거 먼저 하기로 함 --%>
						<%-- <c:forEach items="${list}" var="food">
							<table class="table table-responsive product-dashboard-table"
								style="text-align: center; border: 3px solid #e1f5fe;">
								<tr style="text-align: center; background-color: #e1f5fe;">
									<th rowspan="3" class="product-thumb"
										style="vertical-align: middle; !important"><a
										class="navbar-brand" href="foodDetail.do?code=${food.code}">
											<img width="150px;" height="auto" src="${food.img}"
											alt="image description" />
									</a></th>
									<th width="200px;" class="text-center">Name</th>
									<th width="200px;" class="text-center">Maker</th>
									<th width="200px;" class="text-center">Calory</th>
									<th width="200px;" class="text-center">Origin</th>
								</tr>

								<tr style="text-align: center;">

									<td class="product-details"
										style="vertical-align: middle; !important"><a
										href="foodDetail.do?code=${food.code}">${food.name}</a></td>
									<td style="vertical-align: middle; !important">${food.maker}</td>
									<td style="vertical-align: middle; !important">${food.calory}</td>
									<td style="vertical-align: middle; !important">국내산</td>
								</tr>
								<tr style="text-align: center;">
									<td colspan="4" style="vertical-align: middle; !important"><div
											style="display: inline-block; overflow: hidden; text-overflow: ellipsis; white-space: normal; line-height: 1.2; text-align: left; word-wrap: break-word; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;">
											${food.material}
											<c:if test="contain"></c:if>
										</div></td>
								</tr>
							</table>
						</c:forEach>
 --%>
						<table class="table table-responsive product-dashboard-table">
							<thead>
								<tr style="text-align: center; background-color:#e1f5fe; border: 3px solid #e1f5fe;">
									<th width="300px;">Image</th>
									<th width="300px;">Name</th>
									<th width="200px;" class="text-center">Maker</th>
									<th width="200px;" class="text-center">Calory</th>
									<th width="200px;" class="text-center">Origin</th>
								</tr>
							</thead>
								<c:forEach items="${list}" var="f">
		
									<tr style="text-align: center; border: 3px solid #e1f5fe;">
										<td class="product-thumb" style="padding:0px; vertical-align: middle; !important"><a class="navbar-brand"
											href="foodDetail.do?code=${f.code}"> <img
												width="120px;" height="auto" src="${f.img}"
												alt="image description" />
										</a></td>
										<td class="product-details" style="vertical-align: middle; !important"><a
											href="foodDetail.do?code=${f.code}">${f.name}</a></td>
										<td style="vertical-align: middle; !important">${f.maker}</td>
										<td style="vertical-align: middle; !important">${f.calory}</td>
										<td style="vertical-align: middle; !important">국내산</td>
									</tr>
								</c:forEach>
							</table>
					</div>
				</div>
			</div>
		</div>
	</section>


	<jsp:include page="footer.jsp" />
</body>
</html>