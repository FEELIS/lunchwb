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
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/chart-init.js"></script> --%>

	


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
									    <canvas data-bss-chart="">
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
										<canvas data-bss-chart="">
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
									<h6 id="lineMenu" class="text-primary fw-bold m-0">지난 6개월간 '한식' 여기갈래요 수</h6>
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
									    <canvas data-bss-chart="">
									    </canvas>
								    </div>
								</div>
							</div>
						</div>
						<div class="col-lg-5 col-xl-4">
							<div class="card shadow mb-4">
								<div class="card-header d-flex justify-content-between align-items-center"
									style="-bs-primary: #147a25; - -bs-primary-rgb: 20, 122, 37;">
									<h6 id="pieMenu" class="text-primary fw-bold m-0">연령별 '한식' 선호도</h6>
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
										<canvas data-bss-chart="">
										</canvas>
									</div>
									<div class="text-center small mt-4">
									
									<!-- group_name -->
										<span class="me-2"><i class="fas fa-circle text-primary"></i>&nbsp;20대</span>
										<span class="me-2"><i class="fas fa-circle text-success"></i>&nbsp;30대</span>
										<span class="me-2"><i class="fas fa-circle text-info"></i>&nbsp;40대</span>
										<span class="me-2"><i class="fas fa-circle text-warning"></i>&nbsp;50대</span>
										<span class="me-2"><i class="fas fa-circle text-danger"></i>&nbsp;60대이상</span>
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
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {

	var charts = document.querySelectorAll('[data-bss-chart]');
	
	// 지난 한달간 음식별 여기갈래요 횟수
	var bar = barGraph();
	var i =0;
	
	for (var chart of charts) {
		
		chart.chart = new Chart(chart, JSON.parse(chart.dataset.bssChart=bar[i]));
		console.log(chart.chart);
		i++;
	}

}, false);

