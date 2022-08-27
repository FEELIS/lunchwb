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
<c:import url="/WEB-INF/views/includes/aside/rouletteAside.jsp" />


<div class="d-flex flex-column" id="content-wrapper" style="position: relative;">
    <div class="container" id="container" style="max-width: 1920px;height: auto;margin: 0;padding: 0;">
        <div id="header-1">
            <c:import url="/WEB-INF/views/includes/header.jsp" />
        </div>
        
       <div style="margin-top: 100px;" align="center">
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>
                        <div class="power_controls">
                            <img id="spin_button" src="${pageContext.request.contextPath}/assets/img/rouletteOn.png" alt="Spin" onClick="startSpin();" />
                        </div>
                    </td>
                    <td width="620" height="500" class="the_wheel" align="center" valign="center">
                        <canvas id="canvas" width="620" height="800">
                            <p style="{color: white}" align="center">Sorry, your browser doesn't support canvas. Please try another.</p>
                        </canvas>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>

</div>

</body>

<script type="text/javascript">

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
	
	
	let countbas;
	let theWheel;
	// 룰렛
	// Create new wheel object specifying the parameters at creation time.
	
	setTimeout(() => {
		countbas = countBasketItems(curr_basket_group);
	      
	      if(countbas == 3){
	    	  theWheel = new Winwheel({
	              
	              'numSegments'  : countbas,     // Specify number of segments.
	              'outerRadius'  : 305,   // Set outer radius so wheel fits inside the background.
	              'textFontSize' : 18,    // Set font size as desired.
	              'segments'     :        // Define segments including colour and text.
	              [ 
	                    {'fillStyle' : '#36b9cc', 'text' : basket[curr_basket_group][0].storeName, 'storeNo' : basket[curr_basket_group][0].storeNo},
	                    {'fillStyle' : '#f6c23e', 'text' : basket[curr_basket_group][1].storeName, 'storeNo' : basket[curr_basket_group][1].storeNo},
	                    {'fillStyle' : '#1cc88a', 'text' : basket[curr_basket_group][2].storeName, 'storeNo' : basket[curr_basket_group][2].storeNo}
	              ],
	              'animation' :           // Specify the animation to use.
	              {
	                  'type'     : 'spinToStop',
	                  'duration' : 5,     // Duration in seconds.
	                  'spins'    : 10,     // Number of complete spins.
	                  'callbackFinished' : alertPrize
	              },
	              'pins' :    // Specify pin parameters.
	              {
	                  'number'      : 18,
	                  'outerRadius' : 5,
	                  'margin'      : 10,
	                  'fillStyle'   : '#7734c3',
	                  'strokeStyle' : '#ffffff'
	              }
	           });
	      }else if (countbas == 2){
	    	  theWheel = new Winwheel({
	              
	              'numSegments'  : countbas,     // Specify number of segments.
	              'outerRadius'  : 305,   // Set outer radius so wheel fits inside the background.
	              'textFontSize' : 18,    // Set font size as desired.
	              'segments'     :        // Define segments including colour and text.
	              [ 
	                    {'fillStyle' : '#36b9cc', 'text' : basket[curr_basket_group][0].storeName},
	                    {'fillStyle' : '#f6c23e', 'text' : basket[curr_basket_group][1].storeName}
	              ],
	              'animation' :           // Specify the animation to use.
	              {
	                  'type'     : 'spinToStop',
	                  'duration' : 5,     // Duration in seconds.
	                  'spins'    : 10,     // Number of complete spins.
	                  'callbackFinished' : alertPrize
	              },
	              'pins' :    // Specify pin parameters.
	              {
	                  'number'      : 18,
	                  'outerRadius' : 5,
	                  'margin'      : 10,
	                  'fillStyle'   : '#7734c3',
	                  'strokeStyle' : '#ffffff'
	              }
	           });
	      }
	}, 400);


    // Vars used by the code in this page to do power controls.
    let wheelSpinning = false;

    // -------------------------------------------------------
    // Click handler for spin button.
    // -------------------------------------------------------
    function startSpin()
    {
        if (wheelSpinning == false) {
        	 // This formula always makes the wheel stop somewhere inside prize 3 at least
            // 1 degree away from the start and end edges of the segment.
            let stopAt = (91 + Math.floor((Math.random() * 43)))
     
            // Important thing is to set the stopAngle of the animation before stating the spin.
            theWheel.animation.stopAngle = stopAt;
			
        	console.log("stopAt = " + stopAt);
        	console.log("basket = " + "${basket}");
            // Disable the spin button so can't click again while wheel is spinning.
            document.getElementById('spin_button').src       = "${pageContext.request.contextPath}/assets/img/rouletteOff.png";
            document.getElementById('spin_button').className = "";

            // Begin the spin animation by calling startAnimation on the wheel object.
            theWheel.startAnimation();

            // Set to true so that power can't be changed and spin button re-enabled during
            // the current animation. The user will have to reset before spinning again.
            wheelSpinning = true;
        }
        
        // May as well start the spin from here.
    }
    
    // -------------------------------------------------------
    // Called when the spin animation has finished by the callback feature of the wheel because I specified callback in the parameters
    // note the indicated segment is passed in as a parmeter as 99% of the time you will want to know this to inform the user of their prize.
    // -------------------------------------------------------
    function alertPrize(indicatedSegment)
    {
        // Do basic alert of the segment text. You would probably want to do something more interesting with this information.
        console.log("끝나는각도 = " + theWheel.animation.stopAngle)
        
        if(confirm("오늘 방문할 가게는 [" + indicatedSegment.text +"] 입니다. \n방문하시겠습니까?" ) == false){
        	wheelSpinning = false
        	
        	document.getElementById('spin_button').src       = "${pageContext.request.contextPath}/assets/img/rouletteOn.png";
            document.getElementById('spin_button').className = "";
            
            theWheel.stopAnimation(false);  // Stop the animation, false as param so does not call callback function.
            theWheel.rotationAngle = 0;     // Re-set the wheel angle to 0 degrees.
            theWheel.draw();                // Call draw to render changes to the wheel.
            
        	return false
        }
        
        if(modalSelectMembers(indicatedSegment.storeNo, curr_basket_group) == false){
			return false
		}
        
    }
	
</script>

</html>