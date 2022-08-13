<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title></title>
</head>


<body>
<nav id="basket-aside" class="navbar navbar-light bg-white text-center d-xxl-flex align-items-start justify-content-xxl-center sidebar accordion p-0">
    <div class="container-fluid d-flex flex-column p-0">
        <div id="bujang-logo-wrap">
        	<a href=""><img data-bss-hover-animate="pulse" id="bujang-logo-blue" class="no-drag" src="assets/img/bujang-logo%20blue.png"></a>
        </div>
        
        <div id="comment-box">
        	<span id="eat-what" class="d-inline-block">오늘 점심 뭐 먹지?</span>
        	<span id="prefer-data" class="d-inline-block">
        	<!--  
        		<span class="d-inline-block emphasize-blue">막냉이</span>
        		<span class="d-inline-block">님은 패스트푸드를 좋아하시니까!</span>
        	-->
        		<span class="d-inline-block">오늘도 점심은 부장님요기요</span>
        	</span>
        </div>
        
        <c:if test="${empty(authUser)}">
         <div id="basket-aside-login-area">
         	<span class="d-inline-block" id="login-jebal">로그인을 하면 취향에 맞는 식당을 추천해드려요</span>
         	<a href="${pageContext.request.contextPath}/login"><span class="d-inline-block" id="basket-login-btn">로그인하기</span></a>
         
             <div id="basket-login-controll">
             	<a href="${pageContext.request.contextPath}/join"><span class="d-inline-block" id="basket-join-link">회원가입</span></a>
             	<a><span class="d-inline-block" id="basket-findpw-link">비밀번호 찾기</span></a>
             </div>
         </div>
        </c:if>
        
        <div id="basket-aside-content" class="full-box">
        	<c:if test="${!empty(authUser)}">
             <div class="text-start d-flex basket-aside-title" id="basket-title-group">
             	<span class="d-inline-block">나의 그룹</span>
             </div>
             
             <div class="d-flex" id="basket-groups">
             	<!--  회원이 속한 그룹이 올 자리  -->
             </div>
            </c:if>
            
            <div class="text-start d-flex basket-aside-title" id="basket-title-lunch-candidates">
            	<span class="d-inline-block">오늘의 점심 후보</span>
            </div>
            
            <div class="table-responsive" id="basket-table">
                <table class="table" id="basket-table-table">
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <td id="basket-table-button-area" colspan="2">
                            	<i class="fas fa-filter" id="basket-filter-btn"></i>
                            	<button class="btn btn-primary d-inline-block" id="basket-another-stores-btn" type="button">다른 가게 추천 받기</button>
                            </td>
                        </tr>
                        <tr class="basket-table-row" data-storeNo="2881">
                            <td class="d-xxl-flex justify-content-xxl-start basket-table-cell">
                                <div class="basket-table-store-info">
                                	<span class="text-start basket-table-store-name">써브웨이 서울대점</span>
                                	<span class="text-start basket-table-store-detail">샌드위치 / 251m</span>
                                </div>
                            </td>
                            <td class="basket-table-del-cell">
                            	<i class="fas fa-minus-circle d-xxl-flex basket-del-btn"></i>
                            </td>
                        </tr>
                        <tr class="basket-table-row" data-storeNo="1857">
                            <td class="d-xxl-flex justify-content-xxl-start basket-table-cell">
                                <div class="basket-table-store-info">
                                	<span class="text-start basket-table-store-name">맥도날드 신림점</span>
                                	<span class="text-start basket-table-store-detail">햄버거 / 320m</span>
                                </div>
                            </td>
                            <td class="basket-table-del-cell">
                            	<i class="fas fa-minus-circle d-xxl-flex basket-del-btn"></i>
                            </td>
                        </tr>
                        <tr class="basket-table-row" data-storeNo="2247">
                            <td class="d-xxl-flex justify-content-xxl-start basket-table-cell">
                                <div class="basket-table-store-info">
                                	<span class="text-start basket-table-store-name">양자강</span>
                                	<span class="text-start basket-table-store-detail">중국요리 / 520m</span>
                                </div>
                            </td>
                            <td class="basket-table-del-cell">
                            	<i class="fas fa-minus-circle d-xxl-flex basket-del-btn"></i>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <div id="basket-button-area">
            	<button class="btn btn-primary" id="basket-vote-btn" type="button">투표하기</button>
            	<button class="btn btn-primary" id="basket-random-btn" type="button">랜덤선택</button>
            </div>
        </div>
    </div>