function barGraph() {
	
	var strArray=[];
	var menu = ['뷔페','아시아음식','양식','일식','한식','패스트푸드','패밀리레스토랑','치킨','분식','중식'];
	
	var menu1stCateName = menu[(Math.floor(Math.random() * 10))];
	
	// 라인그래프, 파이모양그래프 제목
	$('#lineMenu').text('지난 6개월간 '+ menu1stCateName +' 여기갈래요 수');
	$('#pieMenu').text('연령별 '+ menu1stCateName +' 선호도');
	
	var userNo = '${authUser.userNo}';

	var statVo = {
		userNo: userNo,
		menu1stCateName: menu1stCateName		
			
	};
	
	$.ajax({
		url : "${pageContext.request.contextPath}/stat/getStatChart",
		type : "post",
		contentType : "application/json",
		async: false,
		data : JSON.stringify(statVo),
		
		dataType : "json",
		success : function(chartMap) {
			/*성공시 처리해야될 코드 작성*/
			console.log(chartMap);
			var bar = renderToBar(chartMap);
			var doughnut = renderToDoughnut(chartMap);
			var line = renderToLine(chartMap);
			var pie = renderToPie(chartMap);
			
			strArray.push(bar);
			strArray.push(doughnut);
			strArray.push(line);
			strArray.push(pie);
			
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	// ajax 
	return strArray;
}

function renderToBar(statVo) {
	var str = '';
	
	str += '{' +
		    '"type": "bar",'+
		    '"data": {'+
		    	'"labels": ['+
		    	statVo.barLabels+
		    	'],'+
		    	'"datasets": [{'+
		    	'"label": "식사횟수",'+
		    	'"empty": true,'+
		    	'"data": ['+
		    	statVo.barData+'],'+
	    		'"backgroundColor": "rgba(255, 99, 132, 0.5)",'+
	    		'"borderColor": "rgba(255, 99, 132, 1)"'+
	    		'}]'+
		    '},'+
		    	'"options": {'+
		    	'"maintainAspectRatio": false,'+
					'"legend": {'+
		    		'"display": false,'+
		    		'"labels": {'+
		    		'"fontStyle": "normal"'+
		    		'}'+
	    		'},'+
		    	'"title": {'+
		    	'"fontStyle": "normal"'+
		    	'},'+
		    	'"scales": {'+
		    	'"xAxes": [{'+
		    		'"display": true,' +
		    		'"ticks": {"beginAtZero": true' +
		   		'},'+
		    	'"gridLines": {'+
		    	'"color": "rgb(234, 236, 244)",'+
		    	'"zeroLineColor": "rgb(234, 236, 244)",'+
		    	'"drawBorder": false,'+
		    	'"drawTicks": false,'+
		    	'"borderDash": ["2"],'+
		    	'"zeroLineBorderDash": ["2"],'+
		    	'"drawOnChartArea": false'+
	    	'},'+
		    '"ticks": {'+
		    '"fontColor": "#858796",'+
		    '"fontStyle": "normal",'+
		    '"padding": 20'+
		    '}'+
		    '}],'+
		    '"yAxes": [{'+
		    '"gridLines": {'+
		    '"color": "rgb(234, 236, 244)",'+
		    '"zeroLineColor": "rgb(234, 236, 244)",'+
		    '"drawBorder": false,'+
		    '"drawTicks": false,'+
		    '"borderDash": ["2"],'+
		    '"zeroLineBorderDash": ["2"]'+
		    '},'+
		    '"ticks": {'+
		    '"beginAtZero": "true",'+
		    '"fontColor": "#858796",'+
		    '"fontStyle": "normal",'+
		    '"padding": 20'+
		    '}'+
		    '}]'+
		    '}'+
		    '}'+
		'}';
		
		return str;
};



function renderToDoughnut(statVo) {
	var str = '';
	
	str +=
		'{'+
		'"type": "doughnut",'+
		'"data": {'+
			'"labels": ['+
				statVo.doughnutLabels +
				'],'+
			'"datasets": [{'+
				'"label": "",'+
				'"backgroundColor": ["#4e73df", "#1cc88a", "#36b9cc"],'+
				'"borderColor": ["#ffffff", "#ffffff", "#ffffff"],'+
				'"data": ['+
					statVo.doughnutData +
					']'+
			'}]'+
		'},'+
		'"options": {'+
			'"maintainAspectRatio": false,'+
			'"legend": {'+
				'"display": false,'+
				'"labels": {'+
					'"fontStyle": "normal"'+
					'}'+
				'},'+
				'"title": {'+
					'"fontStyle": "normal"'+
				'}'+
			'}'+
		'}';
		
	return str;
};

function renderToLine(statVo) {
	
	var str = '';
	
	str +='{'+
		    '"type": "line",'+
		    '"data": {'+
		        '"labels": ['+
		        	statVo.lineLabels +
		        	'],'+
		        '"datasets": [{'+
		            '"label": "Earnings",'+
		            '"fill": true,'+
		            '"data": ['+
		            statVo.lineData+
		            	'],'+
		            '"backgroundColor": "rgba(78, 115, 223, 0.05)",'+
		            '"borderColor": "rgba(78, 115, 223, 1)"'+
		        '}]'+
		    '},'+
		    '"options": {'+
		        '"maintainAspectRatio": false,'+
		        '"legend": {'+
		            '"display": false,'+
		            '"labels": {'+
		                '"fontStyle": "normal"'+
		            '}'+
		        '},'+
		        '"title": {'+
		            '"fontStyle": "normal"'+
		        '},'+
		        '"scales": {'+
		            '"xAxes": [{'+
		                '"gridLines": {'+
		                    '"color": "rgb(234, 236, 244)",'+
		                    '"zeroLineColor": "rgb(234, 236, 244)",'+
		                    '"drawBorder": false,'+
		                    '"drawTicks": false,'+
		                    '"borderDash": ["2"],'+
		                    '"zeroLineBorderDash": ["2"],'+
		                    '"drawOnChartArea": false'+
		                '},'+
		                '"ticks": {'+
		                    '"fontColor": "#858796",'+
		                    '"fontStyle": "normal",'+
		                    '"padding": 20'+
		                '}'+
		            '}],'+
		            '"yAxes": [{'+
		                '"gridLines": {'+
		                    '"color": "rgb(234, 236, 244)",'+
		                    '"zeroLineColor": "rgb(234, 236, 244)",'+
		                    '"drawBorder": false,'+
		                    '"drawTicks": false,'+
		                    '"borderDash": ["2"],'+
		                    '"zeroLineBorderDash": ["2"]'+
		                '},'+
		                '"ticks": {'+
		                    '"fontColor": "#858796",'+
		                    '"fontStyle": "normal",'+
		                    '"padding": 20'+
		                '}'+
		            '}]'+
		        '}'+
		    '}'+
		'}';
		
	return str;
};
function renderToPie(statVo) {
	
	
	var str = '';
	
	str +='{'+
		    '"type": "pie",'+
		    '"data": {'+
		        '"labels": ['+
		        	statVo.pieLabels+
		        	'],'+
		        '"datasets": [{'+
		            '"label": "",'+
		            '"backgroundColor": ["#4e73df", "#1cc88a", "#36b9cc", "#f6c23e", "#e74a3b"],'+
		            '"borderColor": ["#ffffff", "#ffffff", "#ffffff", "#ffffff", "#ffffff"],'+
		            '"data": ['+
		            statVo.pieData+
		            	']'+
		        '}]'+
		    '},'+
		    '"options": {'+
		        '"maintainAspectRatio": false,'+
		        '"legend": {'+
		            '"display": false,'+
		            '"labels": {'+
		                '"fontStyle": "normal"'+
		            '}'+
		        '},'+
		        '"title": {'+
		            '"fontStyle": "normal"'+
		        '}'+
		    '}'+
		'}';
		
	return str;
};

</script>
</html>
