<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
/* 	function login() {
		var frm = document.getElementById("loginForm");
		frm.submit();
	} */
	function modify(){
		console.log("## modify()");
		var id = "${sessionScope.id}";
		$.ajax({
			url : "rest/user/"+ id,
			type : "get",
			data : "",
			success : function(data){
				var user = data.data;
				$('#ePassword').val(user.password);
				$('#eName').val(user.name);
				$('#ePhone').val(user.phone);
				$('#eEmail').val(user.email);
				$('#eAddress').val(user.address);

				var allergy = user.allergy;
				$("input[name=allergy2]").each(function(){
					if( allergy.includes( $(this).val() ) ){
						$(this).attr("checked","checked");
					}
				});
			},
			error  : function(xhr, status,message){
				console.log(message);
			}
		});
	
	}
	
</script>
<link rel="icon" href="../favicon.ico">
<link rel="stylesheet" href="css/bootstrap.css">
<!-- 파일 없는데 이건 왜..? -->
<!-- <link rel="stylesheet" href="css/bootstrap-theme.css"> -->
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

<style>
label {
	color: black;
}
</style>

<!-- header-start -->
<header>
	<div class="header-area ">
		<div id="sticky-header" class="main-header-area">
			<div class="row align-items-center">
				<div class="main-menu d-none d-lg-block" style="margin: auto;">
					<nav>
						<ul class="mein_menu_list" id="navigation">
							<div class="logo-img d-none d-lg-block">
								<a href="/index.do"> <img src="img/logo.png" alt=""
									style="width: 100px;"></a>
							</div>
							<li><a href="#">공지사항<i class="ti-angle-down"></i></a>
								<ul class="submenu">
									<li><a href="/notice.do">공지사항</a></li>
									<li><a href="/qna.do">Q&A</a></li>
								</ul></li>
							<!-- <li><a href="about.html">공지사항</a></li>
									<li><a href="qna.do">Q&A</a></li> -->
							<li><a href="#">상품목록<i class="ti-angle-down"></i></a>
								<ul class="submenu">
									<li><a href="/foodList.do">상품전체목록</a></li>
									<li><a href="/origin.do">국내산식품</a></li>
								</ul>
							</li>
							<li><a href="/bestfood.do">Best상품</a></li>
							<li><a href="/CaloryFood.jsp">칼로리별조합</a></li>
							<li><a href="/quiz.jsp">퀴즈</a></li>
							<li><a href="/trend.do">Food Trend</a></li>

							<c:choose>
								<c:when test="${sessionScope.id != null}">
									<li><a href="#">섭취 정보<i class="ti-angle-down"></i></a>
										<ul class="submenu">
											<li><a href="/ingestionList.do">내 섭취 정보</a></li>
											<li><a href="/selectList.do">내 찜 목록</a></li>
										</ul></li>
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${sessionScope.id == null}">
									<li class="nav-item active"><button type="button"
											class="btn btn-success" data-toggle="modal"
											data-target="#loginModal">Login</button></li>&nbsp;&nbsp;
												<li class="nav-item active"><button type="button"
											class="btn btn-info" data-toggle="modal"
											data-target="#registerModal">Register</button></li>
								</c:when>
								<c:otherwise>
									<%-- <a class="btn btn-light">${sessionScope.id } 님 환영합니다</a><br> --%>
									<li class="nav-item active"><button type="button"
											class="btn btn-success" data-toggle="modal"
											data-target="#userInfoEditModal" onclick="modify();">Modify</button></li>&nbsp;&nbsp;
											<li class="nav-item active"><button type="button"
											class="btn btn-info" onclick="location.href='logout.do'">Logout</button></li>
									<%-- <li>${sessionScope.id } 님 <br />환영합니다</li> --%>
								</c:otherwise>
							</c:choose>
						</ul>
						<%-- ${sessionScope.id } 님 환영합니다 --%>
					</nav>
				</div>
			</div>

			<div class="col-12">
				<div class="mobile_menu d-block d-lg-none"></div>
			</div>
			<div class="logo-img-small d-sm-block d-md-block d-lg-none">
				<a href="index.do"> <img src="img/logo.png" alt=""></a>
			</div>
		</div>
	</div>
