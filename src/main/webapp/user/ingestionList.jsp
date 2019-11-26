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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
$(function(){
	DoughnutChart();
	DoRed();
});

function DoughnutChart() {		
	var ctx = document.getElementById("nutrientChart").getContext('2d');
/*
- Chart를 생성하면서, 
- ctx를 첫번째 argument로 넘겨주고, 
- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
*/
	var nutrientChart = new Chart(ctx,
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
	var ctx = document.getElementById("allergyChart").getContext('2d');
	/*
	- Chart를 생성하면서, 
	- ctx를 첫번째 argument로 넘겨주고, 
	- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
	*/
		var allergyChart = new Chart(ctx,
		{
			type : 'bar',
			data : {
				labels :['# 총 합산 알레르기 유발 성분'],
				datasets:[{
					label:"대두",
					backgroundColor : 'rgba(255, 99, 132, 0.2)',
					data : [${allerCnt[0]}]
				},{
					label:"땅콩",
					backgroundColor : 'rgba(54, 162, 235, 0.2)',
					data : [${allerCnt[1]}]
				},{
					label:"우유",
					backgroundColor : 'rgba(255, 206, 86, 0.2)',
					data : [${allerCnt[2]}]
				},{
					label:"게",
					backgroundColor : 'rgba(75, 192, 192, 0.2)',
					data : [${allerCnt[3]}]
				},{
					label:"새우",
					backgroundColor : 'rgba(153, 102, 255, 0.2)',
					data : [${allerCnt[4]}]
				},{
					label:"참치",
					backgroundColor : 'rgba(255, 159, 64, 0.2)',
					data : [${allerCnt[5]}]
				},{
					label:"연어",
					backgroundColor : 'rgba(255, 215, 000, 0.2)',
					data : [${allerCnt[6]}]
				},{
					label:"쑥",
					backgroundColor : 'rgba(075, 000, 130, 0.2)',
					data : [${allerCnt[7]}]
				},{
					label:"소고기",
					backgroundColor : 'rgba(222, 222, 105, 0.2)',
					data : [${allerCnt[8]}]
				},{
					label:"닭고기",
					backgroundColor : 'rgba(105, 222, 222, 0.2)',
					data : [${allerCnt[9]}]
				},{
					label:"돼지고기",
					backgroundColor : 'rgba(157, 100, 85, 0.2)',
					data : [${allerCnt[10]}]
				},{
					label:"복숭아",
					backgroundColor : 'rgba(35, 25, 105, 0.2)',
					data : [${allerCnt[11]}]
				},{
					label:"민들레",
					backgroundColor : 'rgba(195, 195, 195, 0.2)',
					data : [${allerCnt[12]}]
				},{
					label:"계란흰자",
					backgroundColor : 'rgba(5, 105, 15, 0.2)',
					data : [${allerCnt[13]}]
				}]
			},
			options : {
				maintainAspectRatio : false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
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
function DoRed(){
	Array.prototype.forEach.call(document.getElementsByTagName("td"), function(el) { 
		el.innerHTML = el.innerHTML.replace("${allergies[0]}", "<span style='color: red;'>${allergies[0]}</span>"); 
		el.innerHTML = el.innerHTML.replace("${allergies[1]}", "<span style='color: red;'>${allergies[1]}</span>"); 
		el.innerHTML = el.innerHTML.replace("${allergies[2]}", "<span style='color: red;'>${allergies[2]}</span>"); 
		el.innerHTML = el.innerHTML.replace("${allergies[3]}", "<span style='color: red;'>${allergies[3]}</span>"); 
		el.innerHTML = el.innerHTML.replace("${allergies[4]}", "<span style='color: red;'>${allergies[4]}</span>"); 
		el.innerHTML = el.innerHTML.replace("${allergies[5]}", "<span style='color: red;'>${allergies[5]}</span>"); 
		el.innerHTML = el.innerHTML.replace("${allergies[6]}", "<span style='color: red;'>${allergies[6]}</span>"); 
		el.innerHTML = el.innerHTML.replace("${allergies[7]}", "<span style='color: red;'>${allergies[7]}</span>"); 
		el.innerHTML = el.innerHTML.replace("${allergies[8]}", "<span style='color: red;'>${allergies[8]}</span>"); 
		el.innerHTML = el.innerHTML.replace("${allergies[9]}", "<span style='color: red;'>${allergies[9]}</span>"); 
		el.innerHTML = el.innerHTML.replace("${allergies[10]}", "<span style='color: red;'>${allergies[10]}</span>"); 
		el.innerHTML = el.innerHTML.replace("${allergies[11]}", "<span style='color: red;'>${allergies[11]}</span>"); 
		el.innerHTML = el.innerHTML.replace("${allergies[12]}", "<span style='color: red;'>${allergies[12]}</span>"); 
		el.innerHTML = el.innerHTML.replace("${allergies[13]}", "<span style='color: red;'>${allergies[13]}</span>"); 
	});
} 


</script>
<title>섭취 목록</title>

</head>

<body role="document">
	<jsp:include page="../header.jsp" />
	<div class="header-margin" style="margin-top: 150px;"></div>

	<%-- <div class="container theme-showcase" role="main" id="contents">
		<table class="table table-condensed">
			<c:forEach items="${list}" var="ingestion">
				<tr>
					<td>${ingestion.id}</td>
					<td>${ingestion.foodName}</td>
					<td>${ingestion.ingdate}</td>
					<td>${ingestion.material}</td>
					<td><a href="removeIng.do?ino=${ingestion.ino }">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		<!-- 이거 가운데 정렬 해주라 -->
		<div style="margin:auto;">
			<a class="btn btn-primary" href="showGraph.do" role="button">섭취정보 그래프로 보기</a>
		</div> --%>
	</div>
	<section class="dashboard section">
		<!-- Container Start -->
		<div class="container">
			<!-- Row Start -->
			<div class="row">
				<!-- Recently Favorited -->
				<div class="widget dashboard-container my-adslist">
					<c:if test="${not empty list}">
						<h3 class="widget-header min-title">내 섭취 정보</h3>
					</c:if>
					<table class="table table-responsive product-dashboard-table">
						<c:forEach items="${list}" var="food">
							<thead>
								<tr style="text-align: center; background-color:#e1f5fe;">
									<th width="200">Image</th>
									<th>Product Title</th>
									<th class="text-center">섭취일</th>
									<th class="text-center">칼로리</th>
									<!-- <th class="text-center">알레르기 성분</th> -->
									<th class="text-center">삭제</th>
								</tr>
							</thead>

							<tr style="text-align: center;">
								<td rowspan="2" class="product-thumb" style="vertical-align: middle; !important"><a class="navbar-brand"
									href="searchDetail.do?code=${food.code}"> <img
										width="150px;" height="auto" src="img/${food.foodName}.jpg"
										alt="image description" />
								</a></td>
								<td class="product-details" style="vertical-align: middle; !important"><a
									href="searchDetail.do?code=${food.code}">${food.foodName}</a></td>
								<td style="vertical-align: middle; !important">${food.ingdate}</td>
								<td style="vertical-align: middle; !important">${food.allergy}</td>
								<%-- <td style="vertical-align: middle; !important">${f.allergy}</td> --%>
								<td style="vertical-align: middle; !important"><a href="removeIng.do?ino=${food.ino }">삭제</a></td>
							</tr>
							<tr style="text-align: center;">
								<td colspan="4" style="vertical-align: middle; !important"><div style="display: inline-block;  overflow: hidden; text-overflow: ellipsis; white-space: normal; line-height: 1.2; text-align: left; word-wrap: break-word; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;
								">
									${food.material}
									<c:if test="contain"></c:if>
								</div>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div class="container theme-showcase" role="main" id="contents">
						<canvas id="nutrientChart"></canvas>
					</div>
					<div class="container theme-showcase" role="main" id="contents">
						<canvas id="allergyChart"></canvas>
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