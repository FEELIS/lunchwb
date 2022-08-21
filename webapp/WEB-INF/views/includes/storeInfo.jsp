<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 가게 정보 보기 -->
<div id="modal-store" class="modal visible no-drag modal-stores" role="dialog" tabindex="-1" style="min-width: 800px;">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content" style="width: 798px;">
            <div class="modal-header"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body">
                <div class="fs-4 fw-bold text-dark modal-store-title">
                	<span class="d-inline-block modalStoreName"></span>
               		<span class="fs-6 text-secondary d-inline-block store-cate modalStoreCate"></span>
                    <div class="dropdown d-inline-block"><button class="btn btn-sm dropdown-toggle fs-6 fw-bold text-start text-secondary" aria-expanded="false" data-bs-toggle="dropdown" type="button">영업시간</button>
                        <div class="dropdown-menu">
                        	<div class="modalStoreOpening"></div>
                        	<div class="modalStoreBreak"></div>
                        </div>
                    </div>
                </div>
                <div class="store-info">
                    <div class="d-inline-block store-info-left">
                        <div><span class="modalStoreAddress"></span><span class="fw-bold text-primary modalStoreDistance"></span></div>
                        <div><span class="fw-bold text-primary modalStoreVisitCnt"></span><span> / 40대 그룹 선호 가게 "여기 해야함"</span></div>
                    </div>
                    <div class="text-end d-inline-block store-info-right">
                        <div><span>별점</span><span class="fw-bold text-primary modalStoreScore"></span></div>
                        <div>
                        	<span class="fw-bold text-warning modalStoreStar"></span>
                        </div>
                    </div>
                </div>
                <div>
                    <div id="store-about">
                        <div class="d-inline-block store-imgs">
                            <div class="d-inline-block img-area height-full width-full"><span class="d-inline-block"><!-- <img src="" /> --></span></div>
                            <div class="text-center img-paging-icon">
                            	<i class="typcn typcn-media-record"></i>
                            	<i class="typcn typcn-media-record-outline"></i>
                            	<i class="typcn typcn-media-record-outline"></i>
                            </div>
                        </div>
                        <div class="d-inline-block review-area">
	                        	<!-- 최근 리뷰 영역 -->
                        </div>
                    </div>
                    <div id="all-menu" class="text-start">
                    	<span class="fw-bold text-info d-inline-block" style="color: rgb(54, 185, 204);">
                    		#양자강에서 최근 한달 동안 다른 사람들이 선택한 메뉴를 볼 수 있어요 &gt;&gt;
                    	</span>
                    	<button id="modal-see-menu" class="btn" type="button" data-bs-target="#modal-all-menu" data-bs-toggle="modal">
                    		메뉴 보러가기 <i class="icon ion-android-arrow-dropright-circle"></i>
                    	</button>
                    </div>
                    <div class="other-stores">
                        <div class="text-primary other-store-state">
                        	<span class="d-inline-block"></span>
                        </div>
                        <div class="text-start d-lg-flex justify-content-lg-center">
                        	<span class="d-inline-block">
		                        <button class="btn other-store-btn other-store-1" type="button" data-no="247">
		                        	명품청기와감자탕
		                        	<span class="fw-bold text-warning d-block">
		                        		<i class="fas fa-star"></i>
		                        		<i class="fas fa-star"></i>
		                        		<i class="fas fa-star"></i>
		                        		<i class="fas fa-star-half-alt"></i>
		                        		<i class="far fa-star"></i>
		                        	</span>
		                        </button>
		                    </span>
		                    <span class="d-inline-block">
		                    	<button class="btn other-store-btn other-store-2" type="button" data-no="246">
		                    		다사랑분식
		                    		<span class="fw-bold text-warning d-block">
			                    		<i class="fas fa-star"></i>
		                        		<i class="fas fa-star"></i>
		                        		<i class="fas fa-star"></i>
		                        		<i class="fas fa-star-half-alt"></i>
		                        		<i class="far fa-star"></i>
		                    		</span>
		                    	</button>
		                    </span>
		                    <span class="d-inline-block">
		                    	<button class="btn link-light other-store-btn other-store-3" type="button" data-no="245">
		                    		주궁
		                    		<span class="fw-bold text-warning d-block">
		                    			<i class="fas fa-star"></i>
		                        		<i class="fas fa-star"></i>
		                        		<i class="fas fa-star"></i>
		                        		<i class="fas fa-star-half-alt"></i>
		                        		<i class="far fa-star"></i>
		                    		</span>
		                    	</button>
		                    </span>
		                </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer-custom">
                <p class="modalStoreWithMe"></p>
                <div class="store-button-area">
            	</div>
            </div>
        </div>
    </div>
