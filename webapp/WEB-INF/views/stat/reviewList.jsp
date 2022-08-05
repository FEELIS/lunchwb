<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<meta name="og:type" content="article">

<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/notification.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/yogiyo.css" rel="stylesheet"
	type="text/css">


<!-- fonts -->
<link href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css"
	rel="stylesheet" type="text/css">

<!-- js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>


<title>리뷰내역</title>
</head>
<body>
	<div id="wrapper">
		<!-- aside -->
		<c:import url="/WEB-INF/views/includes/aside/userAside.jsp"></c:import>
		<!-- /aside -->

		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">

				<!-- header -->
				<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
				<!-- /header -->



				<div class="container">
					<div class="d-sm-flex justify-content-between align-items-center mb-4">
						<h3 class="text-dark mb-0">리뷰내역</h3>
					</div>
					<div class="row">
						<div class="col-lg-12 mx-auto">

							<!-- List group-->
							<ul class="list-group shadow">
								<div class="container">
									<!-- list group item-->
									<li class="list-group-item">
										<!-- Custom content-->
										<div class="media align-items-lg-center flex-column flex-lg-row p-3">
											<div class="media-body order-2 order-lg-1">


												<h5 class="mt-0 font-weight-bold mb-2">흑룡강</h5>
												<p class="font-italic text-muted mb-0 small">서울특별시 관악구 낙성대로 22-1</p>
												<div class="d-flex align-items-center justify-content-between mt-1">
													<h6 class="font-italic text-muted mb-0 small">여기갈래요 213회/40대 그룹 선호 가게</h6>
													<ul class="list-inline small">
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star-o text-gray"></i></li>
													</ul>
												</div>
											</div>
											<div class="row row-cols-2">
												<div class="col-2">

													<img src="../../assets/img/assets/img/store/blackdragon.jpg"
														alt="Generic placeholder image" width="200" class="ml-lg-5 order-1 order-lg-2"
														onclick="location.href='../../views/includes/modal/storeInfo.html'">
												</div>
												<div id="loading" class="col-9 bg-light border rounded border-light jumbotron py-3 px-4">
													<div>우리 상사분들이 정말 좋아하셔요</div>
												</div>
												<div class="col-1">
													<button class="btn-primary m-1">수정</button>
													<button class="btn-danger m-1">삭제</button>
												</div>
											</div>
										</div> <!-- End -->
									</li>
									<!-- End -->

									<!-- list group item-->
									<li class="list-group-item">
										<!-- Custom content-->
										<div class="media align-items-lg-center flex-column flex-lg-row p-3">
											<div class="media-body order-2 order-lg-1">
												<h5 class="mt-0 font-weight-bold mb-2">킷사서울</h5>
												<p class="font-italic text-muted mb-0 small">서울특별시 관악구 남부순환로226길 31 2층 킷사서울</p>
												<div class="d-flex align-items-center justify-content-between mt-1">
													<h6 class="font-italic text-muted mb-0 small">여기갈래요 1745회/20대 그룹 선호 가게</h6>
													<ul class="list-inline small">
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
													</ul>
												</div>
											</div>
											<div class="row row-cols-2">
												<div class="col-2">
													<img src="../../assets/img/assets/img/store/kitsaseoul.jpg"
														alt="Generic placeholder image" width="200" class="ml-lg-5 order-1 order-lg-2">
												</div>
												<div id="loading" class="col-9 bg-light border rounded border-light jumbotron py-3 px-4">
													<div>정말 맛있어요 ^^ 담에 또 올 거에요 ~</div>
												</div>
												<div class="col-1">
													<button class="btn-primary m-1">수정</button>
													<button class="btn-danger m-1">삭제</button>
												</div>
											</div>
										</div> <!-- End -->
									</li>
									<!-- End -->

									<!-- list group item -->
									<li class="list-group-item">
										<!-- Custom content-->
										<div class="media align-items-lg-center flex-column flex-lg-row p-3">
											<div class="media-body order-2 order-lg-1">
												<h5 class="mt-0 font-weight-bold mb-2">피자보이시나 서울대점</h5>
												<p class="font-italic text-muted mb-0 small">서울 관악구 남부순환로234길 31 1층 피자보이시나</p>
												<div class="d-flex align-items-center justify-content-between mt-1">
													<h6 class="font-italic text-muted mb-0 small">여기갈래요 984회/20대 그룹 선호 가게</h6>
													<ul class="list-inline small">
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star-o text-gray"></i></li>
													</ul>
												</div>
											</div>
											<div class="row row-cols-2">
												<div class="col-2">
													<img src="../../assets/img/assets/img/store/pizza.jpg" alt="Generic placeholder image"
														width="200" class="col-9  ml-lg-5 order-1 order-lg-2">
												</div>
												<div id="loading" class="col-9 bg-light border rounded border-light jumbotron py-3 px-4">
													<div>분위기도 좋고 맛도 좋았어요</div>
												</div>
												<div class="col-1">
													<button class="btn-primary m-1">수정</button>
													<button class="btn-danger m-1">삭제</button>
												</div>
												<!-- End -->
											</div>
										</div>
									</li>
									<!-- End -->

									<!-- list group item -->
									<li class="list-group-item">
										<!-- Custom content-->
										<div class="media align-items-lg-center flex-column flex-lg-row p-3">
											<div class="media-body order-2 order-lg-1">
												<h5 class="mt-0 font-weight-bold mb-2">코코미</h5>
												<p class="font-italic text-muted mb-0 small">서울 관악구 관악로 146 1층</p>
												<div class="d-flex align-items-center justify-content-between mt-1">
													<h6 class="font-italic text-muted mb-0 small">여기갈래요 518회/20대 그룹 선호 가게</h6>
													<ul class="list-inline small">
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
														<li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
													</ul>
												</div>
											</div>
											<div class="row row-cols-2">
												<div class="col-2">
													<img src="../../assets/img/assets/img/store/kokomi.jpg" alt="Generic placeholder image"
														width="200" class="ml-lg-5 order-1 order-lg-2">
												</div>
												<div id="loading" class="col-9 bg-light border rounded border-light jumbotron py-3 px-4">
													<div>진짜 장인이 해줘요</div>
												</div>
												<div class="col-1">
													<button class="btn-primary m-1">수정</button>
													<button class="btn-danger m-1">삭제</button>
												</div>
											</div>
										</div> <!-- End -->
									</li>
									<!-- End -->
								</div>
							</ul>
							<!-- End -->
						</div>
					</div>
				</div>


			</div>
			<!-- content -->


			<!-- footer -->
			<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
			<!-- /footer -->
		</div>
		<!-- content-wrapper -->
	</div>
	<!-- wrapper -->
</body>
</html>