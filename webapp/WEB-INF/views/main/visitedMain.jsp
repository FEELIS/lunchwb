<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>부장님요기요</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Bold-BS4-Responsive-Pricing-Table-Snippet.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style-jw.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/visited.css">
<!-- 추가하기 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/customModal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/storeInfo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>

</head>
<body>

<div id="wrapper">
    <nav id="visited-aside" class="navbar navbar-light bg-white text-center d-xxl-flex align-items-start justify-content-xxl-center sidebar accordion p-0">
       
        <div class="container-fluid d-flex flex-column p-0">
            
            <div id="header-logo">
            	<img id="bujang-logo-blue" class="no-drag" width="159" height="38" src="${pageContext.request.contextPath}/assets/img/bujang-logo blue.png" href="${pageContext.request.contextPath}/genie/review" />
            </div>
            
            <div id="visited-aside-status-area">
            	<span class="d-inline-block">오늘 점심 뭐 먹었지?</span>
            </div>
            
            <div style="width: 100%;">
            
                <div class="text-start d-flex visited-aside-blue">
                	<span class="d-inline-block">나와 점심을 함께 한 그룹</span>
                </div>
                
                <div id="my-lunch-group" class="d-xxl-flex justify-content-xxl-center align-items-xxl-center">
                    <div>
                    	<span id="my-lunch-group-name">
                    		<svg id="my-lunch-group-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 -64 640 640" width="1em" height="1em" fill="currentColor">
                                <path d="M224 256c70.7 0 128-57.31 128-128S294.7 0 224 0C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3c-95.73 0-173.3 77.6-173.3 173.3C0 496.5 15.52 512 34.66 512H413.3C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM479.1 320h-73.85C451.2 357.7 480 414.1 480 477.3C480 490.1 476.2 501.9 470 512h138C625.7 512 640 497.6 640 479.1C640 391.6 568.4 320 479.1 320zM432 256C493.9 256 544 205.9 544 144S493.9 32 432 32c-25.11 0-48.04 8.555-66.72 22.51C376.8 76.63 384 101.4 384 128c0 35.52-11.93 68.14-31.59 94.71C372.7 243.2 400.8 256 432 256z"></path>
                            </svg>
                            ${visitedMap.visitedVo.groupName}
                        </span>
                    </div>
                </div>
                
                <div class="text-start d-flex visited-aside-blue">
                	<span class="d-inline-block">오늘 다녀온 가게</span>
                </div>
                
            </div>
            
            <div id="visited-store-info">
            	<button id="visited-store-name" class="btn btn-primary" type="button" data-storeno="${visitedMap.visitedVo.storeNo}">
            		${visitedMap.visitedVo.storeName}<span id="visited-store-cate">| ${visitedMap.visitedVo.menu2ndCateName}</span>
            	</button>
                <div id="visited-star-point"></div>
                <p id="visited-store-address" class="visited-store-p"> ${visitedMap.visitedVo.storeRoadAddress}<br /></p>
            </div>
            
            <div id="visited-review-area">
                <p>이 가게의 최근 리뷰 (2건)</p>
                
                <c:forEach items="${visitedMap.reviewList}" var="reviewVo" varStatus="status">
	                <div class="visited-reviews">
	                    <div>
	                    	<span class="visited-review-user">${reviewVo.userName}(${reviewVo.avgAge}/${reviewVo.withCount}인)</span>
		                    <span class="visited-review-star">
			                    <c:forEach var="i" begin="0" end="4">
			                    	<c:choose>
				                    	<c:when test="${reviewVo.userScore > i}">
					                    	<i class="fas fa-star"></i>
					                    </c:when>
					                    <c:otherwise>
					                    	<i class="far fa-star"></i>
					                    </c:otherwise>
				                    </c:choose>
			                    </c:forEach>
		                    </span>
	                    </div>
	                    <div>
	                    	<span class="modal-review-content">${reviewVo.reviewContent}</span>
	                    </div>
	                </div>
                </c:forEach>
                
            </div>
            
            <c:if test="${visitedMap.reviewVo == null}">
	            <p class="visited-p">오늘이 가기 전에 리뷰를 남겨주세요!</p>
	            <button id="btn-visited-cancel" class="btn btn-light link-danger border rounded-pill border-danger" type="button">방문 취소</button>
            </c:if>
            
            <c:if test="${authUser.userNo == visitedMap.groupLeader}">
	            <p class="visited-p">혹시 그룹 취향이 아니었나요?</p>
	            <button id="btn-visited-blacklist" class="btn btn-light link-dark border rounded-pill border-dark" type="button">블랙리스트 추가</button>
 			</c:if>       
 			
        </div>
    </nav>
    
    
    <div id="content-wrapper" class="d-flex flex-column" style="position: relative;">
        
        <div id="content" class="border rounded">
			
			<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
			
            <div class="container-fluid">
                
                <div id="today" class="card shadow">
                    <div class="card-body">
                        <p class="d-inline-block" style="width: 483px;"><span style="color: rgb(255, 255, 255);"></span>
                        	<i class="far fa-edit"></i> 오늘의 식사는 어떠셨나요?
                        </p>
                    </div>
                </div>
                
                <div id="visited-row" class="row">
                    
                    <div class="col">
                        <div id="today-store-rel" class="card shadow">
                            
                            <div class="card-header py-3">
                                <p class="text-primary m-0 fw-bold">
                                	<span class="visited-store-blue">나와 ${visitedMap.visitedVo.storeName}의 인연</span>
                                </p>
                            </div>
                            
                            <div class="card-body">
                                <div class="table-responsive table mt-2 today-store-table" role="grid" aria-describedby="dataTable_info">
                                    <table id="dataTable" class="table my-0">
                                        
                                        <thead>
                                            <tr>
                                                <th style="width: 50%;"><span class="d-inline-block me-2 bg-success icon-circle"></span>언제 처음 방문했을까?</th>
                                                <th style="width: 50%;"><span class="d-inline-block me-2 bg-warning icon-circle"></span>오늘이 몇번째 방문일까?</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                            <tr>
                                                <td>${visitedMap.relVo.visitedDate}<br /></td>
                                                <td>${visitedMap.relVo.visitCount}번째</td>
                                            </tr>
                                        </tbody>
                                        
                                    </table>
                                </div>
                                
                                <div class="table-responsive table mt-2 today-store-table" role="grid" aria-describedby="dataTable_info">
                                    <table id="dataTable" class="table my-0">
                                        
                                        <thead>
                                            <tr>
                                                <th style="width: 50%;"><span class="d-inline-block me-2 bg-primary icon-circle"></span><strong>며칠만에 방문했을까?</strong><br /></th>
                                                <th style="width: 50%;"><span class="d-inline-block me-2 bg-danger icon-circle"></span> 지난번에 누구와 먹었지?</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                            <tr>
                                                <td>
                                                	<c:choose>
                                                		<c:when test="${visitedMap.relVo.lastVisit == null || visitedMap.relVo.lastVisit == '' }">
                                                			-
                                                		</c:when>
                                                		<c:otherwise>
                                                			${visitedMap.relVo.lastVisit}일
                                                		</c:otherwise>
                                                	</c:choose>
                                                </td>
                                                <td>
                                                	<c:choose>
                                                		<c:when test="${visitedMap.relVo.lastVisit == null || visitedMap.relVo.lastVisit == '' }">
                                                			-
                                                		</c:when>
                                                		<c:otherwise>
                                                			${visitedMap.relVo.groupName}
                                                		</c:otherwise>
                                                	</c:choose>
                                                </td>
                                            </tr>
                                        </tbody>
                                        
                                    </table>
                                </div>
                            </div>
                            
                        </div>
                    </div>

                    
                    <div class="col">
                        <div id="today-review" class="card shadow flex-nowrap">
                            
                            <div class="card-header py-3">
                            	<p class="text-primary m-0 fw-bold">
	                            	<c:choose>
	                            		<c:when test="${visitedMap.reviewVo == null}">
			                            	리뷰 남기기
			                            	<input type="hidden" name="visitedNo" value="${visitedMap.visitedVo.visitedNo}"/>
	                            		</c:when>
	                            		<c:otherwise>
											오늘 작성한 리뷰
	                            		</c:otherwise>
	                            	</c:choose>
                            	</p>
                            </div>
                            
                            <div class="card-body" style="background: #ffffff;">
								<form id = "review-submit" action = "${pageContext.request.contextPath}/visited/review/upload" method="post" enctype="multilpart/form-data">
	                                <div class="row">
                                    	<div class="col-xxl-7">
                                        
                                            <div class="d-inline today-review-line">
                                            	<span class="d-inline-block circles">
                                            		<span class="d-inline-block me-2 bg-secondary icon-circle"></span>
                                            	</span>
                                            	<span class="fw-bolder d-inline-block">
                                            		<c:choose>
					                            		<c:when test="${visitedMap.reviewVo == null}">
							                            	가게는 어떠셨나요?
					                            		</c:when>
					                            		<c:otherwise>
															내가 준 별점
					                            		</c:otherwise>
					                            	</c:choose>
                                            	</span>
                                            </div>
                                            
                                     		<div id="today-star-icon" class="text-warning no-drag">	
			                            		<c:if test="${visitedMap.reviewVo == null}">
	                                     			<input type="hidden" name="userScore" value="0"/>
		                                     		<i id = "star-1" class="far fa-star starScore" data-score = "1" data-stt="off"></i>
		                                     		<i id = "star-2" class="far fa-star starScore" data-score = "2" data-stt="off"></i>
		                                     		<i id = "star-3" class="far fa-star starScore" data-score = "3" data-stt="off"></i>
		                                     		<i id = "star-4" class="far fa-star starScore" data-score = "4" data-stt="off"></i>
		                                     		<i id = "star-5" class="far fa-star starScore" data-score = "5" data-stt="off"></i>
			                            		</c:if>
                                     		</div>
                                        
                                        <div>
                                            
                                            <div class="d-block today-review-line">
                                            	<span class="d-inline-block circles">
                                            		<span class="d-inline-block me-2 bg-secondary icon-circle"></span>
                                            	</span>
                                            		<c:choose>
					                            		<c:when test="${visitedMap.reviewVo == null}">
			                                            	<span class="fw-bolder d-inline-block">
			                                            		메뉴를 선택해주세요 
			                                            	</span>
				                                            
				                                            <div>
					                                            <select id="today-menu" name="menuNo">
				                                                    <option class="fw-bold" selected disabled>${visitedMap.visitedVo.menu2ndCateName}</option>
				                                                    <c:forEach items="${visitedMap.menuList}" var="menuVo">
				                                                    	<option value="${menuVo.menuNo}">${menuVo.menuName}</option>
				                                                    </c:forEach>
					                                            </select>
					                                        </div>
					                            		</c:when>
					                            		<c:otherwise>
			                                            	<span class="fw-bolder d-inline-block">
			                                            		오늘 먹은 메뉴
			                                            	</span>
			                                            	<div>
			                                            		<span id="today-menu">${visitedMap.reviewVo.menuName}</span>
			                                            	</div>
					                            		</c:otherwise>
					                            	</c:choose>                                            	

                                            </div>
                                            
                                        </div>
                                        
                                        <div>
                                            <div class="d-block">
                                            	<span class="d-inline-block circles">
                                            		<c:if test="${visitedMap.reviewVo == null}">
	                                            		<span class="d-inline-block me-2 bg-secondary icon-circle"></span>
                                            		</c:if>
                                            	</span>
                                            	
                                            	<span class="fs-6 fw-bolder d-inline-block">
                                            		<c:if test="${visitedMap.reviewVo == null}">
		                                            	사진을 업로드 해주세요(선택) :
                                            		</c:if>
                                            	</span>
                                            </div>
                                            
                                            <div>
                                            	<c:if test="${visitedMap.reviewVo == null}">
                                            		<input type="file" name="file"/>
                                            	</c:if>
                                            </div>
                                        </div>
                                     		
                                       </div>
	                                       
		                                <div id="review-image-area" class="col text-end">
		                                    	<img src="${pageContext.request.contextPath}/assets/img/bujang-logo blue.png" style="width: 130.5px; height: 174px;" />
		                                </div>
		                                
	                                </div>

		                            <div>
		                            	<c:choose>
			                            	<c:when test="${visitedMap.reviewVo == null}">
			                            		<textarea id="today-review-content" name="reviewContent" placeholder="내용을 입력해주세요"></textarea>
			                            	</c:when>
			                            	<c:otherwise>
			                            		<span id="today-review-content">${visitedMap.reviewVo.reviewContent}</span>
			                            	</c:otherwise>
			                            </c:choose>
		                            </div>
		                           
		                            <div id="btn-add-review" class="text-center">
		                            	<c:if test="${visitedMap.reviewVo == null}">
		                           			<button class="btn btn-primary btn-today" type="submit">리뷰 등록</button>
		                           		</c:if>
		                           	</div>

                                </form>
                                
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
    </div>
    
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    
</div>

