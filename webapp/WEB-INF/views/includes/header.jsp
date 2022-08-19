<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/alert.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">

<nav id="header" class="navbar navbar-light navbar-expand-xl bg-white shadow d-xxl-flex justify-content-xxl-end mb-4 topbar static-top">
    <div class="container">
        <div></div>
        
        <ul class="navbar-nav d-xxl-flex align-items-xxl-center">
        
        	<c:if test="${!empty authUser}">
        	
	        	<!-- 알림 -->
	            <li id="user-alert" class="nav-item dropdown d-xxl-flex no-arrow">
	            	<a class="dropdown-toggle nav-link nav-link" aria-expanded="false" data-bs-toggle="dropdown" data-bs-auto-close="outside">
	            		<span class="badge bg-danger badge-counter">3+</span>
	            		<i class="fas fa-bell fa-fw"></i>
	            	</a>
	                <div id="user-alert-list" class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in" data-bs-popper="none">
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
	            
	            <!-- 로그아웃 -->
	            <li class="nav-item d-inline-flex">
	            	<a href="${pageContext.request.contextPath}/logout" style="padding: 15px 0px">
	            		<button id="logout-btn" class="btn btn-primary" type="button" style="2px 0px 0px 0px">로그아웃</button>
	            	</a>
	            </li>
	            
	            <!-- 유저 메뉴 -->
	            <li id="menu-dropdown" class="nav-item dropdown show d-xxl-flex">
	            	<a class="nav-link" aria-expanded="false" data-bs-toggle="dropdown" data-bs-auto-close="outside">
	            		<i class="fas fa-bars"></i>
	            	</a>
	                <div class="dropdown-menu dropdown-menu-end" data-bs-popper="none">
	                	<a class="dropdown-item" href="${pageContext.request.contextPath}/user/checkUser">나의정보</a>
	                	<a class="dropdown-item" href="${pageContext.request.contextPath}/group/list">나의그룹</a>
	                	<a class="dropdown-item" href="${pageContext.request.contextPath}/stat/statCalendar">방문내역</a>
	                	<a class="dropdown-item" href="${pageContext.request.contextPath}/customer/faq">고객센터</a>
	                </div>
	            </li>
            </c:if>
            
        </ul>
    </div>
</nav>

