<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/customModal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/storeInfo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/roulette.css" type="text/css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>


<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/Winwheel.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
</head>


<body>

<div id="wrapper">
<c:import url="/WEB-INF/views/includes/aside/basketAside.jsp" />


<div class="d-flex flex-column" id="content-wrapper" style="position: relative;">
    <div class="container" id="container" style="max-width: 1920px;height: auto;margin: 0;padding: 0;">
        <div id="header-1">
            <c:import url="/WEB-INF/views/includes/header.jsp" />
        </div>
        
        <div class="flex-nowrap no-drag" id="curr-location">
        	<span style="margin-right: 5px;" class="no-drag"><i class="fas fa-crosshairs no-drag"></i>&nbsp;현위치:</span>
        	<span id="curr-location-address">${curr_location.address}</span>
        	<button class="btn btn-primary no-drag" id="location-change-btn" type="button">위치재설정</button>
        </div>
        
       <div align="center">
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>
                        <div class="power_controls">
                            <img id="spin_button" src="${pageContext.request.contextPath}/assets/img/rouletteOn.png" alt="Spin" onClick="startSpin();" />
                        </div>
                    </td>
                    <td width="438" height="582" class="the_wheel" align="center" valign="center">
                        <canvas id="canvas" width="434" height="434">
                            <p style="{color: white}" align="center">Sorry, your browser doesn't support canvas. Please try another.</p>
                        </canvas>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>

<!-- 위치 재설정 모달 -->
<div id="modal-location-change" class="modal fade" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom-color: rgb(255,255,255);">
                    <h4 class="modal-title no-drag">현재 위치 설정</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <div class="modal-body">
                <div><span class="no-drag">출발 위치를 선택해주세요.</span>
                    <div id="modal-curr-location-box">
                    	<span class="emphasize-blue no-drag">현재 설정 위치:&nbsp;</span>
                    	<span id="modal-curr-location" class="no-drag">${curr_location.address}</span>
                    	<button class="btn btn-primary float-end" id="modal-curr-location-btn" type="button">현위치</button>
                    </div>
                    <div id="write-location-box" class="no-drag">
                    	<span class="d-inline-block no-drag">직접 입력하기:</span>
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

</body>

<script type="text/javascript">
	indexJSP = true

	// 위치재설정 버튼 클릭 시
	$("#location-change-btn").on("click", function(){
		var curr_address = ""
		
		if (gpsVo.address == "") {
			curr_address = "현재 위치를 설정해주세요"
			
		} else {
			curr_address = gpsVo.address
		}
		
		$("#modal-curr-location").text(curr_address)
		$("#modal-location-change").modal("show")
		$("#modal-location-change").modal( {
			backdrop: 'static'
		})
	})
	
	
	// 현위치로 재설정
	$("#modal-curr-location-btn").on("click", function(){
		curr_location()
	})
	
	
	// 주소 검색하기
	$(".location-search-bar").on("click", function(){			
		DaumPostcode()
	})
	
	
	// 주소 api
    function DaumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
               $("#modal-curr-location").text(data.jibunAddress)
           }
       }).open()
    }
	
	
	// 모달 닫힐 때 페이지 로드
	$("#modal-gps-submit").on("click", function(){
		if ($("#curr-location-address").text() != $("#modal-curr-location").text()) {
			var gpsChangeOK = confirm("현재 위치 변경 시 현재 저장한 점심 후보가 초기화됩니다. 정말로 변경하시겠습니까?")

			if (!gpsChangeOK) {
				return false
			}
			
			var geocoder = new kakao.maps.services.Geocoder()
			   geocoder.addressSearch($("#modal-curr-location").text(), async function(result, status) {

			   if (status === kakao.maps.services.Status.OK) {
				    gpsVo.gpsX = result[0].x
				    gpsVo.gpsY = result[0].y
			        gpsVo.address = $("#modal-curr-location").text()
			        
			        await setGPS(gpsVo)
				    await clearBasket()
			   	  } 
			});  
			
			$("#modal-location-change").modal("hide")
			sleep(100)
			alert("현재 위치가 변경되었습니다.")
			
			sleep(100)
			location.replace("${pageContext.request.contextPath}/")
			
		} else {
			$("#modal-location-change").modal("hide")
		}
	})
	
	
	// 장바구니 비우기
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
	
	
	// 주변에 가게가 하나도 없을 때 창
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
	
	// 룰렛
	// Create new wheel object specifying the parameters at creation time.
	
	
    let theWheel = new Winwheel({
        'numSegments'  : 3,     // Specify number of segments.
        'outerRadius'  : 212,   // Set outer radius so wheel fits inside the background.
        'textFontSize' : 28,    // Set font size as desired.
        'segments'     :        // Define segments including colour and text.
        [ 
	        	{'fillStyle' : '#eae56f', 'text' : '바스켓배열을어떻게불어와야할까요'},
	            {'fillStyle' : '#89f26e', 'text' : '바스켓배열을어떻게불어와야할까요'},
	            {'fillStyle' : '#7de6ef', 'text' : 'b'},
           
        ],
        'animation' :           // Specify the animation to use.
        {
            'type'     : 'spinToStop',
            'duration' : 5,     // Duration in seconds.
            'spins'    : 8,     // Number of complete spins.
            'callbackFinished' : alertPrize
        }
    });

    // Vars used by the code in this page to do power controls.
    let wheelSpinning = false;

    // -------------------------------------------------------
    // Click handler for spin button.
    // -------------------------------------------------------
    function startSpin()
    {
        // Ensure that spinning can't be clicked again while already running.
        if (wheelSpinning == false) {
            // Based on the power level selected adjust the number of spins for the wheel, the more times is has
            // to rotate with the duration of the animation the quicker the wheel spins.
            theWheel.animation.spins = 8;

            // Disable the spin button so can't click again while wheel is spinning.
            document.getElementById('spin_button').src       = "${pageContext.request.contextPath}/assets/img/rouletteOff.png";
            document.getElementById('spin_button').className = "";

            // Begin the spin animation by calling startAnimation on the wheel object.
            theWheel.startAnimation();

            // Set to true so that power can't be changed and spin button re-enabled during
            // the current animation. The user will have to reset before spinning again.
            wheelSpinning = true;
        }
    }

    // -------------------------------------------------------
    // Function for reset button.
    // -------------------------------------------------------
    function resetWheel()
    {
        theWheel.stopAnimation(false);  // Stop the animation, false as param so does not call callback function.
        theWheel.rotationAngle = 0;     // Re-set the wheel angle to 0 degrees.
        theWheel.draw();                // Call draw to render changes to the wheel.

        document.getElementById('pw1').className = "";  // Remove all colours from the power level indicators.
        document.getElementById('pw2').className = "";
        document.getElementById('pw3').className = "";

        wheelSpinning = false;          // Reset to false to power buttons and spin can be clicked again.
    }

    // -------------------------------------------------------
    // Called when the spin animation has finished by the callback feature of the wheel because I specified callback in the parameters
    // note the indicated segment is passed in as a parmeter as 99% of the time you will want to know this to inform the user of their prize.
    // -------------------------------------------------------
    function alertPrize(indicatedSegment)
    {
        // Do basic alert of the segment text. You would probably want to do something more interesting with this information.
        alert("You have won " + indicatedSegment.text);
    }
	
</script>

</html>