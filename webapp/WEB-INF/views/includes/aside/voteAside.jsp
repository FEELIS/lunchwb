<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
</head>

<body>

<nav id="vote-aside" class="navbar navbar-light bg-white text-center d-xxl-flex align-items-start justify-content-xxl-center sidebar accordion p-0">
	<div class="container-fluid d-flex flex-column p-0">
		<div id="bujang-logo-wrap">
        	<a href="${pageContext.request.contextPath}/" class="no-drag"><img data-bss-hover-animate="pulse" id="bujang-logo-blue" class="no-drag" src="${pageContext.request.contextPath}/assets/img/bujang-logo%20blue.png"></a>
        </div>
        
        <div id="vote-countdown-box" class="no-drag">
	        <div id="countdown-voting-group" class="justify-content-center align-items-center align-content-center">
	        	<span class="d-inline-block only-bold">${voteInfo.groupName}</span>
	        	<span class="d-inline-block">&nbsp;점심 투표</span>
	        </div>
	        
	        <div id="vote-countdown-times">
	            <div class="d-xxl-flex justify-content-center align-items-center  align-content-center justify-content-xxl-center align-items-xxl-center" id="vote-countdown-end-time">
	            	<span class="countdown-label">종료 시각</span>
	            	<span class="countdown-time">
	            		<fmt:formatDate value="${voteInfo.voteEndTime}" pattern="HH"/>시 
	            		<fmt:formatDate value="${voteInfo.voteEndTime}" pattern="mm"/>분
	            	</span>
	            </div>
	            <div class="d-xxl-flex justify-content-center align-items-center align-content-center justify-content-xxl-center align-items-xxl-center" id="vote-countdown-remain-time">
	            	<span class="countdown-label">남은 시간</span>
	            	<span id="countdown-time" class="countdown-time"></span>
	            </div>
	        </div>
	    </div>
	    
	    <div id="vote-select-name-area">
	        <div id="label-select-name"><span class="no-drag">이름을 선택해주세요</span></div>
	        <div id="vote-select-names" class="d-flex d-xxl-flex flex-wrap justify-content-xxl-start">
	        	<!--  투표 인원 영역  -->
	        	<c:forEach items="${voteMember}" var="member">
	        		<c:if test="${!empty(authUser)}">
	        			<c:if test="${!empty(member.userNo) and authUser.userNo == member.userNo}">
	        				<button class="btn btn-primary text-center vote-select-name-btn vote-selected-name" type="button" data-vote-member-no="${member.voteMemberNo}" data-user-no="${data-user-no}">${member.userName}</button>
	        			</c:if>
	        		</c:if>
	        		<button class="btn btn-primary text-center vote-select-name-btn" type="button">${member.userName}</button>
	        	</c:forEach>
	        	<button class="btn btn-primary disabled text-center vote-voted-name" type="button" disabled="disabled">이지희</button>
	        	
	        	<button class="btn btn-primary disabled text-center vote-voted-name" type="button" disabled="disabled">최정필2</button>
	        	<button class="btn btn-primary text-center vote-select-name-btn" type="button">뻐꾸기</button>
	        	<button class="btn btn-primary text-center vote-select-name-btn" type="button">도요새</button>
	        </div>
	    </div>
	    
	    <div style="width: 100%;">
	        <div class="text-start d-flex basket-aside-title"><span class="d-inline-block no-drag">오늘의 점심 후보</span></div>
	        
	        <div class="table-responsive no-drag" id="basket-table">
	            <table class="table no-drag" id="basket-table">
	            	<!--  투표 가게 목록 올 곳 -->
	            	<c:set var="voteCnt" value="0" />
	            	<c:forEach items="${voteBasket}" var="store">
	            		<c:set var="voteCnt" value="${voteCnt+1}" />
	            		<c:if test="${userState == 1}">
	            			<tr class="vote-table-row" data-vote-cnt="${voteCnt}">
                        		<td class="d-xxl-flex justify-content-xxl-start basket-table-cell">
                            		<div class="basket-table-store-info">
                            			<span class="text-start basket-table-store-name">${store.storeName}</span>
                            			<span class="text-start basket-table-store-detail">${store.menu2ndCateName}&nbsp;/&nbsp;${store.distance}m</span>
                            		</div>
                        		</td>
                        		<td class="basket-vote-btn-cell">
                        			<button class="btn btn-primary vote-vote-btn align-items-center" type="button">투표하기</button>
                        		</td>
                    		</tr>
	            		</c:if>
	            		
	            		<c:if test="${userState > 1}">
	            		</c:if>
	            	</c:forEach>

	            </table>
	        </div>
	      
	      	<c:if test="${authUser.userNo == voteInfo.voteMadeUser}">
		        <div id="vote-leader-btn-area" class="d-xxl-flex justify-content-center align-items-center">
		        	<button id="vote-leader-modify-btn" class="btn btn-danger d-flex d-xxl-flex justify-content-center align-items-center align-content-center" type="button">투표 수정하기</button>
		        	<button id="vote-leader-cancel-btn" class="btn btn-danger d-flex d-xxl-flex justify-content-center align-items-center align-content-center" type="button" data-bs-target="#vote-link-modal" data-bs-toggle="modal">투표 취소하기</button>
		        </div>
	        </c:if>
	        
	        <c:if test="${!empty(authUser) and authUser.userNo != voteInfo.voteMadeUser}">
		        <div id="vote-member-btn-area" class="justify-content-center align-items-center">
		        	<button id="vote-member-escape-btn" class="btn btn-danger d-flex d-xxl-flex justify-content-center align-items-center align-content-center justify-content-xxl-center align-items-xxl-start" type="button">다른 사람들이랑 먹을래요</button>
		        </div>
	        </c:if>
	    </div>
	</div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script type="text/javascript">
	let voteEndTime = "${voteInfo.voteEndTime}";
	let clientIp;
	
	
	$(document).ready(
		async function(){
			voteEndTime = changeTimeFormat(voteEndTime)
			countDownTimer(voteEndTime)

			clientIp = await getIpClient()
			
	})


	// 클라이언트 ip 불러오기
	async function getIpClient() {
	  try {
	    const response = await axios.get('https://api.ipify.org?format=json');
	    console.log("clientIp: " + response["data"]["ip"]);
	    
	    return response["data"]["ip"]
	    
	  } catch (error) {
	    console.error(error);
	  }
	}
	
	
	// 카운트 다운 만들기
	const countDownTimer = function(voteEndTime) {
		var second = 1000;
		var minute = second * 60
		var hour = minute * 60
		var day = hour * 24
		var timer
		
		function showRemaining() {
			var now = new Date();
			var distDt = voteEndTime - now

			if (distDt < 0) {
				clearInterval(timer);
				$("#countdown-time").text("00:00:00")
				
				return
			}

			var hours = Math.floor((distDt % day) / hour)
			var minutes = Math.floor((distDt % hour) / minute)
			var seconds = Math.floor((distDt % minute) / second)

			$("#countdown-time").text(lpad(hours, 2, "0") + ":" + lpad(minutes, 2, "0") + ":" + lpad(seconds, 2, "0"))
		}

		timer = setInterval(showRemaining, 1000)
	}

	
	
	
	// 자바 시간 자바스크립트로 변환
	function changeTimeFormat(time) {
		var timeSplit = time.split(" ")
		var newTime = new Date(timeSplit[1] + " " + timeSplit[2] + ", " + timeSplit[5] + " " + timeSplit[3])
		console.log(newTime)
		
		return newTime
	}
	
	// 두자리수 변환
	function lpad(str, padLen, padStr) {
	    if (padStr.length > padLen) {
	        return str
	    }
	    str += ""
	    padStr += ""
	    
	    while (str.length < padLen) {
	        str = padStr + str
	    }
	    str = str.length >= padLen ? str.substring(0, padLen) : str
	    		
	    return str
	}
</script>

</body>

</html>