</header>

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
							type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter ID" name='id'>
						<small id="emailHelp" class="form-text text-muted">Please
							enter your id.</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1"><b>Password</b></label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							placeholder="Enter Password" name='pw'>
					</div>
					<!-- <div class="form-group form-check">
												<input type="checkbox" class="form-check-input"
													id="exampleCheck1"> <label class="form-check-label"
													for="exampleCheck1">ID 저장하기</label>
											</div> -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-success loginButton">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<div class="modal register_modal" id="registerModal" tabindex="-1"
	role="dialog">
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
				<form class="navbar-form navbar-right" method="post"
					action="signIn.do" id="registForm">


					<div class="row" style="margin: 0px !important;">
						<div class="form-group col-6">
							<label for="id">Id</label> <input type="text"
								class="form-control" id="id" name="id" placeholder="Enter Id"
								required="required">
						</div>
						<div class="form-group col-6">
							<label for="inputPassword">Password</label> <input
								type="password" class="form-control" id="inputPassword"
								name="pw" placeholder="Enter Password" required="required">
						</div>
					</div>
					<div class="row" style="margin: 0px !important;">
						<div class="form-group col-6">
							<label for="name">Name</label> <input type="text"
								class="form-control" name="name" id="name"
								placeholder="Enter Name">
						</div>
						<div class="form-group col-6">
							<label for="phone">전화번호</label> <input type="text"
								class="form-control" id="phone" name="phone"
								placeholder="Enter Phone" required="required">
						</div>
					</div>
					<div class="row" style="margin: 0px !important;">
						<div class="form-group col-12">
							<label for="email">Email</label> <input type="text"
								class="form-control" id="email" name="email"
								placeholder="Enter Email" required="required">
						</div>
					</div>
					<div class="row" style="margin: 0px !important;">
						<div class="form-group col-12">
							<label for="address">Address</label> <input type="text"
								class="form-control" id="address" name="address"
								placeholder="Enter Address" required="required">
						</div>
					</div>

					<!-- <div class="form-row">
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
											</div> -->
					<div class="row" style="margin: 0px !important;">
						<div class="form-group col-12"
							style="margin-bottom: 0px !important;">
							<label for="inputAllergy">Allergy</label><br>
						</div>
					</div>
					<div class="row" style="margin: 0px !important;">
						<div class="form-group col-12"
							style="margin-left: 20px; margin-bottom: 0px !important;">
							<input class="form-check-input" type="checkbox" id="gridCheck1"
								name="allergy2" value="대두"
								<c:if test="${fn:contains(user.allergy, '대두')}">checked</c:if>>
							<label class="form-check-label" for="gridCheck1"> 대두</label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="gridCheck2" name="allergy2" value="땅콩"
								<c:if test="${fn:contains(user.allergy, '땅콩')}">checked</c:if>>
							<label for="gridCheck2"> 땅콩 </label> &nbsp;&nbsp;&nbsp; <input
								class="form-check-input" type="checkbox" id="gridCheck3"
								name="allergy2" value="우유"
								<c:if test="${fn:contains(user.allergy, '우유')}">checked</c:if>>
							<label class="form-check-label" for="gridCheck3"> 우유</label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="gridCheck4" name="allergy2" value="게"
								<c:if test="${fn:contains(user.allergy, '게')}">checked</c:if>>
							<label class="form-check-label" for="gridCheck4"> 게</label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="gridCheck5" name="allergy2" value="새우"
								<c:if test="${fn:contains(user.allergy, '새우')}">checked</c:if>>
							<label class="form-check-label" for="gridCheck5"> 새우 </label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="gridCheck6" name="allergy2" value="참치">
							<label class="form-check-label" for="gridCheck6"> 참치</label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="gridCheck7" name="allergy2" value="연어"
								<c:if test="${fn:contains(user.allergy, '연어')}">checked</c:if>>
							<label class="form-check-label" for="gridCheck7"> 연어</label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="gridCheck8" name="allergy2" value="쑥"
								<c:if test="${fn:contains(user.allergy, '쑥')}">checked</c:if>>
							<label class="form-check-label" for="gridCheck8"> 쑥</label>
						</div>
					</div>
					<div class="row" style="margin: 0px !important;">
						<div class="form-group col-12" style="margin-left: 20px;">

							<input class="form-check-input" type="checkbox" id="gridCheck9"
								name="allergy" value="소고기"
								<c:if test="${fn:contains(user.allergy, '소고기')}">checked</c:if>>
							<label class="form-check-label" for="gridCheck9"> 소고기 </label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="gridCheck10" name="allergy2" value="닭고기"
								<c:if test="${fn:contains(user.allergy, '닭고기')}">checked</c:if>>
							<label class="form-check-label" for="gridCheck10"> 닭고기 </label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="gridCheck11" name="allergy2" value="돼지고기"
								<c:if test="${fn:contains(user.allergy, '돼지고기')}">checked</c:if>>
							<label class="form-check-label" for="gridCheck11"> 돼지고기 </label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="gridCheck12" name="allergy2" value="복숭아"
								<c:if test="${fn:contains(user.allergy, '복숭아')}">checked</c:if>>
							<label class="form-check-label" for="gridCheck12">복숭아 </label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="gridCheck13" name="allergy2" value="민들레"
								<c:if test="${fn:contains(user.allergy, '민들레')}">checked</c:if>>
							<label class="form-check-label" for="gridCheck13">민들레 </label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="gridCheck14" name="allergy2" value="계란흰자"
								<c:if test="${fn:contains(user.allergy, '계란흰자')}">checked</c:if>>
							<label class="form-check-label" for="gridCheck14">계란흰자 </label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-info">Edit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<div class="modal edit_modal" id="userInfoEditModal" tabindex="-1"
	role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Userinfo Edit</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form class="navbar-form navbar-right" method="post"
					action="modify.do" id="modifyForm">


					<div class="row" style="margin: 0px !important;">
						<div class="form-group col-6">
							<label for="eid">Id</label> <input type="text"
								class="form-control" id="eid" name="id" placeholder="Enter Id"
								required="required" readonly="readonly"
								value="${sessionScope.id}">
						</div>
						<div class="form-group col-6">
							<label for="ePassword">Password</label> <input type="password"
								class="form-control" id="ePassword" name="pw"
								placeholder="Enter Password" required="required" value="">
						</div>
					</div>
					<div class="row" style="margin: 0px !important;">
						<div class="form-group col-6">
							<label for="eName">Name</label> <input type="text"
								class="form-control" name="name" id="eName" value=""
								placeholder="Enter Name">
						</div>
						<div class="form-group col-6">
							<label for="ePhone">전화번호</label> <input type="text"
								class="form-control" id="ePhone" name="phone" value=""
								placeholder="Enter Phone" required="required">
						</div>
					</div>
					<div class="row" style="margin: 0px !important;">
						<div class="form-group col-12">
							<label for="eEmail">Email</label> <input type="text"
								class="form-control" id="eEmail" name="email" value=""
								placeholder="Enter Email" required="required">
						</div>
					</div>
					<div class="row" style="margin: 0px !important;">
						<div class="form-group col-12">
							<label for="eAddress">Address</label> <input type="text"
								class="form-control" id="eAddress" name="address" value=""
								placeholder="Enter Address" required="required">
						</div>
					</div>

					<!-- <div class="form-row">
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
											</div> -->
					<div class="row" style="margin: 0px !important;">
						<div class="form-group col-12"
							style="margin-bottom: 0px !important;">
							<label for="inputAllergy">Allergy</label><br>
						</div>
					</div>
					<div class="row" style="margin: 0px !important;">
						<div class="form-group col-12"
							style="margin-left: 20px; margin-bottom: 0px !important;">
							<input class="form-check-input" type="checkbox" id="eGridCheck1"
								name="allergy" value="대두"> <label
								class="form-check-label" for="eGridCheck1"> 대두</label>

							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="eGridCheck2" name="allergy" value="땅콩">
							<label class="form-check-label" for="eGridCheck2"> 땅콩 </label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="eGridCheck3" name="allergy" value="우유">
							<label class="form-check-label" for="eGridCheck3"> 우유</label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="eGridCheck4" name="allergy" value="게">
							<label class="form-check-label" for="eGridCheck4"> 게</label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="eGridCheck5" name="allergy" value="새우">
							<label class="form-check-label" for="eGridCheck5"> 새우 </label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="eGridCheck6" name="allergy" value="참치">
							<label class="form-check-label" for="eGridCheck6"> 참치</label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="eGridCheck7" name="allergy" value="연어">
							<label class="form-check-label" for="eGridCheck7"> 연어</label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="eGridCheck8" name="allergy" value="쑥">
							<label class="form-check-label" for="eGridCheck8"> 쑥</label>
						</div>
					</div>
					<div class="row" style="margin: 0px !important;">
						<div class="form-group col-12" style="margin-left: 20px;">

							<input class="form-check-input" type="checkbox" id="eGridCheck9"
								name="allergy" value="소고기"> <label
								class="form-check-label" for="eGridCheck9"> 소고기 </label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="eGridCheck10" name="allergy" value="닭고기">
							<label class="form-check-label" for="eGridCheck10"> 닭고기 </label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="eGridCheck11" name="allergy" value="돼지고기">
							<label class="form-check-label" for="eGridCheck11"> 돼지고기
							</label> &nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="eGridCheck12" name="allergy" value="복숭아">
							<label class="form-check-label" for="eGridCheck12">복숭아 </label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="eGridCheck13" name="allergy" value="민들레">
							<label class="form-check-label" for="eGridCheck13">민들레 </label>
							&nbsp;&nbsp;&nbsp; <input class="form-check-input"
								type="checkbox" id="eGridCheck14" name="allergy" value="계란흰자">
							<label class="form-check-label" for="eGridCheck14">계란흰자 </label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-info" onclick="register()">Modify</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- header-end -->