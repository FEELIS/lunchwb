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
             	<a><span class="d-inline-block" id="basket-findpw-link">비밀번호 찾기</span></a>
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
                <table class="table">
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <td id="basket-table-button-area" colspan="2">
                            	<i class="fas fa-filter" id="basket-filter-btn"></i>
                            	<button class="btn btn-primary d-inline-block" id="basket-another-stores-btn" type="button">다른 가게 추천 받기</button>
                            </td>
                        </tr>
                        <tr>
                            <td id="basket-no-items" colspan="2">점심 후보를 추가해주세요</td>
                        </tr>
                        <tr>
                            <td class="d-xxl-flex justify-content-xxl-start basket-table-cell">
                                <div class="basket-table-store-info">
                                	<span class="text-start basket-table-store-name">써브웨이 서울대점</span>
                                	<span class="text-start basket-table-store-detail">샌드위치 / 251m</span>
                                </div>
                            </td>
                            <td class="basket-table-del-cell">
                            	<i class="fas fa-minus-circle d-xxl-flex basket-del-btn"></i>
                            </td>
                        </tr>
                        <tr>
                            <td class="d-xxl-flex justify-content-xxl-start basket-table-cell">
                                <div class="basket-table-store-info">
                                	<span class="text-start basket-table-store-name">맥도날드 신림점</span>
                                	<span class="text-start basket-table-store-detail">햄버거 / 320m</span>
                                </div>
                            </td>
                            <td class="basket-table-del-cell">
                            	<i class="fas fa-minus-circle d-xxl-flex basket-del-btn"></i>
                            </td>
                        </tr>
                        <tr>
                            <td class="d-xxl-flex justify-content-xxl-start basket-table-cell">
                                <div class="basket-table-store-info">
                                	<span class="text-start basket-table-store-name">양자강</span>
                                	<span class="text-start basket-table-store-detail">중국요리 / 520m</span>
                                </div>
                            </td>
                            <td class="basket-table-del-cell">
                            	<i class="fas fa-minus-circle d-xxl-flex basket-del-btn"></i>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <div id="basket-button-area">
            	<button class="btn btn-primary" id="basket-vote-btn" type="button">투표하기</button>
            	<button class="btn btn-primary" id="basket-random-btn" type="button">랜덤선택</button>
            </div>
        </div>
    </div>
</nav>

<div class="modal fade row-cols-md-6 md" role="dialog" tabindex="-1" id="modal-recFilter">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header text-primary modal-header-custom">
            	<span>필터를 선택해주세요&nbsp;<i class="fas fa-check"></i></span>
            	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <div class="modal-body text-center text-dark" style="font-size: 14px;">
                <div class="row">
                    <div class="col" style="border-right: 1px solid voar(--bs-gray-200);">
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-1" checked="checked"><label class="form-check-label" for="formCheck-1">뷔페</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-2" checked="checked"><label class="form-check-label" for="formCheck-6">아시아음식</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-3" checked="checked"><label class="form-check-label" for="formCheck-5">양식</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-4" checked="checked"><label class="form-check-label" for="formCheck-4">일식</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-5" checked="checked"><label class="form-check-label" for="formCheck-3">한식</label></div>
                    </div>
                    <div class="col" style="border-right: 1px solid voar(--bs-gray-200);">
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-6" checked="checked"><label class="form-check-label" for="formCheck-6">패스트푸드</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-7" checked="checked"><label class="form-check-label" for="formCheck-7">패밀리레스토랑</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-8" checked="checked"><label class="form-check-label" for="formCheck-8">치킨</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-9" checked="checked"><label class="form-check-label" for="formCheck-9">분식</label></div>
                        <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-10" checked="checked"><label class="form-check-label" for="formCheck-10">중식</label></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer modal-footer-custom">
            	<button id="modal-filter-submit" class="btn btn-primary" type="button">저장</button>
            	<button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
	var userNo = ""
	var basket = ""
	var basket_group = 0
	
	
	// 페이지 로드 시
	$(document).ready(function(){
		userNo = "${authUser.userNo}"
		
		if (userNo == "") {
			console.log("비로그인 회원")
		} else {
			console.log(userNo + "번 회원")
			
			// 그룹 불러오기
		 	$.ajax({
				url : "${pageContext.request.contextPath}/basket/getBasketGroup",		
				type : "post",
				contentType : "application/json",
				async: false,
				data : JSON.stringify(userNo),
				dataType : "json",
				success : function(basketGroup){
					for (var i = 0; i < basketGroup.length; i++) {
						addBasketGroup(basketGroup[i])
						
						if (i == 0) {
							basket_group = basketGroup[i].groupNo
							$(".basket-group").addClass("basket-selected-group")
						}
					}
					
					if (basketGroup.length < 4) {
						$("#basket-groups").append(
							"<div class=\"basket-group no-drag basket-group-add\"><span>그룹추가</span><i class=\"fas fa-user-plus\"></i></div>"
						)
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			}); 
		}
	})

	
	// 다른 그룹 클릭
	$("#basket-groups").on("click", ".basket-normal-group", function(){
		$(this).addClass("basket-selected-group")
		$("[data-groupNo=" + basket_group + "]").removeClass("basket-selected-group")
		
		basket_group = $(this).attr("data-groupNo")
	})	
	
	
	// 그룹 추가 버튼 클릭
	$("#basket-groups").on("click", ".basket-group-add", function(){
		location.replace("${pageContext.request.contextPath}/group/add")
	})
	
	
	// 장바구니 필터 클릭 시
	$("#basket-filter-btn").on("click", function(){
		$("#modal-recFilter").modal("show")
	})
	
	
	// 장바구니 필터 적용
	$("#modal-filter-submit").on("click", function(){
		// 뭔가 ajax로 알고리즘을 적용 한 뒤
		
		$("#modal-recFilter").modal("hide")
	})
	
	
	// 그룹 목록 불러오기 메소드
	function addBasketGroup(basketGroup) {
		$("#basket-groups").append(
			"<div class=\"basket-group basket-normal-group no-drag\" data-groupNo=\"" + basketGroup.groupNo + "\"><span>" + basketGroup.groupName + "</span><i class=\"fas fa-user-circle\"></i></div>"
		)
	}
	
	
	// 장바구니 추가하기 메소드
	function addToBasket(store) {
		
	}
	
	
	// 장바구니에서 삭제하기 메소드
	function deleteFromBasket(store) {
		
	}

</script>

</html>