</div>



<!-- 모든 리뷰 보기 -->
<div id="modal-reviews" class="modal visible no-drag modal-stores" role="dialog" tabindex="-1" style="min-width: 798px;">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content" style="width: 798px;">
            <div class="modal-header"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body">
                <div class="fs-4 fw-bold text-dark modal-store-title">
                	<span class="d-inline-block modalStoreName"></span>
                	<span class="fs-6 text-secondary d-inline-block store-cate modalStoreCate"></span>
                    <div class="dropdown d-inline-block"><button class="btn btn-sm dropdown-toggle fs-6 fw-bold text-start text-secondary" aria-expanded="false" data-bs-toggle="dropdown" type="button">영업시간</button>
                        <div class="dropdown-menu">
                        	<div class="modalStoreOpening"></div>
                        	<div class="modalStoreBreak"></div>
                        </div>
                    </div>
                </div>
                <div class="store-info">
                    <div class="d-inline-block store-info-left">
                        <div><span class="modalStoreAddress"></span><span class="fw-bold text-primary modalStoreDistance"></span></div>
                        <div><span class="fw-bold text-primary modalStoreVisitCnt"></span><span> / 40대 그룹 선호 가게 "여기 해야함"</span></div>
                    </div>
                    <div class="text-end d-inline-block store-info-right">
                        <div><span>별점</span><span class="fw-bold text-primary modalStoreScore"></span></div>
                        <div>
                        	<span class="fw-bold text-warning modalStoreStar"></span>
                        </div>
                    </div>
                </div>
                <div class="d-inline-block review-area">
                    <div>
                    	<button class="btn back-store-info" type="button" data-bs-target="#modal-store" data-bs-toggle="modal">
                    		<i class="icon ion-android-arrow-dropleft-circle"></i>
                    		 이전으로 돌아가기
                    	</button>
                    </div>
                    <div id="store-all-review">
                    </div>
                </div>
            </div>
            <div class="modal-footer-custom">
                <p class="modalStoreWithMe"></p>
                <div class="store-button-area">
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 최근 메뉴창 -->
<div id="modal-all-menu" class="modal visible no-drag modal-stores" role="dialog" tabindex="-1" style="min-width: 798px;">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content" style="width: 798px;">
            <div class="modal-header"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body">
                <div class="fs-4 fw-bold text-dark modal-store-title">
                	<span class="d-inline-block modalStoreName"></span>
               		<span class="fs-6 text-secondary d-inline-block store-cate modalStoreCate"></span>
                    <div class="dropdown d-inline-block"><button class="btn btn-sm dropdown-toggle fs-6 fw-bold text-start text-secondary" aria-expanded="false" data-bs-toggle="dropdown" type="button">영업시간</button>
                        <div class="dropdown-menu">
                        	<div class="modalStoreOpening"></div>
                        	<div class="modalStoreBreak"></div>
                        </div>
                    </div>
                </div>
                <div class="store-info">
                    <div class="d-inline-block store-info-left">
                        <div><span class="modalStoreAddress"></span><span class="fw-bold text-primary modalStoreDistance"></span></div>
                        <div><span class="fw-bold text-primary modalStoreVisitCnt"></span><span> / 40대 그룹 선호 가게 "여기 해야함"</span></div>
                    </div>
                    <div class="text-end d-inline-block store-info-right">
                        <div><span>별점</span><span class="fw-bold text-primary modalStoreScore"></span></div>
                        <div>
                        	<span class="fw-bold text-warning modalStoreStar"></span>
                        </div>
                    </div>
                </div>
                <div id="latest-menu-area">
                    <div class="text-start">
                    	<button class="btn back-store-info" type="button" data-bs-target="#modal-store" data-bs-toggle="modal">
                    		<i class="icon ion-android-arrow-dropleft-circle"></i> 이전으로 돌아가기
                    	</button>
                    </div>
                    <div id="store-latest-menu" class="text-center">
                    </div>
                </div>
                <div class="other-stores">
                    <div class="text-primary other-store-state"><span class="d-inline-block"></span></div>
                    <div class="text-start d-lg-flex justify-content-lg-center"><span class="d-inline-block"><button class="btn other-store-btn other-store-1" type="button">흑룡강<span class="fw-bold text-warning d-block"><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-half-outline"></i><i class="typcn typcn-star-outline"></i></span></button></span><span class="d-inline-block"><button class="btn other-store-btn other-store-2" type="button">홍콩반점<span class="fw-bold text-warning d-block"><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-half-outline"></i><i class="typcn typcn-star-outline"></i></span></button></span><span class="d-inline-block"><button id="other-store-6" class="btn link-light other-store-btn other-store-3" type="button">락궁<span class="fw-bold text-warning d-block"><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-half-outline"></i><i class="typcn typcn-star-outline"></i></span></button></span></div>
                </div>
            </div>
            <div class="modal-footer-custom">
                <p class="modalStoreWithMe"></p>
                <div class="store-button-area">
	            </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

