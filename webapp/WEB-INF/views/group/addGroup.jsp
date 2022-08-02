<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>부장님요기요: 새 그룹 추가</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/group.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/customModal.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">
</head>

<body id="page-top">

<div id="wrapper">
	
	<c:import url="/WEB-INF/views/includes/aside/userAside.jsp"></c:import>
	
	<c:import url="/WEB-INF/views/includes/aside/groupAside.jsp"></c:import>
	
    <div id="content-wrapper" class="d-flex flex-column">
    
        <div id="content">
        
			<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

            <div class="container-fluid">
                <h3 class="text-dark mb-4 group-content-title"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -64 640 640" width="1em" height="1em" fill="currentColor" style="font-size: 30px;">
                        <path d="M224 256c70.7 0 128-57.31 128-128S294.7 0 224 0C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3c-95.73 0-173.3 77.6-173.3 173.3C0 496.5 15.52 512 34.66 512H413.3C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM479.1 320h-73.85C451.2 357.7 480 414.1 480 477.3C480 490.1 476.2 501.9 470 512h138C625.7 512 640 497.6 640 479.1C640 391.6 568.4 320 479.1 320zM432 256C493.9 256 544 205.9 544 144S493.9 32 432 32c-25.11 0-48.04 8.555-66.72 22.51C376.8 76.63 384 101.4 384 128c0 35.52-11.93 68.14-31.59 94.71C372.7 243.2 400.8 256 432 256z"></path>
                    </svg>새 그룹</h3>
                <div id="groupmem-invt" class="card shadow">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 fw-bold">새 그룹 만들기</p>
                    </div>
                    <div class="card-body">
                        <div>
                        	<form id="addGroupForm" action="${pageContext.request.contextPath}/group/add" method="post">
		                        <p>그룹을 생성하면 그룹의 리더가 됩니다<br/></p>
	                        	<input id="addName" type="text" name="groupName" placeholder="그룹 이름을 입력해주세요"/>
	                        	<button id="btnAddGroup" class="btn btn-primary btn-groupmem-invt" type="submit">생성하기</button>
	                        	<div class="form-check">
	                        		<input id="chk-boss-notuser" class="form-check-input" type="checkbox" name="bossCheck" value="1" />
	                        		<label class="form-check-label" for="chk-boss-notuser">혹시 부장님이신가요?<br /></label>
	                        	</div>
	                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer id="footer" class="bg-white sticky-footer" style="background-color: #ffffff;">
            <div class="container my-auto">
                <div class="text-center my-auto copyright"><span>Copyright © FEELIS 2022<br />https://github.com/FEELIS <br /></span></div>
            </div>
        </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
   
   
   
<!-- 그룹 순서 변경 모달 -->
<div id="modal-group-order-change" class="modal fade" role="dialog" tabindex="-1" data-bs-auto-close="outside" ara-expanded="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-header-custom">
                <div><span>그룹 순서 변경</span></div><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body modal-body-custom">
                <div class="group-order-area">
                    <p><i class="icon ion-arrow-up-b"></i><i class="icon ion-arrow-down-b"></i>동기모임</p>
                </div>
                <div class="group-order-area">
                    <p>개발1팀<i class="icon ion-arrow-down-b"></i><i class="icon ion-arrow-up-b"></i></p>
                </div>
                <div class="group-order-area">
                    <p>개발2팀<i class="icon ion-arrow-down-b"></i><i class="icon ion-arrow-up-b"></i></p>
                </div>
                <div class="group-order-area">
                    <p><i class="icon ion-arrow-down-b"></i>지히팀<i class="icon ion-arrow-up-b"></i></p>
                </div>
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">변경</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>
 
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>

</body>

</html>