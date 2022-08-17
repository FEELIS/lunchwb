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
<link href="${pageContext.request.contextPath}/assets/css/yogiyo.css" rel="stylesheet" type="text/css">


<!-- fonts -->
<link href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css" rel="stylesheet" type="text/css">

<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/liveReload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/chart.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/chart-init.js"></script>

	


<title>방문통계</title>
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
				<div class="container-fluid" id="main-content">
					<div class="d-sm-flex justify-content-between align-items-center mb-4">
						<h3 class="text-dark mb-0">전체통계</h3>
						<a class="btn btn-primary btn-sm d-none d-sm-inline-block" role="button" href="#"><i
							class="fas fa-download fa-sm text-white-50"></i>&nbsp;Generate Report</a>
					</div>
					<div class="row">
						<div class="col-md-6 col-xl-3 mb-4">
							<div class="card shadow border-start-primary py-2">
								<div class="card-body">
									<div class="row align-items-center no-gutters">
										<div class="col me-2">
											<div class="text-uppercase text-primary fw-bold text-xs mb-1">
												<span>이전달 평균 점심값</span>
											</div>
											<div class="text-dark fw-bold h5 mb-0">
												<span>7,350원</span>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xl-3 mb-4">
							<div class="card shadow border-start-success py-2">
								<div class="card-body">
									<div class="row align-items-center no-gutters">
										<div class="col me-2">
											<div class="text-uppercase text-success fw-bold text-xs mb-1">
												<span>이전달 총 점심값</span>
											</div>
											<div class="text-dark fw-bold h5 mb-0">
												<span>245,000원</span>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xl-3 mb-4">
							<div class="card shadow border-start-info py-2">
								<div class="card-body">
									<div class="row align-items-center no-gutters">
										<div class="col me-2">
											<div class="text-uppercase text-info fw-bold text-xs mb-1">
												<span>이전달 '한식'을 제일 많이 드셨어요!</span>
											</div>
											<div class="row g-0 align-items-center">
												<div class="col-auto">
													<div class="text-dark fw-bold h5 mb-0 me-3">
														<span>50%</span>
													</div>
												</div>
												<div class="col">
													<div class="progress progress-sm">
														<div class="progress-bar bg-info" aria-valuenow="50" aria-valuemin="0"
															aria-valuemax="100" style="width: 50%;">
															<span class="visually-hidden">50%</span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xl-3 mb-4">
							<div class="card shadow border-start-warning py-2">
								<div class="card-body">
									<div class="row align-items-center no-gutters">
										<div class="col me-2">
											<div class="text-uppercase text-warning fw-bold text-xs mb-1">
												<span>Pending Requests</span>
											</div>
											<div class="text-dark fw-bold h5 mb-0">
												<span>18</span>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-7 col-xl-8">
							<div class="card shadow mb-4">
								<div class="card-header d-flex justify-content-between align-items-center"
									style="-bs-primary: #4e73df; - -bs-primary-rgb: 78, 115, 223;">
									<h6 class="text-primary fw-bold m-0">지난 한달간 음식별 여기갈래요 횟수</h6>
									<div class="dropdown no-arrow">
										<button class="btn btn-link btn-sm dropdown-toggle" aria-expanded="false"
											data-bs-toggle="dropdown" type="button">
											<i class="fas fa-ellipsis-v text-gray-400"></i>
										</button>
										<div class="dropdown-menu shadow dropdown-menu-end animated--fade-in">
											<p class="text-center dropdown-header">dropdown header:</p>
											<a class="dropdown-item" href="#">&nbsp;Action</a><a class="dropdown-item" href="#">&nbsp;Another
												action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">&nbsp;Something else here</a>
										</div>
									</div>
								</div>
								<div class="card-body">
								    <div class="chart-area">
									    <canvas data-bss-chart=
										    "{&quot;type&quot;:&quot;bar&quot;
										    ,&quot;data&quot;:{&quot;labels&quot;
										    :[&quot;한식&quot;,&quot;일식&quot;,&quot;중식&quot;,&quot;양식&quot;,&quot;패스트푸드&quot;,&quot;분식&quot;,&quot;아시아음식&quot;,&quot;뷔페&quot;]
										    ,&quot;datasets&quot;
										    :[{&quot;label&quot;:&quot;식사횟수&quot;
										    ,&quot;empty&quot;:true,&quot;data&quot;
										    :[&quot;31&quot;
										    ,&quot;8&quot;
										    ,&quot;16&quot;
										    ,&quot;12&quot;
										    ,&quot;6&quot;
										    ,&quot;12&quot;
										    ,&quot;4&quot;
										    ,&quot;3&quot;]
										    ,&quot;backgroundColor&quot;
										    :&quot;rgba(255, 99, 132, 0.5)&quot;
										    ,&quot;borderColor&quot;
										    :&quot;rgba(255, 99, 132, 1)&quot;}]},
										    &quot;options&quot;
										    
										    :{&quot;maintainAspectRatio&quot;:false,
										    &quot;legend&quot;:{&quot;display&quot;
										    :false,&quot;labels&quot;:{&quot;fontStyle&quot;:&quot;normal&quot;}}
										    ,&quot;title&quot;:{&quot;fontStyle&quot;:&quot;normal&quot;},&quot;scales&quot;
										    :{&quot;xAxes&quot;:[{&quot;gridLines&quot;:{&quot;color&quot;:&quot;rgb(234, 236, 244)&quot;
										    ,&quot;zeroLineColor&quot;:&quot;rgb(234, 236, 244)&quot;,&quot;drawBorder&quot;
										    :false,&quot;drawTicks&quot;:false,&quot;borderDash&quot;:[&quot;2&quot;],&quot;zeroLineBorderDash&quot;
										    :[&quot;2&quot;],&quot;drawOnChartArea&quot;:false},&quot;ticks&quot;:{&quot;fontColor&quot;
										    :&quot;#858796&quot;,&quot;fontStyle&quot;:&quot;normal&quot;,&quot;padding&quot;:20}}],&quot;yAxes&quot;
										    :[{&quot;gridLines&quot;:{&quot;color&quot;:&quot;rgb(234, 236, 244)&quot;,&quot;zeroLineColor&quot;
										    :&quot;rgb(234, 236, 244)&quot;,&quot;drawBorder&quot;:false,&quot;drawTicks&quot;:false,&quot;borderDash&quot;
										    :[&quot;2&quot;],&quot;zeroLineBorderDash&quot;:[&quot;2&quot;]},&quot;ticks&quot;:{&quot;fontColor&quot;
										    :&quot;#858796&quot;,&quot;fontStyle&quot;:&quot;normal&quot;,&quot;padding&quot;:20}}]}}}">
									    </canvas>
								    </div>
								</div>
							</div>
						</div>
						<div class="col-lg-5 col-xl-4">
							<div class="card shadow mb-4">
								<div class="card-header d-flex justify-content-between align-items-center"
									style="-bs-primary: #147a25; - -bs-primary-rgb: 20, 122, 37;">
									<h6 class="text-primary fw-bold m-0">그룹별 식사횟수</h6>
									<div class="dropdown no-arrow">
										<button class="btn btn-link btn-sm dropdown-toggle" aria-expanded="false"
											data-bs-toggle="dropdown" type="button">
											<i class="fas fa-ellipsis-v text-gray-400"></i>
										</button>
										<div class="dropdown-menu shadow dropdown-menu-end animated--fade-in">
											<p class="text-center dropdown-header">dropdown header:</p>
											<a class="dropdown-item" href="#">&nbsp;Action</a><a class="dropdown-item" href="#">&nbsp;Another
												action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">&nbsp;Something else here</a>
										</div>
									</div>
								</div>
								<div id="doughnut" class="card-body">
									<div class="chart-area">
										<canvas data-bss-chart=
										"{&quot;type&quot;
										:&quot;doughnut&quot;
										,&quot;data&quot;
										
										<%-- 각 영역 마우스 올리면 보이는 그룹이름 --%>
										:{&quot;labels&quot;
										:[&quot;소방기계&quot;,&quot;소방전기&quot;,&quot;BIM팀&quot;]
										,&quot;datasets&quot;
										
										<%-- 각 영역 색깔 --%>
										:[{&quot;label&quot;:&quot;&quot;,&quot;backgroundColor&quot;
										:[&quot;#4e73df&quot;,&quot;#1cc88a&quot;,&quot;#36b9cc&quot;]
										<%-- 도넛그래프 외곽선 색깔 --%>
										,&quot;borderColor&quot;
										:[&quot;#ffffff&quot;,&quot;#ffffff&quot;,&quot;#ffffff&quot;]
										
										<%-- 그룹간 식사횟수 --%>
										,&quot;data&quot;:[&quot;57&quot;,&quot;26&quot;,&quot;9&quot;]}
										]},&quot;options&quot;
										:{&quot;maintainAspectRatio&quot;:false,&quot;legend&quot;
										:{&quot;display&quot;:false,&quot;labels&quot;
										:{&quot;fontStyle&quot;:&quot;normal&quot;}},&quot;title&quot;:{&quot;fontStyle&quot;:&quot;normal&quot;}}}">
										</canvas>
									</div>
									<div class="text-center small mt-4">
									
									<!-- group_name -->
										<span class="me-2"><i class="fas fa-circle text-primary"></i>&nbsp;소방기계</span><span
											class="me-2"><i class="fas fa-circle text-success"></i>&nbsp;소방전기</span><span
											class="me-2"><i class="fas fa-circle text-info"></i>&nbsp;BIM팀</span>
									</div>
								</div>
							</div>
						</div>
					</div>
						<div class="row">
						<div class="col-lg-7 col-xl-8">
							<div class="card shadow mb-4">
								<div class="card-header d-flex justify-content-between align-items-center"
									style="-bs-primary: #4e73df; - -bs-primary-rgb: 78, 115, 223;">
									<h6 class="text-primary fw-bold m-0">지난 6개월간 '한식' 여기갈래요 수</h6>
									<div class="dropdown no-arrow">
										<button class="btn btn-link btn-sm dropdown-toggle" aria-expanded="false"
											data-bs-toggle="dropdown" type="button">
											<i class="fas fa-ellipsis-v text-gray-400"></i>
										</button>
										<div class="dropdown-menu shadow dropdown-menu-end animated--fade-in">
											<p class="text-center dropdown-header">dropdown header:</p>
											<a class="dropdown-item" href="#">&nbsp;Action</a>
											<a class="dropdown-item" href="#">&nbsp;Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">&nbsp;Something else here</a>
										</div>
									</div>
								</div>
								<div class="card-body">
								    <div class="chart-area">
									    <canvas data-bss-chart=
										    "{&quot;type&quot;:&quot;line&quot;
										    ,&quot;data&quot;:{&quot;labels&quot;
										    :[&quot;2월&quot;
										    ,&quot;3월&quot;
										    ,&quot;4월&quot;
										    ,&quot;5월&quot;
										    ,&quot;6월&quot;
										    ,&quot;7월&quot;]
										    ,&quot;datasets&quot;
										    :[{&quot;label&quot;
										    :&quot;Earnings&quot;
										    ,&quot;fill&quot;
										    :true,&quot;data&quot;
										    :[&quot;15432&quot;
										    ,&quot;14739&quot;
										    ,&quot;6825&quot;
										    ,&quot;19321&quot;
										    ,&quot;12832&quot;
										    ,&quot;18231&quot;]
										    ,&quot;backgroundColor&quot;
										    :&quot;rgba(78, 115, 223, 0.05)&quot;
										    ,&quot;borderColor&quot;
										    :&quot;rgba(78, 115, 223, 1)&quot;}]},
										    &quot;options&quot;
										    
										    :{&quot;maintainAspectRatio&quot;:false,
										    &quot;legend&quot;:{&quot;display&quot;
										    :false,&quot;labels&quot;:{&quot;fontStyle&quot;:&quot;normal&quot;}}
										    ,&quot;title&quot;:{&quot;fontStyle&quot;:&quot;normal&quot;},&quot;scales&quot;
										    :{&quot;xAxes&quot;:[{&quot;gridLines&quot;:{&quot;color&quot;:&quot;rgb(234, 236, 244)&quot;
										    ,&quot;zeroLineColor&quot;:&quot;rgb(234, 236, 244)&quot;,&quot;drawBorder&quot;
										    :false,&quot;drawTicks&quot;:false,&quot;borderDash&quot;:[&quot;2&quot;],&quot;zeroLineBorderDash&quot;
										    :[&quot;2&quot;],&quot;drawOnChartArea&quot;:false},&quot;ticks&quot;:{&quot;fontColor&quot;
										    :&quot;#858796&quot;,&quot;fontStyle&quot;:&quot;normal&quot;,&quot;padding&quot;:20}}],&quot;yAxes&quot;
										    :[{&quot;gridLines&quot;:{&quot;color&quot;:&quot;rgb(234, 236, 244)&quot;,&quot;zeroLineColor&quot;
										    :&quot;rgb(234, 236, 244)&quot;,&quot;drawBorder&quot;:false,&quot;drawTicks&quot;:false,&quot;borderDash&quot;
										    :[&quot;2&quot;],&quot;zeroLineBorderDash&quot;:[&quot;2&quot;]},&quot;ticks&quot;:{&quot;fontColor&quot;
										    :&quot;#858796&quot;,&quot;fontStyle&quot;:&quot;normal&quot;,&quot;padding&quot;:20}}]}}}">
									    </canvas>
								    </div>
								</div>
							</div>
						</div>
						<div class="col-lg-5 col-xl-4">
							<div class="card shadow mb-4">
								<div class="card-header d-flex justify-content-between align-items-center"
									style="-bs-primary: #147a25; - -bs-primary-rgb: 20, 122, 37;">
									<h6 class="text-primary fw-bold m-0">연령별 '한식' 선호도</h6>
									<div class="dropdown no-arrow">
										<button class="btn btn-link btn-sm dropdown-toggle" aria-expanded="false"
											data-bs-toggle="dropdown" type="button">
											<i class="fas fa-ellipsis-v text-gray-400"></i>
										</button>
										<div class="dropdown-menu shadow dropdown-menu-end animated--fade-in">
											<p class="text-center dropdown-header">dropdown header:</p>
											<a class="dropdown-item" href="#">&nbsp;Action</a><a class="dropdown-item" href="#">&nbsp;Another
												action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">&nbsp;Something else here</a>
										</div>
									</div>
								</div>
								<div id="doughnut" class="card-body">
									<div class="chart-area">
										<canvas data-bss-chart=
										"{&quot;type&quot;
										:&quot;pie&quot;
										,&quot;data&quot;
										
										<%-- 각 영역 마우스 올리면 보이는 그룹이름 --%>
										:{&quot;labels&quot;
										:[&quot;20대 이하&quot;,&quot;30대&quot;,&quot;40대&quot;,&quot;50대&quot;,&quot;60대 이상&quot;]
										,&quot;datasets&quot;
										
										<%-- 각 영역 색깔 --%>
										:[{&quot;label&quot;:&quot;&quot;,&quot;backgroundColor&quot;
										:[&quot;#4e73df&quot;,&quot;#1cc88a&quot;,&quot;#36b9cc&quot;,&quot;#f6c23e&quot;,&quot;#e74a3b&quot;]
										<%-- 도넛그래프 외곽선 색깔 --%>
										,&quot;borderColor&quot;
										:[&quot;#ffffff&quot;,&quot;#ffffff&quot;,&quot;#ffffff&quot;,&quot;#ffffff&quot;,&quot;#ffffff&quot;]
										
										<%-- 그룹간 식사횟수 --%>
										,&quot;data&quot;:[&quot;974&quot;,&quot;1531&quot;,&quot;1231&quot;,&quot;1682&quot;,&quot;453&quot;]}
										]},&quot;options&quot;
										:{&quot;maintainAspectRatio&quot;:false,&quot;legend&quot;
										:{&quot;display&quot;:false,&quot;labels&quot;
										:{&quot;fontStyle&quot;:&quot;normal&quot;}},&quot;title&quot;:{&quot;fontStyle&quot;:&quot;normal&quot;}}}">
										</canvas>
									</div>
									<div class="text-center small mt-4">
									
									<!-- group_name -->
										<span class="me-2"><i class="fas fa-circle text-primary"></i>&nbsp;20대 이하</span>
										<span class="me-2"><i class="fas fa-circle text-success"></i>&nbsp;30대</span>
										<span class="me-2"><i class="fas fa-circle text-info"></i>&nbsp;40대</span>
										<span class="me-2"><i class="fas fa-circle text-warning"></i>&nbsp;50대</span>
										<span class="me-2"><i class="fas fa-circle text-danger"></i>&nbsp;60대 이상</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 mb-4">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="text-primary fw-bold m-0">Projects</h6>
								</div>
								<div class="card-body">
									<h4 class="small fw-bold">
										Server migration<span class="float-end">20%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-danger" aria-valuenow="20" aria-valuemin="0"
											aria-valuemax="100" style="width: 20%;">
											<span class="visually-hidden">20%</span>
										</div>
									</div>
									<h4 class="small fw-bold">
										Sales tracking<span class="float-end">40%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-warning" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%;">
											<span class="visually-hidden">40%</span>
										</div>
									</div>
									<h4 class="small fw-bold">
										Customer Database<span class="float-end">60%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-primary" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: 60%;">
											<span class="visually-hidden">60%</span>
										</div>
									</div>
									<h4 class="small fw-bold">
										Payout Details<span class="float-end">80%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-info" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
											style="width: 80%;">
											<span class="visually-hidden">80%</span>
										</div>
									</div>
									<h4 class="small fw-bold">
										Account setup<span class="float-end">Complete!</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-success" aria-valuenow="100" aria-valuemin="0"
											aria-valuemax="100" style="width: 100%;">
											<span class="visually-hidden">100%</span>
										</div>
									</div>
								</div>
							</div>
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="text-primary fw-bold m-0">Todo List</h6>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">
										<div class="row align-items-center no-gutters">
											<div class="col me-2">
												<h6 class="mb-0">
													<strong>Lunch meeting</strong>
												</h6>
												<span class="text-xs">10:30 AM</span>
											</div>
											<div class="col-auto">
												<div class="form-check">
													<input class="form-check-input" type="checkbox" id="formCheck-1"><label
														class="form-check-label" for="formCheck-1"></label>
												</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="row align-items-center no-gutters">
											<div class="col me-2">
												<h6 class="mb-0">
													<strong>Lunch meeting</strong>
												</h6>
												<span class="text-xs">11:30 AM</span>
											</div>
											<div class="col-auto">
												<div class="form-check">
													<input class="form-check-input" type="checkbox" id="formCheck-2"><label
														class="form-check-label" for="formCheck-2"></label>
												</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="row align-items-center no-gutters">
											<div class="col me-2">
												<h6 class="mb-0">
													<strong>Lunch meeting</strong>
												</h6>
												<span class="text-xs">12:30 AM</span>
											</div>
											<div class="col-auto">
												<div class="form-check">
													<input class="form-check-input" type="checkbox" id="formCheck-3"><label
														class="form-check-label" for="formCheck-3"></label>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div class="col">
							<div class="row">
								<div class="col-lg-6 mb-4">
									<div class="card text-white bg-primary shadow">
										<div class="card-body">
											<p class="m-0">Primary</p>
											<p class="text-white-50 small m-0">#4e73df</p>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card text-white bg-success shadow">
										<div class="card-body">
											<p class="m-0">Success</p>
											<p class="text-white-50 small m-0">#1cc88a</p>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card text-white bg-info shadow">
										<div class="card-body">
											<p class="m-0">Info</p>
											<p class="text-white-50 small m-0">#36b9cc</p>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card text-white bg-warning shadow">
										<div class="card-body">
											<p class="m-0">Warning</p>
											<p class="text-white-50 small m-0">#f6c23e</p>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card text-white bg-danger shadow">
										<div class="card-body">
											<p class="m-0">Danger</p>
											<p class="text-white-50 small m-0">#e74a3b</p>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card text-white bg-secondary shadow">
										<div class="card-body">
											<p class="m-0">Secondary</p>
											<p class="text-white-50 small m-0">#858796</p>
										</div>
									</div>
								</div>
							</div>
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
<!-- <script type="text/javascript">
	$(document).ready(function() {
		console.log("jquery로 데이터 받기");
		fetchList();
	});
	
	//====================================== 그래프 목록 ======================================
	function fetchList() {
		var id = '${blogVo.id}';
		console.log(id);
		
		// = 없으면 오류
		var cateVo = {
			id: id
		};
		
		$.ajax({
			url : "${pageContext.request.contextPath}/cateList",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(cateVo),
			
			dataType : "json",
			success : function(cateList) {
				/*성공시 처리해야될 코드 작성*/
				console.log(cateList);
				//화면에 data + html을 그린다.
				for (var i = 0; i < cateList.length; i++) {
					render(cateList[i], "down");
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		})
		// ajax 
	};
	function render(cateVo, opt) {
		console.log('render()');
		var str = '';
		
		
		
		
		
		
		str+= '<div class="chart-area">';
		str+= '<canvas data-bss-chart=';
		str+= '"{&quot;type&quot;';
		str+= ':&quot;doughnut&quot;';
		str+= ',&quot;data&quot;';
		// 각 영역 마우스 올리면 보이는 그룹이름
		str+= '	:{&quot;labels&quot;';
		str+= '	:[&quot;소방기계&quot;,&quot;Social&quot;,&quot;Referral&quot;]';
		str+= '	,&quot;datasets&quot;';
		
		// 각 영역 색깔
		str+= '	:[{&quot;label&quot;:&quot;&quot;,&quot;backgroundColor&quot;';
		str+= '	:[&quot;#4e73df&quot;,&quot;#1cc88a&quot;,&quot;#36b9cc&quot;]';
		
		// 도넛그래프 외곽선 색깔
		str+= '	,&quot;borderColor&quot;';
		str+= '	:[&quot;#ffffff&quot;,&quot;#ffffff&quot;,&quot;#ffffff&quot;]';

		// 그룹간 식사횟수
		str+= '	,&quot;data&quot;:[&quot;50&quot;,&quot;30&quot;,&quot;15&quot;]}';
		str+= '	]},&quot;options&quot;';
		str+= '	:{&quot;maintainAspectRatio&quot;:false,&quot;legend&quot;';
		str+= '	:{&quot;display&quot;:false,&quot;labels&quot;';
		str+= '	:{&quot;fontStyle&quot;:&quot;normal&quot;}},&quot;title&quot;:{&quot;fontStyle&quot;:&quot;normal&quot;}}}">';
		str+= '	</canvas>';
		str+= '</div>';

		
		
		
		
		//리스트 순서
		if (opt == "up") {
			$("#cateList").prepend(str);
		} else if (opt == "down") {
			$("#cateList").append(str);
		} else {
			console.log("opt오류");
		}
	};


</script> -->
</html>