/* 바구니에서 - 가게 정보 보기 클릭 */
/* 메인페이지로 옮겨놓기 + 다른가게 눌렀을 때도*/
/* k : 1 바구니(추천) 경우 거리 표시
k : 0 기록(비추천) 경우 거리 표시 제외 */

/* 메인-가게바구니에서 조회할 때 */
$("#basket-table").on("click", ".basket-table-store-name", function(){
	if (typeof indexJSP === 'undefined' || indexJSP) {
        var storeNo = $(this).closest(".basket-table-row").attr("data-storeNo")
		console.log(storeNo+"번 가게 정보 보기")
		storeInfoOpen(storeNo, 1)
	}
})

/* 실험용 */
$("#test-storeInfo").on("click", function(){
	var storeNo = $(this).data("storeno")
	console.log(storeNo+"번 가게 정보 보기")
	storeInfoOpen(storeNo, 1)
})


/* 가게 고정 */
/* 리뷰 메인 가게정보에서 조회할 때 */
$("#visited-store-name").on("click", function(){
	var storeNo = $(this).data("storeno")
	console.log(storeNo+"번 가게 정보 보기")
	storeInfoOpen(storeNo, 0)
})


/* 모달에서 > 다시 다른 가게 정보 조회(버튼) */
$("#modal-store .other-store-btn").on("click", function(){
	var storeNo = $(this).attr("data-no")
	console.log(storeNo+"번 가게 정보 보기")
	//세션에 주소가 있으면 거리를 재고 아님 말고
	if("${curr_location}" != null){
		storeInfoOpen(storeNo, 1)
	}else{
		storeInfoOpen(storeNo, 0)
	}
})

 
 
 
/* 가게정보 모달 오픈 */
function storeInfoOpen(storeNo, k){
	console.log("가게: "+storeNo)
	
	storeBasicInfo(storeNo)
	
	//추천 때만 나와의 거리를 보여줌
	if(k==1){
		modalStoreDistance(storeNo)
	}
	
	//k=1 > 장바구니 : 여기갈래요 / 장바구니에 있으면 점심후보추가 or 없으면 점심후보제외
	//k=0 > 리뷰메인 : 내가 다녀온 장소 방문취소 (다녀온 곳 아니면 버튼 x) / 블랙리스트 추가(이미 블랙 > 블랙리스트 제외)   
	//k=2 > 그동안의 기록 : 블랙리스트 추가 or 제외
	//k=3 > 블랙리스트 가게 조회 : 블랙리스트 추가 or 제외
	modalSortOfStore(storeNo, k)
	
	$("#modal-store").modal("show")
}


