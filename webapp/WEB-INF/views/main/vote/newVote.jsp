<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>부장님요기요</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/basket-aside.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style-jw.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vote.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>

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
                    <div class="vote-container-title"><span class="no-drag">투표 만들기</span></div>
                    
                    <div id="edit-vote-area" class="card-body no-drag">
                        <div id="edit-vote-header">
                        	<span id="edit-vote-group-name">정필1팀</span>                        	
                        	<span id="edit-vote-group-nums">
                        		<span>(총 인원&nbsp;</span>
                        		<span id="edit-vote-group-num" class="emphasize-blue">6</span>
                        		<span>명)</span>
                        	</span>
                        </div>
                        <hr>
                        
                        <div id="edit-vote-member">
                            <div id="edit-vote-add-people-area">
                                <div id="vote-add-people">
	                                <span class="eidt-vote-title">인원 추가</span>
	                                <span id="vote-new-member-toggle">
	                                	<i id="vote-member-minus" class="fas fa-minus-circle"></i>
	                                	<span id="vote-new-member-num">1</span><span>명</span>
	                                	<i id="vote-member-plus" class="fas fa-plus-circle"></i>
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

<script type="text/javascript">

	////////// 투표 인원 변경 //////////////////////////////////////////////////////////////////////	
	// 인원추가 - 버튼 토글
	$("#vote-member-minus").on("click", function(){
		var voteAddNum = parseInt($("#vote-new-member-num").text())
		
		if (voteAddNum > 1) {
			voteAddNum -= 1
			$("#vote-new-member-num").text(voteAddNum)
		}
	})
	
	// 인원추가 + 버튼 토글
	$("#vote-member-plus").on("click", function(){
		var voteAddNum = parseInt($("#vote-new-member-num").text())
		
		if (voteAddNum + parseInt($("#edit-vote-group-num").text()) < 15) {
			voteAddNum += 1
			$("#vote-new-member-num").text(voteAddNum)
			
		} else {
			alert("투표 총 인원은 15명을 초과할 수 없습니다.")
		}
	})	
	
	
	// 추가하기 버튼 클릭
	$("#vote-new-member-add-btn").on("click", function(){
		var voteAddNum = parseInt($("#vote-new-member-num").text())
		var totNum = parseInt($("#edit-vote-group-num").text())
		totNum += voteAddNum
		
		// 투표할 인원 div 추가
		
		$("#edit-vote-group-num").text(totNum)
		$("#vote-new-member-num").text(1)
	})
</script>

</body>

</html>