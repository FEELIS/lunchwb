<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>부장님요기요</title>

<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/bujang.png">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Bold-BS4-Responsive-Pricing-Table-Snippet.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style-jw.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/basket-aside.css">

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
<c:import url="/WEB-INF/views/includes/aside/basketAside.jsp" />


<div class="d-flex flex-column" id="content-wrapper">
	<c:import url="/WEB-INF/views/includes/header.jsp" />
    
    <div class="container" id="container">
                
        <div class="flex-nowrap" id="curr-location">
        	<span style="margin-right: 5px;"><i class="fas fa-crosshairs"></i>&nbsp;현위치:</span>
        	<span id="curr-location-address">${curr_location.address}</span>
        	<button class="btn btn-primary" id="location-change-btn" type="button">위치재설정</button>
        </div>
        
        <c:if test="${!empty(curr_location)}">
        	<c:forEach var="basketItems" items="${basket}">
            	<c:if test="${basketItems.key == curr_basket_group}">
            		<c:set var="stores" value="${basketItems.value}" />
            		<c:if test="${fn:length(stores)==0}">
            			<div class='d-inline-flex justify-content-center align-items-center' id='no-store'>
                    		<div>
                    			<span class='d-block justify-content-center' id='no-store-alert-1'>주변에 추천 가능한 가게가 없어요</span>
                    			<span class='d-flex justify-content-center' id='no-store-alert-2'>현재 위치나 필터를 확인해주세요</span>
                    		</div>
                		</div>
            		</c:if>		
             	</c:if>
             </c:forEach>
        </c:if>
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
                    	<span id="modal-curr-location">${curr_location.address}</span>
                    	<button class="btn btn-primary float-end" id="modal-curr-location-btn" type="button">현위치</button>
                    </div>
                    <div id="write-location-box">
                    	<span class="d-inline-block">직접 입력하기:</span>
                    	<input type="text" class="location-search-bar" readonly>
                    	<button class="btn btn-primary align-items-center location-search-bar" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </div>
            <div class="modal-footer modal-footer-custom">
            	<button id="modal-gps-submit" class="btn btn-primary" type="button">저장</button>
            	<button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

</div>

<script type="text/javascript">

// basketAside에서 사용(나는 index.jsp임)
indexJSP = true

// 위치재설정 버튼 클릭 시 > 모달 텍스트 불러옴 + 모달 보여주게
$("#location-change-btn").on("click", function(){
	console.log(countBasketItems(curr_basket_group))
	var curr_address = ""
	
	// 모달 내부에 표시될 현재 위치 불러오기
	if (gpsVo.address == "") {
		curr_address = "현재 위치를 설정해주세요"
		
	} else {
		curr_address = gpsVo.address
	}
	
	// 모달에 내용 표시하고 보여주기
	$("#modal-curr-location").text(curr_address)
	$("#modal-location-change").modal("show")
	// 모달 밖 클릭해도 안닫히게 하고 싶은데 잘 닫힘
	$("#modal-location-change").modal({
		backdrop: 'static'
	})
})


// gps에 저장할 위치를 현재 위치로 재설정
$("#modal-curr-location-btn").on("click", function(){
	curr_location()
})


// 직접 주소 검색하기
$(".location-search-bar").on("click", function(){			
	DaumPostcode()
})


// Daum 주소 api 불러오는 함수
   function DaumPostcode() {
      new daum.Postcode({
          oncomplete: function(data) {
        	  // 검색해서 클릭한 주소로 모달에 표시되는 주소도 변경
              $("#modal-curr-location").text(data.jibunAddress)
          }
      }).open()
   }


// 주소 변경 모달에서 확인 클릭시 > 주소 변경, 위도 경도 불러오기, 세션에 저장
$("#modal-gps-submit").on("click", function(){
	// 주소가 변경되었다면
	if ($("#curr-location-address").text() != $("#modal-curr-location").text()) {
		var gpsChangeOK = confirm("현재 위치 변경 시 현재 저장한 점심 후보가 초기화됩니다. 정말로 변경하시겠습니까?")

		if (!gpsChangeOK) {
			return false
		}
		
		// 카카오 api 주소 > 위도경도 찾기
		var geocoder = new kakao.maps.services.Geocoder()
		   geocoder.addressSearch($("#modal-curr-location").text(), async function(result, status) {

		   if (status === kakao.maps.services.Status.OK) {
			    // 전역변수 gpsVo에 변경된 위도, 경도, 주소 저장
			    gpsVo.gpsX = result[0].x
			    gpsVo.gpsY = result[0].y
		        gpsVo.address = $("#modal-curr-location").text()
		        
		        // 세션에 gps저장
		        await setGPS(gpsVo)
			    await clearBasket()
		   	  } 
		});  
		
		// 모달 숨기고 알림
		$("#modal-location-change").modal("hide")
		
		sleep(100)
		alert("현재 위치가 변경되었습니다.")
		
		sleep(300)
		// 페이지 다시 로드하기
		location.replace("${pageContext.request.contextPath}/")
		
	} else {
		// 주소 변경 안했으면 얌전히 모달만 닫기
		$("#modal-location-change").modal("hide")
	}
})


// 장바구니 아예 비워버리는 함수
async function clearBasket() {
	$.ajax({
		url : "${pageContext.request.contextPath}/basket/clearBasket",		
		type : "post",
		async : false,
		success : function() {
			console.log("장바구니 비우기 완료")
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	})
}


// 주변에 가게가 하나도 없을 때 html 그려주는 함수
function noStore() {
	if (indexJSP) {
		$("#container").append(
			  "<div class='d-inline-flex justify-content-center align-items-center' id='no-store'>"
            + 	"<div>"
            +   	"<span class='d-block justify-content-center' id='no-store-alert-1'>주변에 추천 가능한 가게가 없어요</span>"
            +       "<span class='d-flex justify-content-center' id='no-store-alert-2'>현재 위치나 필터를 확인해주세요</span>"
            +   "</div>"
            + "</div>"
		)
	}
}

	
</script>

</body>

</html>