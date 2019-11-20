<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
$(function(){
	DoughnutChart();
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
// 				backgroundColor : [ 
// 						'rgba(255, 99, 132, 0.2)',
// 						'rgba(54, 162, 235, 0.2)',
// 						'rgba(255, 206, 86, 0.2)',
// 						'rgba(75, 192, 192, 0.2)',
// 						'rgba(153, 102, 255, 0.2)',
// 						'rgba(255, 159, 64, 0.2)',
// 						'rgba(255, 215, 000, 0.2)',
// 						'rgba(075, 000, 130, 0.2)',
// 						'rgba(105, 105, 105, 0.2)' ],
// 				borderColor : [ 
// 						'rgba(255,99,132,1)',
// 						'rgba(54, 162, 235, 1)',
// 						'rgba(255, 206, 86, 1)',
// 						'rgba(75, 192, 192, 1)',
// 						'rgba(153, 102, 255, 1)',
// 						'rgba(255, 159, 64, 1)',
// 						'rgba(255, 215, 000, 1)',
// 						'rgba(075, 000, 130, 1)',
// 						'rgba(105, 105, 105, 1)' ],
// 				borderWidth : 1
// 				}]
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
<title>섭취 목록</title>

<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="dist/css/bootstrap-theme.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="theme.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body role="document">
	<jsp:include page="../navBar.jsp" />
	<jsp:include page="../jumbotron.jsp" />

	<div class="container theme-showcase" role="main" id="contents">
		<canvas id="myChart"></canvas>
	</div>
</body>
</html>