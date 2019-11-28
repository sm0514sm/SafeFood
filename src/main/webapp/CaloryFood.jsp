<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>detailList</title>
<jsp:include page="link_script.jsp" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script>
	function check() {

		var str = calory.calval.value;
		if (typeof str == "undefined" || str == null || str == "" || $("#search2").val() == null) {
			alert("값을 입력해 주세요.");
			calory.calval.focus();
			return false;
		} else {
			return true;
		}
	}
// 	function DoughnutChart() {		
// 		var ctx = document.getElementById("nutrientChart").getContext('2d');
// 	/*
// 	- Chart를 생성하면서, 
// 	- ctx를 첫번째 argument로 넘겨주고, 
// 	- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
// 	*/
// 		var nutrientChart = new Chart(ctx,
// 		{
// 			type : 'bar',
// 			data : {
// 				labels :['# 총 합산 영양소'],
// 				datasets:[{
// 					label:"칼로리",
// 					backgroundColor : 'rgba(255, 99, 132, 0.2)',
// 					data : [${food.calory}]
// 				},{
// 					label:"탄수화물",
// 					backgroundColor : 'rgba(54, 162, 235, 0.2)',
// 					data : [${food.carbo}]
// 				},{
// 					label:"단백질",
// 					backgroundColor : 'rgba(255, 206, 86, 0.2)',
// 					data : [${food.protein}]
// 				},{
// 					label:"지방",
// 					backgroundColor : 'rgba(75, 192, 192, 0.2)',
// 					data : [${food.fat}]
// 				},{
// 					label:"당류",
// 					backgroundColor : 'rgba(153, 102, 255, 0.2)',
// 					data : [${food.sugar}]
// 				},{
// 					label:"나트륨",
// 					backgroundColor : 'rgba(255, 159, 64, 0.2)',
// 					data : [${food.natrium}]
// 				},{
// 					label:"콜레스테롤",
// 					backgroundColor : 'rgba(255, 215, 000, 0.2)',
// 					data : [${food.chole}]
// 				},{
// 					label:"포화지방산",
// 					backgroundColor : 'rgba(075, 000, 130, 0.2)',
// 					data : [${food.fattyacid}]
// 				},{
// 					label:"트랜스지방",
// 					backgroundColor : 'rgba(105, 105, 105, 0.2)',
// 					data : [${food.transfat}]
// 				}]
// 			},
// 			options : {
// 				maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
// 				scales : {
// 					yAxes : [{
// 						ticks : {
// 							beginAtZero : true
// 						}
// 					}]
// 				},
// 				legend:{
// 					display:true,
// 					position:'bottom'
// 				}
				
// 			}
// 		});
// 	}
</script>
<style>
th {
	width: 300px;
	text-align: center;
	vertical-align: middle;
	background-color:#e1f5fe;
}
</style>
</head>
<body role="document">
	<c:if test="${not empty sessionScope.msg}">	
		<script>	
			alert("${sessionScope.msg}");
		</script>
		<c:remove var="msg" scope="session"/>

	</c:if>
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
						<h3 class="widget-header min-title">Calory별 식품 조합</h3><br><br>
					</c:if>
					<c:set></c:set>
					<c:forEach items="${calory}" var="cal" varStatus="status">
						<h3 style="font-family: 'Sunflower', sans-serif;">${status.count}번째 리스트</h3><hr/>
						<table class="table table-responsive product-dashboard-table">
							<tr>
								<th style="vertical-align: middle;">Image</th>
								<c:forEach items="${cal}" var="f">
									<td class="product-thumb">
										<a class="navbar-brand" href="foodDetail.do?code=${f.code}">
											<img width="150px;" height="auto" src="${f.img}" alt="image description" />
										</a>
									</td>
								</c:forEach>
							</tr>
							<tr>
								<th>Name</th>
								<c:forEach items="${cal}" var="f">
									<td class="product-details" style="vertical-align: middle; !important"><a
										href="foodDetail.do?code=${f.code}">${f.name}</a></td>
								</c:forEach>
							</tr>
							<tr>
								<th>Maker</th>
								<c:forEach items="${cal}" var="f">
									<td style="vertical-align: middle; !important">${f.maker}</td>
								</c:forEach>
							</tr>
							<tr>
								<th>Calory</th>
								<c:forEach items="${cal}" var="f">
									<td style="vertical-align: middle; !important">${f.calory}</td>
								</c:forEach>
							</tr>
							<tr>
								<th>Origin</th>
								<c:forEach items="${cal}" var="f">
									<td style="vertical-align: middle; !important">${f.allergy}</td>
								</c:forEach>
							</tr>
						</table>
<!-- 						<div class="container theme-showcase" role="main" id="contents" style="margin-bottom: 100px"> -->
<%-- 							<canvas id="nutrientChart${nutriList.code}"></canvas> --%>
<!-- 						</div> -->
					</c:forEach>
<%-- 					<c:forEach items="${nutriList}" var="f"> chart list--%>
<%-- 						<td style="vertical-align: middle; !important">${f.calory}</td> --%>
<%-- 					</c:forEach> --%>
					
				</div>
			</div>
			<!-- Row End -->
		</div>
		<!-- Container End -->
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>