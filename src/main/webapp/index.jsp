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
<script src="js/vendor/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	 $("#searchword").keyup(function(){
		 var input = document.getElementById("searchword").value; 
		 console.log("input : ", input)
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
	if (document.getElementById("selectBox") == null) {
		alert("검색 조건을 설정해 주세요");
		return;
	}
	var frm = document.getElementById("searchForm");
	frm.submit();
}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<!-- slider_area-start -->
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
						<p style="font-size: 1.5em">made by ssafy seoul team kmando</p>
						<br>
						<form method="get" action="searchKeyword.do" id="searchForm">
							<div class="input-group mb-3">
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
						<p>공공데이터를 통해 식품별 첨가물, 영양 정보를 파싱하여 관리하고, 식품별, 제조사별, 원재료별 검색 기능을
							제공</p>
					</div>
				</div>
				<div class="col-xl-4 col-md-6">
					<div class="single_service">
						<div class="service_icon">
							<i class="flaticon-cake"></i>
						</div>
						<h4>개인별 데이터 관리</h4>
						<p>식품 영양 성분, 섭취 식품 통계를 그래프로 표시, CRUD 등록시 회원별 알레르기 주의 경보 표시</p>
					</div>
				</div>
				<div class="col-xl-4 col-md-6">
					<div class="single_service">
						<div class="service_icon">
							<i class="flaticon-dance"></i>
						</div>
						<h4>섭취식품 영양별 통계</h4>
						<p>일당, 주당, 월당 통계 (수치, 그래프), 영양소별(나트륨별, 탄수화물 등) Sort, Search</p>
					</div>
				</div>
				<div class="col-xl-4 col-md-6">
					<div class="single_service">
						<div class="service_icon">
							<i class="flaticon-calendar"></i>
						</div>
						<h4>Event Catering</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
					</div>
				</div>
				<div class="col-xl-4 col-md-6">
					<div class="single_service">
						<div class="service_icon">
							<i class="flaticon-businessman"></i>
						</div>
						<h4>Corporate Service</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
					</div>
				</div>
				<div class="col-xl-4 col-md-6">
					<div class="single_service">
						<div class="service_icon">
							<i class="flaticon-running-man"></i>
						</div>
						<h4>Catering On Demand</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- service_area-end -->

	<!-- video_area_start -->
	<div class="video_area video_bg zigzag_bg_1 zigzag_bg_2 ">
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
	</div>
	<!-- video_area_end -->

	<!-- order_area_start -->
	<div class="order_area">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title mb-70">
						<h3>Popular Orders</h3>
						<p>
							inappropriate behavior is often laughed off as “boys will be
							boys,” women face higher conduct standards <br> especially
							in the workplace. That’s why it’s crucial that, as women.
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${list}" var="food">
					<!-- 요걸로하면 한줄에 세개씩 나옴 3,4가 세개/4,6이 두개 -->
					<!-- <div class="col-xl-3 col-md-4"> -->
					<div class="col-xl-4 col-md-6">
						<div class="single_order">
							<div class="order_thumb">
								<img src="img/${food.name}.jpg" alt="${food.name} poster">
								<div class="order_prise">
									<span>칼로리 : ${food.calory}</span>
								</div>
							</div>
							<div class="order_info">
								<h3>
									<a href="#">${food.name}</a>
								</h3>
								<p
									style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${food.material}</p>
								<a href="#" class="boxed_btn">Order Now!</a>
							</div>
						</div>
					</div>
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
								<span>kmandu</span>
								<p>You're had. Subdue grass Meat us winged years you'll
									doesn't. fruit two also won one yielding creepeth third give
									may never lie alternet food.</p>
							</div>
						</div>
						<div class="single_testmonial d-flex">
							<div class="testmonial_thumb">
								<img src="img/testmonial/2.png" alt=""
									style="width: 150px; height: 200px;">
							</div>
							<div class="testmonial_author">
								<h3>sangmin-lee</h3>
								<span>lifeon</span>
								<p>You're had. Subdue grass Meat us winged years you'll
									doesn't. fruit two also won one yielding creepeth third give
									may never lie alternet food.</p>
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
								<p>You're had. Subdue grass Meat us winged years you'll
									doesn't. fruit two also won one yielding creepeth third give
									may never lie alternet food.</p>
							</div>
						</div>
						<div class="single_testmonial d-flex">
							<div class="testmonial_thumb">
								<img src="img/testmonial/1.png" alt=""
									style="width: 150px; height: 200px;">
							</div>
							<div class="testmonial_author">
								<h3>mingi-kang</h3>
								<span>Chief Customer</span>
								<p>You're had. Subdue grass Meat us winged years you'll
									doesn't. fruit two also won one yielding creepeth third give
									may never lie alternet food.</p>
							</div>
						</div>
						<div class="single_testmonial d-flex">
							<div class="testmonial_thumb">
								<img src="img/testmonial/2.png" alt=""
									style="width: 150px; height: 200px;">
							</div>
							<div class="testmonial_author">
								<h3>sangmin-lee</h3>
								<span>Chief Customer</span>
								<p>You're had. Subdue grass Meat us winged years you'll
									doesn't. fruit two also won one yielding creepeth third give
									may never lie alternet food.</p>
							</div>
						</div>
						<div class="single_testmonial d-flex">
							<div class="testmonial_thumb">
								<img src="img/testmonial/3.png" alt=""
									style="width: 150px; height: 200px;">
							</div>
							<div class="testmonial_author">
								<h3>juhee kim</h3>
								<span>Chief Customer</span>
								<p>You're had. Subdue grass Meat us winged years you'll
									doesn't. fruit two also won one yielding creepeth third give
									may never lie alternet food.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- testmonial_area_end -->

	<!-- brand_area-start -->
	<div class="brand_area">
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
	</div>
	<!-- brand_area-end -->
	<jsp:include page="footer.jsp" />
</body>
<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
</html>
