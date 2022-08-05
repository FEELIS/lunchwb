<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav id="user-aside"
	class="navbar navbar-dark bg-primary align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
	<div class="container-fluid d-flex flex-column p-0">
		<a href="${pageContext.request.contextPath}/">
			<img data-bss-hover-animate="pulse" id="bujang-logo" width="159" height="38"
				src="${pageContext.request.contextPath}/assets/img/bujang-logo.png">
		</a>
		<ul class="navbar-nav" id="asdie-ul">
			<li class="nav-item">
				<a class="nav-link nav-title no-drag">나의정보</a>
			</li>
			<li class="nav-item">
				<a class="nav-link nav-menu" href="${pageContext.request.contextPath}/checkUserInfo">회원정보수정</a>
			</li>
			<li class="nav-item">
				<hr class="nav-line">
			</li>

			<li class="nav-item">
				<a class="nav-link nav-title no-drag">나의그룹</a>
			</li>
			<li class="nav-item">
				<a class="nav-link nav-menu" href="${pageContext.request.contextPath}/group/list">그룹목록</a>
			</li>
			<li class="nav-item">
				<a class="nav-link nav-menu" href="${pageContext.request.contextPath}/group/blackList">블랙리스트</a>
			</li>

			<li class="nav-item">
				<hr class="nav-line">
			</li>
			<li class="nav-item">
				<a class="nav-link nav-title no-drag">방문내역</a>
			</li>
			<li class="nav-item">
				<a class="nav-link nav-menu" href="${pageContext.request.contextPath}/stat/statCalendar">캘린더</a>
			</li>
			<li class="nav-item">
				<a class="nav-link nav-menu" href="${pageContext.request.contextPath}/stat/reviewList">리뷰내역</a>
			</li>
			<li class="nav-item">
				<a class="nav-link nav-menu" href="${pageContext.request.contextPath}/stat/statChart">방문통계</a>
			</li>
			<li class="nav-item">
				<hr class="nav-line">
			</li>
			<li class="nav-item">
				<a class="nav-link nav-title no-drag">고객센터</a>
			</li>
			<li class="nav-item">
				<a class="nav-link nav-menu" href="${pageContext.request.contextPath}/customer/FAQ">FAQ</a>
			</li>
			<li class="nav-item">
				<a class="nav-link nav-menu" href="${pageContext.request.contextPath}/customer/writeInquiry">문의하기</a>
			</li>
			<li class="nav-item">
				<a class="nav-link nav-menu" href="${pageContext.request.contextPath}/customer/reviewReport/${authUser.userNo}">문의내역</a>
			</li>
		</ul>
	</div>
</nav>
