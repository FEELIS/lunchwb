<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> 회원가입 </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Login-Form-Basic-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand bg-white shadow d-xxl-flex justify-content-xxl-end mb-4 topbar static-top no-side-bar-header">
        <div class="container join-login-page"><span class="logo-span"><img data-bss-hover-animate="pulse" id="bujang-logo-blue" class="no-drag" width="159" height="38" src="${pageContext.request.contextPath}/assets/img/bujang-logo%20blue.png" href="header+aside+footer.html"></span>
            <div></div>
            <ul class="navbar-nav d-xxl-flex align-items-xxl-center">
                <li class="nav-item dropdown no-arrow" id="user-alert"><a class="dropdown-toggle nav-link nav-link" aria-expanded="false" data-bs-toggle="dropdown"><span class="badge bg-danger badge-counter">3</span><i class="fas fa-bell fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                        <h6 class="dropdown-header">alerts center</h6><a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="me-3">
                                <div class="bg-primary icon-circle"><i class="fas fa-file-alt text-white"></i></div>
                            </div>
                            <div><span class="small text-gray-500">December 12, 2019</span>
                                <p>A new monthly report is ready to download!</p>
                            </div>
                        </a><a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="me-3">
                                <div class="bg-success icon-circle"><i class="fas fa-donate text-white"></i></div>
                            </div>
                            <div><span class="small text-gray-500">December 7, 2019</span>
                                <p>$290.29 has been deposited into your account!</p>
                            </div>
                        </a><a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="me-3">
                                <div class="bg-warning icon-circle"><i class="fas fa-exclamation-triangle text-white"></i></div>
                            </div>
                            <div><span class="small text-gray-500">December 2, 2019</span>
                                <p>Spending Alert: We've noticed unusually high spending for your account.</p>
                            </div>
                        </a><a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                    </div>
                </li>
                <li class="nav-item d-inline-flex"><button class="btn btn-primary" id="logout-btn" type="button">로그아웃</button></li>
                <li class="nav-item dropdown d-xxl-flex" id="menu-dropdown"><a class="nav-link" aria-expanded="false" data-bs-toggle="dropdown" data-bs-auto-close="outside"><i class="fas fa-bars"></i></a>
                    <div class="dropdown-menu dropdown-menu-end"><a class="dropdown-item" href="#">나의정보</a><a class="dropdown-item" href="#">나의그룹</a><a class="dropdown-item" href="#">방문내역</a><a class="dropdown-item" href="#">고객센터</a></div>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-12 col-xl-10" style="width: 600px;">
                <div class="card shadow-lg o-hidden border-0 my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 col-xxl-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h4 class="text-dark mb-4" style="font-weight: bold;">회원가입</h4>
                                    </div>
                                    <form method="post" action="${pageContext.request.contextPath}/join" class="user">
                                        <div class="mb-3"><strong class="join-text">아이디</strong><input class="form-control form-control-user join-email" type="email" id="inputJoinEmail" aria-describedby="emailHelp" placeholder="이메일을 입력해주세요." name="userEmail"><button class="btn btn-primary" id="check-email" type="button">중복 확인</button></div>
                                        <div class="mb-3"><strong class="join-text">비밀번호</strong><input class="form-control form-control-user" type="password" id="inputJoinPassword" placeholder="비밀번호를 입력해주세요." name="userPassword"></div>
                                        <div class="mb-3"><strong class="join-text">비밀번호 확인</strong><input class="form-control form-control-user" type="password" id="checkJoinPassword" placeholder="비밀번호를 한 번 더 입력해주세요." name="checkPassword"></div>
                                        <div class="mb-3"><strong class="join-text">닉네임</strong><input class="form-control form-control-user" type="text" id="inputJoinNickname" placeholder="사용하실 닉네임을 입력해주세요" name="userName"></div>
                                        <div class="mb-3"><strong class="join-text">생년월일</strong><input id="inputJoinDate" type="date" name="userBirth"></div>
                                        <div class="mb-3"><strong class="join-text">성별</strong><select class="form-select" style="width: 150px;height: auto;" name="userSex">
                                                <option value="male" selected="selected">남자</option>
                                                <option value="female">여자</option>
                                            </select></div>
                                        <div class="mb-3">
                                            <div class="custom-control custom-checkbox small">
                                                <div class="form-check"><input class="form-check-input custom-control-input" type="checkbox" id="formCheck-1"><label class="form-check-label custom-control-label" for="formCheck-1">이용약관을 확인하였습니다.</label></div>
                                            </div>
                                        </div><button class="btn btn-primary d-block btn-user w-100" id="btn-join" type="submit">가입하기</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="bg-white sticky-footer" id="footer">
        <div class="container my-auto">
            <div class="text-center my-auto copyright"><span>Copyright © FEELIS 2022<br>https://github.com/FEELIS&nbsp;<br></span></div>
        </div>
    </footer>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
</body>

</html>

