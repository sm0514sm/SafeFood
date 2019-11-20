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
<header>
<jsp:include page="navBar.jsp"/>
</header>
<body role="document">
	<section class="page-search">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- Advance Search -->
					<div class="advance-search">
						<form name="calory" action="calory.do" method="post" onsubmit="return check()">
							<div class="row">
								<!-- Store Search -->
								<div class="col-lg-4 col-md-12">
									<div class="block d-flex">
										<select class="form-control mb-2 mr-sm-2 mb-sm-0" id="search1"
											style="height: 50px; background-color: #5672F9;"
											name="keyword">
											<option value="cal" selected>칼로리</option>
										</select>
									</div>
								</div>
								<div class="col-lg-8 col-md-12">
									<div class="block d-flex">
										<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
											id="search2" placeholder="칼로리 입력" name="calval" />
										<!-- Search Button -->
										<button class="btn btn-main" id="searchbtn"
											style="height: 50px; border: solid 1px white; border-radius: 2px;">
											검색</button>
									</div>
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
				<div class="col-md-10 offset-md-1 col-lg-12 offset-lg-0">
					<!-- Recently Favorited -->
					<div class="widget dashboard-container my-adslist">
						<h3 class="widget-header">FoodList</h3>
						<table class="table table-responsive product-dashboard-table">
							<thead>
								<tr>
									<th>Image</th>
									<th>Product Title</th>
									<th class="text-center">Category</th>
									<th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody id="list">
								<c:forEach items="${calory}" var="f">

									<tr>
										<td class="product-thumb"><a class="navbar-brand"
											href="searchDetail.do?code=${f.code}"> <img width="100%"
												height="auto" src="${f.img}" alt="image description" /></a></td>
										<td class="product-details"><a
											href="searchDetail.do?code=${f.code}"><h3 class="title">${f.name}</h3></a>
											<span class="add-id"><strong>칼로리</strong></span>${f.calory} <span
											class="add-id"><strong>제조사</strong></span>${f.maker} <span><strong>원재료</strong></span>
											<div class="list-details">${f.material}</div></td>
										<td class="product-category"><span class="categories">음료</span></td>
										<td class="action" data-title="Action">
											<div class="">
												<ul class="list-inline justify-content-center">
													<li class="list-inline-item"><input type="number"
														required="required" min="1" /> <a class="edit" href=""><i
															class="fa fa-plus"></i></a></li>
												</ul>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Row End -->
		</div>
		<!-- Container End -->
	</section>
</body>
</html>