<!--  가게 정보 모달 삽입 --> 
<c:import url="/WEB-INF/views/includes/storeInfo.jsp" />

<script type="text/javascript">

const visitedVo = "${visitedMap.visitedVo}" 
console.log(visitedVo)

$(document).ready(function(){
	drawStoreStar()
	drawReviewStar()
})


function drawStoreStar(){
	var starScore = "${visitedMap.visitedVo.ratingBujang}"
	
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
	str += '<span class="visited-store-blue">' + starScore + '/5</span>'
	
	$("#visited-star-point").html(str)
}


function drawReviewStar(){
	var review = "${visitedMap.reviewVo}"
	if(review != null && review != ""){
		var userScore = "${visitedMap.reviewVo.userScore}"
		for(var i=0; i<5; i++){
			if(userScore > i){
				$("#today-star-icon").append('<i class="fas fa-star"></i>')
			}else{
				$("#today-star-icon").append('<i class="far fa-star"></i>')
			}
		}
	}
}


$("#today-star-icon").on("click", ".starScore", function(){
	var score = $(this).attr("data-score")
	var state = $(this).attr("data-stt")
	console.log(score + "번 별 클릭, 상태: " + state)
	
	if(state == "off"){
		$("#today-star-icon [name='userScore']").val(score)
		for(var i=1; i<=score; i++){
			document.getElementById("star-"+i).className = "fas fa-star starScore"
			$("#star-"+i).attr("data-stt", "on")
		}
		
	}else if(state == "on"){
		$("#today-star-icon [name='userScore']").val(score-1)
		for(var i=score; i<=5; i++){
			document.getElementById("star-"+i).className = "far fa-star starScore"
				$("#star-"+i).attr("data-stt", "off")
		}
	}
	
})


$("#today-review").on("submit", function(){
	console.log("리뷰 작성")

	var menuNo = $("[name = 'menuNo']").val()
	if(menuNo == null){
		alert("메뉴를 선택해주세요")
		return false
	}
	
	var content = $("[name = 'reviewContent']").val()
	if(content == null || content == ""){
		alert("내용을 입력해주세요")
		return false
	}
	
	var score = $("[name = 'userScore']").val()
	if(score == 0){
		if(confirm("별점이 0점으로 기록됩니다.") == false){
			return false
		}
	}
	
	return true
	
})



</script>
    
</body>
</html>