<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>부장님요기요: 블랙리스트</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/customModal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/group.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/alert.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap">
	
<script type="text/javascript"src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
<script type="text/javascript"src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>
</head>

<body id="page-top">

	<div id="wrapper">

		<c:import url="/WEB-INF/views/includes/aside/userAside.jsp"></c:import>

		<c:import url="/WEB-INF/views/includes/aside/groupAside.jsp"></c:import>

		<div id="content-wrapper" class="d-flex flex-column">

			<div id="content">

				<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

				<div class="container-fluid">
					<h3 class="text-dark mb-4 group-content-title">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -64 640 640"
							width="1em" height="1em" fill="currentColor"
							style="font-size: 30px;">
                        	<path d="M224 256c70.7 0 128-57.31 128-128S294.7 0 224 0C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3c-95.73 0-173.3 77.6-173.3 173.3C0 496.5 15.52 512 34.66 512H413.3C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM479.1 320h-73.85C451.2 357.7 480 414.1 480 477.3C480 490.1 476.2 501.9 470 512h138C625.7 512 640 497.6 640 479.1C640 391.6 568.4 320 479.1 320zM432 256C493.9 256 544 205.9 544 144S493.9 32 432 32c-25.11 0-48.04 8.555-66.72 22.51C376.8 76.63 384 101.4 384 128c0 35.52-11.93 68.14-31.59 94.71C372.7 243.2 400.8 256 432 256z"></path>
                    	</svg>
						${map.groupName}
					</h3>
					<div id="group-blacklist" class="card shadow">
						<div class="card-header py-3">
							<p class="text-primary m-0 fw-bold">블랙리스트 목록</p>
						</div>
						<div class="card-body">
						<!-- 
							<span class="blacklist-search"><input type="text"
								placeholder="가게 이름을 입력해주세요" />
							<button class="btn btn-primary btn-store-search" type="button">검색</button></span>
							 -->
							<div class="table-responsive table mt-2 store-list-table" role="grid" aria-describedby="dataTable_info">
								<table id="dataTable" class="table my-0">
									<thead>
										<tr>
											<th style="width: 25%;">가게 이름</th>
											<th style="width: 15%;">카테고리</th>
											<th style="width: 50%;">가게 위치</th>
											<th style="width: 10%;">
												<c:if test="${map.groupLeader == authUser.userNo}">삭제</c:if>
											</th>
										</tr>
									</thead>
									<tbody class="text-dark">
										<c:forEach items="${map.blacklist}" var="blackVo" varStatus="status">
											<tr id="black-${blackVo.blackNo}">
												<td>${blackVo.storeName}</td>
												<td>${blackVo.menu2ndCateName}</td>
												<td>${blackVo.storeRoadAddress}</td>
												<c:if test="${map.groupLeader == authUser.userNo}">
													<td class="text-warning">
														<i class="fas fa-trash group-black-delete"></i>
														<a class="blacklist-delete" href="#"></a>
													</td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr></tr>
									</tfoot>
								</table>
							</div>
							<div class="row">
								<div class="col-md-6 align-self-center">
									<p class="dataTables_info" role="status" aria-live="polite">총 개수 : ${map.blackCount}</p>
								</div>
								<div class="col-md-6">
									<nav
										class="d-lg-flex justify-content-lg-end visible dataTables_paginate paging_simple_numbers">
										<ul class="pagination">
											<li class="page-item disabled"><a class="page-link"
												aria-label="Previous" href="#"><span aria-hidden="true">«</span></a></li>
											<li class="page-item active"><a class="page-link"
												href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link"
												aria-label="Next" href="#"><span aria-hidden="true">»</span></a></li>
										</ul>
									</nav>
								</div>
							</div>
						</div>
					</div>
					<div id="group-blacklist-add" class="card shadow">
						<div class="card-header py-3">
							<p class="text-primary m-0 fw-bold">
								<strong>블랙리스트 추가하기</strong><br />
							</p>
						</div>
						<div class="card-body">
							<div>
								<input type="text" placeholder="가게 이름을 입력해주세요" />
								<button class="btn btn-primary btn-store-search" type="button">검색</button>
								<div>
									<span id="store-search-limit">현재위치에서 1km 이내의 음식점이 검색됩니다</span>
								</div>
							</div>
							<div class="table-responsive table mt-2 store-list-table"
								role="grid" aria-describedby="dataTable_info">
								<table id="dataTable" class="table my-0">
									<thead>
										<tr>
											<th style="width: 30%;">가게 이름</th>
											<th style="width: 60%;">가게 위치</th>
											<th style="width: 10%;">추가</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>라밥 서울대2호점</td>
											<td>서울 관악구 쑥고개로 139</td>
											<td><a href="#"><svg
														class="text-primary blacklist-add"
														xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512"
														width="1em" height="1em" fill="currentColor">
                                                    <path
															d="M432 256c0 17.69-14.33 32.01-32 32.01H256v144c0 17.69-14.33 31.99-32 31.99s-32-14.3-32-31.99v-144H48c-17.67 0-32-14.32-32-32.01s14.33-31.99 32-31.99H192v-144c0-17.69 14.33-32.01 32-32.01s32 14.32 32 32.01v144h144C417.7 224 432 238.3 432 256z"></path>
                                                </svg></a></td>
										</tr>
										<tr>
											<td>라밥 서울대2호점<br /></td>
											<td>서울 관악구 쑥고개로 139<br /></td>
											<td><svg class="text-primary blacklist-add"
													xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512"
													width="1em" height="1em" fill="currentColor">
                                                <path
														d="M432 256c0 17.69-14.33 32.01-32 32.01H256v144c0 17.69-14.33 31.99-32 31.99s-32-14.3-32-31.99v-144H48c-17.67 0-32-14.32-32-32.01s14.33-31.99 32-31.99H192v-144c0-17.69 14.33-32.01 32-32.01s32 14.32 32 32.01v144h144C417.7 224 432 238.3 432 256z"></path>
                                            </svg></td>
										</tr>
										<tr>
											<td>라밥 서울대2호점<br /></td>
											<td>서울 관악구 쑥고개로 139<br /></td>
											<td><svg class="text-primary blacklist-add"
													xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512"
													width="1em" height="1em" fill="currentColor">
                                                <path
														d="M432 256c0 17.69-14.33 32.01-32 32.01H256v144c0 17.69-14.33 31.99-32 31.99s-32-14.3-32-31.99v-144H48c-17.67 0-32-14.32-32-32.01s14.33-31.99 32-31.99H192v-144c0-17.69 14.33-32.01 32-32.01s32 14.32 32 32.01v144h144C417.7 224 432 238.3 432 256z"></path>
                                            </svg></td>
										</tr>
										<tr>
											<td>라밥 서울대2호점<br /></td>
											<td>서울 관악구 쑥고개로 139<br /></td>
											<td><svg class="text-primary blacklist-add"
													xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512"
													width="1em" height="1em" fill="currentColor">
                                                <path
														d="M432 256c0 17.69-14.33 32.01-32 32.01H256v144c0 17.69-14.33 31.99-32 31.99s-32-14.3-32-31.99v-144H48c-17.67 0-32-14.32-32-32.01s14.33-31.99 32-31.99H192v-144c0-17.69 14.33-32.01 32-32.01s32 14.32 32 32.01v144h144C417.7 224 432 238.3 432 256z"></path>
                                            </svg></td>
										</tr>
										<tr>
											<td>라밥 서울대2호점<br /></td>
											<td>서울 관악구 쑥고개로 139<br /></td>
											<td><svg class="text-primary blacklist-add"
													xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512"
													width="1em" height="1em" fill="currentColor">
                                                <path
														d="M432 256c0 17.69-14.33 32.01-32 32.01H256v144c0 17.69-14.33 31.99-32 31.99s-32-14.3-32-31.99v-144H48c-17.67 0-32-14.32-32-32.01s14.33-31.99 32-31.99H192v-144c0-17.69 14.33-32.01 32-32.01s32 14.32 32 32.01v144h144C417.7 224 432 238.3 432 256z"></path>
                                            </svg></td>
										</tr>
									</tbody>
									<tfoot>
										<tr></tr>
									</tfoot>
								</table>
							</div>
							<div class="row">
								<div class="col-md-6 align-self-center">
									<p class="dataTables_info" role="status" aria-live="polite">총
										개수 : 14</p>
								</div>
								<div class="col-md-6">
									<nav
										class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
										<ul class="pagination">
											<li class="page-item disabled"><a class="page-link"
												aria-label="Previous" href="#"><span aria-hidden="true">«</span></a></li>
											<li class="page-item active"><a class="page-link"
												href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link"
												aria-label="Next" href="#"><span aria-hidden="true">»</span></a></li>
										</ul>
									</nav>
								</div>
							</div>
						</div>
					</div>
				</div>
				<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
			</div>
		</div>
	<a class="border rounded d-inline scroll-to-top" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>
	</div>




</body>
</html>