/* 가게 기본정보 */
function storeBasicInfo(storeNo){
	console.log("modalStoreBasicInfo storeNo : " + storeNo)
	
	$.ajax({
		url : "${pageContext.request.contextPath}/store/info",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(storeNo),
		dataType : "json",
		
		success : function(storeMap){
			console.log(storeMap)
			
			$(".modalStoreName").text(storeMap.storeVo.storeName)
			$(".modalStoreCate").text("|   " + storeMap.storeVo.menu2ndCateName + "   |")
			$(".modalStoreAddress").text(storeMap.storeVo.storeRoadAddress)
			$(".modalStoreVisitCnt").text("여기갈래요 "+ storeMap.storeVo.visitCnt +"회")
			$(".modalStoreScore").text("(" + storeMap.storeVo.ratingBujang + "/5)")
			
			modalStoreStar(storeMap.storeVo.ratingBujang, 0)
			
			$(".modalStoreOpening").html('<a class="dropdown-item disabled link-secondary bg-warning">영업시간 :</a>')
			$(".modalStoreBreak").html('<a class="dropdown-item disabled link-secondary bg-warning">브레이크타임 :</a>')
			modalStoreTime(storeMap.storeVo.openingHours, 1)
			modalStoreTime(storeMap.storeVo.breaktime, 2)
			
			//k = 1 가게 정보창
			$("#modal-store .review-area").text("")
			for(var i=0; i<3; i++){
				modalStoreReivew(storeMap.reviewList[i], 1)
			}
			
			modalStoreMoreReivews()
			
			$(".other-store-state span").text(storeMap.storeVo.menu2ndCateName + " 카테고리 다른 가게")
			
			if(storeMap.visitedVo == null){
				$(".modalStoreWithMe").text("아직 방문기록이 없어요. 이번에 가보는건 어떨가요?")
			}else{
				$(".modalStoreWithMe").text("나의 방문 횟수: " + storeMap.visitedVo.visitCount + "회(최근 방문일 " + storeMap.visitedVo.visitedDate + ", " + storeMap.visitedVo.groupName + ")")
			}
			
			//k = 2 전체 리뷰창
			$("#modal-reviews #store-all-review").text("")
			for(var i=0; i<storeMap.reviewList.length; i++){
				modalStoreReivew(storeMap.reviewList[i], 2)
			}
			
			modalStoreSentence()
			for(var i=0; i<storeMap.menuList.length; i++){
				modalStoreAllMenu(storeMap.menuList[i])
			}
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	 
	})
}


/* 조회하는 유저와의 가게 거리 */
function modalStoreDistance(storeNo) {
	console.log("modalStoreDistance storeNo : " + storeNo)
	
	$.ajax({
		url : "${pageContext.request.contextPath}/store/distance",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(storeNo),
		dataType : "json",
		
		success : function(distance){
			console.log("distance: "+distance)
			
			if(distance>0){
				$(".modalStoreDistance").text(" ("+distance+"m)")
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
 
	})
}


/* 별 그리기 */
/* k:별그릴위치 종류 0:이 가게, 1 2 3: 다른가게 */
function modalStoreStar(starScore, k){
	console.log("score: " + starScore)
	
	var str = ''
	for(var i=0; i<5; i++){
		if(starScore >= (i+0.75)){
			str += '				<i class="fas fa-star"></i>'
		}else if(starScore >= (i+0.25) && starScore < (i+0.75) ){
			str += '				<i class="fas fa-star-half-alt"></i>'
		}else{
			str += '				<i class="far fa-star"></i>'
		}
	}
	
	switch(k){
		case 0: 
			console.log("k:" + k)
			$(".modalStoreStar").html(str)
			break
		default:
			break
	}
	
}


/* 영업시간+브레이크타임 드랍다운 리스트 */
function modalStoreTime(storeTime, opt){
	console.log("storeTime: " + opt)
	
	var str = ''
	
	if(storeTime[0] == "정보없음"){
		str += '<a class="dropdown-item disabled link-secondary">정보없음</a>'
	}else{
		str += '<a class="dropdown-item disabled link-secondary">월 : ' + storeTime[0] + '</a>'
		str += '<a class="dropdown-item disabled link-secondary">화 : ' + storeTime[1] + '</a>'
		str += '<a class="dropdown-item disabled link-secondary">수 : ' + storeTime[2] + '</a>'
		str += '<a class="dropdown-item disabled link-secondary">목 : ' + storeTime[3] + '</a>'
		str += '<a class="dropdown-item disabled link-secondary">금 : ' + storeTime[4] + '</a>'
		str += '<a class="dropdown-item disabled link-secondary">토 : ' + storeTime[5] + '</a>'
		str += '<a class="dropdown-item disabled link-secondary">일 : ' + storeTime[6] + '</a>'
	}
	
	if(opt == 1){
		$(".modalStoreOpening").append(str)
	}else if(opt == 2){
		$(".modalStoreBreak").append(str)
	}else{
		console.log("opt 오류")
	}
}


/* 가게 리뷰 */
function modalStoreReivew(storeReview, k){
	var str = ''
	str += '<div class="store-reviews">'
	str += '	<div class="d-inline-block store-review-left">'
	str += '		<span class="fw-bolder d-block">'
	str += '			' + storeReview.userName + ' (' + storeReview.avgAge + ' / ' + storeReview.withCount + '인 / ' + storeReview.menuName + ')'
	str += '		</span>'
	str += '		<span class="d-block">' + storeReview.reviewContent + '</span>'
	str += '	</div>'
	str += '	<div class="text-end d-inline-block store-review-right">'
	str += '		<span class="d-inline-block">'
	
	for(var i=0; i<5; i++){
		if(storeReview.userScore > i){
			str += '			<i class="fas fa-star"></i>'
		}else{
			str += '			<i class="far fa-star"></i>'
		}
	}
	
	str += '		</span>'
	str += '		<div class="d-inline-block">'
	str += '			<a class="btn float-none review-report" aria-expanded="false" data-bs-toggle="dropdown" role="button">신고하기'
	str += '				<svg class="bi bi-megaphone-fill text-danger modal-review-report-icon" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16">'
	str += '					<path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-11zm-1 .724c-2.067.95-4.539 1.481-7 1.656v6.237a25.222 25.222 0 0 1 1.088.085c2.053.204 4.038.668 5.912 1.56V3.224zm-8 7.841V4.934c-.68.027-1.399.043-2.008.053A2.02 2.02 0 0 0 0 7v2c0 1.106.896 1.996 1.994 2.009a68.14 68.14 0 0 1 .496.008 64 64 0 0 1 1.51.048zm1.39 1.081c.285.021.569.047.85.078l.253 1.69a1 1 0 0 1-.983 1.187h-.548a1 1 0 0 1-.916-.599l-1.314-2.48a65.81 65.81 0 0 1 1.692.064c.327.017.65.037.966.06z"></path>'
	str += '				</svg>'
	str += '			</a>'
	str += '			<div class="dropdown-menu dropdown-menu-end text-start">'
	str += '				<a class="dropdown-item" href="#" data-reviewno="'+storeReview.reviewNo+'" data-reporttype="1">광고/홍보글</a>'
	str += '				<a class="dropdown-item" href="#" data-reviewno="'+storeReview.reviewNo+'" data-reporttype="2">욕설/비방</a>'
	str += '				<a class="dropdown-item" href="#" data-reviewno="'+storeReview.reviewNo+'" data-reporttype="3">잘못된메뉴</a>'
	str += '				<a class="dropdown-item" href="#" data-reviewno="'+storeReview.reviewNo+'" data-reporttype="4">관련없는내용</a>'
	str += '				<a class="dropdown-item" href="#" data-reviewno="'+storeReview.reviewNo+'" data-reporttype="5">개인정보유출</a>'
	str += '				<a class="dropdown-item" href="#" data-reviewno="'+storeReview.reviewNo+'" data-reporttype="6">음란/선정성</a>'
	str += '			</div>'
	str += '		</div>'
	
	str += '		<div><span>' + storeReview.visitedDate + ' (' + storeReview.visitedCount + '번째 방문) </span></div>'
	str += '	</div>'
	str += '</div>'
	
	if(k == 1){
		$("#modal-store .review-area").append(str)
	}else if(k == 2){
		$("#modal-reviews #store-all-review").append(str)
	}
}


/* 리뷰더보기 버튼 */
function modalStoreMoreReivews(){
	
	var str = ''
	str += '<div id="more-reviews" class="text-end">'
	str += '	<button id="modal-review-more" class="btn btn-sm" type="button" data-bs-target="#modal-reviews" data-bs-toggle="modal">'
	str += '		리뷰더보기<i class="icon ion-android-arrow-dropright-circle"></i>'
	str += '	</button>'
	str += '</div>'
	
	$("#modal-store .review-area").append(str)
}


/* 리뷰 신고 */
$("#store-about").on("click", ".dropdown-item", function(){
	var reviewNo = $(this).data("reviewno")
	var reportCateNo = $(this).data("reporttype")
	console.log("리뷰 신고 : " + reviewNo + ", 타입: " + reportCateNo)
	
	if(confirm("리뷰를 신고하시겠습니까?") == false){
		return false
	}
	
	var reportVo = {
			reviewNo: reviewNo,
			reportCateNo: reportCateNo
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath}/store/review/report",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(reportVo),
		dataType : "json",
		
		success : function(result){
			if(result == "success"){
				alert("신고해주신 리뷰는 관리자 검토 후 조치가 진행됩니다")
			}else if(result == "fail"){
				alert("다시 시도해주세요")
			}else{
				alert("로그인 후 시도해주세요")
			}
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
 
	})
})


/* 최근 메뉴 */
function modalStoreSentence(){
	
	var str = ''
	str += '<p class="fs-6 fw-bold text-start text-info">'
	str += '	<strong>'
	str += '		<span style="color: rgb(54, 185, 204);">'
	str += '			#최근 한달 동안 다른 사람들이 리뷰를 남긴 메뉴/ 선택 횟수 &gt;&gt;'
	str += '		</span>'
	str += '	</strong><br />'
	str += '</p>'
	
	$("#modal-all-menu #store-latest-menu").html(str)
}


/* 최근 메뉴 리스트 */
function modalStoreAllMenu(menuVo){
	var str = '<span class="latest-menu">' + menuVo.menuName + '(<span>' + menuVo.menuCount + '</span>회)</span>'
	$("#modal-all-menu #store-latest-menu").append(str)
}


/* 가게 정보 모달  다른 가게 + footer 버튼 */
function modalSortOfStore(storeNo, k){
	//버튼 영역 초기화
	$(".store-button-area").html("")
	console.log("가게정보 모달 버튼 영역: " + k)
	
	switch(k){
		case 0:
		// k=1 : 리뷰메인
			//조회하는 가게 = 다녀온 가게
			if(storeNo == "${visitedMap.visitedVo.storeNo}"){
				$(".store-button-area").append('<button class="btn btn-primary btn-visit-cancle" type="button" data-storeNo="'+storeNo+'">방문취소</button>')
			}
			//다녀온 가게가 아니면 블랙버튼만(조회 자체가 블랙 아닌것만 됨)
			$(".store-button-area").append('<button class="btn btn-light btn-add-black" type="button" data-storeNo="'+storeNo+'">블랙추가</button>')
		
			break
		
		case 1:
		// k=1 : 바구니/지도
			// 그룹? 비로그인 또는 그룹이 없으면 여기갈래요 불가 > 
			var groupNo = "${curr_basket_group}"
			console.log(groupNo + ": curr_group")

			if(groupNo != "" && groupNo != "0"){
				var str = '' 
				str += '<a href="${pageContext.request.contextPath}/visited/decision/'+storeNo+'/'+groupNo+'">'
				str += '	<button class="btn btn-primary btn-decision-this" type="button">여기갈래요</button>'
				str += '</a>'
				$(".store-button-area").append(str)
			}
			// 바구니? ${basket.curr_basket_group}: 선택된 가게 리스트
			var basketStore = "${basket}"
			if(basketStore["${curr_basket_group}"] != null && basketStore["${curr_basket_group}"] != []){
				console.log(basketStore["${curr_basket_group}"])
				for(var i=0; i<basketStore["${curr_basket_group}"].length; i++){
					var listStoreNo = basketStore["${curr_basket_group}"][i].storeNo
					console.log(listStoreNo)
					//지금 모달을 여는 가게
					if(listStoreNo = storeNo){
						//장바구니에 있는 가게
						if(basketStore["${curr_basket_group}"][i].stored){
							$(".store-button-area").append('<button class="btn btn-light btn-delete-store-basket" type="button" data-storeNo="'+storeNo+'">점심후보제외</button>')
						}else{
							$(".store-button-area").append('<button class="btn btn-light btn-add-store-basket" type="button" data-storeNo="'+storeNo+'">점심후보추가</button>')
						}
					}
				}
			}

			break
			
		case 2:
		//stat에서 조회 > 나중에 추가
			break
			
		case 3:
		// 블랙리스트에서 조회 > 나중에 추가
			
			break
		
		default :
			console.log("가게 조회 종류 오류")
			break
	}
}


//장바구니 점심 후보 추가
$(".btn-add-store-basket", ).on("click", function(){
	var storeNo = $(this).attr("data-storeNo")
	addItemToBasket(storeNo)
	$(".modal-stores").modal("hide")
})


//장바구니 점심 후보 삭제
$("#modal-store .btn-delete-store-basket").on("click", function(){
	var storeNo = $(this).attr("data-storeNo")
	deleteSessionBasketGroup(storeNo)
	$(".modal-stores").modal("hide")
})


//여기갈래요 버튼 클릭
$(".btn-decision-this").on("click", function(){
	if(confirm("정말로 방문을 선택하시겠습니까?") == false){
		return false
	}
})

</script>

