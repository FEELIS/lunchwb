<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>회원정보 변경</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/alert.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/group.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Login-Form-Basic-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark bg-primary align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" id="user-aside">
            <div class="container-fluid d-flex flex-column p-0"><img data-bss-hover-animate="pulse" id="bujang-logo" width="159" height="38" src="../../assets/img/bujang-logo.png" href="../../jihee/etc/header+aside+footer.html">
                <ul class="navbar-nav" id="asdie-ul">
                    <li class="nav-item"><a class="nav-link nav-title no-drag">나의정보</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="views/user/checkUserInfo.html">회원정보수정</a></li>
                    <li class="nav-item">
                        <hr class="nav-line">
                    </li>
                    <li class="nav-item"><a class="nav-link nav-title no-drag">나의그룹</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="views/group/groupList.html">그룹목록</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="views/group/addGroup.html">그룹추가</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="views/group/blacklist.html">블랙리스트</a></li>
                    <li class="nav-item">
                        <hr class="nav-line">
                    </li>
                    <li class="nav-item"><a class="nav-link nav-title no-drag">방문내역</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="#">캘린더</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="#">리뷰내역</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="#">방문통계</a></li>
                    <li class="nav-item">
                        <hr class="nav-line">
                    </li>
                    <li class="nav-item"><a class="nav-link nav-title no-drag">고객센터</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="#">FAQ</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="#"></a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="#">문의하기</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="#">문의내역</a></li>
                    <li class="nav-item">
                        <hr class="nav-line">
                    </li>
                    <li class="nav-item"><a class="nav-link nav-title no-drag">admin</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="#">가게</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="views/admin/user/userList.html">유저</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="#">리뷰</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="#">신고</a></li>
                    <li class="nav-item"><a class="nav-link nav-menu" href="#">문의</a></li>
                </ul>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="header">
                <nav class="navbar navbar-light navbar-expand bg-white shadow d-xxl-flex justify-content-xxl-end mb-4 topbar static-top" id="header">
                    <div class="container join-login-page"><span></span>
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
            </div>
            <div class="container" id="container" style="max-width: 1920px;height: auto;">
                <div>
                    <section class="position-relative py-4 py-xl-5">
                        <div class="container">
                            <div class="row mb-0">
                                <div class="col-md-8 col-xl-6 text-center mx-auto">
                                    <h2 style="font-weight: bold;">회원 정보 수정</h2>
                                </div>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <div class="col-md-6 col-xl-4 col-xxl-5">
                                    <div class="p-5">
                                        <div class="text-center"></div>
                                        <form method="post" action="${pageContext.request.contextPath}/user/modifyUser" class="user">
                                            <div class="mb-3"><strong class="join-text">아이디</strong><span id="infoEmail" class="input-group-text">${userInfo.userEmail}</span></div>
                                            <div class="mb-3"><strong class="join-text">새 비밀번호</strong><input class="form-control form-control-user btn-radius" type="password" id="inputJoinPassword" placeholder="비밀번호를 입력해주세요." name="userPassword"></div>
                                            <div class="mb-3"><strong class="join-text">새 비밀번호 확인</strong><input class="form-control form-control-user btn-radius" type="password" id="checkJoinPassword" placeholder="비밀번호를 한 번 더 입력해주세요." name="checkPassword"></div>
                                            <div class="mb-3"><strong class="join-text">닉네임</strong><input class="form-control form-control-user btn-radius" type="password" id="inputJoinNickname" placeholder="${userInfo.userName}" name="userName"></div>
                                            <div class="mb-3"><strong class="join-text">생년월일</strong><input id="inputJoinDate" type="date" value="${userInfo.userBirth}"></div>
                                            <div class="mb-3"><strong class="join-text">성별</strong>
                                            	<select class="form-select gender-box">
                                            		<c:choose>
                                            			<c:when test="${userInfo.userSex eq 'male' } ">
                                            				<option value="male" selected="selected">남자</option>
	                                                    	<option value="female">여자</option>
                                            			</c:when>
                                            			<c:otherwise>
                                            				<option value="male">남자</option>
	                                                    	<option value="female" selected="selected">여자</option>
                                            			</c:otherwise>
                                            		</c:choose>
                                                </select></div>
                                            <div class="mb-3"></div><button class="btn btn-primary d-block btn-user w-100 btn-radius" id="btn-join" type="submit">수정하기</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <footer class="bg-white sticky-footer" id="footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © FEELIS 2022<br>https://github.com/FEELIS&nbsp;<br></span></div>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
</body>

</html>

