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
             	<a href="${pageContext.request.contextPath}/findPW"><span class="d-inline-block" id="basket-findpw-link">비밀번호 찾기</span></a>
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
	                <tr>
	                    <td id="basket-table-button-area" colspan="2">
	                    	<i class="fas fa-filter" id="basket-filter-btn"></i>
	                    	<button class="btn btn-primary d-inline-block" id="basket-another-stores-btn" type="button">다른 가게 추천 받기</button>
	                    </td>
	                </tr>
	                <!--  장바구니 아이템이 올 자리 -->
	                <c:if test="${!empty(basket)}">
		                <c:forEach var="basketItems" items="${basket}">
		                	<c:if test="${basketItems.key == curr_basket_group}">
		                		<c:set var="basketCnt" value="0" />
		                		<c:set var="stores" value="${basketItems.value}" />
		                		
		                		<c:forEach var="store" items="${stores}">
		                			<c:if test="${store.stored}">
		                				<c:set var="basketCnt" value="${basketCnt + 1}" />
		                				
				                		<tr class="basket-table-row" data-storeNo="${store.storeNo}">
				                			<td class="d-xxl-flex justify-content-xxl-start basket-table-cell">
				                				<div class="basket-table-store-info">
				                					<span class="text-start basket-table-store-name">${store.storeName}</span>
				                					<span class="text-start basket-table-store-detail">${store.menu2ndCateName}&nbsp;/&nbsp;${store.distance}m</span>
				                				</div>
				                			</td>
				                			<td class="basket-table-del-cell"><i class="fas fa-minus-circle d-xxl-flex basket-del-btn"></i></td>
				                		</tr>
				                		
			                		</c:if>
			                	</c:forEach>
			                	
			                	<c:if test="${basketCnt == 0}">
			                		<tr id="no-basket-items">
                                		<td id="basket-no-items" class="no-drag" colspan="2">점심 후보를 추가해주세요</td>
                            		</tr>
			                	</c:if>
			                </c:if>
		                </c:forEach>
	                </c:if>
                </table>
            </div>
            

            <div id="basket-button-area">
            	<c:if test="${!empty(authUser)}">
            		<button class="btn btn-primary" id="basket-vote-btn" type="button">투표하기</button>
            	</c:if>
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
                <div class="text-start" id="modal-recFilter-btn-area">
                	<button class="btn btn-primary" id="modal-recFilter-addAll" type="button">전체선택</button>
                	<button class="btn btn-primary" id="modal-recFilter-delAll" type="button">전체해제</button>
                </div>
            
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
            <div class="modal-footer justify-content-center modal-footer-custom">
            	<button id="modal-filter-submit" class="btn btn-primary" type="button">저장</button>
            	<button id="modal-filter-dismiss" class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<!--<c:import url="/WEB-INF/views/includes/storeInfo.jsp" />-->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e74b599be710b798192fd5221284718a&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script type="text/javascript">
	
	// ----------------- 님들이 쓸만한 함수 --------------------------------------
	// 장바구니에서 항목 삭제할 때 : deleteSessionBasketGroup(deleteStoreNo)
	// 장바구니에 항목 추가할 때: addItemToBasket(storeNo)
	
	let indexJSP = false
	
	const userNo = "${authUser.userNo}"
	let basket = "${basket}"
		
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
			
			if (indexJSP) {
				// 지도 로딩
			}
	})

	
	// 장바구니 클릭 시 모달 팝업
	//$("#basket-table").on("click", ".basket-table-store-name", function(){
	//	var storeNo = $(this).closest(".basket-table-row").attr("data-storeNo")
	//	console.log(storeNo)
		
	//	$("#modal-store").modal("show")
	//})
		
	
	// 페이지 로딩 초기 gps 확인 함수
	async function callGPS() {
		sleep(300)
		console.log(gpsVo.gpsX)
		console.log(gpsVo.gpsY)
		
		if (gpsVo.gpsX == "" || gpsVo.gpsX == 0.0) {
			// geolocation으로 현재 좌표 알아내기
			await curr_location()
						
			// 세션에 현재 gps 저장
			await setGPS(gpsVo)
		} else {
			gpsVo.gpsX = parseFloat(gpsVo.gpsX)
			gpsVo.gpsY = parseFloat(gpsVo.gpsY)
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
			data : JSON.stringify(gpsVo),
			dataType : "json",
			async : false,
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
			contentType : "application/json",
			async : false,
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
	
	
	// 필터 전체 선택 클릭 시
	$("#modal-recFilter-addAll").on("click", function() {
		for (var i = 1; i <= 10; i++) {
			var curr = "#formCheck-" + String(i)
			$(curr).prop("checked", true)
		}
	})
	
	
	// 필터 전체 제외 클릭 시
	$("#modal-recFilter-delAll").on("click", function() {
		for (var i = 1; i <= 10; i++) {
			var curr = "#formCheck-" + String(i)
			$(curr).prop("checked", false)
		}
	})
	
	
	// 장바구니 필터 적용
	$("#modal-filter-submit").on("click", function() {
		let temp_filter = filter_excluded
		filter_excluded = []
				
		for (var i = 1; i <= 10; i++) {
			var curr = "#formCheck-" + String(i)
			
			if (!$(curr).is(":checked")) {
				filter_excluded.push(i)
			}
		}
			
		if (filter_excluded.length == 10) {
			alert("적어도 하나의 카테고리를 선택해야 합니다")
			filter_excluded = temp_filter
				
			return false
		}		
								
		$.ajax({
			url : "${pageContext.request.contextPath}/basket/saveFilterSession",		
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(filter_excluded),
			async : false,
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

		console.log("필터 제외 항목 " + filter_excluded)
		
		$("#modal-recFilter").modal("hide")
	})
	
		
	// 페이지 로딩 초기 사용자 확인 + 장바구니 확인
	async function callUser() {
		console.log("callUser() 시작")
		
		if (userNo == "") {
			console.log("비로그인 회원")
			
			if ("${curr_basket_group}" == ""){
				await setSessionBasketGroup()
			}
			
			if (basket == "") {				
				await makeGuestBasket()
				
			} else {
				await loadBasket()
			}
			
		} else {
			console.log(userNo + "번 회원")
			
			if ("${curr_basket_group}" != "" && "${curr_basket_group}" != "0") {
				curr_basket_group = parseInt("${curr_basket_group}")
		
			} 
			await getBasketGroups()
			
			console.log("장바구니 그룹: " + curr_basket_group)
						
			if (basket == "") {
				await makeGroupBasket()
				
			} else {
				await loadBasket()
			}
		}
		
		console.log(basket)
		console.log("callUser() 끝")
	}
	
	
	// 비회원 장바구니 생성
	async function makeGuestBasket() {
		$.ajax({
			url : "${pageContext.request.contextPath}/basket/guestMakeBasket",		
			type : "post",
			contentType : "application/json",
			async : false,
			dataType : "json",
			success : function(result){	
				basket = result
				console.log(basket)
				
				if (result[0].length != 0) {							
					for (var i = 0; i < 3; i++) {
						addToBasket(basket[0][i])
					}
					console.log("장바구니 생성 완료")
					
				} else {
					alert("현재 위치에서 추천 가능한 가게가 없습니다.")
					
					noStore()
					basketNoItem()					
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		})
		console.log("makeGuestBasket() 끝")
	}
	
	
	// 회원 장바구니 생성
	async function makeGroupBasket() {
		$.ajax({
			url : "${pageContext.request.contextPath}/basket/groupMakeBasket",		
			type : "post",
			contentType : "application/json",
			async : false,
			data : JSON.stringify(basket_group),
			dataType : "json",
			success : function(result){	
				basket = result
				console.log(basket)
				
				if (result[curr_basket_group].length != 0) {							
					for (var i = 0; i < 3; i++) {
						addToBasket(basket[curr_basket_group][i])
					}
					console.log("장바구니 생성 완료")
					
				} else {
					alert("현재 위치에서 추천 가능한 가게가 없습니다.")
					
					noStore()
					basketNoItem()					
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		})
		console.log("makeGuestBasket() 끝")
	}
	
	
	// 세션에 현재 선택된 장바구니 그룹 저장
	async function setSessionBasketGroup() {
		var data_group = {"curr_basket_group": curr_basket_group}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/basket/setSessionBasketGroup",		
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data_group),
			dataType : "json",
			async : false,
			success : function(result){				
				if (result) {
					console.log("현재 그룹: " + curr_basket_group + " - 세션 저장 완료")
					
				} else {
					console.log("현재 그룹 세션 저장 실패")
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		})
		
		console.log("setSessionBasketGroup() 끝")
	}
	
	
	// 장바구니 불러오기
	async function loadBasket() {
		$.ajax({
			url : "${pageContext.request.contextPath}/basket/loadBasket",		
			type : "post",
			async : false,
			success : function(result){				
				basket = result
				
				console.log("장바구니를 불러왔습니다")
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		})
		
		console.log("loadBasket() 끝")
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
			success : async function(basketGroup){
				for (var i = 0; i < basketGroup.length; i++) {
					addBasketGroup(basketGroup[i])
					basket_group.push(basketGroup[i].groupNo)
					
					if (curr_basket_group == 0) {
						if (i == 0) {
							curr_basket_group = basketGroup[i].groupNo
						}
					} 
				}
				
				console.log(curr_basket_group)
				if ("${curr_basket_group}" != String(curr_basket_group)) {
					await setSessionBasketGroup()
				}
				
				$("[data-groupNo=" + String(curr_basket_group) + "]").addClass("basket-selected-group")
				
				if (basketGroup.length < 4) {
					$("#basket-groups").append(
						"<div class='basket-group no-drag basket-group-add'><span>그룹추가</span><i class='fas fa-user-plus'></i></div>"
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
	
	
	// 다른 그룹 클릭
	$("#basket-groups").on("click", ".basket-normal-group", async function(){
		if (String(curr_basket_group) != $(this).attr("data-groupNo")) {
			$("[data-groupNo=" + String(curr_basket_group) + "]").removeClass("basket-selected-group")
			$(this).addClass("basket-selected-group")
			
			curr_basket_group = parseInt($(this).attr("data-groupNo"))
			console.log("현재 장바구니 그룹: " + curr_basket_group)
			
			await setSessionBasketGroup()
			
			// 장바구니 교체 작업
			await changeGroupBasket()
		}
	})	
	
	
	// 그룹 추가 버튼 클릭
	$("#basket-groups").on("click", ".basket-group-add", function(){
		location.replace("${pageContext.request.contextPath}/group/add")
	})
	
	
	// 장바구니 그룹 탭 생성 메소드
	function addBasketGroup(basketGroup) {
		$("#basket-groups").append(
			"<div class='basket-group basket-normal-group no-drag' data-groupNo='" + basketGroup.groupNo + "'><span>" + basketGroup.groupName + "</span><i class='fas fa-user-circle'></i></div>"
		)
		console.log("그룹 탭 추가")
	}
	
		
	// 장바구니 추가하기 메소드
	function addToBasket(store) {
		$("#basket-table-table").append(
			  "<tr class='basket-table-row' data-storeNo='" + store.storeNo + "'>"
            + 	"<td class='d-xxl-flex justify-content-xxl-start basket-table-cell'>"                    
            + 		"<div class='basket-table-store-info'><span class='text-start basket-table-store-name'>" + store.storeName + "</span><span class='text-start basket-table-store-detail'>" + store.menu2ndCateName + " / " + store.distance + "m</span></div>"                        
            + 	"</td>"                    
            + 	"<td class='basket-table-del-cell'><i class='fas fa-minus-circle d-xxl-flex basket-del-btn'></i></td>"                    
            + "</tr>"
		)
	}
	
	
	// 다른 가게 추천받기 버튼 클릭
	$("#basket-another-stores-btn").on("click", async function(){
		if (basket[curr_basket_group].length >= 15) {
			alert("가게 추천은 15개까지만 가능합니다")
			return
		}

		console.log(typeof(basket))
		console.log(basket[0])
		
		if (curr_basket_group == 0) {
			await guestAddStore()
			
		} else {
			
		}
		
		// 지도 핀 처리
	})
	
	
	// 그룹 없을 때 장바구니 추가 가게 선택
	async function guestAddStore() {	
		var temp = basket[0].length
		
		$.ajax({
			url : "${pageContext.request.contextPath}/basket/guestAddStore",		
			type : "post",
			async : false,
			success : function(result){				
				basket = result
				
				if (basket[0].length > temp) {
					console.log("가게가 추가되었습니다")
					console.log(basket[curr_basket_group])
				} else {
					alert("현재 위치, 필터를 적용할 때 추천 가능한 가게가 없습니다.")
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		})
		
		console.log("guestAddStore() 끝")
	}
	
	
	// 장바구니 삭제 버튼 클릭 시
	$("#basket-table").on("click", ".basket-del-btn", async function(){
		var deleteStoreNo = parseInt($(this).closest(".basket-table-row").attr("data-storeNo"))
		console.log(deleteStoreNo)
		
		await deleteSessionBasketGroup(deleteStoreNo)
	})
	
	
	// 장바구니 항목 삭제
	async function deleteSessionBasketGroup(deleteStoreNo) {
		var delete_obj = {"storeNo": deleteStoreNo}

		$.ajax({
			url : "${pageContext.request.contextPath}/basket/deleteFromBasket",		
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(delete_obj),
			dataType : "json",
			async : false,
			success : function(result){				
				basket = result
				
				console.log("장바구니에서 항목이 삭제되었습니다")
				console.log(basket[curr_basket_group])
				
				$("[data-storeNo=" + deleteStoreNo + "]").remove()
				
				var cnt = 0
				for (var i = 0; i < basket[curr_basket_group].length; i++) {
					if (basket[curr_basket_group][i].stored) {
						cnt += 1
					}
				}

				if (cnt == 0) {
					basketNoItem()
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
			
		})
		
		console.log("deleteFromBasket() 끝")
	}
	
	
	// 점심후보를 추가해주세요 추가 메소드
	function basketNoItem() {
		$("#basket-table-table").append(
			"<tr id='no-basket-items'><td id='basket-no-items' class='no-drag' colspan='2'>점심 후보를 추가해주세요</td></tr>"
		)
		
		console.log("basketNoItem() 끝")
	}
	
	
	// 주변에 가게가 하나도 없을 때 창
	function noStore() {
		$("#container").append(
			  "<div class='d-inline-flex justify-content-center align-items-center' id='no-store'>"
            + 	"<div>"
            +   	"<span class='d-block justify-content-center' id='no-store-alert-1'>주변에 추천 가능한 가게가 없어요</span>"
            +       "<span class='d-flex justify-content-center' id='no-store-alert-2'>현재 위치나 필터를 확인해주세요</span>"
            +   "</div>"
            + "</div>"
		)
	}
	
	
	// 장바구니에 항목 추가하기
	function addItemToBasket(storeNo) {
		// 만약 이미 가게 3개 이상 추가되었으면 alert
		
		var add_obj = {"storeNo": storeNo}

		$.ajax({
			url : "${pageContext.request.contextPath}/basket/addToBasket",		
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(add_obj),
			dataType : "json",
			async : false,
			success : function(result){				
				basket = result
				$("#no-basket-items").remove()
				
				console.log("장바구니에 항목이 추가되었습니다")
				console.log(basket[curr_basket_group])
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		})
		
		console.log("addItemsToBasket() 끝")
	}
	
	
	// 다른 그룹 장바구니로 변경
	async function changeGroupBasket() {
		$(".basket-table-row").remove()
		
		var cnt = 0
		for (var i = 0; i < basket[curr_basket_group].length; i++) {
			if (basket[curr_basket_group][i].stored) {
				cnt += 1
				addToBasket(basket[curr_basket_group][i])
			}
		}
		
		$("#no-basket-items").remove()
		if (cnt == 0) {
			basketNoItem()
		}
		
	}
	
	
	// sleep
	async function sleep(ms) {
		let start = Date.now(), now = start
	    while (now - start < ms) {
	        now = Date.now()
	    }
	}
	
	
</script>

</body>

</html>