<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>detailList</title>
<script src="js/vendor/jquery-1.12.4.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script>
	function check() {
		var str = calory.calval.value;
		if (typeof str == "undefined" || str == null || str == "") {
			alert("값을 입력해 주세요.");
			calory.calval.focus();
			return false;
		} else {
			return true;
		}
	}
</script>

</head>
<body role="document">
	<jsp:include page="header.jsp" />
	<div class="header-margin" style="margin-top: 150px;"></div>
	<section class="page-search">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- Advance Search -->
					<div class="advance-search">

						<form name="calory form-inline" action="calory.do" method="post"
							onsubmit="return check()">
							<div class="row">
								<div class="col-sm-2">
									<label for="calinput" class="sr-only">칼로리 입력</label> <input
										type="text" readonly class="form-control-plaintext"
										id="calinput" value="칼로리 입력">
								</div>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="search2"
										name="calval" placeholder="칼로리 입력">
								</div>
								<div class="col-sm-5">
									<button type="submit" class="btn btn-info mb-2" id="searchbtn">검색</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--==================================
=            User Profile            =
===================================-->
	<section class="dashboard section">
		<!-- Container Start -->
		<div class="container">
			<!-- Row Start -->
			<div class="row">
				<!-- Recently Favorited -->
				<div class="widget dashboard-container my-adslist">
					<c:if test="${not empty calory}">
						<h3 class="widget-header min-title">Calory별 식품 조합</h3>
					</c:if>
					<table class="table table-responsive product-dashboard-table">
						<c:forEach items="${calory}" var="f">
							<thead>
								<tr style="text-align: center; background-color:#e1f5fe;">
									<th width="300px;">Image</th>
									<th width="300px;">Product Title</th>
									<th width="300px;" class="text-center">제조사</th>
									<th width="300px;" class="text-center">칼로리</th>
									<th width="300px;" class="text-center">알레르기 성분</th>
								</tr>
							</thead>

							<tr style="text-align: center;">
								<td rowspan="2" class="product-thumb" style="vertical-align: middle; !important"><a class="navbar-brand"
									href="foodDetail.do?code=${f.code}"> <img
										width="150px;" height="auto" src="${f.img}"
										alt="image description" />
								</a></td>
								<td class="product-details" style="vertical-align: middle; !important"><a
									href="foodDetail.do?code=${f.code}">${f.name}</a></td>
								<td style="vertical-align: middle; !important">${f.maker}</td>
								<td style="vertical-align: middle; !important">${f.calory}</td>
								<td style="vertical-align: middle; !important">${f.allergy}</td>
							</tr>
							<tr style="text-align: center;">
								<td colspan="4" style="vertical-align: middle; !important"><div style="display: inline-block;  overflow: hidden; text-overflow: ellipsis; white-space: normal; line-height: 1.2; text-align: left; word-wrap: break-word; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;
								">${f.material}</div></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<!-- Row End -->
		</div>
		<!-- Container End -->
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>