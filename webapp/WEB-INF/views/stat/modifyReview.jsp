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
    <link href="${pageContext.request.contextPath}/assets/css/notification.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/yogiyo.css" rel="stylesheet" type="text/css">


    <!-- fonts -->
    <link href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css" rel="stylesheet" type="text/css">

    <!-- js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>


    <title>따로갔어요~ 수정폼</title>
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
                <div>
                    <div class="container-fluid">
                        <h1 class="font-weight-bold">리뷰남기기</h1>
                        <hr />
                        <form id="contactForm-1" action="javascript:void(0);" method="get">
                            <input class="form-control" type="hidden" name="Introduction" value="This email was sent from www.awebsite.com" />
                            <input class="form-control" type="hidden" name="subject" value="Awebsite.com Contact Form" />
                            <input class="form-control" type="hidden" name="to" value="email@awebsite.com" />
                            <div class="row">
                                <div class="col-md-6">
                                    <div id="successfail-1"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-3">
                                    <img src="${pageContext.request.contextPath}/upload/${aloneVo.reviewFileName}" class="img-fluid">
                                </div>
                                <div id="message-1" class="col-12 col-md-6">
                                    <h2 class="h4">
                                        <i class="fas fa-utensils"></i>
                                        ${aloneVo.storeName}
                                        <small>
                                            <small class="required-input">${aloneVo.menu1stCateName}/${aloneVo.menuName}</small>
                                        </small>
                                    </h2>
                                    <div class="form-group mb-3">
                                        <label class="form-label" for="from-name">${aloneVo.storeRoadAddress}</label>
                                        <span class="required-input">*</span>
                                        <div class="input-group col-auto">
                                            <span class="input-group-text"> 
                                           	 <i class="fa fa-user"></i>
                                            </span> 
                                            <input id="from-name-1" class="form-control bg-white" type="text" name="name" value="${aloneVo.userName}" readonly="readonly" required />
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="form-label" for="from-file">이미지를 선택해주세요</label>
                                        <span class="required-input">*</span>
                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <i class="fa fa-file"></i></span>
                                            <input id="from-file-1" class="form-control-file" type="file" name="file" required value="${pageContext.request.contextPath}/upload/${aloneVo.reviewFileName}"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-12 col-lg-6">
                                            <div class="form-group mb-3">
                                                <label class="form-label" for="from-calltime">별점</label>
                                                <div class="input-group col-auto">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="fa fa-star"></i></span>
                                                    </div>
												<ul class="list-inline form-control">
													<li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
													<li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
													<li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
													<li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
													<li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
												</ul>	
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-12 col-lg-6">
                                            <div class="form-group mb-3 col-auto">
                                                <label class="form-label" for="from-calltime">함께한 그룹</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <i class="fa fa-users"></i>
                                                        </span>
                                                    </div>
													<input id="from-name-1" class="form-control bg-white" type="text" name="name" value="${aloneVo.groupName}" 
													readonly="readonly" required />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="form-label" for="from-comments">리뷰</label>
                                        <textarea id="from-comments-1" class="form-control" name="comments" placeholder="리뷰를 남겨주세요" rows="5"></textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <button class="btn btn-primary d-block w-100" type="button" onclick="location.href='${pageContext.request.contextPath}/stat/reviewList'">
                                                    <i class="fa fa-chevron-circle-left "></i> 리뷰내역으로 돌아가기
                                                </button>
                                            </div>
                                            <div class="col">
                                                <button class="btn btn-primary d-block w-100" type="submit">
                                                    리뷰수정하기 <i class="fa fa-chevron-circle-right"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="d-flex d-md-none" />
                                </div>
                            </div>
                        </form>
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
</html>