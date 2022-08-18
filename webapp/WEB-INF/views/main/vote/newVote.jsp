<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>부장님요기요</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/basket-aside.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style-jw.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vote.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">

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
            <div id="header-1">
                <c:import url="/WEB-INF/views/includes/header.jsp" />
            </div>
                        		
            <div class="container" id="container">
                <div id="main-content">
                    <div class="vote-container-title"><span class="no-drag">투표 만들기</span></div>
                    
                    <div id="edit-vote-area" class="card-body no-drag">
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
                            		<c:if test="${member.bossCheck==1}">
                            			<span class="d-flex d-xxl-flex flex-wrap vote-people-bujang vote-people" data-group-member-no="${member.groupMemberNo}" data-user-no="${member.userNo}" data-vote-member-no="${memberNo}">
                            				<span class="text-end d-xxl-flex justify-content-xxl-end vote-people-header">
                            					<i id="vote-member-not-today" class="fas fa-minus-circle"></i>
                            				</span>
                            				<span class="vote-people-body-wrap">
                            					<span class="text-center d-xxl-flex justify-content-xxl-center align-items-xxl-center vote-people-body">
                            						<i class="fas fa-crown vote-bujang-crown"></i>
                            						<span class="vote-people-name">${member.userName}</span>
                            						<i class="fas fa-crown"></i>
                            					</span>
                            				</span>
                            			</span>
                            		</c:if>
                            		
                            		<c:if test="${member.bossCheck==0}">
                            			<span class="d-flex d-xxl-flex flex-wrap vote-people" data-group-member-no="${member.groupMemberNo}" data-user-no="${member.userNo}" data-vote-member-no="${memberNo}">
                            				<span class="text-end d-xxl-flex justify-content-xxl-end vote-people-header">
                            					<i id="vote-member-not-today" class="fas fa-minus-circle"></i>
                            				</span>
                            				<span class="vote-people-body-wrap">
                            					<span class="text-center d-xxl-flex justify-content-xxl-center align-items-xxl-center vote-people-body">
                            						<i class="fas fa-crown"></i>
                            						<span class="vote-people-name">${member.userName}</span>
                            						<i class="fas fa-crown"></i>
                            					</span>
                            				</span>
                            			</span>
                            		</c:if>
                            		
                            	</c:forEach>
	                            	                            	
                            	                            	
                            	<span class="d-flex d-xxl-flex flex-wrap vote-people">
                            		<span class="text-end d-xl-flex d-xxl-flex justify-content-xl-end align-items-xl-center justify-content-xxl-end vote-people-header">
                            			<i class="fas fa-check-circle d-inline-block vote-people-edit-confirm"></i>
                            			<i class="fas fa-times-circle d-inline-block"></i>
                            		</span>
                            		<span class="vote-people-body-wrap">
                            			<span class="text-center d-xxl-flex justify-content-xxl-center align-items-xxl-center vote-people-body">
                            			<i class="fas fa-crown" style="font-size: 1px;color: #eaecf4;padding-right: 0;"></i>
                            			<span style="font-size: 18px;">
                            				<input type="text" value="도요새"></span>
                            				<i class="fas fa-crown" style="font-size: 1px;color: #eaecf4;padding-right: 0;"></i>
                            			</span>
                            		</span>
                            	</span>
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
    </div>
	
