// 지금 시각
let currentDate
// 지금 시각(시)
let currentTime
// 지금 시각(분)
let currentMin
// 임시 시각(시)
let tempTime
// 임시 시각(분)
let tempMin
// 새이름 다 떨어졌을 때 사용할 변수
let myBird = 1
// idx로 사용할 전체 사람 수(계속 업데이트)
let totVote = parseInt($("#edit-vote-group-num").text())
	
// 임시 멤버 이름으로 사용할 bird 이름
let birdName = ["가마우지", "갈매기", "개개비", "거위", "고니", "곤줄박이", "기러기", "까마귀", "까치", 
	"꼬리치레", "꾀꼬리", "꿩", "나무발발이", "논병아리", "느시", "닭", "독수리", "동고비", "두견", "두루미",
	"따오기", "딱따구리", "뜸부기", "마도요", "말똥가리", "매", "메추라기", "메추라기", "밀화부리", "발구지",
	"병아리", "부엉이", "비둘기", "뻐꾸기", "새홀리기", "솔개", "아비", "양진이", "어치", "오리", "오목눈이",
	"올빼미", "왜가리", "원앙", "제비", "조롱이", "종다리", "지빠귀", "직박구리", "찌르레기", "할미새사촌", "해오라기"]


/////////////// 페이지 로딩 시 //////////////////////////////////////////////////////////////////

$(document).ready(async function() {
	// 현재 시각 불러오기
	getTime()
	
	// 투표 종료시각 input에 현재 시각 표시
	$("#vote-end-hour").val(currentTime)
	$("#vote-end-min").val(currentMin)
})


////////// 새로고침 방지 ///////////////////////////////////////////////////////////////

document.onkeydown = noEvent

// 부장 로고 클릭 시 > 저장 안된다고 경고
$("#bujang-logo-blue").on("click", function(){
	var confirmRefresh = confirm("페이지 이동 시 진행상황이 저장되지 않습니다. 메인으로 이동하시겠습니까?")
	if (!confirmRefresh) {		
		return false
	}
})

// F5 버튼 눌렀을 때 > 저장 안된다고 경고
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

// 인원추가 - 버튼 토글 > 추가 인원--
$("#vote-member-minus").on("click", function(){
	var voteAddNum = parseInt($("#vote-new-member-num").text())
	
	if (voteAddNum > 1) {
		voteAddNum -= 1
		$("#vote-new-member-num").text(voteAddNum)
	}
})

// 인원추가 + 버튼 토글 > 추가인원++
$("#vote-member-plus").on("click", function(){
	var voteAddNum = parseInt($("#vote-new-member-num").text())
	
	// 투표 최대 인원 30명 넘는지 확인, 넘으면 경고
	if (voteAddNum + parseInt($("#edit-vote-group-num").text()) < 30) {
		voteAddNum += 1
		$("#vote-new-member-num").text(voteAddNum)
		
	} else {
		alert("투표 총 인원은 30명을 초과할 수 없습니다.")
	}
})	


// 추가하기 버튼 클릭 > 인원초과 안되면 html상 추가
$("#vote-new-member-add-btn").on("click", function(){
	// 추가할 인원
	var voteAddNum = parseInt($("#vote-new-member-num").text())
	// 현재 총 인원
	var totNum = parseInt($("#edit-vote-group-num").text())
	
	// 인원 추가에 표시되는 인원 1로 초기화
	$("#vote-new-member-num").text(1)
	
	// 총 인원 30명 넘어가면
	if (totNum + voteAddNum > 30) {
		alert("투표 총 인원은 30명을 초과할 수 없습니다.")
		return false
	}
	
	// 투표할 추가 인원 div html상에 추가
	for (var i = 0; i < voteAddNum; i++) {		
		totVote += 1
		
		// 새이름 선택하기, 중복 안되게 사용한 이름은 birdName 배열에서 제거
		if (birdName.length > 0) {	
			var tempidx = Math.floor(Math.random() * birdName.length)
			var tempName = birdName[tempidx]
			birdName.splice(tempidx, 1)
			
		} else { // 혹시? 누가 50개나 되는 이름을 다 썼다면
			var tempName = "새".repeat(myBird)
			myBird += 1 
		}
		
		// html 그리기
		$("#edit-vote-people-area").append(
			  "<span class='d-flex d-xxl-flex flex-wrap vote-people' data-vote-member-no='" + totVote + "'>"
       		+ 	"<span class='text-end d-xl-flex d-xxl-flex justify-content-xl-end align-items-xl-center justify-content-xxl-end vote-people-header'>"
   			+ 		"<i class='fas fa-pen d-inline-block vote-people-edit-name-btn'></i>"
   			+ 		"<i class='fas fa-times-circle d-inline-block vote-people-del-btn'></i>"
   			+ 	"</span>"
   			+ 	"<span class='vote-people-body-wrap'>"
   			+		"<span class='text-center d-flex d-xxl-flex justify-content-center align-items-center vote-people-body'>"
   			+	 		"<i class='fas fa-crown foo'></i>"
   			+ 			"<span class='vote-people-name'>" + tempName + "</span>"
   			+		 	"<i class='fas fa-crown'></i>"
   			+ 		"</span>"
   			+ 	"</span>"
   			+ "</span>"
		)
	}
	
	// 투표 참여 인원 표시 변경된 총 인원으로 변경
	totNum += voteAddNum
	$("#edit-vote-group-num").text(totNum)
})



