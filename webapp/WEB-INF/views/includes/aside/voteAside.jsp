<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
</head>

<body>

<nav id="vote-aside" class="navbar navbar-light bg-white text-center d-xxl-flex align-items-start justify-content-xxl-center sidebar accordion p-0">
	<div class="container-fluid d-flex flex-column p-0">
		<div id="bujang-logo-wrap">
        	<a href="${pageContext.request.contextPath}/" class="no-drag"><img data-bss-hover-animate="pulse" id="bujang-logo-blue" class="no-drag" src="${pageContext.request.contextPath}/assets/img/bujang-logo%20blue.png"></a>
        </div>
        
        <div id="vote-countdown-box" class="no-drag">
	        <div id="countdown-voting-group" class="justify-content-center align-items-center align-content-center">
	        	<span class="d-inline-block only-bold">정필1팀</span>
	        	<span class="d-inline-block">&nbsp;점심 투표</span>
	        </div>
	        
	        <div id="vote-countdown-times">
	            <div class="d-xxl-flex justify-content-center align-items-center  align-content-center justify-content-xxl-center align-items-xxl-center" id="vote-countdown-end-time">
	            	<span class="countdown-label">종료 시각</span>
	            	<span class="countdown-time">11시 45분</span>
	            </div>
	            <div class="d-xxl-flex justify-content-center align-items-center align-content-center justify-content-xxl-center align-items-xxl-center" id="vote-countdown-remain-time">
	            	<span class="countdown-label">남은 시간</span>
	            	<span class="countdown-time">00:11:27</span>
	            </div>
	        </div>
	    </div>
	    
	    <div id="vote-select-name-area">
	        <div id="label-select-name"><span class="no-drag">이름을 선택해주세요</span></div>
	        <div id="vote-select-names" class="d-flex d-xxl-flex flex-wrap justify-content-xxl-start">
	        	<button class="btn btn-primary disabled text-center vote-voted-name" type="button" disabled="disabled">이지희</button>
	        	<button class="btn btn-primary text-center vote-select-name-btn vote-selected-name" type="button">김준호</button>
	        	<button class="btn btn-primary disabled text-center vote-voted-name" type="button" disabled="disabled">최정필2</button>
	        	<button class="btn btn-primary text-center vote-select-name-btn" type="button">뻐꾸기</button>
	        	<button class="btn btn-primary text-center vote-select-name-btn" type="button">도요새</button>
	        </div>
	    </div>
	    
	    <div style="width: 100%;">
	        <div class="text-start d-flex basket-aside-title"><span class="d-inline-block no-drag">오늘의 점심 후보</span></div>
	        
	        <div class="table-responsive no-drag" id="basket-table">
	            <table class="table no-drag" id="basket-table">
                    <tr>
                        <td class="d-xxl-flex justify-content-xxl-start basket-table-cell">
                            <div class="basket-table-store-info">
                            	<span class="text-start basket-table-store-name">써브웨이 서울대점</span>
                            	<span class="text-start basket-table-store-detail">샌드위치 / 251m</span>
                            </div>
                        </td>
                        <td class="basket-vote-btn-cell">
                        	<button class="btn btn-primary vote-vote-btn align-items-center" type="button">투표하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="d-xxl-flex justify-content-xxl-start basket-table-cell">
                            <div class="basket-table-store-info">	
                            	<span class="text-start basket-table-store-name">맥도날드 신림점</span>
                            	<span class="text-start basket-table-store-detail">햄버거 / 320m</span>
                            </div>
                        </td>
                        <td class="basket-vote-btn-cell">
                        	<button class="btn btn-primary vote-vote-btn align-items-center" type="button">투표하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="d-xxl-flex justify-content-xxl-start basket-table-cell">
                            <div class="basket-table-store-info">
                            	<span class="text-start basket-table-store-name">양자강</span>
                            	<span class="text-start basket-table-store-detail">중국요리 / 520m</span>
                            </div>
                        </td>
                        <td class="basket-vote-btn-cell">
                        	<button class="btn btn-primary vote-vote-btn align-items-center" type="button">투표하기</button>
                        </td>
                    </tr>
	            </table>
	        </div>
	      
	        <div id="vote-leader-btn-area" class="d-xxl-flex justify-content-center align-items-center">
	        	<button class="btn btn-danger d-flex d-xxl-flex justify-content-center align-items-center align-content-center" id="vote-leader-modify-btn" type="button">투표 수정하기</button>
	        	<button class="btn btn-danger d-flex d-xxl-flex justify-content-center align-items-center align-content-center" id="vote-leader-cancel-btn" type="button" data-bs-target="#vote-link-modal" data-bs-toggle="modal">투표 취소하기</button>
	        </div>
	        
	        <div class="justify-content-center align-items-center" id="vote-member-btn-area">
	        	<button class="btn btn-danger d-flex d-xxl-flex justify-content-center align-items-center align-content-center justify-content-xxl-center align-items-xxl-start" id="vote-member-escape-btn" type="button">다른 사람들이랑 먹을래요</button>
	        </div>
	    </div>
	</div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script type="text/javascript">

	// 클라이언트 ip 불러오기
	async function getIpClient() {
	  try {
	    const response = await axios.get('https://api.ipify.org?format=json');
	    console.log(response["data"]["ip"]);
	  } catch (error) {
	    console.error(error);
	  }
	}
</script>

</body>

</html>