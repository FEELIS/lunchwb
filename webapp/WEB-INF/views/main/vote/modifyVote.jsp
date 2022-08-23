<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>부장님요기요</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Bold-BS4-Responsive-Pricing-Table-Snippet.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style-jw.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vote-aside.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vote.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>

</head>



<body>

<div id="wrapper">
    <c:import url="/WEB-INF/views/includes/aside/voteAside.jsp" />
    
    <div class="d-flex flex-column" id="content-wrapper">
        <c:import url="/WEB-INF/views/includes/header.jsp" />
        
        <div class="container" id="container">
            <div id="main-content">
                <div class="vote-container-title"><span>투표 수정하기</span></div>
                
                <div id="edit-vote-area" class="card-body">
                    <div id="edit-vote-header">
                    	<span id="edit-vote-group-name">${voteInfo.groupName}</span>                        	
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
                        	                         	
                        	<c:forEach var="member" items="${voteMember}">
                        		<c:if test="${member.bossCheck==1}">
                        			<span class="d-flex d-xxl-flex flex-wrap vote-people-bujang vote-people" data-user-no="${member.userNo}" data-user-grade="${member.userGrade}" data-vote-member-no="${member.voteMemberNo}">
                        				<span class="text-end d-xxl-flex justify-content-xxl-end vote-people-header">
                        					<c:if test="${member.userNo != authUser.userNo}">
                        						<i class="fas fa-minus-circle vote-member-not-today"></i>
                        					</c:if>
                        				</span>
                        				<span class="vote-people-body-wrap">
                        					<span class="text-center d-flex d-xxl-flex justify-content-center align-items-center vote-people-body">
                        						<i class="fas fa-crown vote-bujang-crown"></i>
                        						<span class="vote-people-name" data-user-name="${member.userName}">${member.userName}</span>
                        						<i class="fas fa-crown"></i>
                        					</span>
                        				</span>
                        			</span>
                        		</c:if>
                        		
                        		<c:if test="${member.bossCheck==0}">
                        			<span class="d-flex d-xxl-flex flex-wrap vote-people" data-user-no="${member.userNo}" data-user-grade="${member.userGrade}" data-vote-member-no="${member.voteMemberNo}">
                        				<span class="text-end d-xxl-flex justify-content-xxl-end vote-people-header">
                        					<c:if test="${member.userNo != authUser.userNo}">
                        						<i class="fas fa-minus-circle vote-member-not-today"></i>
                        					</c:if>
                        				</span>
                        				<span class="vote-people-body-wrap">
                        					<span class="text-center d-flex d-xxl-flex justify-content-center align-items-center vote-people-body">
                        						<i class="fas fa-crown"></i>
                        						<span class="vote-people-name" data-user-name="${member.userName}">${member.userName}</span>
                        						<i class="fas fa-crown"></i>
                        					</span>
                        				</span>
                        			</span>
                        		</c:if>                    
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
                    
                    <div class="text-center" id="vote-make-finish">
                    	<button class="btn btn-primary text-center" id="vote-edit-return-btn" type="button">돌아가기</button>
                    	<button class="btn btn-primary text-center" id="make-vote-btn" type="button">투표 수정하기</button>
                    </div>
                </div>
            </div>
        </div>
        
        <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
        
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>

</body>

</html>