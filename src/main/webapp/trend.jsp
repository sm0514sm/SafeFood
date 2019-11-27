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
						<h3 class="widget-header min-title">Food Trend</h3><hr />
						<!-- google trend -->
						<script type="text/javascript" src="https://ssl.gstatic.com/trends_nrtr/1982_RC01/embed_loader.js"></script>
						<script type="text/javascript"> trends.embed.renderExploreWidget("RELATED_QUERIES"
								, {"comparisonItem":[{"keyword":"음식","geo":"KR","time":"today 12-m"}]
								,"category":0,"property":""}
								, {"exploreQuery":"geo=KR&q=%EC%9D%8C%EC%8B%9D&date=today 12-m"
								,"guestPath":"https://trends.google.co.kr:443/trends/embed/"}); 
						</script> 
						<script type="text/javascript" src="https://ssl.gstatic.com/trends_nrtr/1982_RC01/embed_loader.js"></script> 
						<script type="text/javascript"> 
							trends.embed.renderExploreWidget("RELATED_TOPICS"
								, {"comparisonItem":[{"keyword":"food","geo":"KR","time":"today 12-m"}]
								,"category":0,"property":""}
								, {"exploreQuery":"q=food&geo=KR&date=today 12-m","guestPath":"https://trends.google.co.kr:443/trends/embed/"}); 
						</script> 
						<script type="text/javascript" src="https://ssl.gstatic.com/trends_nrtr/1982_RC01/embed_loader.js"></script>
						<script type="text/javascript"> 
							trends.embed.renderExploreWidget("GEO_MAP"
								, {"comparisonItem":[{"keyword":"음식","geo":"KR","time":"today 12-m"}]
								,"category":0,"property":""}
								, {"exploreQuery":"geo=KR&q=%EC%9D%8C%EC%8B%9D&date=today 12-m"
								,"guestPath":"https://trends.google.co.kr:443/trends/embed/"}); 
						</script> 
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>