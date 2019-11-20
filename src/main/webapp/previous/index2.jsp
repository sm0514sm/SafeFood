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

<title>SafeFood</title>

<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="dist/css/bootstrap-theme.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="theme.css" rel="stylesheet">
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
	<script type="text/javascript">
		$(function() {
			$.ajax({
				url : 'main.test',
				data : { action : 'searchAllProductAjax.do'},
				dataType : 'json',
				success : processResult,
				error : function(err) {
					console.log(err);
				}
			})
			
/* 			$('#search').click(function(){
				$.ajax({
					url : 'main.do',
					data : { action : 'searchProductAjax.do',
							searchItem : $('#searchbox option:selected').val(),
							searchWord : $('#searchWord').val()	
					},
					dataType : 'json',
					success : processResult,
					error : function(err) {
						console.log(err);
					}
				})
			}) */
		});

		function processResult(data, status, xhr) {
				console.log(data)
				$('#contents').empty();
				var html = '<div class="row">';
				$.each(data,function(index, item) {
					var imageSrc = $('image', item).text();
					var name = $('name', item).text();
					var material = $('material', item).text();
					html+='<div class="col-lg-6 portfolio-item">';
					html+='<div class="card h-100"> <a href="FoodDetail.html"><img class="card-img-top" src="../';
					html+=imageSrc;
					html+='"alt="';
					html+=name;
					html+='"></a><div class="card-body"><h4 class="card-title"><a href="#">';
					html+=name;
					html+='</a></h4><p class="card-text">';
					html+=material;
					html+='</p><p><a class="btn btn-primary" href="#" role="button">추가</a>' 
					html+='<a class="btn btn-primary" href="#" role="button">찜</a></p></div></div></div>'
				});
				html+='</div>'
				$('#contents').append(html);
			}
	
		
	</script>
</head>

<body role="document">
	<jsp:include page="../navBar.jsp"/>
	<jsp:include page="../jumbotron.jsp"/>
	<div class="container theme-showcase" role="main" id="contents">
	</div>

</html>
    