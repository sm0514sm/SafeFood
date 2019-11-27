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
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
$(function(){
	DoughnutChart();
	DoughnutChart2();
});

function DoughnutChart() {		
	var ctx = document.getElementById("myChart").getContext('2d');
/*
- Chart를 생성하면서, 
- ctx를 첫번째 argument로 넘겨주고, 
- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
*/
	var myChart = new Chart(ctx,
	{
		type : 'bar',
		data : {
			labels :['# 총 합산 영양소'],
			datasets:[{
				label:"칼로리",
				backgroundColor : 'rgba(255, 99, 132, 0.2)',
				data : [${food.calory}]
			},{
				label:"탄수화물",
				backgroundColor : 'rgba(54, 162, 235, 0.2)',
				data : [${food.carbo}]
			},{
				label:"단백질",
				backgroundColor : 'rgba(255, 206, 86, 0.2)',
				data : [${food.protein}]
			},{
				label:"지방",
				backgroundColor : 'rgba(75, 192, 192, 0.2)',
				data : [${food.fat}]
			},{
				label:"당류",
				backgroundColor : 'rgba(153, 102, 255, 0.2)',
				data : [${food.sugar}]
			},{
				label:"나트륨",
				backgroundColor : 'rgba(255, 159, 64, 0.2)',
				data : [${food.natrium}]
			},{
				label:"콜레스테롤",
				backgroundColor : 'rgba(255, 215, 000, 0.2)',
				data : [${food.chole}]
			},{
				label:"포화지방산",
				backgroundColor : 'rgba(075, 000, 130, 0.2)',
				data : [${food.fattyacid}]
			},{
				label:"트랜스지방",
				backgroundColor : 'rgba(105, 105, 105, 0.2)',
				data : [${food.transfat}]
			}]
		},
		options : {
			maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
			scales : {
				yAxes : [{
					ticks : {
						beginAtZero : true
					}
				}]
			},
			legend:{
				display:true,
				position:'bottom'
			}
			
		}
	});
}

function DoughnutChart2() {		
	var ctx = document.getElementById("myChart2").getContext('2d');
/*
- Chart를 생성하면서, 
- ctx를 첫번째 argument로 넘겨주고, 
- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
*/
	var myChart = new Chart(ctx,
	{
		type : 'bar',
		data : {
			labels :['# 총 합산 영양소'],
			datasets:[{
				label:"칼로리",
				backgroundColor : 'rgba(255, 99, 132, 0.2)',
				data : [${food2.calory}]
			},{
				label:"탄수화물",
				backgroundColor : 'rgba(54, 162, 235, 0.2)',
				data : [${food2.carbo}]
			},{
				label:"단백질",
				backgroundColor : 'rgba(255, 206, 86, 0.2)',
				data : [${food2.protein}]
			},{
				label:"지방",
				backgroundColor : 'rgba(75, 192, 192, 0.2)',
				data : [${food2.fat}]
			},{
				label:"당류",
				backgroundColor : 'rgba(153, 102, 255, 0.2)',
				data : [${food2.sugar}]
			},{
				label:"나트륨",
				backgroundColor : 'rgba(255, 159, 64, 0.2)',
				data : [${food2.natrium}]
			},{
				label:"콜레스테롤",
				backgroundColor : 'rgba(255, 215, 000, 0.2)',
				data : [${food2.chole}]
			},{
				label:"포화지방산",
				backgroundColor : 'rgba(075, 000, 130, 0.2)',
				data : [${food2.fattyacid}]
			},{
				label:"트랜스지방",
				backgroundColor : 'rgba(105, 105, 105, 0.2)',
				data : [${food2.transfat}]
			}]
		},
		options : {
			maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
			scales : {
				yAxes : [{
					ticks : {
						beginAtZero : true
					}
				}]
			},
			legend:{
				display:true,
				position:'bottom'
			}
			
		}
	});
}
</script>

<title>내 찜 목록</title>

</head>

<body role="document">
	<jsp:include page="../header.jsp" />
	<div class="header-margin" style="margin-top: 170px;"></div>

	<section class="dashboard section">
		<!-- Container Start -->
		<div class="container">
			<!-- Row Start -->
			<div class="row">
				<!-- Recently Favorited -->
				<div class="widget dashboard-container my-adslist">
					<c:if test="${not empty list}">
						<h3 class="widget-header min-title">예상 섭취 정보</h3>
					</c:if>
					<table class="table table-responsive product-dashboard-table" style="margin-bottom: 80px">
						<c:forEach items="${list}" var="food">
							<thead>
								<tr style="text-align: center; background-color:#e1f5fe;">
									<th width="300px;">Image</th>
									<th width="300px;">Product Title</th>
<!-- 									<th width="300px;" class="text-center">칼로리</th> -->
									<th width="300px;" class="text-center">알레르기 성분</th>
									<th width="300px;" class="text-center">섭취</th>
								</tr>
							</thead>

							<tr style="text-align: center;">
								<td rowspan="2" class="product-thumb"
									style="vertical-align: middle; !important"><a
									class="navbar-brand" href="foodDetail.do?code=${food.code}">
										<img width="150px;" height="auto" src="${food.img}"
										alt="image description" />
									</a>
								</td>
								<td class="product-details" style="vertical-align: middle; !important"><a
									href="searchDetail.do?code=${f.ino}">${f.foodName}</a></td>
<%-- 								<td style="vertical-align: middle; !important">${f.calory}</td> --%>
								<td style="vertical-align: middle; !important">${f.allergy}</td>
								<td style="vertical-align: middle; !important">
									<button class="btn btn-info btn-sm" onclick="location.href='selectToIngesFood.do?code=${f.code}&ino=${f.ino}'">섭취</button>
									<button class="btn btn-info btn-sm" onclick="location.href='deleteSelectFood.do?code=${f.code}'">삭제</button>
								</td>
							</tr>
							<tr style="text-align: center;">
								<td colspan="4" style="vertical-align: middle; !important"
									class="allergyTd"><div
										style="display: inline-block; overflow: hidden; text-overflow: ellipsis; white-space: normal; line-height: 1.2; text-align: left; word-wrap: break-word; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;">
										${food.material}
										<c:if test="contain"></c:if>
									</div></td>
							</tr>
						</c:forEach>
					</table>

					<h3 class="widget-header min-title" style="margin-bottom: 10px">찜
						목록 추가 전 섭취 영양소 그래프</h3>
					<hr />
					<div class="container theme-showcase" role="main" id="contents"
						style="margin-bottom: 100px">
						<canvas id="myChart"></canvas>
					</div>
					<h3 class="widget-header min-title" style="margin-bottom: 10px">찜
						목록 추가 시 섭취 영양소 그래프</h3>
					<hr />
					<div class="container theme-showcase" role="main" id="contents">
						<canvas id="myChart2"></canvas>
					</div>
				</div>
			</div>
			<!-- Row End -->
		</div>

		<!-- Container End -->
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>