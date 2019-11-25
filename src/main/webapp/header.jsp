<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
function login() {
	var frm = document.getElementById("loginForm");
	frm.submit();
}	
</script>
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Nanum+Gothic|Nanum+Gothic+Coding|Sunflower:300&display=swap">

<!-- header-start -->
<header>
	<div class="header-area ">
		<div id="sticky-header" class="main-header-area">
			<div class="container">
				<div class="row align-items-center">
					<div class="">
						<div class="main-menu d-none d-lg-block">
							<nav>
								<ul class="mein_menu_list" id="navigation">
									<div class="logo-img d-none d-lg-block">
										<a href="index.do"> <img src="img/logo.png" alt=""
											style="width: 100px;"></a>
									</div>
									<li><a href="#">공지사항<i class="ti-angle-down"></i></a>
										<ul class="submenu">
											<li><a href="about.html">공지사항</a></li>
											<li><a href="qna.do">Q&A</a></li>
										</ul>
									</li>
									<!-- <li><a href="about.html">공지사항</a></li>
									<li><a href="qna.do">Q&A</a></li> -->
									<li><a href="foodList.do">상품정보</a></li>
									<li><a href="bestfood.do">Best상품</a></li>
									<li><a href="CaloryFood.jsp">칼로리별조합</a></li>

									<c:choose>
										<c:when test="${sessionScope.id != null}">
											<li><a href="#">섭취 정보<i class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a href="ingestionList.do">내 섭취 정보</a></li>
											<li><a href="#contact">예상 섭취 정보</a></li>
												</ul>
											</li>
										</c:when>
									</c:choose>

									<c:choose>
										<c:when test="${sessionScope.id == null}">
											<li class="nav-item active"><button type="button"
													class="btn btn-success" data-toggle="modal"
													data-target="#loginModal">Login</button></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<li class="nav-item active"><button type="button"
													class="btn btn-info" data-toggle="modal"
													data-target="#registerModal">Register</button></li>
										</c:when>
										<c:otherwise>
											<div class="form-group">
												<a class="btn btn-light">${sessionScope.id } 님 환영합니다</a><br>
												<a class="btn btn-success" href="userInfo.do" role="button" style="margin-right: 9px;">Modify</a>
												<a class="btn btn-info" href="logout.do" role="button">Logout</a>
											</div>
											<%-- <li>${sessionScope.id } 님 <br />환영합니다</li> --%>
										</c:otherwise>
									</c:choose>
								</ul>
								<%-- ${sessionScope.id } 님 환영합니다 --%>
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
												<form class="navbar-form navbar-right" method="post"
													action="login.do" id="loginForm">
													<div class="form-group">
														<label for="exampleInputEmail1"><b>Id</b></label> <input
															type="email" class="form-control" id="exampleInputEmail1"
															aria-describedby="emailHelp" placeholder="Enter ID"
															name='id'> <small id="emailHelp"
															class="form-text text-muted">Please enter your
															id.</small>
													</div>
													<div class="form-group">
														<label for="exampleInputPassword1"><b>Password</b></label>
														<input type="password" class="form-control"
															id="exampleInputPassword1" placeholder="Enter Password"
															name='pw'>
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
												<button type="submit" class="btn btn-success loginButton"
													onclick="login()">Login</button>
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