///////////// 투표 인원 수정 /////////////////////////////////////////////////////////////////////////////////////////////

// 기존 그룹 멤버 투표 제외하기
$("#edit-vote-people-area").on("click", ".vote-member-not-today", function(){
	//alert($(this).closest(".vote-people").find(".vote-people-name").text() + "님은 오늘 점심 따로갈래요 😢")
	
	// 인원 표시 div 삭제된 상태로 변경하기
	$(this).closest(".vote-people").addClass("vote-people-deleted")
	$(this).removeClass("fas fa-minus-circle vote-member-not-today")
	$(this).addClass("fas fa-plus-circle vote-member-re-add")
	
	// 투표 총 인원 표시 변경
	var totNum = parseInt($("#edit-vote-group-num").text()) - 1
	$("#edit-vote-group-num").text(totNum)
	
})


// 제외된 기존 그룹 멤버 다시 추가
$("#edit-vote-people-area").on("click", ".vote-member-re-add", function(){
	// 다시 참여한 상태로 div 변경
	$(this).closest(".vote-people").removeClass("vote-people-deleted")
	$(this).removeClass("fas fa-plus-circle vote-member-re-add")
	$(this).addClass("fas fa-minus-circle vote-member-not-today")
	
	// 투표 총 인원 표시 변경
	var totNum = parseInt($("#edit-vote-group-num").text()) + 1
	$("#edit-vote-group-num").text(totNum)
})


// 새이름 멤버 삭제 클릭 > 아예 삭제해버리기
$("#edit-vote-people-area").on("click", ".vote-people-del-btn", function(){
	var confirmDelBird = confirm($(this).closest(".vote-people").find(".vote-people-name").text() + "님을 투표에서 제외하시겠습니까?")
	
	if (!confirmDelBird) {
		
		return false
	}
	
	// 새이름 표시 삭제
	$(this).closest(".vote-people").remove()
	
	// 총 인원 변경 반영
	var totNum = parseInt($("#edit-vote-group-num").text())
	$("#edit-vote-group-num").text(totNum-1)

})


// 새이름 멤버 수정 클릭 > input 있는 상태로 변경
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


// 새이름 멤버 수정(포커스 안된 곳 클릭)
$("#edit-vote-people-area").on("change", ".change-birdname-ipt", function(){
	changeBirdName($(this).closest(".vote-people").find(".vote-people-edit-confirm"))
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
	
	if (changedName.length < 2) { // 글자수 체크
		alert("적어도 두 글자 이상 입력해주세요")
		
		return
	}
	
	// 표시되는 이름 변경
	spanName.html(changedName)
			
	// html 다시 변경
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
	
	// 0 채워서 보여주기
	show_two_nums()
}


// 시간 더하기 계산
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
	

// 표시되는 숫자 두자리 유지하기
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
	// 현재시각 불러오기
	getTime()
	
	$("#vote-end-hour").val(currentTime)
	$("#vote-end-min").val(currentMin)
})


///////////////////// 투표 생성하기 //////////////////////////////////////////////////////////

