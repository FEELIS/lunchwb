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
                            	<c:forEach var="member" items="${voteMember}">
                            		<c:if test="${member.bossCheck==1}">
                            			<span class="d-flex d-xxl-flex flex-wrap vote-people-bujang vote-people" data-group-member-no="${member.groupMemberNo}" data-user-no="${member.userNo}">
                            				<span class="text-end d-xxl-flex justify-content-xxl-end vote-people-header">
                            					<i class="fas fa-minus-circle vote-member-not-today"></i>
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
                            			<span class="d-flex d-xxl-flex flex-wrap vote-people" data-group-member-no="${member.groupMemberNo}" data-user-no="${member.userNo}">
                            				<span class="text-end d-xxl-flex justify-content-xxl-end vote-people-header">
                            					<i class="fas fa-minus-circle vote-member-not-today"></i>
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
	
	
	
	////////// 새로고침 방지 ///////////////////////////////////////////////////////////////
	
	document.onkeydown = noEvent
	
	// 부장 로고 클릭 시
	$("#bujang-logo-blue").on("click", function(){
		var confirmRefresh = confirm("페이지 이동 시 진행상황이 저장되지 않습니다. 메인으로 이동하시겠습니까?")
		if (!confirmRefresh) {		
			return false
		}
	})
	
	// F5 버튼 눌렀을 때
	function noEvent() {
		if (event.keyCode == 116) {
			var confirmRefresh = confirm("페이지 이동 시 진행상황이 저장되지 않습니다. 새로고침하시겠습니까?")
			if (!confirmRefresh) {
				event.keyCode = 2
				
				return false
			}
		} else if (event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)) {
			return false
			
		}
	}		
	
	
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
		
		if (voteAddNum + parseInt($("#edit-vote-group-num").text()) < 30) {
			voteAddNum += 1
			$("#vote-new-member-num").text(voteAddNum)
			
		} else {
			alert("투표 총 인원은 30명을 초과할 수 없습니다.")
		}
	})	
	
	
	// 추가하기 버튼 클릭
	$("#vote-new-member-add-btn").on("click", function(){
		var voteAddNum = parseInt($("#vote-new-member-num").text())
		var totNum = parseInt($("#edit-vote-group-num").text())
				
		$("#vote-new-member-num").text(1)
		
		if (totNum + voteAddNum > 30) {
			alert("투표 총 인원은 30명을 초과할 수 없습니다.")
			return false
		}
		
		// 투표할 추가 인원 div 추가
		for (var i = 0; i < voteAddNum; i++) {			
			var tempidx = Math.floor(Math.random() * birdName.length)
			var tempName = birdName[tempidx]
			birdName.splice(tempidx, 1)
			
			$("#edit-vote-people-area").append(
				  "<span class='d-flex d-xxl-flex flex-wrap vote-people'>"
        		+ 	"<span class='text-end d-xl-flex d-xxl-flex justify-content-xl-end align-items-xl-center justify-content-xxl-end vote-people-header'>"
    			+ 		"<i class='fas fa-pen d-inline-block vote-people-edit-name-btn'></i>"
    			+ 		"<i class='fas fa-times-circle d-inline-block vote-people-del-btn'></i>"
    			+ 	"</span>"
    			+ 	"<span class='vote-people-body-wrap'>"
    			+		"<span class='text-center d-xxl-flex justify-content-xxl-center align-items-xxl-center vote-people-body'>"
    			+	 		"<i class='fas fa-crown foo'></i>"
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
	$("#edit-vote-people-area").on("click", ".vote-member-not-today", function(){
		//alert($(this).closest(".vote-people").find(".vote-people-name").text() + "님은 오늘 점심 따로갈래요 😢")
		
		$(this).closest(".vote-people").addClass("vote-people-deleted")
		$(this).removeClass("fas fa-minus-circle vote-member-not-today")
		$(this).addClass("fas fa-plus-circle vote-member-re-add")
	})
	
	
	// 제외된 기존 그룹 멤버 다시 추가
	$("#edit-vote-people-area").on("click", ".vote-member-re-add", function(){
		$(this).closest(".vote-people").removeClass("vote-people-deleted")
		$(this).removeClass("fas fa-plus-circle vote-member-re-add")
		$(this).addClass("fas fa-minus-circle vote-member-not-today")
	})
	
	
	// 새이름 멤버 삭제
	$("#edit-vote-people-area").on("click", ".vote-people-del-btn", function(){
		var confirmDelBird = confirm($(this).closest(".vote-people").find(".vote-people-name").text() + "님을 투표에서 제외하시겠습니까?")
		if (!confirmDelBird) {
			return
		}
		
		$(this).closest(".vote-people").remove()
		
		var totNum = parseInt($("#edit-vote-group-num").text())
		$("#edit-vote-group-num").text(totNum-1)
	})
	
	
	// 새이름 멤버 수정
	$("#edit-vote-people-area").on("click", ".vote-people-edit-name-btn", function(){
		$(this).removeClass("fas fa-pen vote-people-edit-name-btn")
		$(this).addClass("fas fa-check-circle vote-people-edit-confirm")
		$(this).closest(".vote-people").find(".vote-people-del-btn").remove()
		
		var spanBirdName = $(this).closest(".vote-people").find(".vote-people-name")
		var birdName = spanBirdName.text()
		spanBirdName.html(
			"<input class='change-birdname-ipt' type='text' value='" + birdName + "'>"
		)
	})
	
	
	// 새이름 멤버 수정(확정 버튼 클릭)
	$("#edit-vote-people-area").on("click", ".vote-people-edit-confirm", function(){
		changeBirdName($(this))
	})
	
	
	// 새이름 멤버 수정(엔터)
	$("#edit-vote-people-area").on("keyup", ".change-birdname-ipt", function(key){
		if (key.keyCode == 13) {
			changeBirdName($(this).closest(".vote-people").find(".vote-people-edit-confirm"))
		}
	})
	
	
	// 새이름 멤버 수정 함수
	function changeBirdName(btn) {
		var spanName = btn.closest(".vote-people").find(".vote-people-name")
		var changedName = spanName.find("input").val()
		
		if (changedName.length < 1) {
			alert("적어도 한 글자 이상 입력해주세요")
			
			return
		}
		
		spanName.html(changedName)
				
		btn.removeClass("fas fa-check-circle vote-people-edit-confirm")
		btn.addClass("fas fa-pen vote-people-edit-name-btn")
		btn.closest(".vote-people-header").append("<i class='fas fa-times-circle d-inline-block vote-people-del-btn'></i>")
	}
		
	
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
	
	
	///////////////////// 투표 생성하기 //////////////////////////////////////////////////////////
	
</script>

</body>

</html>