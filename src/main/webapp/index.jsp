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
<title>SafeFood</title>
<jsp:include page="link_script.jsp" />
<script type="text/javascript">
$(function(){
	 $("#searchword").keyup(function(){
		 var input = document.getElementById("searchword").value; 
		 /* console.log("input : ", input) */
		 $.ajax({
			 url : "searchCharacter.do",
			 type : "get",
			 data :{input: input},
			 error  : function(xhr, status,message){
				 alert("error:"+message + xhr + status);
			 },
			 success : function(data){
				 $("#testtest").html(data + "");
			 }
		 });
	 });
});
function search() {
	if (document.getElementById("searchbox").value == null) {
		alert("검색 조건을 설정해 주세요");
		return;
	}
	/* alert(document.getElementById("searchbox").selectedIndex);
	alert(document.getElementById("searchbox").text);
	alert(document.getElementById("searchbox").value); */
	var frm = document.getElementById("searchForm");
	frm.submit();
}
</script>
</head>
<body>
	<!-- slider_area-start -->
	<jsp:include page="header.jsp" />
	<div class="slider_area zigzag_bg_2">
		<div class="slider_sctive owl-carousel">
			<div class="single_slider slider_img_1"
				style="background-image: url(../img/banner/banner-2.png)">
				<div class="single_slider-iner">
					<div class="slider_contant text-center"
						style="background: #ffffffdd !important">
						<h3>
							Safe Food <br> Service.
						</h3>
						<p style="font-size: 1.5em">made by ssafy seoul team trinity</p>
						<br>
						<form method="get" action="searchKeyword.do" id="searchForm">
							<div class="input-group mb-3" style="margin-bottom: 0px !important;">
								<div class="col-4" style="padding: 0px !important;">
									<select id="searchbox" name="searchSelect" class="form-control">
										<option value="" disabled selected>검색 조건</option>
										<option value="name">상품명</option>
										<option value="maker">제조사</option>
										<option value="material">영양소</option>
									</select>
								</div>
								<div class="col-5" style="padding: 0px !important;">
									<input type="text" class="form-control" id="searchword"
										name="searchWord" aria-label="Text input with dropdown button"
										placeholder="검색어 입력">
								</div>  
								<div class="col-2" style="padding: 0px !important;">
									<a href="javascript:search()">
										<button id="search" class="btn btn-info" type="button">검색</button>
									</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- <div class="single_slider slider_img_1"
				style="background-image: url(../img/banner/banner.png)">
				<div class="single_slider-iner">
					<div class="slider_contant text-center"
						style="background: #ffffffdd !important">
						<h3>
							Safe Food <br> Service.
						</h3>
						<p style="font-size: 1.5em">made by ssafy seoul team kmando</p>
					</div>
				</div>
			</div> -->


			<!-- <div class="single_slider slider_img_1">
                <div class="single_slider-iner">
                    <div class="slider_contant text-center">
                        <h3>Food Catering <br>
                            Service.</h3>
                            <p>inappropriate behavior is often laughed off as “boys will be boys,” women <br>
                            face higher conduct standards especially in the workplace. That’s why it’s <br>
                                crucial that, as women.</p>
                    </div>
                </div>
            </div> -->
		</div>
	</div>
	<!-- slider_area-end -->

	<!-- service_area-start -->
	<div class="service_area">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title mb-60">
						<h3>Our Services</h3>
						<p>
							inappropriate behavior is often laughed off as “boys will be
							boys,” women face higher conduct standards <br> especially
							in the workplace. That’s why it’s crucial that, as women.
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-4 col-md-6">
					<div class="single_service">
						<div class="service_icon">
							<i class="flaticon-gift"></i>
						</div>
						<h4>식품 영양정보 관리</h4>
						<p>식품 별 첨가물, 영양 정보를 관리하고, 각 식품별 영양소 및 사용자별 알레르기 정보 확인해보세요 !</p>
					</div>
				</div>
				<div class="col-xl-4 col-md-6">
					<div class="single_service">
						<div class="service_icon">
							<i class="flaticon-calendar"></i>
							
						</div>
						<h4>섭취식품 영양소 통계</h4>
						<p>섭취한 식품 데이터를 저장할 수 있고, 일간, 주간, 월간별 영양소 통계를 그래프를 통해 한눈에 확인 가능합니다 !</p>
					</div>
				</div>
				<div class="col-xl-4 col-md-6">
					<div class="single_service">
						<div class="service_icon">
							<i class="flaticon-dance"></i>
						</div>
						<h4>칼로리별 식품 추천</h4>
						<p>입력한 칼로리에 맞는 식품 조합을 볼 수 있고, 그래프를 통해 영양소 차이를 한눈에 파악 가능합니다 !</p>
					</div>
				</div>
				<div class="col-xl-4 col-md-6">
					<div class="single_service">
						<div class="service_icon">
							<i class="flaticon-running-man"></i>
						</div>
						<h4>식품 관련 퀴즈</h4>
						<p>식품에 대한 다양한 퀴즈를 풀고 랭킹을 올려보세요! 실시간으로 랭킹을 확인할 수 있습니다 ! </p>
					</div>
				</div>
				<div class="col-xl-4 col-md-6">
					<div class="single_service">
						<div class="service_icon">
							<i class="flaticon-cake"></i>
						</div>
						<h4>Food Trend</h4>
						<p>식품 관련 주제와 검색어를 통해 다양한 이슈들을 확인하고, 지역별 키워드에 대한 관심도 파악 가능합니다 !</p>
					</div>
				</div>
				<div class="col-xl-4 col-md-6">
					<div class="single_service">
						<div class="service_icon">
							<i class="flaticon-businessman"></i>
						</div>
						<h4> 공지사항과 Q&A</h4>
						<p> 식품과 관련된 다양한 정보와 게시판을 통해 이용자들과 정보를 공유해보세요 ! </p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- service_area-end -->

	<!-- video_area_start -->
	<!-- <div class="video_area video_bg zigzag_bg_1 zigzag_bg_2 ">
		<div class="video_area_inner">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="video_text">
							<div class="info">
								<div class="info_inner">
									<h4>Watch Video</h4>
									<p>You will love our execution</p>
								</div>
								<div class="icon_video">
									<a class="popup-video"
										href="https://www.youtube.com/watch?v=HWnXId_Zg4k"><i
										class="ti-control-play"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	<!-- video_area_end -->

	<!-- order_area_start -->
	<div class="order_area">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title mb-70">
						<h3>Best Products</h3>
						<p>
							inappropriate behavior is often laughed off as “boys will be
							boys,” women face higher conduct standards <br> especially
							in the workplace. That’s why it’s crucial that, as women.
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${list}" var="food" varStatus="status">
					<c:if test="${status.index < 9}">
					<!-- 요걸로하면 한줄에 세개씩 나옴 3,4가 세개/4,6이 두개 ..? 아닌 것 같습니다만 -->
					<!-- <div class="col-xl-3 col-md-4"> -->
					<div class="col-xl-4 col-md-6">
						<div class="single_order">
							<div class="order_thumb">
								<div style="text-align: center;">
									<a href="foodDetail.do?code=${food.code}">
										<img src="img/${food.name}.jpg" alt="${food.name} poster" width="200">
									</a>
								</div>
								<div class="order_prise">
									<span>Best ${status.count}</span>
								</div>
							</div>
							<div class="order_info">
								<h3>
									<a href="foodDetail.do?code=${food.code}" style="font-family: 'Sunflower', sans-serif;">${food.name}</a>
								</h3>
								<p style="margin-bottom: 0 !important">제조사 : ${food.maker}</p>
								<p style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${food.material}</p>
								
								<c:if test="${not empty sessionScope.id}">
									<button type="button" class="btn btn-info btn-sm" onclick="location.href='ingestion.do?code=${food.code}'">추가</button> 
									<button type="button" class="btn btn-info btn-sm" onclick="location.href='selectfood.do?code=${food.code}'">찜</button>
								</c:if>
								
								<%-- <a href="location.href='ingestion.do?code=${food.code}'" class="boxed_btn">추가</a>
								<a href="location.href='selectfood.do?code=${food.code}'" class="boxed_btn">찜하기</a> --%>
							</div>
						</div>
					</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- order_area_end -->

	<!-- testmonial_area_start -->
	<div class="testmonial_area banner-3">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title white mb-60">
						<h3>This website is made by</h3>
						<p>
							inappropriate behavior is often laughed off as “boys will be
							boys,” women face higher conduct standards <br> especially
							in the workplace. That’s why it’s crucial that, as women.
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-12">
					<div class="testmonial_active owl-carousel">
						<div class="single_testmonial d-flex">
							<div class="testmonial_thumb">
								<img src="img/testmonial/1.png" alt=""
									style="width: 150px; height: 200px;">
							</div>
							<div class="testmonial_author">
								<h3>mingi-kang</h3>
								<span>Kmandu</span>
								<p>6반의 자랑 삼성SDI 만두</p>
							</div>
						</div>
						<div class="single_testmonial d-flex">
							<div class="testmonial_thumb">
								<img src="img/testmonial/2.png" alt=""
									style="width: 150px; height: 200px;">
							</div>
							<div class="testmonial_author">
								<h3>sangmin-lee</h3>
								<span>Lifaon</span>
								<p>6반의 귀염둥이 막내</p>
							</div>
						</div>
						<div class="single_testmonial d-flex">
							<div class="testmonial_thumb">
								<img src="img/testmonial/3.png" alt=""
									style="width: 150px; height: 200px;">
							</div>
							<div class="testmonial_author">
								<h3>juhee kim</h3>
								<span>smileH</span>
								<p>CSS에 영혼을 갈아넣은 희주</p>
							</div>
						</div>
						<div class="single_testmonial d-flex">
							<div class="testmonial_thumb">
								<img src="img/testmonial/1.png" alt=""
									style="width: 150px; height: 200px;">
							</div>
							<div class="testmonial_author">
								<h3>mingi-kang</h3>
								<span>Kmandu</span>
								<p>6반의 자랑 삼성SDI 만두</p>
							</div>
						</div>
						<div class="single_testmonial d-flex">
							<div class="testmonial_thumb">
								<img src="img/testmonial/2.png" alt=""
									style="width: 150px; height: 200px;">
							</div>
							<div class="testmonial_author">
								<h3>sangmin-lee</h3>
								<span>Lifaon</span>
								<p>6반의 귀염둥이 막내</p>
							</div>
						</div>
						<div class="single_testmonial d-flex">
							<div class="testmonial_thumb">
								<img src="img/testmonial/3.png" alt=""
									style="width: 150px; height: 200px;">
							</div>
							<div class="testmonial_author">
								<h3>juhee kim</h3>
								<span>smileH</span>
								<p>CSS에 영혼을 갈아넣은 희주</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- testmonial_area_end -->

	<!-- <div class="brand_area">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title mb-70">
						<h3>Brands love to take Our Services</h3>
						<p>
							inappropriate behavior is often laughed off as “boys will be
							boys,” women face higher conduct standards <br> especially
							in the workplace. That’s why it’s crucial that, as women.
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-2 col-md-6 col-lg-3">
					<div class="single_brand">
						<img src="img/brand/1.png" alt="">
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-3">
					<div class="single_brand">
						<img src="img/brand/02.png" alt="">
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-3">
					<div class="single_brand">
						<img src="img/brand/03.png" alt="">
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-3">
					<div class="single_brand">
						<img src="img/brand/04.png" alt="">
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-3">
					<div class="single_brand">
						<img src="img/brand/05.png" alt="">
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-3">
					<div class="single_brand">
						<img src="img/brand/06.png" alt="">
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-3">
					<div class="single_brand">
						<img src="img/brand/7.png" alt="">
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-3">
					<div class="single_brand">
						<img src="img/brand/12.png" alt="">
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-3">
					<div class="single_brand">
						<img src="img/brand/9.png" alt="">
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-3">
					<div class="single_brand">
						<img src="img/brand/10.png" alt="">
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-3">
					<div class="single_brand">
						<img src="img/brand/11.png" alt="">
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-3">
					<div class="single_brand">
						<img src="img/brand/8.png" alt="">
					</div>
				</div>
			</div>
		</div>
	</div> -->
	
	<jsp:include page="footer.jsp" />
</body>
<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
</html>
