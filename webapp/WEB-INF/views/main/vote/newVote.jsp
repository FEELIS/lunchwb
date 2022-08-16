<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>부장님요기요</title>

<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap">
<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/basket-aside.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
<link rel="stylesheet" href="assets/css/style-jw.css">
<link rel="stylesheet" href="assets/css/vote.css">
<link rel="stylesheet" href="assets/css/yogiyo.css">

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script src="assets/js/theme.js"></script>
</head>

<body>

    <div id="wrapper">
        
        <c:import url="/WEB-INF/views/includes/aside/basketAside.jsp" />
        
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="header-1">
                <c:import url="/WEB-INF/views/includes/header.jsp" />
            </div>
            
            <div class="container" id="container">
                <div id="main-content">
                    <div class="vote-container-title"><span>투표 만들기</span></div>
                    
                    <div id="edit-vote-area" class="card-body">
                        <div id="edit-vote-header">
                        	<span id="edit-vote-group-name">개발 1팀</span>
                        	<span id="edit-vote-group-nums">
                        		<span>(총 인원</span>
                        		<span id="edit-vote-group-num" class="emphasize-blue">&nbsp;6</span>
                        		<span>명)</span>
                        	</span>
                        </div>
                        <hr>
                        
                        <div id="edit-vote-member">
                            <div id="edit-vote-add-people-area">
                                <div id="vote-add-people">
	                                <span class="eidt-vote-title">인원 추가</span>
	                                <span id="vote-new-member-toggle">
	                                	<i class="fas fa-minus-circle"></i>
	                                	<span id="vote-new-member-num">1</span><span>명</span>
	                                	<i class="fas fa-plus-circle"></i>
	                                </span>
	                                
	                                <button class="btn btn-primary" id="vote-new-member-add-btn" type="button">추가하기</button>
                                </div>
                            </div>
                            
                            <div class="d-flex d-xxl-flex flex-row flex-grow-0 flex-wrap justify-content-xxl-start" id="edit-vote-people-area">
                            	<span class="d-flex d-xxl-flex flex-wrap vote-people-bujang vote-people">
                            		<span class="text-end d-xxl-flex justify-content-xxl-end vote-people-header">
                            			<i class="fas fa-minus-circle"></i>
                            		</span>
                            		<span class="vote-people-body-wrap">
                            			<span class="text-center d-xxl-flex justify-content-xxl-center align-items-xxl-center vote-people-body">
                            				<i class="fas fa-crown vote-bujang-crown"></i>
                            				<span class="vote-people-name">이지희</span>
                            				<i class="fas fa-crown"></i>
                            			</span>
                            		</span>
                            	</span>
                            	
                            	<span class="d-flex d-xxl-flex flex-wrap vote-people">
                            		<span class="text-end d-xxl-flex justify-content-xxl-end vote-people-header">
                            			<i class="fas fa-minus-circle"></i>
                            		</span>
                            		<span class="vote-people-body-wrap">
                            			<span class="text-center d-xxl-flex justify-content-xxl-center align-items-xxl-center vote-people-body">
                            				<i class="fas fa-crown"></i>
                            				<span class="vote-people-name">김준호</span>
                            				<i class="fas fa-crown"></i>
                            			</span>
                            		</span>
                            	</span>
                            	
                            	<span class="d-flex d-xxl-flex flex-wrap vote-people vote-people-deleted">
                            		<span class="text-end d-xxl-flex justify-content-xxl-end vote-people-header">
                            			<i class="fas fa-plus-circle"></i>
                            		</span>
                            		<span class="vote-people-body-wrap">
                            			<span class="text-center d-xxl-flex justify-content-xxl-center align-items-xxl-center vote-people-body">
                            				<i class="fas fa-crown"></i>
                            				<span class="vote-people-name">최정필1</span>
                            				<i class="fas fa-crown"></i>
                            			</span>
                            		</span>
                            	</span>
                            	
                            	<span class="d-flex d-xxl-flex flex-wrap vote-people">
                            		<span class="text-end d-xxl-flex justify-content-xxl-end vote-people-header">
                            			<i class="fas fa-minus-circle"></i>
                            		</span>
                            		<span class="vote-people-body-wrap">
                            			<span class="text-center d-xxl-flex justify-content-xxl-center align-items-xxl-center vote-people-body">
                            				<i class="fas fa-crown"></i>
                            				<span class="vote-people-name">최정필2</span>
                            				<i class="fas fa-crown"></i>
                            			</span>
                            		</span>
                            	</span>
                            	
                            	<span class="d-flex d-xxl-flex flex-wrap vote-people">
                            		<span class="text-end d-xxl-flex justify-content-xxl-end vote-people-header">
                            			<i class="fas fa-minus-circle"></i>
                            		</span>
                            		<span class="vote-people-body-wrap">
                            			<span class="text-center d-xxl-flex justify-content-xxl-center align-items-xxl-center vote-people-body">
                            				<i class="fas fa-crown"></i>
                            				<span class="vote-people-name">최정필3</span>
                            				<i class="fas fa-crown"></i>
                            			</span>
                            		</span>
                            	</span>
                            	
                            	<span class="d-flex d-xxl-flex flex-wrap vote-people">
                            		<span class="text-end d-xl-flex d-xxl-flex justify-content-xl-end align-items-xl-center justify-content-xxl-end vote-people-header">
                            			<i class="fas fa-pen d-inline-block vote-people-edit-name-btn"></i>
                            			<i class="fas fa-times-circle d-inline-block"></i>
                            		</span>
                            		<span class="vote-people-body-wrap">
                            			<span class="text-center d-xxl-flex justify-content-xxl-center align-items-xxl-center vote-people-body">
                            				<i class="fas fa-crown"></i>
                            				<span class="vote-people-name">뻐꾸기</span>
                            				<i class="fas fa-crown"></i>
                            			</span>
                            		</span>
                            	</span>
                            	
                            	<span class="d-flex d-xxl-flex flex-wrap vote-people">
                            		<span class="text-end d-xl-flex d-xxl-flex justify-content-xl-end align-items-xl-center justify-content-xxl-end vote-people-header">
                            			<i class="fas fa-check-circle d-inline-block vote-people-edit-confirm"></i>
                            			<i class="fas fa-times-circle d-inline-block"></i>
                            		</span>
                            		<span class="vote-people-body-wrap">
                            			<span class="text-center d-xxl-flex justify-content-xxl-center align-items-xxl-center vote-people-body">
                            			<i class="fas fa-crown" style="font-size: 1px;color: #eaecf4;padding-right: 0;"></i>
                            			<span style="font-size: 18px;">
                            				<input type="text" value="도요새"></span>
                            				<i class="fas fa-crown" style="font-size: 1px;color: #eaecf4;padding-right: 0;"></i>
                            			</span>
                            		</span>
                            	</span>
                            </div>
                        </div>
                        <hr>
                        
                        <div id="vote-end-time">
                            <div>
                            	<span class="eidt-vote-title">투표 마감 시각</span>
                            	<input type="number" id="vote-end-hour" min="00" max="23" step="1" value="12" name="end-vote-hour">
                            	<span>시</span>
                            	<input type="number" id="vote-end-min" min="00" max="59" step="1" value="10" name="end-vote-min">
                            	<span>분 까지</span>
                            </div>
                            
                            <div id="vote-time-button-area">
                            	<span>투표 마감 시각</span>
                            	<button class="btn btn-primary vote-add-time-btn" id="vote-add-10m" type="button">+10분</button>
                            	<button class="btn btn-primary vote-add-time-btn" id="vote-add-30m" type="button">+30분</button>
                            	<button class="btn btn-primary vote-add-time-btn" id="vote-add-1hr" type="button">+1시간</button>
                            	<button class="btn btn-primary" id="vote-reset-btn" type="button">초기화</button>
                            </div>
                        </div>
                        <hr>
                        
                        <div class="text-center" id="vote-make-finish"><button class="btn btn-primary text-center" id="make-vote-btn" type="button">투표 만들기</button></div>
                    </div>
                </div>
            </div>
            
            <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
            
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>

</body>
</html>