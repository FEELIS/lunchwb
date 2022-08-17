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
                            동기모임
                        </span>
                    </div>
                </div>
                
                <div class="text-start d-flex visited-aside-blue">
                	<span class="d-inline-block">오늘 다녀온 가게</span>
                </div>
                
            </div>
            
            <div id="visited-store-info">
            	<button id="visited-store-name" class="btn btn-primary" type="button" data-storeno="${visitedMap.visitedVo.storeNo}">
            		${visitedMap.visitedVo.storeName}<span id="visited-store-cate">| ${visitedMap.visitedVo.menu2stCateName}</span>
            	</button>
                <div id="visited-star-point">
                	<i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                	<span class="visited-store-blue">3.3/5</span>
                </div>
                <p id="visited-store-address" class="visited-store-p">서울특별시 관악구 낙성대로 22-1<br /></p>
            </div>
            
            <div id="visited-review-area">
                <p>이 가게의 최근 리뷰 (2건)</p>
                
                <div class="visited-reviews">
                    
                    <div>
                    	<span class="visited-review-user">이지희(20대 그룹/3인)</span>
	                    <span class="visited-review-star">
		                    <i class="far fa-star"></i>
		                    <i class="far fa-star"></i>
		                    <i class="far fa-star"></i>
		                    <i class="far fa-star"></i>
		                    <i class="far fa-star"></i>
	                    </span>
                    </div>
                    <div>
                    	<span class="modal-review-content">냉면 냉면 냉면 손이 너무 시려 냉면 냉면 냉면 사이즈 체크좀 하자 안녕</span>
                    </div>
                </div>
                
                <div class="visited-reviews">
                    <div><span class="visited-review-user">이지희(20대 그룹/3인)</span>
                    <span class="visited-review-star">
                    </span></div>
                    <div><span class="modal-review-content">냉면 냉면 냉면 손이 너무 시려 냉면 냉면 냉면 사이즈 체크좀 하자 안녕</span></div>
                </div>
                
            </div>
            
            <p class="visited-p">오늘이 가기 전에 리뷰를 남겨주세요!</p>
            <button id="btn-visited-cancel" class="btn btn-light link-danger border rounded-pill border-danger" type="button">방문 취소</button>
            
            <p class="visited-p">혹시 그룹 취향이 아니었나요?</p>
            <button id="btn-visited-blacklist" class="btn btn-light link-dark border rounded-pill border-dark" type="button">블랙리스트 추가</button>
        
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
                                	<span class="visited-store-blue">양자강</span>과 나의 인연
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
                                                <td>2022년 07월 20일<br /></td>
                                                <td>103번째</td>
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
                                                <td>11일</td>
                                                <td>동기모임</td>
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
                                <p class="text-primary m-0 fw-bold">리뷰 남기기</p>
                            </div>
                            
                            <div class="card-body" style="background: #ffffff;">
                                <div class="row">
                                    <div class="col-xxl-7">
                                        
                                        <div>
                                            <div class="d-inline today-review-line">
                                            	<span class="d-inline-block circles">
                                            		<span class="d-inline-block me-2 bg-secondary icon-circle"></span>
                                            	</span>
                                            	<span class="fw-bolder d-inline-block">
                                            		가게는 어떠셨나요?
                                            	</span>
	                                     		<span id="today-star-icon" class="text-warning">
		                                     		<i class="far fa-star"></i>
		                                     		<i class="far fa-star"></i>
		                                     		<i class="far fa-star"></i>
		                                     		<i class="far fa-star"></i>
		                                     		<i class="far fa-star"></i>
	                                     		</span>
                                            </div>
                                     		
                                        </div>
                                        
                                        <div>
                                            
                                            <div class="d-block today-review-line">
                                            	<span class="d-inline-block circles">
                                            		<span class="d-inline-block me-2 bg-secondary icon-circle"></span>
                                            	</span>
                                            	
                                            	<span class="fw-bolder d-inline-block">
                                            		메뉴를 선택해주세요 
		                                            <select id="today-menu" name="menu">
		                                                <optgroup label="중식/중화요리">
	                                                    <option value="black-noodle">짜장면</option>
	                                                    <option value="">짬뽕</option>
	                                                    <option value="">쟁반짜장</option>
	                                                    <option value="">짜장밥</option>
	                                                    <option value="">짬뽕밥</option>
	                                                    <option value="">볶음밥</option>
	                                                    <option value="">탕수육</option>
	                                                    <option value="">양장피</option>
		                                                </optgroup>
		                                            </select>
                                            	</span>

                                            </div>
                                            
                                        </div>
                                        
                                        <div>
                                            <div class="d-block">
                                            	<span class="d-inline-block circles">
                                            		<span class="d-inline-block me-2 bg-secondary icon-circle"></span>
                                            	</span>
                                            	
                                            	<span class="fs-6 fw-bolder d-inline-block">사진을 업로드 해주세요(선택) :</span>
                                            </div>
                                            
                                            <div><input type="file" /></div>
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="col text-end">
                                    	<img src="map.png" style="width: 174px;height: 130.5px;" />
                                    </div>
                                    
                                </div>
                                
                                <div>
                                	<textarea id="today-review-content" name="reviewContent" placeholder="내용을 입력해주세요"></textarea>
                                </div>
                                
                                <div class="text-center">
                                	<button class="btn btn-primary btn-today" type="button">리뷰 등록</button>
                                </div>
                                
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

    
</body>
</html>