// 투표 만들기 버튼 클릭
$("#make-vote-btn").on("click", function(){	
	// 투표 종료 시각 데이터 
	let voteEndDate = new Date()
	voteEndDate.setHours($("#vote-end-hour").val())
	voteEndDate.setMinutes($("#vote-end-min").val())
	console.log(voteEndDate)
	
	// 현재시각이 투표종료시각 이후라면
	if (voteEndDate <= new Date()) {
		alert("투표 마감 시각은 현재 시각 이후여야합니다.")
		
		return false
	}
	
	voteEndDate = String(voteEndDate)
	
	// 투표 멤버 데이터 정리하기
	let voteMember = [] // 투표 참가자 저장할 리스트(List<VoteVo>)
	let checkMember = [] // 추가된 회원 저장할 리스트(List<Integer>) >> 투표 가능 여부 check 용
	var cnt = 0
	
	for (var i = 1; i <= totVote; i++) {
		var currMem = {}
		var currDiv = $("[data-vote-member-no=" + i + "]")
		
		var currName = currDiv.find(".vote-people-name").text()
		
		// 해당 no의 사람이 존재한다면
		if (currName.length > 0) {
			// 오늘 안가기로 한 회원이면 저장하지 않음
			if (currDiv.hasClass("vote-people-deleted")) {
				
				continue
			}
			
			// 투표 참가 인원++
			cnt += 1
			// 투표 참가자 이름 불러오기
			currMem["userName"] = currName
						
			var userGrade = parseInt(currDiv.attr("data-user-grade"))
			var userNo =  parseInt(currDiv.attr("data-user-no"))

			if (userGrade >= 0) { // 회원은 userState 업데이트 위해 정보 추가 수집
				currMem["userNo"] = userNo
				currMem["userGrade"] = userGrade
				
				checkMember.push(userNo)
			}
			voteMember.push(currMem)
		}
	}
	
	if (cnt < 2) {
		alert("최소 두 명 이상이 존재해야 투표를 진행할 수 있습니다.")
		
		return false
	}
	
	voteMem = JSON.stringify({"mem" : voteMember})
	console.log(voteMem)
	
	
	// 투표 참여중인 회원 있는지 확인
	let stopVoteMake = false
	
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/vote/checkVoteMem",
		contentType : "application/json",
		async : false,
		data : JSON.stringify(checkMember),
		dataType : 'json',
		
		success : function(result) {
			var alertMember = ""
			
			for (var i = 0; i < result.length; i++) {
				if (i != result.length-1) {
					alertMember += result[i] + "님, "
				} else {
					alertMember += result[i]
				}
				
				var cantTr = $("[data-user-name=" + result[i] + "]").closest(".vote-people")
				
				// 참여 못하는 회원 비활성화
				cantTr.addClass("vote-people-deleted")
				cantTr.find(".vote-people-header i").removeClass("fas fa-minus-circle vote-member-not-today")
				cantTr.find(".vote-people-header i").addClass("fas fa-plus-circle vote-member-re-add")
			}
			
			// 누구누구 참여 못하는지 알려주기
			if (alertMember != "") {
				alert(alertMember + "님은 이미 다른 투표에 참여중입니다.")
				
				stopVoteMake = true
			}
		},
		error: function(xhr, status, error){
			console.log("오류 발생" + error)
		}
	})
	
	// 참여 못하는 회원이 한 명이라도 있으면 return
	if (stopVoteMake) {
		return false
	}
		
	
	// 장바구니 데이터 정리
	var curr_basket = []
	for (var i = 0; i < basket[curr_basket_group].length; i++) {
		if (basket[curr_basket_group][i].stored) {
			curr_basket.push(basket[curr_basket_group][i])
		}
	}
	console.log(curr_basket)
	currBasket = JSON.stringify(curr_basket)
	
	
	// ajax로 데이터 전송		
	let voteData = {
		voteEndDate : voteEndDate,
		voteMember : voteMem,
		currBasket : currBasket
	}
	
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/vote/makeVote",
		contentType : "application/json",
		async : false,
		data : JSON.stringify(voteData),
		dataType : 'json',
		
		success : function(voteNo) {
			if (voteNo == 0) {
				alert("투표 생성 실패")
				
			} else {
				$("#vote-url-input").val("http://localhost:8088/lunchwb/" + voteNo)
				$("#vote-link-modal").modal("show")
			}
		},
		error: function(xhr, status, error){
			console.log("오류 발생" + error)
		}
	})
})



////////////////////// 투표 생성 모달 //////////////////////////////////////////////

// 복사 버튼 클릭 시 클립보드에 url 복사
$("#vote-url-copy-btn").on("click", async function(){
	await saveClipBoard()
	location.replace("${pageContext.request.contextPath}/")
})
	
	
// 클립보드 저장 api 사용하는 function
async function saveClipBoard() {
	var content = $("#vote-url-input").val()

    navigator.clipboard.writeText(content)
        .then(() => {
        alert("클립보드에 복사되었습니다.")
    })
        .catch(err => {
        console.log("클립보드 복사 실패")
    })
}


// 투표 생성 모달 닫힘 > 메인페이지로 이동
$("#vote-link-modal").on("hide.bs.modal", function(){
	location.replace("${pageContext.request.contextPath}/")
})