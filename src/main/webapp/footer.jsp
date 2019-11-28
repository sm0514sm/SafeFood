<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- footer-start -->
<footer class="footer_area footer-bg zigzag_bg_1" style="margin-top: 80px;">
	<div class="footer-top">
		<div class="container">
			<div class="row">
				<div class="col-xl-2 col-md-6 col-lg-2">
					<div class="footer_widget">
						<h3 class="heading">Notice</h3>
						<ul>
							<li><a href="/notice.do">Notice&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
							<li><a href="/qna.do">Q&A</a></li>
						</ul>
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-2">
					<div class="footer_widget">
						<h3 class="heading">Food List</h3>
						<ul>
							<li><a href="/foodList.do">Food List</a></li>
							<li><a href="/origin.do">Domestic Food&nbsp;&nbsp;&nbsp;</a></li>
							<li><a href="/bestfood.do">Best 5</a></li>
						</ul>
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-2">
					<div class="footer_widget">
						<h3 class="heading">Combination</h3>
						<ul>
							<li><a href="/CaloryFood.jsp">Combination</a></li>
						</ul>
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-2">
					<div class="footer_widget">
						<h3 class="heading">Food Trend</h3>
						<ul>
							<li><a href="/trend.do">Food Trend</a></li>
						</ul>
					</div>
				</div>
				<c:choose>
					<c:when test="${sessionScope.id != null}">
						<div class="col-xl-2 col-md-6 col-lg-2">
							<div class="footer_widget">
								<h3 class="heading">Quiz</h3>
								<ul>
									<li><a href="/quiz.jsp">Quiz</a></li>
								</ul>
							</div>
						</div>
						<div class="col-xl-2 col-md-6 col-lg-2">
							<div class="footer_widget">
								<h3 class="heading">My Page</h3>
								<ul>
									<li><a href="/ingestionList.do">My Ingestion</a></li>
									<li><a href="/selectList.do">My Wishlist</a></li>
								</ul>
							</div>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="footer-bottom">
		<div class="container">
			<div class="row align-items-center" style="margin-top: 20px; margin-bottom: 5px !important;">
				<div class="col-xl-7 col-md-12 col-lg-8">
					<div class="copyright">
						<p class="footer-text">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright <!-- &copy; -->
							<script>
									document.write(new Date().getFullYear());
							</script>
							. 강민기 김주희 이상민.
							All rights reserved<!--  | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a> -->
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
				<!-- <div class="col-xl-5 col-md-12 col-lg-4">
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
				</div> -->
			</div>
		</div>
	</div>
</footer>
<!-- footer-end -->