<script type="text/javascript">
	let currentDate
	let currentTime
	let currentMin
	let tempTime
	let tempMin
		
	let birdName = ["가마우지", "갈매기", "개개비", "거위", "고니", "곤줄박이", "기러기", "까마귀", "까치", 
		"꼬리치레", "꾀꼬리", "꿩", "나무발발이", "논병아리", "느시", "닭", "독수리", "동고비", "두견", "두루미",
		"따오기", "딱따구리", "뜸부기", "마도요", "말똥가리", "매", "메추라기", "메추라기", "밀화부리", "발구지",
		"병아리", "부엉이", "비둘기", "뻐꾸기", "새홀리기", "솔개", "아비", "양진이", "어치", "오리", "오목눈이",
		"올빼미", "왜가리", "원앙", "제비", "조롱이", "종다리", "지빠귀", "직박구리", "찌르레기", "할미새사촌", "해오라기"]
	

	$(document).ready(function() {
		getTime()
		$("#vote-end-hour").val(currentTime)
		$("#vote-end-min").val(currentMin)
	})
		
	////////// 투표 인원 변경 //////////////////////////////////////////////////////////////////////	
	
	// 인원추가 - 버튼 토글
	$("#vote-member-minus").on("click", function(){
		var voteAddNum = parseInt($("#vote-new-member-num").text())
		
		if (voteAddNum > 1) {
			voteAddNum -= 1
			$("#vote-new-member-num").text(voteAddNum)
		}
	})
	
	// 인원추가 + 버튼 토글
	$("#vote-member-plus").on("click", function(){
		var voteAddNum = parseInt($("#vote-new-member-num").text())
		
		if (voteAddNum + parseInt($("#edit-vote-group-num").text()) < 15) {
			voteAddNum += 1
			$("#vote-new-member-num").text(voteAddNum)
			
		} else {
			alert("투표 총 인원은 15명을 초과할 수 없습니다.")
		}
	})	
	
	
	// 추가하기 버튼 클릭
	$("#vote-new-member-add-btn").on("click", function(){
		var voteAddNum = parseInt($("#vote-new-member-num").text())
		var totNum = parseInt($("#edit-vote-group-num").text())
				
		$("#vote-new-member-num").text(1)
		
		if (totNum + voteAddNum > 15) {
			alert("투표 총 인원은 15명을 초과할 수 없습니다.")
			return false
		}
		
		// 투표할 추가 인원 div 추가
		for (var i = 0; i < voteAddNum; i++) {
			var tempName = birdName[Math.floor(Math.random() * 52)]
			
			$("#edit-vote-people-area").append(
				  "<span class='d-flex d-xxl-flex flex-wrap vote-people' data-vote-member-no='" + totNum+i + "'>"
        		+ 	"<span class='text-end d-xl-flex d-xxl-flex justify-content-xl-end align-items-xl-center justify-content-xxl-end vote-people-header'>"
    			+ 		"<i class='fas fa-pen d-inline-block vote-people-edit-name-btn'></i>"
    			+ 		"<i class='fas fa-times-circle d-inline-block'></i>"
    			+ 	"</span>"
    			+ 	"<span class='vote-people-body-wrap'>"
    			+		"<span class='text-center d-xxl-flex justify-content-xxl-center align-items-xxl-center vote-people-body'>"
    			+	 		"<i class='fas fa-crown'></i>"
    			+ 			"<span class='vote-people-name'>" + tempName + "</span>"
    			+		 	"<i class='fas fa-crown'></i>"
    			+ 		"</span>"
    			+ 	"</span>"
    			+ "</span>"
			)
		}
		
		totNum += voteAddNum
		$("#edit-vote-group-num").text(totNum)
	})
	
	
	
	///////////// 투표 인원 수정 /////////////////////////////////////////////////////////////////////////////////////////////
	
	// 기존 그룹 멤버 투표 제외하기
	$("#edit-vote-people-area").on("click", "#vote-member-not-today", function(){
		alert("으악")
	})
	
	
	// 제외된 기존 그룹 멤버 다시 추가
	$("#edit-vote-people-area").on("click", "#vote-member-re-add", function(){
		
	})
	
	
	////////// 투표 마감 시각 관련 /////////////////////////////////////////////////////////////////////////////
	
	// 현재 시각 가져오기
	function getTime() {
		currentDate = new Date()
		currentTime = String(currentDate.getHours())
		currentMin = String(currentDate.getMinutes())
		
		show_two_nums()
	}
	
	
	// 시간 계산
	function calculateTime(plusMin) {
		tempTime = parseInt(currentTime)
		tempMin = parseInt(currentMin) + plusMin
		
		if (tempMin > 59) {			
			tempMin -= 60
			tempTime += 1
		}
		
		if (tempTime > 23) {
			alert("투표 마감 시각은 오늘 자정을 넘어갈 수 없습니다")
			return
			
		} else {
			currentTime = String(tempTime)
			currentMin = String(tempMin)
			show_two_nums()
			
			$("#vote-end-hour").val(currentTime)
			$("#vote-end-min").val(currentMin)
		}
	}
		
	
	// 두자리 수 유지
	function show_two_nums() {
		currentTime = currentTime.padStart(2, "0")
		currentMin = currentMin.padStart(2, "0")
	}
	
	
	// input에서 변화 감지 (**수정 필요)
	$("#vote-end-hour").on("change", function(){
		tempTime = String($("#vote-end-hour").val())
		
		if (tempTime > 23) {
			alert("0 ~ 23 사이의 숫자만 입력 가능합니다.")
			$("#vote-end-hour").val(currentTime)
			
			return
		}
		
		currentTime = tempTime
		show_two_nums()
		$("#vote-end-hour").val(currentTime)
	})
	
	$("#vote-end-min").on("change", function(){
		tempMin = String($("#vote-end-min").val())
		
		if (tempMin > 59) {
			alert("0 ~ 59 사이의 숫자만 입력 가능합니다.")
			$("#vote-end-min").val(currentMin)
			
			return
		}
		
		currentMin = tempMin
		show_two_nums()
		$("#vote-end-min").val(currentMin)
	})
	
	
	// +10분 클릭
	$("#vote-add-10m").on("click", function(){
		calculateTime(10)
	})
	
	
	// +30분 클릭
	$("#vote-add-30m").on("click", function(){
		calculateTime(30)
	})
	
	
	// +1시간 클릭
	$("#vote-add-1hr").on("click", function(){
		calculateTime(60)
	})
	
	
	// 초기화 클릭
	$("#vote-reset-btn").on("click", function(){
		getTime()
		
		$("#vote-end-hour").val(currentTime)
		$("#vote-end-min").val(currentMin)
	})
	
	
	// 투표 생성하기
	
</script>

</body>

</html>