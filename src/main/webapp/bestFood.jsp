<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>detailList</title>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>

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
<!-- <style>
th {
	font-size: 1.2em;
}
td {
	font-size: 1.1em;
}
</style> -->
</head>
<body role="document">
	<jsp:include page="header.jsp" />
	<div class="header-margin" style="margin-top: 170px;"></div>
	<section class="page-search">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- Advance Search -->
					<div class="advance-search">

						<form name="calory form-inline" action="calory.do" method="post"
							onsubmit="return check()">
							<h3 class="widget-header min-title">섭취 음식 Best 5</h3><hr />
							<%-- <c:forEach items="${list}" var="food" varStatus="status">
								<div class="row">
									${food.name} ${food.count}회
									<img src="${food.img}" width="150px" height="150px"/> 
									${food.maker} <br/>
								</div>
							</c:forEach> --%>
							
							<table class="table table-responsive product-dashboard-table">
								<c:forEach items="${list}" var="f">
									<thead>
										<tr style="text-align: center; background-color:#e1f5fe;">
											<th width="300px;">Image</th>
											<th width="300px;">Product Title</th>
											<th width="200px;" class="text-center">Maker</th>
											<th width="200px;" class="text-center">Calory</th>
											<th width="200px;" class="text-center">Count</th>
										</tr>
									</thead>
		
									<tr style="text-align: center;">
										<td class="product-thumb" style="padding:0px; vertical-align: middle; !important"><a class="navbar-brand"
											href="foodDetail.do?code=${f.code}"> <img
												width="120px;" height="auto" src="${f.img}"
												alt="image description" />
										</a></td>
										<td class="product-details" style="vertical-align: middle; !important"><a
											href="foodDetail.do?code=${f.code}">${f.name}</a></td>
										<td style="vertical-align: middle; !important">${f.maker}</td>
										<td style="vertical-align: middle; !important">${f.calory}</td>
										<td style="vertical-align: middle; !important">${f.count}</td>
									</tr>
								</c:forEach>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>