<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상세페이지</title>
<jsp:include page="link_script.jsp" />
<!-- <link rel="stylesheet" href="css/index.css"> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
$(function(){
	DoughnutChart();
});
function ingestion(id, code){
	var date = $('#date').val();
	var quantity = $('#quantity').val();
	if(quantity == ""){
		alert("수량을 입력해주세요!");
		return false;
	}else if(quantity < 1){
		alert("1 이상의 숫자를 입력해주세요!");
		return false;
	}
	
	//입력 정보의 객체화
	var objParams = {
		"id" : id,
		"code" : code,
		"ingdate" : date,
		"quantity" : quantity
	};
	
	//비동기통신하는데 data JSON.stringify 안하면 spring에서 json데이터를 vo,dto를 컨버팅을 못하니까 까먹지 말고 꼭!
	$.ajax({
		url : "rest/ingestion",
		type : "POST",
		dataType:'json',
		contentType :   "application/json",
		data : JSON.stringify(objParams),
		success : function(data){
			console.log(data);
			if(data.state == "fail"){
				alert("섭취 식품 등록에 실패하였습니다.");
			}else{
				alert("섭취 식품에 추가되었습니다.");
			}
		},
		error  : function(xhr, status,message){
			console.log(message);
		}
	});
	
}

function selectfood(id, code){
	var date = $('#date').val();
	var quantity = $('#quantity').val();
	if(quantity == ""){
		alert("수량을 입력해주세요!");
		return false;
	}else if(quantity < 1){
		alert("1 이상의 숫자를 입력해주세요!");
		return false;
	}
	
	var objParams = {
		"id" : id,
		"code" : code,
		"ingdate" : date,
		"quantity" : quantity
	};
	
	$.ajax({
		url : "rest/selectfood",
		type : "POST",
		dataType:'json',
		contentType :   "application/json",
		data : JSON.stringify(objParams),
		success : function(data){
			console.log(data);
			if(data.state == "fail"){
				alert("찜 목록 등록에 실패하였습니다.");
			}else{
				alert("찜 목록에 추가되었습니다.");
			}
		},
		error  : function(xhr, status,message){
			console.log(message);
		}
	});
	
}

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
table {
	margin-bottom: 60px !important;
}
td {
	text-align: left;
}
th, td {
	vertical-align: middle !important;
}
#chart th {
	background-color: #e8fdff;
}
#chart th, #chart td {
	text-align: center;
}
</style>
</head>

<body role="document">
	<jsp:include page="header.jsp" />
	<div class="header-margin" style="margin-top: 150px;"></div>
	
	<div class="container theme-showcase" role="main" id="contents">
	<h3 class="widget-header min-title">제품 정보</h3>
	<div class="table-responsive">
		<form>
		<table class="table">
			<tr>
				<td rowspan='6'  align="center"><img id="Picture"
					src="img/${food.name}.jpg" width='400px' style="margin-left: 50px; margin-right: 50px;"></td>
				<td id="FName" colspan="3" style="font-size: 40px; font-family: 'Do Hyeon', sans-serif;">${food.name}</td>
			</tr>
			<tr>
				<th width="100px">제조사</th>
				<td id="Brand" colspan="2">${food.maker}</td>
			</tr>
			<tr>
				<th>원재료</th>
				<td id="Ingredient" colspan="2">${food.material}</td>
			</tr>
			<tr>
				<th>알레르기성분</th>
				<td colspan="2">${food.allergy}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${food.count}</td>
			</tr>
			<c:if test="${sessionScope.id != null}">
				<tr>
					
						<td style="width: 250px">
							날짜 <input type="date" required="required" id="date" name="date" style="width: 150px;"/>
						</td>
						<td style="width: 150px">
							수량 <input type="number" required="required" min="1" id="quantity" name="quantity" size="50"
								style="width: 50px;"/>
						</td>
						<td style="text-align: right">
	<%-- 						<button type="button" class="btn btn-info btn-sm" onclick="location.href='ingestion.do?code=${food.code}'">추가</button>  --%>
							<button type="button" class="btn btn-info btn-sm" onclick="ingestion('${sessionScope.id}','${food.code}')">추가</button> 
							<button type="button" class="btn btn-info btn-sm" onclick="selectfood('${sessionScope.id}','${food.code}')">찜</button>
						</td>
				</tr>
			</c:if>

		</table>
		</form>
	</div>
	</div>
	<div class="container theme-showcase" role="main" id="contents" style="margin-bottom: 100px;">
	<h3 class="widget-header min-title">영양 정보</h3><hr /><br>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<canvas id="myChart"></canvas>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-6">
				<div class="table-responsive">
					<table class="table" id="chart" style="margin-top: 70px;">
						<tr>
							<th>일일 제공량</th>
							<th>칼로리</th>
							<th>탄수화물</th>
							<th>단백질</th>
							<th>지방</th>
						</tr>
						<tr>
							<td id="Serving">${food.supportpereat}</td>
							<td id="Cal">${food.calory}</td>
							<td id="Calbo">${food.carbo}</td>
							<td id="Protein">${food.protein}</td>
							<td id="Fat">${food.fat}</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>당류</th>
							<th>나트륨</th>
							<th>콜레스테롤</th>
							<th>포화지방산</th>
							<th>트랜스지방</th>
						</tr>
						<tr>
							<td id="Sweet">${food.sugar}</td>
							<td id="Natrum">${food.natrium}</td>
							<td id="Coles">${food.chole}</td>
							<td id="GoodFat">${food.fattyacid}</td>
							<td id="TransFat">${food.transfat}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>