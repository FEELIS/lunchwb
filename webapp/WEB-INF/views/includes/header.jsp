<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>부장님여기요</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&amp;display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Features-Large-Icons-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/group.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/group.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/alert.css">
</head>

<body>

<nav id="header" class="navbar navbar-light navbar-expand bg-white shadow d-xxl-flex justify-content-xxl-end mb-4 topbar static-top">
    <div class="container">
        <div></div>
        
        <ul class="navbar-nav d-xxl-flex align-items-xxl-center">
        
            <li id="user-alert" class="nav-item dropdown d-xxl-flex no-arrow">
            	<a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" data-bs-auto-close="outside">
            		<span class="badge bg-danger badge-counter">3+</span>
            		<i class="fas fa-bell fa-fw"></i>
            	</a>
                <div id="user-alert-list" class="dropdown-menu dropdown-menu-end show dropdown-list animated--grow-in" data-bs-popper="none">
                    <h6 class="dropdown-header">alerts center</h6>
                   	<a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="bg-success icon-circle"></div>
                        <div>
                            <p class="alert-basic">기주임님이 개발1팀을 탈퇴하였습니다</p>
                        </div>
                        <div class="btn-group" role="group">
                        	<button class="btn btn-primary btn-alert-check" type="button">확인</button>
                        </div>
                   	</a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="bg-warning icon-circle"></div>
                        <div>
                            <p class="alert-basic">feelis님이 초대를 거절하였습니다</p>
                        </div>
                        <div class="btn-group" role="group">
                        	<button class="btn btn-primary btn-alert-check" type="button">확인</button>
                        </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="bg-warning icon-circle"></div>
                        <div>
                            <p class="alert-basic">feelis님이 초대를 수락하였습니다</p>
                        </div>
                        <div class="btn-group" role="group">
                        	<button class="btn btn-primary btn-alert-check" type="button">확인</button>
                        </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="bg-primary icon-circle"></div>
                        <div>
                            <p class="alert-basic">개발1팀에서 퇴장당하였습니다</p>
                        </div>
                        <div class="btn-group" role="group">
                        	<button class="btn btn-primary btn-alert-check" type="button">확인</button>
                        </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="bg-danger icon-circle"></div>
                        <div>
                            <p class="alert-basic">개발1팀의 그룹장을 위임받았습니다</p>
                        </div>
                        <div class="btn-group" role="group">
                        	<button class="btn btn-primary btn-alert-check" type="button">확인</button>
                        </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="bg-dark icon-circle"></div>
                        <div>
                            <p class="alert-basic">7월 23일에 남겨주신 리뷰가 광고/도배의 이유로 삭제되었습니다</p>
                        </div>
                        <div class="btn-group" role="group">
                        	<button class="btn btn-primary btn-alert-check" type="button">확인</button>
                       	</div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="bg-warning icon-circle"></div>
                        <div>
                            <p class="alert-choice">개발1팀에 초대되었습니다</p>
                        </div>
                        <div class="btn-group" role="group">
                        	<button class="btn btn-primary btn-alert-ok" type="button">수락</button>
                        	<button class="btn btn-primary btn-alert-opposite" type="button">거절</button>
                        </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="bg-info icon-circle"></div>
                        <div>
                            <p class="alert-choice">남겨주신 문의에 답변이 등록되었습니다</p>
                        </div>
                        <div class="btn-group" role="group">
                        	<button class="btn btn-primary btn-alert-ok" type="button">보기</button>
                        	<button class="btn btn-primary btn-alert-opposite" type="button">확인</button>
                        </div>
                    </a>
                </div>
            </li>
            
            <li class="nav-item d-inline-flex">
            	<button id="logout-btn" class="btn btn-primary" type="button">로그아웃</button>
            </li>
            
            <li id="menu-dropdown" class="nav-item dropdown show d-xxl-flex">
            	<a class="nav-link" aria-expanded="true" data-bs-toggle="dropdown" data-bs-auto-close="outside">
            		<i class="fas fa-bars"></i>
            	</a>
                <div class="dropdown-menu dropdown-menu-end show" data-bs-popper="none">
                	<a class="dropdown-item" href="#">나의정보</a>
                	<a class="dropdown-item" href="${pageContext.request.contextPath}/groupList">나의그룹</a>
                	<a class="dropdown-item" href="#">방문내역</a>
                	<a class="dropdown-item" href="#">고객센터</a>
                </div>
            </li>
            
        </ul>
    </div>
</nav>

    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/theme.js"></script>
    <script src="../../../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../../assets/js/bs-init.js"></script>
    <script src="../../../assets/js/theme.js"></script>
</body>
</html>
