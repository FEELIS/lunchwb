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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/basket-aside.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e74b599be710b798192fd5221284718a&libraries=services"></script>

</head>


<body>
<div id="wrapper">

<c:import url="/WEB-INF/views/includes/aside/basketAside.jsp" />

<div class="d-flex flex-column" id="content-wrapper" style="position: relative;">
    <div class="container" id="container" style="max-width: 1920px;height: auto;margin: 0;padding: 0;">
        <div id="header-1">
            <c:import url="/WEB-INF/views/includes/header.jsp" />
        </div>
        
        <div class="flex-nowrap" id="curr-location">
        	<span style="margin-right: 5px;"><i class="fas fa-crosshairs"></i>&nbsp;현위치:</span>
        	<span id="curr-location-address">서울 관악구 남부순환로 1820 에그옐로우&nbsp;</span><button class="btn btn-primary" id="location-change-btn" type="button">위치재설정</button>
        </div>
    </div>
</div>

<a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>

<!-- 위치 재설정 모달 -->
<div id="modal-location-change" class="modal fade" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom-color: rgb(255,255,255);">
                    <h4 class="modal-title">현재 위치 설정</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <div class="modal-body">
                <div><span>출발 위치를 선택해주세요.</span>
                    <div id="modal-curr-location-box">
                    	<span class="emphasize-blue">현재 설정 위치:&nbsp;</span>
                    	<span>서울 관악구 남부순환로 1820 에그옐로우</span>
                    	<button class="btn btn-primary float-end" id="modal-curr-location-btn" type="button">현위치</button>
                    </div>
                    <div id="write-location-box">
                    	<span class="d-inline-block">직접 입력하기:</span>
                    	<input type="text" class="location-search-bar">
                    	<button class="btn btn-primary align-items-center location-search-bar" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</div>



<script type="text/javascript">
	// 위치재설정 버튼 클릭 시
	$("#location-change-btn").on("click", function(){
		$("#modal-location-change").modal("show")
	})
	
	console.log(basket_group)
	

	
</script>

</body>

</html>