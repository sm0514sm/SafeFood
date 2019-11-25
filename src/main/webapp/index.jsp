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

<link rel="icon" href="../favicon.ico">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="theme.css">

<!-- add -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/slicknav.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Nanum+Gothic|Nanum+Gothic+Coding|Sunflower:300&display=swap">
<script type="text/javascript">
function login() {
	var frm = document.getElementById("loginForm");
	frm.submit();
}	
</script>

</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header>
		<div class="header-area ">
			<div id="sticky-header" class="main-header-area">
				<div class="container">
					<div class="row align-items-center"
						style="margin-top: 0px !important">
						<div class="">
							<div class="main-menu d-none d-lg-block">
								<nav>
									<ul class="mein_menu_list" id="navigation">
										<div class="logo-img d-none d-lg-block">
											<a href="index.html"> <img src="img/logo.png" alt="" style="width:100px;"></a>
										</div>
										<li><a href="about.html">공지사항</a></li>
										<li><a href="foodList.do">상품 정보</a></li>
										<li><a href="CaloryFood.jsp">칼로리별 섭취</a></li>
										<!-- <li><a href="#">blog <i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="blog.html">blog</a></li>
                                                <li><a href="single-blog.html">single-blog</a></li>
                                            </ul>
                                        </li> -->
										<li><a href="qna.do">Q&A</a></li>
										<c:choose>
											<c:when test="${sessionScope.id != null}">
												<li><a href="ingestionList.do">내 섭취 정보</a></li>
												<li><a href="#contact">예상 섭취 정보</a></li>
											</c:when>
										</c:choose>
										<!-- <li><a href="contact.html">Contact</a></li> -->
										
										<c:choose>
											<c:when test="${sessionScope.id == null}">
												<li class="nav-item active"><button type="button"
														class="btn btn-outline-success" data-toggle="modal"
														data-target="#loginModal">Login</button></li>&nbsp;&nbsp;&nbsp;&nbsp;
												<li class="nav-item active"><button type="button"
														class="btn btn-outline-info" data-toggle="modal"
														data-target="#registerModal">Register</button></li>
											</c:when>
										<c:otherwise>
										<div class="form-group">
											<%-- <a class="btn btn-primary">${sessionScope.id } 님 환영합니다</a> --%> 
											<a class="btn btn-outline-success" href="userInfo.do" role="button">Modify</a> 
											<a class="btn btn-outline-info" href="logout.do" role="button">Logout</a>
										</div>
										</c:otherwise>
									</c:choose>
									</ul>
									${sessionScope.id } 님 환영합니다
									<div class="modal login_modal" id="loginModal" tabindex="-1"
										role="dialog">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Login</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form class="navbar-form navbar-right" method="post" action="login.do" id="loginForm">
													<div class="form-group">
														<label for="exampleInputEmail1"><b>Id</b></label> <input
															type="email" class="form-control" id="exampleInputEmail1"
															aria-describedby="emailHelp" placeholder="Enter ID" name='id'>
														<small id="emailHelp" class="form-text text-muted">Please
															enter your id.</small>
													</div>
													<div class="form-group">
														<label for="exampleInputPassword1"><b>Password</b></label>
														<input type="password" class="form-control"
															id="exampleInputPassword1" placeholder="Enter Password" name='pw'>
													</div>
													<div class="form-group form-check">
														<input type="checkbox" class="form-check-input"
															id="exampleCheck1"> <label
															class="form-check-label" for="exampleCheck1">ID
															저장하기</label>
													</div>
													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<button type="submit" class="btn btn-success loginButton" onclick="login()">Login</button>
												</div>
											</div>
										</div>
									</div>


									<div class="modal register_modal" id="registerModal"
										tabindex="-1" role="dialog">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Register</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<label for="inputEmail">Email</label> <input type="text"
															class="form-control" id="inputEmail"
															placeholder="Enter Email">
													</div>
													<div class="form-group">
														<label for="inputPassword">Password</label> <input
															type="password" class="form-control" id="inputPassword4"
															placeholder="Enter Password">
													</div>
													<div class="form-group">
														<label for="inputName">Name</label> <input type="text"
															class="form-control" id="inputName"
															placeholder="Enter Name">
													</div>
													<div class="form-row">
														<div class="form-group col-md-6">
															<label for="inputCity">City</label> <input type="text"
																class="form-control" id="inputCity"
																placeholder="Enter City">
														</div>
														<div class="form-group col-md-4">
															<label for="inputState">Gender</label> <select
																id="inputState" class="form-control">
																<option selected>Choose</option>
																<option>Man</option>
																<option>Woman</option>
															</select>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<button type="submit" class="btn btn-info">Register</button>
												</div>
											</div>
										</div>
									</div>


									<!-- <div class="text-center">
									  <a href="" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#modalLoginForm">Launch
									    Modal Login Form</a>
									</div> -->
								</nav>
							</div>
						</div>
						<!-- <div class="col-xl-2 col-lg-2 d-none d-lg-block">
                            <div class="custom_order">
                                <a href="#" class="boxed_btn_white">Custom Order</a>
                            </div>
                        </div> -->
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
						<div class="logo-img-small d-sm-block d-md-block d-lg-none">
							<a href="index.html"> <img src="img/logo.png" alt="">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- header-end -->

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
						<p style="font-size: 1.5em ">made by ssafy seoul team kmando</p>
					</div>
				</div>
			</div>
			<div class="single_slider slider_img_1"
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
			</div>
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
						<p>공공데이터를 통해 식품별 첨가물, 영양 정보를 파싱하여 관리하고, 식품별, 제조사별, 원재료별 검색 기능을 제공</p>
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
								<img src="img/testmonial/1.png" alt="" style="width: 150px; height: 200px;">
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
								<img src="img/testmonial/2.png" alt="" style="width: 150px; height: 200px;">
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
								<img src="img/testmonial/3.png" alt="" style="width: 150px; height: 200px;">
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
								<img src="img/testmonial/1.png" alt="" style="width: 150px; height: 200px;">
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
								<img src="img/testmonial/2.png" alt="" style="width: 150px; height: 200px;">
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
								<img src="img/testmonial/3.png" alt="" style="width: 150px; height: 200px;">
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

	<!-- footer-start -->
	<footer class="footer_area footer-bg zigzag_bg_1">
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-xl-2 col-md-6 col-lg-2">
						<div class="footer_widget">
							<h3 class="heading">Top Products</h3>
							<ul>
								<li><a href="#">Managed Website</a></li>
								<li><a href="#"> Manage Reputation</a></li>
								<li><a href="#">Power Tools</a></li>
								<li><a href="#">Marketing Service</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-2 col-md-6 col-lg-2">
						<div class="footer_widget">
							<h3 class="heading">Quick Links</h3>
							<ul>
								<li><a href="#">Jobs</a></li>
								<li><a href="#">Brand Assets</a></li>
								<li><a href="#"> Investor Relations</a></li>
								<li><a href="#">Terms of Service</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-2 col-md-6 col-lg-2">
						<div class="footer_widget">
							<h3 class="heading">Features</h3>
							<ul>
								<li><a href="#">Jobs</a></li>
								<li><a href="#">Brand Assets</a></li>
								<li><a href="#">Investor Relations</a></li>
								<li><a href="#">Terms of Service</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-2 col-md-6 col-lg-2">
						<div class="footer_widget">
							<h3 class="heading">Resources</h3>
							<ul>
								<li><a href="#">Guides</a></li>
								<li><a href="#">Research</a></li>
								<li><a href="#">Experts</a></li>
								<li><a href="#">Agencies</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-4 col-md-12 col-lg-4">
						<div class="footer_widget">
							<h3 class="heading">Newsletter</h3>
							<p class="offer_text">You can trust us. we only send promo
								offers,</p>
							<form action="#">
								<input type="text" placeholder="Your email address">
								<button type="submit">
									<i class="ti-arrow-right"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-xl-7 col-md-12 col-lg-8">
						<div class="copyright">
							<p class="footer-text">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart-o" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
					</div>
					<div class="col-xl-5 col-md-12 col-lg-4">
						<div class="social_links">
							<ul>
								<li><a href="#"> <i class="fa fa-facebook"></i>
								</a></li>
								<li><a href="#"> <i class="fa fa-twitter"></i>
								</a></li>
								<li><a href="#"> <i class="fa fa-dribbble"></i>
								</a></li>
								<li><a href="#"> <i class="fa fa-behance"></i>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer-end -->


	<!-- JS here -->
	<script src="js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/ajax-form.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/imagesloaded.pkgd.min.js"></script>
	<script src="js/scrollIt.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/nice-select.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/plugins.js"></script>

	<!--contact js-->
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>

	<script src="js/main.js"></script>

</body>

<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
</html>
