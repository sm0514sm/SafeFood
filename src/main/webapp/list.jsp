<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../favicon.ico">

<title>상품 목록</title>

<!-- Bootstrap core CSS -->
<link href="../dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="../dist/css/bootstrap-theme.min.css" rel="stylesheet">

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

	<!-- Fixed navbar -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.html">Safe Food</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="#">공지 사항</a></li>
					<li><a href="product.html">상품 정보</a></li>
					<li><a href="#contact">베스트 섭취 정보</a></li>
					<li><a href="#contact">내 섭취 정보</a></li>
					<li><a href="#contact">예상 섭취 정보</a></li>
				</ul>
				<form class="navbar-form navbar-right">
					<div class="form-group">
						<input type="text" placeholder="ID" class="form-control">
					</div>
					<div class="form-group">
						<input type="password" placeholder="Password" class="form-control">
					</div>
						<a class="btn btn-primary" href="#" role="button">Login</a>
						<a class="btn btn-primary" href="SignIn.html" role="button">Sign in</a>
						
				</form>
			</div>
			<!--/.navbar-collapse -->
		</div>
	</nav>


	<div class="jumbotron">
		<div class="container" id='container1'>
			<h1>WHAT WE PROVIDE</h1>
			<p>건강함 삶을 위한 먹거리 프로젝트</p>
		</div>
	</div>
	<div class="jumbotron2" id='container2'>
		<div class="container">

			<div class="serarch-group">
				<div class="dataTables_search" id="dataTables_search">
					<select id = "searchbox" class="form-control">
						<option value="" disabled selected>검색 항목 선택</option>
						<option value="product">상품명</option>
						<option value="company">제조사</option>
					<!-- 	<option value="price">가격</option> -->
					</select>
				</div>
				<div id="option" class="dataTables_search" id="dataTables_search">
					<input id="searchword" type="text" class="form-control"
						placeholder="검색어를 입력하세요">
				</div>
				<div class="dataTables_search" id="dataTables_search">
						<button id="search" class="btn btn-primary" type="button">검색</button>
				</div>


			</div>
		</div>
	</div>


	<div class="container theme-showcase" role="main" id="contents">


	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type='text/javascript' src='../js/jquery-3.3.1.js'></script>
	<script type="text/javascript">
		$(function() {
			
			$.ajax({
				url : '../res/foodInfo.xml',
				data : {},
				dataType : 'xml',
				success : processResult,
				error : function(err) {
					console.log(err);
				}
			})
			$('#search').on('click', function(event) {
				//var index = $("#searchbox option").index($("#searchbox option:selected"));

				option = $('#searchbox option:selected').val();
				word = $('#searchword').val();
				console.log(option)
				console.log(word)
				$.ajax({
					url : '../res/foodInfo.xml',
					data : {},
					dataType : 'xml',
					success : searchResult,
					error : function(err) {
						console.log(err);
					}
				})
	
			});
		});
		
		function processResult(xmlData, status, xhr) {
			var errorMsg = $('error', xmlData).text(); //<error>의 body 정보 추출
			if (errorMsg != '') { //error가 발생한경우 
				alert(errorMsg);

			} else {
				$('#content').empty();

				var html = '<div class="row">';
				$('food', xmlData)
						.each(

								function(index, item) {
									var imageSrc = $('image', item).text();
									var name = $('name', item).text();
									var material = $('material', item).text();
									var maker = $('maker', item).text();
									var allergy = '';
									/* var allergys=["대두","땅콩","우유","게","새우","참치","연어","쑥","소고기","닭고기","돼지고기","복숭아","민들레","계란흰자"];
									
									for( i=0;i<allergys.length;i++) {
										if(material.search(allergys[i])) {
											allergy += allergys[i];
										}
									} */
									
									
									html += '<div class="col-md-2"><section><a href="FoodDetail.html"><img id="image" class="img-responsive" alt="';
									html+=name;
									html += 'poster" src="../';
									html+=imageSrc;
									html+='"></a></section></div><div class="col-md-4"><h2>'
									html += name
									html += '</h2><p>'
									html += '<table class="table table-condensed"><tbody><tr><td>제품명</td><td>'
									html += name
									html += '</td></tr><tr><td>제조사</td><td>'
									html += maker
									html += '</td></tr><tr><td>알레르기 성분</td><td>'
									html += allergy
									html += '</td></tr></tbody></table></p>'
									html += '<p><a class="btn btn-primary" href="#" role="button">추가</a> '
									html += '<a class="btn btn-primary" href="#" role="button">찜</a></p></div>'

								});
				html += '</div>'
				$('#contents').append(html);
			}
		}

		function searchResult(xmlData, status, xhr) {
			var errorMsg = $('error', xmlData).text(); //<error>의 body 정보 추출
			if (errorMsg != '') { //error가 발생한경우 
				$('#contents').empty();
				alert(errorMsg);

			} else {
				$('#contents').empty();

				/* option = $('#searchbox option:selected').val();	//company, product
				word = $('#searchword').val();
				 */
				var html = '<div class="row">';
				$('food', xmlData).each(function(index, item) {
						var maker = $('maker', item).text();
						var name = $('name', item).text();
						var imageSrc = $('image', item).text();
						var material = $('material', item).text();
						var allergy = '알레르기';
						if(option.search('company') != -1){	//option이 회사면
							
							if (maker.search(word) != -1) {

								console.log(maker)
								html += '<div class="col-md-2"><section><a href="FoodDetail.html"><img id="image" class="img-responsive" alt="';
								html+=name;
								html += 'poster" src="../';
								html+=imageSrc;
								html+='"></a></section></div><div class="col-md-4"><h2>'
								html += name
								html += '</h2><p>'
								html += '<table class="table table-condensed"><tbody><tr><td>제품명</td><td>'
								html += name
								html += '</td></tr><tr><td>제조사</td><td>'
								html += maker
								html += '</td></tr><tr><td>알레르기 성분</td><td>'
								html += allergy
								html += '</td></tr></tbody></table></p>'
								html += '<p><a class="btn btn-primary" href="#" role="button">추가</a> '
								html += '<a class="btn btn-primary" href="#" role="button">찜</a></p></div>'

							}
						}
						else if(option.search('product') != -1){
								if (name.search(word) != -1) {
									

										
										html += '<div class="col-md-2"><section><a href="FoodDetail.html"><img id="image" class="img-responsive" alt="';
										html +=name;
										html += 'poster" src="../';
										html +=imageSrc;
										html +='"></a></section></div><div class="col-md-4"><h2>'
										html += name
										html += '</h2><p>'
										html += '<table class="table table-condensed"><tbody><tr><td>제품명</td><td>'
										html += name
										html += '</td></tr><tr><td>제조사</td><td>'
										html += maker
										html += '</td></tr><tr><td>알레르기 성분</td><td>'
										html += allergy
										html += '</td></tr></tbody></table></p>'
										html += '<p><a class="btn btn-primary" href="#" role="button">추가</a> '
										html += '<a class="btn btn-primary" href="#" role="button">찜</a></p></div>'

									}
						}
						}
				);
				html += '</div>'
				$('#contents').append(html);
			}
		}
	</script>




</body>
</html>