<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>부장님요기요</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Bold-BS4-Responsive-Pricing-Table-Snippet.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style-jw.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vote-aside.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vote.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/theme.js"></script>

</head>

<body>
 
<div id="wrapper">
<c:import url="/WEB-INF/views/includes/aside/voteAside.jsp" />
    
    <div class="d-flex flex-column" id="vote-map-wrapper">        
    	<div id="header-1">
	            <c:import url="/WEB-INF/views/includes/header.jsp" />
	    </div>
        
        <div class="container" id="container">
	        
            <div class="d-flex d-xxl-flex justify-content-center" id="map-btn-area">
            	<button class="btn btn-danger d-inline-flex d-xxl-flex justify-content-center align-items-center" id="vote-kakao-btn" type="button">
            		<i class="fas fa-comment"></i>
            		<span>공유하기</span>
            	</button>
            	
            	<span class="d-inline-flex flex-shrink-0 justify-content-center flex-nowrap align-items-xxl-center" id="vote-url-copy-box">
            		<i class="fas fa-link d-inline-flex d-xxl-flex flex-shrink-0 justify-content-start align-items-center justify-content-xl-start align-items-xl-center justify-content-xxl-start align-items-xxl-center no-drag"></i>
            		<input class="d-inline-flex d-xxl-flex flex-shrink-0 align-items-xxl-center" type="text" id="vote-url-input" value="www.lunchwb.com?voteNo=1">
            		<button class="btn btn-primary d-inline-flex d-xxl-flex flex-shrink-0 justify-content-center align-items-center align-content-center align-items-xl-center justify-content-xxl-center align-items-xxl-center" id="vote-url-copy-btn" type="button">복사</button>
            	</span>
            </div>
        </div>
    </div>
    
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    
    <div class="modal fade" role="dialog" tabindex="-1" id="vote-link-modal">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header d-xxl-flex" id="vote-link-modal-header">
                    <h4 class="modal-title d-xxl-flex" id="vote-link-modal-header-title">투표가 생성되었습니다!</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                
                <div class="modal-body d-flex justify-content-center justify-content-xxl-center" id="vote-link-modal-body">
                    <div class="justify-content-center">
                        <p class="text-center">같이 밥을 먹을 그룹원들에게 투표를 공유할 수 있습니다<br></p>
                        <div class="d-flex justify-content-center">
                        	<button class="btn btn-danger d-inline-flex d-xxl-flex justify-content-center align-items-center" id="vote-kakao-btn" type="button" data-bs-target="#modal-1" data-bs-toggle="modal">
                        		<i class="fas fa-comment"></i>
                        		<span>공유하기</span>
                        	</button>
                        	<span class="d-inline-flex flex-shrink-0 justify-content-center flex-nowrap align-items-xxl-center" id="vote-url-copy-box">
                        		<i class="fas fa-link d-inline-flex d-xxl-flex flex-shrink-0 justify-content-start align-items-center justify-content-xl-start align-items-xl-center justify-content-xxl-start align-items-xxl-center no-drag"></i>
                        		<input class="d-inline-flex d-xxl-flex flex-shrink-0 align-items-xxl-center" type="text" id="vote-url-input-1" value="www.lunchwb.com?voteNo=1">
                        		<button class="btn btn-primary d-inline-flex d-xxl-flex flex-shrink-0 justify-content-center align-items-center align-content-center align-items-xl-center justify-content-xxl-center align-items-xxl-center" id="vote-url-copy-btn-1" type="button">복사</button>
                        	</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>