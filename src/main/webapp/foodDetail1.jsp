<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>detailList</title>
<link rel="stylesheet" href="css/index.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="dist/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="theme.css" rel="stylesheet">
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
<script type="text/javascript">
$(function(){
				DoughnutChart();
});

function DoughnutChart() {		
	// 우선 컨텍스트를 가져옵니다. 
	var ctx = document.getElementById("myChart").getContext('2d');
	/*
	 - Chart를 생성하면서, 
	 - ctx를 첫번째 argument로 넘겨주고, 
	 - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
	 */
	var myChart = new Chart(ctx,
			{
				type : 'doughnut',
				data : {
					labels : [ "칼로리", "탄수화물", "단백질", "지방", "당류", "나트륨",
							"콜레스테롤", "포화지방산", "트랜스지방" ],
					datasets : [ {
						label : '# of Votes',
						data : [ ${food.calory}, ${food.carbo}, ${food.protein}, ${food.fat}, ${food.sugar}, ${food.natrium},
								${food.chole}, ${food.fattyacid}, ${food.transfat} ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)',
								'rgba(255, 215, 000, 0.2)',
								'rgba(075, 000, 130, 0.2)',
								'rgba(105, 105, 105, 0.2)' ],
						borderColor : [ 'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)',
								'rgba(255, 215, 000, 1)',
								'rgba(075, 000, 130, 1)',
								'rgba(105, 105, 105, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
	}


</script>
<style>
#title {
	text-align: center;
}

.table {
	margin: auto;
	align: center;
	width: 80%;
}

#table td {
	text-align: left;
}

#table th {
	width: 5%;
}
</style>

</head>
<header>
<jsp:include page="navBar.jsp"/>
</header>
<body role="document">
	
	<div id="title">
		<h1>제품 정보</h1>
	</div>
	<br />
	<div class="container" style=" text-align: center">
		<i class="fa fa-github-square" style="font-size: 80px;"></i>
	</div>
	<br/>
	<div class="table-responsive">
		<table id="table" class="table" style="margin: auto;">
			<tr>
				<td rowspan='6' width='30%' align="center">
				<img id="Picture" src="img/${food.name}.jpg" width='200px' height='200px'>
				</td>
			</tr>
			<tr>
				<th>제품명</th>
				<td id="FName">${food.name}</td>
			</tr>
			<tr>
				<th>제조사</th>
				<td id="Brand">${food.maker}</td>
			</tr>
			<tr>
				<th>원재료</th>
				<td id="Ingredient">${food.material}</td>
			</tr>
			<tr>
				<th>알레르기성분</th>
				<td>${food.allergy}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${food.count}</td>
			</tr>
			<tr>
				<th align='left'>Quantity&nbsp;<br /> <input type="number"
					required="required" min="1" id='person' />
				<p />
					<br />
					<button type='button' class='btn btn-info'>추가</button>
					<button type='button' class='btn btn-info'>찜</button>
				</th>
				<td></td>
			</tr>
		</table>
	</div>
	<br />
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<canvas id="myChart"></canvas>
			</div>
			<div class="col-md-6">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th>일일 제공량</th>
							<td id="Serving">${food.supportpereat}</td>
						</tr>
						<tr>
							<th>칼로리</th>
							<td id="Cal">${food.calory}</td>
						</tr>
						<tr>
							<th>탄수화물</th>
							<td id="Calbo">${food.carbo}</td>
						</tr>
						<tr>
							<th>단백질</th>
							<td id="Protein">${food.protein}</td>
						</tr>
						<tr>
							<th>지방</th>
							<td id="Fat">${food.fat}</td>
						</tr>
						<tr>
							<th>당류</th>
							<td id="Sweet">${food.sugar}</td>
						</tr>
						<tr>
							<th>나트륨</th>
							<td id="Natrum">${food.natrium}</td>
						</tr>
						<tr>
							<th>콜레스테롤</th>
							<td id="Coles">${food.chole}</td>
						</tr>
						<tr>
							<th>포화지방산</th>
							<td id="GoodFat">${food.fattyacid}</td>
						</tr>
						<tr>
							<th>트랜스지방</th>
							<td id="TransFat">${food.transfat}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>