</nav>

<div class="modal fade row-cols-md-6 md" role="dialog" tabindex="-1" id="modal-recFilter">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header text-primary modal-header-custom">
            	<span>제외하고 싶은 음식은 체크를 해제해주세요&nbsp;<i class="fas fa-check"></i></span>
            	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <div class="modal-body text-center text-dark" style="font-size: 14px;">
                <div class="row">
                    <div class="col" style="border-right: 1px solid voar(--bs-gray-200);">
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-1"><label class="form-check-label" for="formCheck-1">뷔페</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-2"><label class="form-check-label" for="formCheck-2">아시아음식</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-3"><label class="form-check-label" for="formCheck-3">양식</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-4"><label class="form-check-label" for="formCheck-4">일식</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-5"><label class="form-check-label" for="formCheck-5">한식</label></div>
                    </div>
                    <div class="col" style="border-right: 1px solid voar(--bs-gray-200);">
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-6"><label class="form-check-label" for="formCheck-6">패스트푸드</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-7"><label class="form-check-label" for="formCheck-7">패밀리레스토랑</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-8"><label class="form-check-label" for="formCheck-8">치킨</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-9"><label class="form-check-label" for="formCheck-9">분식</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-10"><label class="form-check-label" for="formCheck-10">중식</label></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer modal-footer-custom">
            	<button id="modal-filter-submit" class="btn btn-primary" type="button">저장</button>
            	<button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<!--<c:import url="/WEB-INF/views/includes/storeInfo.jsp" />-->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e74b599be710b798192fd5221284718a&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script type="text/javascript">
	const userNo = "${authUser.userNo}"
	let basket = ""
	let basket_group = []
	let curr_basket_group = 0
	
	let filter_excluded = "${filter_excluded}"
		
	let gpsVo = {
			gpsX : "${curr_location.gpsX}",
			gpsY : "${curr_location.gpsY}",
			address : "${curr_location.address}"
		}
			
	
	// 페이지 로드 시
	$(document).ready(
		async function(){
			await callGPS()
			await callFilter()		
			await callUser()
	})

	
	// 장바구니 클릭 시 모달 팝업
	//$("#basket-table").on("click", ".basket-table-store-name", function(){
	//	var storeNo = $(this).closest(".basket-table-row").attr("data-storeNo")
	//	console.log(storeNo)
		
	//	$("#modal-store").modal("show")
	//})
	
	
	// 다른 그룹 클릭
	$("#basket-groups").on("click", ".basket-normal-group", function(){
		if (curr_basket_group != $(this).attr("data-groupNo")) {
			$("[data-groupNo=" + curr_basket_group + "]").removeClass("basket-selected-group")
			$(this).addClass("basket-selected-group")
			
			curr_basket_group = $(this).attr("data-groupNo")
			
			// 장바구니 교체 작업
		}
	})	
	
	
	// 그룹 추가 버튼 클릭
	$("#basket-groups").on("click", ".basket-group-add", function(){
		location.replace("${pageContext.request.contextPath}/group/add")
	})
	
	
	// 장바구니 필터 클릭 시
	$("#basket-filter-btn").on("click", function(){
		for (var i = 1; i <= 10; i++) {
			var curr = "#formCheck-" + String(i)
			
			if (filter_excluded.includes(i)) {
				$(curr).prop("checked", false)
			} else {
				$(curr).prop("checked", true)
			}
		}
		$("#modal-recFilter").modal("show")
	})
	
	
	// 장바구니 필터 적용
	$("#modal-filter-submit").on("click", function(){
		filter_excluded = []
		
		for (var i = 1; i <= 10; i++) {
			var curr = "#formCheck-" + String(i)
			
			if (!$(curr).is(":checked")) {
				filter_excluded.push(i)
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/basket/saveFilterSession",		
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(filter_excluded),
				dataType : "json",
				success : function(result){
					if (result) {
						console.log("필터 세션 저장 성공")
					} else {
						console.log("필터 세션 저장 실패")
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			})
		}
		console.log("필터 제외 항목 " + filter_excluded)
		
		$("#modal-recFilter").modal("hide")
	})
	
	
	async function sleep(ms) {
		let start = Date.now(), now = start
	    while (now - start < ms) {
	        now = Date.now()
	    }
	}
	
	
	// 페이지 로딩 초기 gps 확인 함수
	async function callGPS() {
		sleep(500)
		console.log(gpsVo.gpsX)
		console.log(gpsVo.gpsY)
		
		if (gpsVo.gpsX == "" || gpsVo.gpsX == 0.0) {
			// geolocation으로 현재 좌표 알아내기
			await curr_location()
						
			// 세션에 현재 gps 저장
			await setGPS(gpsVo)
		} 
		
		console.log(gpsVo)
		console.log("callGPS() 종료")
	} 
	
	
	// 현재 위치 저장 함수
	async function curr_location() {
		document.cookie="safeCookie1=foo; SameSite=Lax";
		document.cookie="safeCookie2=foo";
		document.cookie="crossCookie=bar; SameSite=None; Secure";
		
		var options = {enableHighAccuracy: true}
		
		let getPosition = async function(options) {
			return new Promise(function (resolve, reject) {
				navigator.geolocation.getCurrentPosition(resolve, reject, options)
			})
		}
		
		await getPosition()
			.then((position) => {
				console.log("geolocation")
		    	var gpsX = position.coords.longitude
		    	var gpsY = position.coords.latitude
		    	gpsVo.gpsX = parseFloat(gpsX)
		    	gpsVo.gpsY = parseFloat(gpsY)
			})
			.catch((error) => {
				alert("GPS 사용을 허용해주세요")
			})
				
		console.log(gpsVo.gpsX)
		console.log(gpsVo.gpsY)
		
		// 카카오 API로 주소 알아내기
	    await getAddr(gpsVo.gpsY, gpsVo.gpsX)
				
		console.log("curr_location() 종료")
	}
	
	
	// 좌표 > 주소 변환 api
	async function getAddr(lat, lng) {
		console.log("getAddr() 시작")
		let geocoder = new kakao.maps.services.Geocoder()
		
		let addressSearch = (lat, lng) => {
			return new Promise((resolve, reject) => {
				geocoder.coord2Address(lng, lat, (result, status) => {
					if (status === kakao.maps.services.Status.OK) {
						gpsVo.address = result[0].address.address_name
						console.log(gpsVo.address)
											
						if (!$('#modal-location-change').is(':visible')) {
							$("#curr-location-address").text(result[0].address.address_name)
						} else {
							$("#modal-curr-location").text(result[0].address.address_name)
						}
						resolve(result[0].address.address_name)
					} else {
						reject('geocoder error')
					}
				})
			})
		}	
		
		await addressSearch(lat, lng)
	}
	
	
	// gps 세션 값 저장하기
	async function setGPS(gpsVo) {		
		$.ajax({
			url : "${pageContext.request.contextPath}/basket/setGPS",		
			type : "post",
			contentType : "application/json",
			async : false,
			data : JSON.stringify(gpsVo),
			dataType : "json",
			success : function(result){
				if (result) {
					console.log("gps 저장")
				} else {
					console.log("gps 저장 실패")
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		})
		console.log("setGPS() 종료")
	}
	

	// 필터 확인 함수
	async function callFilter() {
		if (filter_excluded == "") {
			await makeFilterSession()
						
		} else {
			var temp1 = "${filter_excluded}"
			var temp2 = temp1.substring(1, temp1.length-1)
			filter_excluded = temp2.split(",")	
			
			for (var i = 0; i < filter_excluded.length; i++) {
				filter_excluded[i] = parseInt(filter_excluded[i])
			}
		}
		console.log("필터 제외 항목 " + filter_excluded)
		console.log("callFilter() 끝")
	}
	
	
	// 필터 세션 생성
	async function makeFilterSession() {
		$.ajax({
			url : "${pageContext.request.contextPath}/basket/makeFilterSession",		
			type : "post",
			async : false,
			contentType : "application/json",
			dataType : "json",
			success : function(result){
				if (result) {
					filter_excluded = []
					console.log("필터 세션 생성 성공")
				} else {
					console.log("필터 세션 생성 실패")
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		})
		console.log("makeFilterSession() 끝")
	}
	
	
	// 페이지 로딩 초기 사용자 확인 + 장바구니 확인
	async function callUser() {
		console.log("callUser() 시작")
		
		if (userNo == "") {
			console.log("비로그인 회원")
			
			basket = "${basket}"
			console.log("basket " + basket)
			
			if (basket == "") {				
				await makeGuestBasket()
			}
			
		} else {
			console.log(userNo + "번 회원")
			await getBasketGroups()
		}
		
		console.log("callUser() 끝")
	}
	
	
	// 비회원 장바구니 생성
	async function makeGuestBasket() {
		$.ajax({
			url : "${pageContext.request.contextPath}/basket/guestMakeBasket",		
			type : "post",
			async: false,
			contentType : "application/json",
			dataType : "json",
			success : function(){
				console.log("여기까진 왔다")
				//if (result[0].length != 0) {
				//	basket = result[0]
				//	console.log("장바구니 생성 완료")
				//} else {
				//	console.log("장바구니 생성 실패")
				//}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		})
		console.log("makeGuestBasket() 끝")
	}
	
	
	
	// 장바구니 그룹 목록 불러오기
	async function getBasketGroups() {
		$.ajax({
			url : "${pageContext.request.contextPath}/basket/getBasketGroup",		
			type : "post",
			async : false,
			contentType : "application/json",
			data : JSON.stringify(userNo),
			dataType : "json",
			success : function(basketGroup){
				for (var i = 0; i < basketGroup.length; i++) {
					addBasketGroup(basketGroup[i])
					basket_group.push(basketGroup[i].groupNo)
					
					if (i == 0) {
						curr_basket_group = basketGroup[i].groupNo
						$(".basket-group").addClass("basket-selected-group")
					}
				}
				
				console.log("나의 그룹 " +  basket_group)
				
				if (basketGroup.length < 4) {
					$("#basket-groups").append(
						"<div class=\"basket-group no-drag basket-group-add\"><span>그룹추가</span><i class=\"fas fa-user-plus\"></i></div>"
					)
					console.log("그룹 추가하기 추가")
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		})
		console.log("getBasketGroups() 끝")
	}
	
	// 장바구니 그룹 탭 생성 메소드
	function addBasketGroup(basketGroup) {
		$("#basket-groups").append(
			"<div class=\"basket-group basket-normal-group no-drag\" data-groupNo=\"" + basketGroup.groupNo + "\"><span>" + basketGroup.groupName + "</span><i class=\"fas fa-user-circle\"></i></div>"
		)
		console.log("그룹 탭 추가")
	}
	
	
	// 점심후보를 추가해주세요 추가 메소드
	function basketNoItem() {
		$("#basket-tabke-table").append(
			"<tr><td id=\"basket-no-items\" colspan=\"2\">점심 후보를 추가해주세요</td></tr>"
		)
		
		$("#basket-button-area").remove()
	}
	
	
	// 장바구니 추가하기 메소드
	function addToBasket(store) {
		console.log("장바구니에 추가")
	}
	
	
	// 장바구니에서 삭제하기 메소드
	function deleteFromBasket(store) {
		
	}
	

</script>

</body>

</html>