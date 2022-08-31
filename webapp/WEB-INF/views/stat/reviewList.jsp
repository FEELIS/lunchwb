<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta name="og:type" content="article">

    <!-- 파비콘 -->
    <link href="${pageContext.request.contextPath}/assets/img/bujang.png" rel="shortcut icon" type="image/x-icon">

    <!-- css -->
    <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/yogiyo.css" rel="stylesheet" type="text/css">


    <!-- fonts -->
    <link href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css" rel="stylesheet" type="text/css">

    <!-- js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>


    <title>리뷰내역</title>
</head>

<body>
    <div id="wrapper">
        <!-- aside -->
        <c:import url="/WEB-INF/views/includes/aside/userAside.jsp"></c:import>
        <!-- /aside -->

        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">

                <!-- header -->
                <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
                <!-- /header -->



                <div class="container">
                    <div class="d-sm-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-dark mb-0">리뷰내역</h3>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 mx-auto">

                            <!-- List group-->
                            <ul class="list-group shadow">
                                <div id="revList" class="container mb-2">
                                </div>
                            </ul>
                            <!-- End -->
                        </div>
                    </div>
                </div>


            </div>
            <!-- content -->


            <!-- footer -->
            <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
            <!-- /footer -->
        </div>
        <!-- content-wrapper -->
    </div>
    <!-- wrapper -->
</body>
<script type="text/javascript">
    $(document).ready(function() {
        console.log("jquery로 데이터 받기");
        fetchList();
    });



    //====================================== 리뷰 목록 ======================================
    function fetchList() {
        var userNo = '${authUser.userNo}';

        // = 없으면 오류
        var aloneVo = {
            userNo: userNo
        };

        $.ajax({
            url: "${pageContext.request.contextPath}/stat/showReviewList",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(aloneVo),

            dataType: "json",
            success: function(reviewList) {
                /*성공시 처리해야될 코드 작성*/
                console.log(reviewList);
                //화면에 data + html을 그린다.
                for (var i = 0; i < reviewList.length; i++) {
                    render(reviewList[i], "down");
                }
            },
            error: function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        })
        // ajax 
    };

    function render(aloneVo, opt) {
        console.log('render()');
        var str = '';

        str += '	<li id="t' + aloneVo.reviewNo + '" class="list-group-item">';
        str += '		<div class="media align-items-lg-center flex-column flex-lg-row p-3">';
        str += '			<div class="media-body order-2 order-lg-1">';
        str += '				<h5 class="mt-0 font-weight-bold mb-2"><i class="fas fa-utensils"></i> ' + aloneVo.storeName + '</h5>';
        str += '				<p class="font-italic text-muted mb-0 small">' + aloneVo.storeRoadAddress + '</p>';
        str += '				<div class="d-flex align-items-center justify-content-between mt-1">';
        str += '					<h6 class="font-italic text-muted mb-0 small">여기갈래요 '+ aloneVo.visitedCount+'회/'+aloneVo.ageGroup+' 그룹 선호 가게</h6>';
        str += '					<ul class="list-inline small">';
        
        
        // 별점 추가
        for (var i = 1; i <= 5; i++) {
			if (aloneVo.userScore<i) {
        str += '						<li class="list-inline-item m-0"><i class="far fa-star text-warning"></i></li>';	// light
				
			} else {
        str += '						<li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>';	// solid

			}
		};
		
        str += '					</ul>';
        str += '				</div>';
        str += '			</div>';
        str += '			<div class="row row-cols-2">';

        if (aloneVo.reviewFileName != null) {
            str += '					<div class="col-2">';
            str += '						<img src="${pageContext.request.contextPath}/upload/' + aloneVo.reviewFileName + '" alt="이미지 없음" width="200" class="ml-lg-5 order-1 order-lg-2">';
            str += '					</div>';
        } else {
            str += '					<div class="col-2">';
            str += '						<img src="${pageContext.request.contextPath}/assets/img/noimg.jpg" alt="이미지 없음" width="200" class="ml-lg-5 order-1 order-lg-2">';
            str += '					</div>';
        }

        str += '				<div id="loading" class="col-9 bg-light border rounded border-light jumbotron py-3 px-4">';
        str += '					<div>' + aloneVo.reviewContent + '</div>';
        str += '				</div>';
        str += '				<div class="col-1">';
        str += '					<a href="${pageContext.request.contextPath}/stat/modifyReview/' + aloneVo.reviewNo + '">';
        str += '						<button class="btn-primary m-1">수정</button>';
        str += '					</a>';
        str += '						<button class="btnRevDel btn-danger m-1" data-rno="' + aloneVo.reviewNo + '">삭제</button>';
        str += '				</div>';
        str += '			</div>';
        str += '		</div>';
        str += '	</li>';



        //리스트 순서
        if (opt == "up") {
            $("#revList").prepend(str);
        } else if (opt == "down") {
            $("#revList").append(str);
        } else {
            console.log("opt오류");
        }
    };

    //====================================== 선택한 리스트 삭제 ======================================
    $("ul").on("click", ".btnRevDel", function() {
        var $this = $(this);
        var reviewNo = $this.data("rno");

        var aloneVo = {
            reviewNo: reviewNo
        };

        $.ajax({
            url: "${pageContext.request.contextPath}/stat/deleteReview",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(aloneVo),

            dataType: "json",
            success: function(result) {
                console.log("deleteReview");
                console.log(result);
                if (result == "true") {
                    $("#t" + reviewNo).remove();
                }
            },
            error: function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
        // ajax 

    });
</script>

</html>
