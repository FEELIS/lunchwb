<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>부장님여기요</title>
    <link rel="stylesheet" href="../../../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&amp;display=swap">
    <link rel="stylesheet" href="../../../assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="../../../assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="../../../assets/css/Features-Large-Icons-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="../../../assets/css/yogiyo.css">
    <link rel="stylesheet" href="../../../assets/css/visited.css">
</head>
<body>

<div id="wrapper">
    <nav id="visited-aside" class="navbar navbar-light bg-white text-center d-xxl-flex align-items-start justify-content-xxl-center sidebar accordion p-0">
        <div class="container-fluid d-flex flex-column p-0">
            <div id="header-logo"><img id="bujang-logo-blue" class="no-drag" width="159" height="38" src="bujang-logo blue.png" href="../그외/header+aside+footer.html" /></div>
            <div id="visited-aside-status-area"><span class="d-inline-block">오늘 점심 뭐 먹었지?</span></div>
            <div style="width: 100%;">
                <div class="text-start d-flex visited-aside-blue"><span class="d-inline-block">나와 점심을 함께 한 그룹</span></div>
                <div id="my-lunch-group" class="d-xxl-flex justify-content-xxl-center align-items-xxl-center">
                    <div><span id="my-lunch-group-name"><svg id="my-lunch-group-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 -64 640 640" width="1em" height="1em" fill="currentColor">
                                <!--! Font Awesome Free 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. -->
                                <path d="M224 256c70.7 0 128-57.31 128-128S294.7 0 224 0C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3c-95.73 0-173.3 77.6-173.3 173.3C0 496.5 15.52 512 34.66 512H413.3C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM479.1 320h-73.85C451.2 357.7 480 414.1 480 477.3C480 490.1 476.2 501.9 470 512h138C625.7 512 640 497.6 640 479.1C640 391.6 568.4 320 479.1 320zM432 256C493.9 256 544 205.9 544 144S493.9 32 432 32c-25.11 0-48.04 8.555-66.72 22.51C376.8 76.63 384 101.4 384 128c0 35.52-11.93 68.14-31.59 94.71C372.7 243.2 400.8 256 432 256z"></path>
                            </svg>동기모임</span></div>
                </div>
                <div class="text-start d-flex visited-aside-blue"><span class="d-inline-block">오늘 다녀온 가게</span></div>
            </div>
            <div id="visited-store-info"><button id="visited-store-name" class="btn btn-primary" type="button">양자강<span id="visited-store-cate">| 중식/중화요리</span></button>
                <div id="visited-star-point"><span class="visited-store-blue">3.3/5</span><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-half-outline"></i><i class="typcn typcn-star-outline"></i></div>
                <p id="visited-store-address" class="visited-store-p">서울특별시 관악구 낙성대로 22-1<br /></p>
            </div>
            <div id="visited-review-area">
                <p>이 가게의 최근 리뷰 (5건)</p>
                <div class="visited-reviews">
                    <div><span class="visited-review-user">이지희(20대 그룹/3인)</span><span class="visited-review-star"><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i></span></div>
                    <div><span class="modal-review-content">냉면 냉면 냉면</span></div>
                </div>
                <div class="visited-reviews">
                    <div><span class="visited-review-user">이지희(20대 그룹/3인)</span><span class="visited-review-star"><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i></span></div>
                    <div><span class="modal-review-content">냉면 냉면 냉면</span></div>
                </div>
                <div class="visited-reviews">
                    <div><span class="visited-review-user">이지희(20대 그룹/3인)</span><span class="visited-review-star"><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i><i class="typcn typcn-star-full-outline"></i></span></div>
                    <div><span class="modal-review-content">냉면 냉면 냉면</span></div>
                </div>
            </div>
            <p class="visited-p">오늘이 가기 전에 리뷰를 남겨주세요!</p><button id="btn-visited-cancel" class="btn btn-light link-danger border rounded-pill border-danger" type="button">방문 취소</button>
            <p class="visited-p">혹시 그룹 취향이 아니었나요?</p><button id="btn-visited-blacklist" class="btn btn-light link-dark border rounded-pill border-dark" type="button">블랙리스트 추가</button>
        </div>
    </nav>
    <div id="content-wrapper" class="d-flex flex-column" style="position: relative;">
        <div id="content" class="border rounded">
            <nav id="header" class="navbar navbar-light navbar-expand bg-white shadow d-xxl-flex justify-content-xxl-end mb-4 topbar static-top">
                <div class="container">
                    <div></div>
                    
                    <ul class="navbar-nav d-xxl-flex align-items-xxl-center">
                        <li id="user-alert" class="nav-item dropdown show d-xxl-flex">
                        	<a class="dropdown-toggle nav-link nav-link" aria-expanded="true" data-bs-toggle="dropdown" href="#" data-bs-auto-close="outside"><span class="badge bg-danger badge-counter">3+</span><i class="fas fa-bell fa-fw"></i></a>
                            <div id="user-alert-list" class="dropdown-menu dropdown-menu-end show dropdown-list animated--grow-in" data-bs-popper="none">
                                <h6 class="dropdown-header">alerts center</h6>
                                	<a class="dropdown-item d-flex align-items-center" href="#" style="padding: 8px 12px;">
                                    <div style="padding: 0px 8px 0px 0px;">
                                        <p class="alert-basic">기주임님이 개발1팀을 탈퇴하였습니다</p>
                                    </div>
                                    <div class="btn-group" role="group"><button class="btn btn-primary btn-alert-check" type="button">확인</button></div>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div style="padding: 0px 8px 0px 0px;">
                                        <p class="alert-basic">feelis님이 초대를 거절하였습니다</p>
                                    </div>
                                    <div class="btn-group" role="group"><button class="btn btn-primary btn-alert-check" type="button">확인</button></div>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div style="padding: 0px 8px 0px 0px;">
                                        <p class="alert-basic">feelis님이 초대를 수락하였습니다</p>
                                    </div>
                                    <div class="btn-group" role="group"><button class="btn btn-primary btn-alert-check" type="button">확인</button></div>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div style="padding: 0px 8px 0px 0px;">
                                        <p class="alert-basic">개발1팀에서 퇴장당하였습니다</p>
                                    </div>
                                    <div class="btn-group" role="group"><button class="btn btn-primary btn-alert-check" type="button">확인</button></div>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div style="padding: 0px 8px 0px 0px;">
                                        <p class="alert-basic">개발1팀의 그룹장을 위임받았습니다</p>
                                    </div>
                                    <div class="btn-group" role="group"><button class="btn btn-primary btn-alert-check" type="button">확인</button></div>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div style="padding: 0px 8px 0px 0px;">
                                        <p class="alert-basic">7월 23일에 남겨주신 리뷰가 광고/도배의 이유로 삭제되었습니다</p>
                                    </div>
                                    <div class="btn-group" role="group"><button class="btn btn-primary btn-alert-check" type="button">확인</button></div>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div style="padding: 0px 8px 0px 0px;">
                                        <p class="alert-choice">개발1팀에 초대되었습니다</p>
                                    </div>
                                    <div class="btn-group" role="group"><button class="btn btn-primary btn-alert-check" type="button">수락</button><button class="btn btn-primary btn-alert-opposite" type="button">거절</button></div>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div style="padding: 0px 8px 0px 0px;">
                                        <p class="alert-choice">남겨주신 문의에 답변이 등록되었습니다</p>
                                    </div>
                                    <div class="btn-group" role="group"><button class="btn btn-primary btn-alert-check" type="button">보기</button><button class="btn btn-primary btn-alert-opposite" type="button">확인</button></div>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item d-inline-flex"><button id="logout-btn" class="btn btn-primary" type="button">로그아웃</button></li>
                        <li id="menu-dropdown" class="nav-item dropdown show d-xxl-flex"><a class="nav-link" aria-expanded="true" data-bs-toggle="dropdown" data-bs-auto-close="outside"><i class="fas fa-bars"></i></a>
                            <div class="dropdown-menu dropdown-menu-end show" data-bs-popper="none"><a class="dropdown-item" href="#">나의정보</a><a class="dropdown-item" href="#">나의그룹</a><a class="dropdown-item" href="#">방문내역</a><a class="dropdown-item" href="#">고객센터</a></div>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="container-fluid">
                <div id="today" class="card shadow">
                    <div class="card-body">
                        <p class="d-inline-block" style="width: 483px;"><span style="color: rgb(255, 255, 255);"> </span><i class="icon-note"></i> 오늘의 식사는 어떠셨나요?</p>
                    </div>
                </div>
                <div id="visited-row" class="row">
                    <div class="col">
                        <div id="today-store-rel" class="card shadow">
                            <div class="card-header py-3">
                                <p class="text-primary m-0 fw-bold"><span class="visited-store-blue">양자강</span>과 나의 인연</p>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive table mt-2 today-store-table" role="grid" aria-describedby="dataTable_info">
                                    <table id="dataTable" class="table my-0">
                                        <thead>
                                            <tr>
                                                <th style="width: 50%;"><span class="d-inline-block me-2 bg-success icon-circle"></span>언제 처음 방문했을까?</th>
                                                <th style="width: 50%;"><span class="d-inline-block me-2 bg-warning icon-circle"></span>오늘이 몇번째 방문일까?</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>2022년 07월 20일<br /></td>
                                                <td>103번째</td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr></tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="table-responsive table mt-2 today-store-table" role="grid" aria-describedby="dataTable_info">
                                    <table id="dataTable" class="table my-0">
                                        <thead>
                                            <tr>
                                                <th style="width: 50%;"><span class="d-inline-block me-2 bg-primary icon-circle"></span><strong>며칠만에 방문했을까?</strong><br /></th>
                                                <th style="width: 50%;"><span class="d-inline-block me-2 bg-danger icon-circle"></span> 지난번에 누구와 먹었지?</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>11일</td>
                                                <td>동기모임</td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr></tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div id="today-review" class="card shadow flex-nowrap">
                            <div class="card-header py-3">
                                <p class="text-primary m-0 fw-bold">리뷰 남기기</p>
                            </div>
                            <div class="card-body" style="background: #ffffff;">
                                <div class="row">
                                    <div class="col-xxl-7">
                                        <div>
                                            <div class="d-inline"><span class="d-inline-block circles"><span class="d-inline-block me-2 bg-secondary icon-circle"></span></span><span class="fw-bolder d-inline-block">가게는 어떠셨나요?</span></div><span id="today-star-icon" class="text-warning d-block"><i class="typcn typcn-star-outline"></i><i class="typcn typcn-star-outline"></i><i class="typcn typcn-star-outline"></i><i class="typcn typcn-star-outline"></i><i class="typcn typcn-star-outline"></i></span>
                                        </div>
                                        <div>
                                            <div class="d-block"><span class="d-inline-block circles"><span class="d-inline-block me-2 bg-secondary icon-circle"></span></span><span class="fw-bolder d-inline-block">무엇을 드셨나요? </span></div><select id="today-menu" name="menu">
                                                <optgroup label="중식/중화요리">
                                                    <option value="black-noodle">짜장면</option>
                                                    <option value="">짬뽕</option>
                                                    <option value="">쟁반짜장</option>
                                                    <option value="">짜장밥</option>
                                                    <option value="">짬뽕밥</option>
                                                    <option value="">볶음밥</option>
                                                    <option value="">탕수육</option>
                                                    <option value="">양장피</option>
                                                </optgroup>
                                            </select>
                                        </div>
                                        <div>
                                            <div class="d-block"><span class="d-inline-block circles"><span class="d-inline-block me-2 bg-secondary icon-circle"></span></span><span class="fs-6 fw-bolder d-inline-block">사진을 업로드 해주세요(선택) :</span></div>
                                            <div><input type="file" /></div>
                                        </div>
                                    </div>
                                    <div class="col text-end"><img src="map.png" style="width: 174px;height: 130.5px;" /></div>
                                </div>
                                <div><textarea id="today-review-content" name="reviewContent" placeholder="내용을 입력해주세요"></textarea></div>
                                <div class="text-center"><button class="btn btn-primary btn-today" type="button">리뷰 등록</button></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/theme.js"></script>
    <script src="../../../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../../assets/js/bs-init.js"></script>
    <script src="../../../assets/js/theme.js"></script>
    
</body>
</html>