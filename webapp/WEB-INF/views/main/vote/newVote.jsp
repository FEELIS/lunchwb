<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>부장님요기요</title>

<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/bujang.png">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/basket-aside.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style-jw.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vote.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>

</head>

<body>

<div id="wrapper"> 
	<c:import url="/WEB-INF/views/includes/aside/basketAside.jsp" />
    
    <div class="d-flex flex-column" id="content-wrapper">
        <c:import url="/WEB-INF/views/includes/header.jsp" />

        <div class="container" id="container">
            <div id="main-content">
                <div class="vote-container-title"><span>투표 만들기</span></div>
                
                <div id="edit-vote-area" class="card-body">
                    <div id="edit-vote-header">
                    	<span id="edit-vote-group-name">${groupName}</span>                        	
                    	<span id="edit-vote-group-nums">
                    		<span>(총 인원&nbsp;</span>
                    		<span id="edit-vote-group-num" class="emphasize-blue">${fn:length(voteMember)}</span>
                    		<span>명)</span>
                    	</span>
                    </div>
                    
                    <hr>
                    
                    <div id="edit-vote-member">
                        <div id="edit-vote-add-people-area">
                            <div id="vote-add-people">
                             <span class="eidt-vote-title">인원 추가</span>
                             <span id="vote-new-member-toggle">
                             	<i id="vote-member-minus" class="fas fa-minus-circle"></i>
                             	<span id="vote-new-member-num">1</span><span>명</span>
                             	<i id="vote-member-plus" class="fas fa-plus-circle"></i>
                             </span>
                             
                             <button class="btn btn-primary" id="vote-new-member-add-btn" type="button">추가하기</button>
                            </div>
                        </div>
                        
                        <div class="d-flex d-xxl-flex flex-row flex-grow-0 flex-wrap justify-content-xxl-start" id="edit-vote-people-area">
                        
                        	<!--  투표 참여할 인원들 표시  -->   
                        	<c:set var="memberNo" value="0" />                     	                         
                        	<c:forEach var="member" items="${voteMember}">
                        		<c:set var="memberNo" value="${memberNo+1}" />                      		
                        			<span class="d-flex d-xxl-flex flex-wrap vote-people <c:if test="${member.bossCheck==1}">vote-people-bujang</c:if>"
                        			      data-user-no="${member.userNo}" data-user-grade="${member.userGrade}" data-vote-member-no="${memberNo}">
                        				<span class="text-end d-xxl-flex justify-content-xxl-end vote-people-header">
                        					<c:if test="${member.userNo != authUser.userNo}">
                        						<i class="fas fa-minus-circle vote-member-not-today"></i>
                        					</c:if>
                        				</span>
                        				<span class="vote-people-body-wrap">
                        					<span class="text-center d-flex d-xxl-flex justify-content-center align-items-center vote-people-body">
                        						<i class="fas fa-crown <c:if test="${member.bossCheck==1}">vote-bujang-crown</c:if>"></i>
                        						<span class="vote-people-name" data-user-name="${member.userName}">${member.userName}</span>
                        						<i class="fas fa-crown"></i>
                        					</span>
                        				</span>
                        			</span>         
                        	</c:forEach>
                        </div>
                    </div>
                    
                    <hr>
                    
                    <div id="vote-end-time">
                        <div>
                        	<span class="eidt-vote-title">투표 마감 시각</span>
                        	<input type="number" id="vote-end-hour" min="00" max="23" step="1" value="" name="end-vote-hour">
                        	<span>시</span>
                        	<input type="number" id="vote-end-min" min="00" max="59" step="1" value="" name="end-vote-min">
                        	<span>분 까지</span>
                        </div>
                        
                        <div id="vote-time-button-area">
                        	<span>투표 마감 시각</span>
                        	<button class="btn btn-primary vote-add-time-btn" id="vote-add-10m" type="button">+10분</button>
                        	<button class="btn btn-primary vote-add-time-btn" id="vote-add-30m" type="button">+30분</button>
                        	<button class="btn btn-primary vote-add-time-btn" id="vote-add-1hr" type="button">+1시간</button>
                        	<button class="btn btn-primary" id="vote-reset-btn" type="button">초기화</button>
                        </div>
                    </div>
                    
                    <hr>
                    
                    <div class="text-center" id="vote-make-finish"><button class="btn btn-primary text-center" id="make-vote-btn" type="button">투표 만들기</button></div>
                </div>
            </div>
        </div>
        <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
    </div>
    
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    
    <div class="modal fade" role="dialog" tabindex="-1" id="vote-link-modal">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	        <div class="modal-content">
	            <div class="modal-header d-xxl-flex" id="vote-link-modal-header">
	                <h4 class="modal-title d-xxl-flex" id="vote-link-modal-header-title">투표가 성공적으로 생성되었습니다!</h4>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            
	            <div class="modal-body d-flex justify-content-center justify-content-xxl-center" id="vote-link-modal-body">
	                <div class="justify-content-center">
	                    <p class="text-center">같이 밥을 먹을 그룹원들에게 투표를 공유할 수 있습니다<br></p>
	                    <div class="d-flex justify-content-center">
	                    	<button class="btn btn-danger d-inline-flex d-xxl-flex justify-content-center align-items-center" id="vote-kakao-btn" type="button">
	                    		<i class="fas fa-comment"></i>
	                    		<span>공유하기</span>
	                    	</button>
	                    	<span class="d-inline-flex flex-shrink-0 justify-content-center flex-nowrap align-items-xxl-center" id="vote-url-copy-box">
	                    		<i class="fas fa-link d-inline-flex d-xxl-flex flex-shrink-0 justify-content-start align-items-center justify-content-xl-start align-items-xl-center justify-content-xxl-start align-items-xxl-center"></i>
	                    		<input id="vote-url-input" class="d-inline-flex d-xxl-flex flex-shrink-0 align-items-xxl-center" type="text" value="">
	                    		<button id="vote-url-copy-btn" class="btn btn-primary d-inline-flex d-xxl-flex flex-shrink-0 justify-content-center align-items-center align-content-center align-items-xl-center justify-content-xxl-center align-items-xxl-center" type="button">복사</button>
	                    	</span>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	
</div>
	
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/editVote.js"></script>

</body>

</html>