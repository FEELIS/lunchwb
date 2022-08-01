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
    <link rel="stylesheet" href="../../../assets/css/group.css">
</head>
<body id="page-top">

<div id="wrapper">
	
	<c:import url="/WEB-INF/views/includes/aside/user-aside.jsp"></c:import>
	
	<c:import url="/WEB-INF/views/includes/aside/groupAsdie.jsp"></c:import>
	
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <nav id="header" class="navbar navbar-light navbar-expand bg-white shadow d-xxl-flex justify-content-xxl-end mb-4 topbar static-top">
                <div class="container">
                    <div></div>
                    <ul class="navbar-nav d-xxl-flex align-items-xxl-center">
                        <li id="user-alert" class="nav-item dropdown d-xxl-flex d-xxl-flex"><a class="nav-link nav-link" aria-expanded="false" data-bs-toggle="dropdown" data-bs-auto-close="outside" href="#"><span class="badge bg-danger badge-counter">3+</span><i class="fas fa-bell fa-fw"></i></a>
                            <div id="user-alert-list" class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                                <h6 class="dropdown-header">alerts center</h6><a class="dropdown-item border rounded-0 d-flex align-items-center" href="#">
                                    <div>
                                        <p class="alert-basic">기주임님이 개발1팀을 탈퇴하였습니다</p>
                                    </div><button class="btn btn-primary btn-alert-check" type="button">확인</button>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div>
                                        <p class="alert-basic">feelis님이 초대를 거절하였습니다</p>
                                    </div><button class="btn btn-primary btn-alert-check" type="button">확인</button>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div>
                                        <p class="alert-basic">feelis님이 초대를 수락하였습니다</p>
                                    </div><button class="btn btn-primary btn-alert-check" type="button">확인</button>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div>
                                        <p class="alert-basic">개발1팀에서 퇴장당하였습니다</p>
                                    </div><button class="btn btn-primary btn-alert-check" type="button">확인</button>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div>
                                        <p class="alert-basic">개발1팀의 그룹장을 위임받았습니다</p>
                                    </div><button class="btn btn-primary btn-alert-check" type="button">확인</button>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div>
                                        <p class="alert-basic">7월 23일에 남겨주신 리뷰가 광고/도배의 이유로 삭제되었습니다</p>
                                    </div><button class="btn btn-primary btn-alert-check" type="button">확인</button>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div>
                                        <p class="alert-choice">개발1팀에 초대되었습니다</p>
                                    </div>
                                    <div class="btn-group" role="group"><button class="btn btn-primary btn-alert-ok" type="button">수락</button><button class="btn btn-primary btn-alert-opposite" type="button">거절</button></div>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div>
                                        <p class="alert-choice">남겨주신 문의에 답변이 등록되었습니다</p>
                                    </div>
                                    <div class="btn-group" role="group"><button class="btn btn-primary btn-alert-ok" type="button">보기</button><button class="btn btn-primary btn-alert-opposite" type="button">확인</button></div>
                                </a><a class="dropdown-item" href="#">Menu Item</a>
                            </div>
                        </li>
                        <li class="nav-item d-inline-flex"><button id="logout-btn" class="btn btn-primary" type="button">로그아웃</button></li>
                        <li id="menu-dropdown" class="nav-item dropdown d-xxl-flex"><a class="nav-link" aria-expanded="false" data-bs-toggle="dropdown" data-bs-auto-close="outside"><i class="fas fa-bars"></i></a>
                            <div class="dropdown-menu dropdown-menu-end"><a class="dropdown-item" href="#">나의정보</a><a class="dropdown-item" href="#">나의그룹</a><a class="dropdown-item" href="#">방문내역</a><a class="dropdown-item" href="#">고객센터</a></div>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="container-fluid">
                <h3 class="text-dark mb-4 group-content-title"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -64 640 640" width="1em" height="1em" fill="currentColor" style="font-size: 30px;">
                        <!--! Font Awesome Free 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. -->
                        <path d="M224 256c70.7 0 128-57.31 128-128S294.7 0 224 0C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3c-95.73 0-173.3 77.6-173.3 173.3C0 496.5 15.52 512 34.66 512H413.3C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM479.1 320h-73.85C451.2 357.7 480 414.1 480 477.3C480 490.1 476.2 501.9 470 512h138C625.7 512 640 497.6 640 479.1C640 391.6 568.4 320 479.1 320zM432 256C493.9 256 544 205.9 544 144S493.9 32 432 32c-25.11 0-48.04 8.555-66.72 22.51C376.8 76.63 384 101.4 384 128c0 35.52-11.93 68.14-31.59 94.71C372.7 243.2 400.8 256 432 256z"></path>
                    </svg>새 그룹</h3>
                <div id="groupmem-invt" class="card shadow">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 fw-bold">새 그룹 만들기</p>
                    </div>
                    <div class="card-body">
                        <div><input type="text" placeholder="그룹 이름을 입력해주세요" /><button class="btn btn-primary btn-groupmem-invt" type="button">생성하기</button></div>
                    </div>
                </div>
            </div>
        </div>
        <footer id="footer" class="bg-white sticky-footer" style="background-color: #ffffff;">
            <div class="container my-auto">
                <div class="text-center my-auto copyright"><span>Copyright © FEELIS 2022<br />https://github.com/FEELIS <br /></span></div>
            </div>
        </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
   
   
   
<!-- 그룹 순서 변경 모달 -->
<div id="modal-group-order-change" class="modal fade" role="dialog" tabindex="-1" data-bs-auto-close="outside" ara-expanded="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-header-custom">
                <div><span>그룹 순서 변경</span></div><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body modal-body-custom">
                <div class="group-order-area">
                    <p><i class="icon ion-arrow-up-b"></i><i class="icon ion-arrow-down-b"></i>동기모임</p>
                </div>
                <div class="group-order-area">
                    <p>개발1팀<i class="icon ion-arrow-down-b"></i><i class="icon ion-arrow-up-b"></i></p>
                </div>
                <div class="group-order-area">
                    <p>개발2팀<i class="icon ion-arrow-down-b"></i><i class="icon ion-arrow-up-b"></i></p>
                </div>
                <div class="group-order-area">
                    <p><i class="icon ion-arrow-down-b"></i>지히팀<i class="icon ion-arrow-up-b"></i></p>
                </div>
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">변경</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>
   
   

    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/theme.js"></script>
    <script src="../../../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../../assets/js/bs-init.js"></script>
    <script src="../../../assets/js/theme.js"></script>
       

</body>
</html>