<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<meta name="og:type" content="article">

<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/calendar.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/notification.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/yogiyo.css" rel="stylesheet" type="text/css">

<!-- fonts -->
<link href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css" rel="stylesheet" type="text/css">

<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/liveReload.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/theme.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/WOWSlider-about-us.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>



<title>부장님요기요-달력</title>
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

				<div id="main-content" class="container-fluid">

					<div class="calendar card mb-4">
						<div class="d-flex align-items-center">
							<i class="far fa-calendar fa-3x me-3"></i>
							<h1 class="month fw-bold mb-0 text-uppercase">2022년 7월</h1>
						</div>
						<p class="fst-italic text-muted mb-5">
							오늘은 "스시야"에 다녀오셨어요<br />
						</p>
						<ol class="day-names list-unstyled">
							<li class="fw-bold text-uppercase">일요일</li>
							<li class="fw-bold text-uppercase">월요일</li>
							<li class="fw-bold text-uppercase">화요일</li>
							<li class="fw-bold text-uppercase">수요일</li>
							<li class="fw-bold text-uppercase">목요일</li>
							<li class="fw-bold text-uppercase">금요일</li>
							<li class="fw-bold text-uppercase">토요일</li>
						</ol>
						<ol class="days list-unstyled">
							<li class="outside">
								<div class="date">
									<span class="d-flex flex-row-reverse">26</span>
								</div>
							</li>
							<li class="outside">
								<div class="date">
									<span class="d-flex flex-row-reverse">27</span>
								</div>
							</li>
							<li class="outside">
								<div class="date">
									<span class="d-flex flex-row-reverse">28</span>
								</div>
							</li>
							<li class="outside">
								<div class="date">
									<span class="d-flex flex-row-reverse">29</span>
								</div>
							</li>
							<li class="outside">
								<div class="date">
									<span class="d-flex flex-row-reverse">30</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">1</span>
								</div>
								<div class="event bg-success show-menu">중식/중화요리</div>
								<div class="event bg-success show-menu">흑룡강</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">2</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">3</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">4</span>
								</div>
								<div class="event span bg-danger show-menu">중식/만두</div>
								<div class="event span bg-danger show-menu">북촌손만두</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">5</span>
								</div>
								<div class="event span bg-warning show-menu">중식/중화요리</div>
								<div class="event span bg-warning show-menu">양자강</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">6</span>
								</div>
								<div class="event span bg-warning show-menu">분식</div>
								<div class="event span bg-warning show-menu">포마토김밥</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">7</span>
								</div>
								<div class="event span bg-warning show-menu">면요리</div>
								<div class="event span bg-warning show-menu">경성모밀</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">8</span>
								</div>
								<div class="event span bg-warning show-menu">분식</div>
								<div class="event span bg-warning show-menu">정우네김밥</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">9</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">10</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">11</span>
								</div>
								<div class="event bg-success show-menu">일식</div>
								<div class="event bg-success show-menu">스시야</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">12</span>
								</div>
								<div class="d-flex flex-row-reverse">
									<button type="button" class="btn btn-primary"
										onclick="location.href='../../views/stat/addReview.html'">리뷰하러 가기</button>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">13</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">14</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">15</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">16</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">17</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">18</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">19</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">20</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">21</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">22</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">23</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">24</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">25</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">26</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">27</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">28</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">29</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">30</span>
								</div>
							</li>
							<li>
								<div class="date">
									<span class="d-flex flex-row-reverse">31</span>
								</div>
							</li>
							<li class="outside">
								<div class="date">
									<span class="d-flex flex-row-reverse">1</span>
								</div>
							</li>
							<li class="outside">
								<div class="date">
									<span class="d-flex flex-row-reverse">2</span>
								</div>
							</li>
							<li class="outside">
								<div class="date">
									<span class="d-flex flex-row-reverse">3</span>
								</div>
							</li>
							<li class="outside">
								<div class="date">
									<span class="d-flex flex-row-reverse">4</span>
								</div>
							</li>
							<li class="outside">
								<div class="date">
									<span class="d-flex flex-row-reverse">5</span>
								</div>
							</li>
							<li class="outside">
								<div class="date">
									<span class="d-flex flex-row-reverse">6</span>
								</div>
							</li>
						</ol>
					</div>
				</div>
				<!-- content -->
			</div>
			
			<!-- footer -->
			<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
			<!-- /footer -->
		</div>
		<!-- content-wrapper -->
	</div>
	<!-- wrapper -->
</body>

</html>
