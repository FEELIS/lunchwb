<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/alert.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">


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
                <p class="alert-basic">기주임님이 개발1팀을 탈퇴</p>
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

</body>
</html>