<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> 로그인 </title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Login-Form-Basic-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">
    
    <!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>
</head>

<body>
    <nav class="navbar navbar-light navbar-expand bg-white shadow d-xxl-flex justify-content-xxl-end mb-4 topbar static-top no-side-bar-header">
        <div class="container join-login-page">
	        <span>
		        <a href = "${pageContext.request.contextPath}/">
			        <img data-bss-hover-animate="pulse" id="bujang-logo-blue" class="no-drag" width="159" height="38" src="${pageContext.request.contextPath}/assets/img/bujang-logo%20blue.png">
		        </a>
	        </span>
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
            <div class="col-md-9 col-lg-12 col-xl-10" style="width: 500px;">
                <div class="card shadow-lg o-hidden border-0 my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 col-xxl-12">
                                <div class="p-5">
                                    <div class="text-center">
                                    	<img class="login_logo" src="${pageContext.request.contextPath}/assets/img/bujang-logo%20blue.png">
                                   	</div>
                                    <div class="text-center">
                                        <h4 class="text-dark mb-4 h3 input-box">로그인</h4>
                                    </div>
                                    <form method="post" action="${pageContext.request.contextPath}/login" class="user">
                                        <div class="mb-3"><input class="form-control form-control-user " type="email" id="InputLoginEmail" aria-describedby="emailHelp" placeholder="이메일을 입력해주세요." name="userEmail"></div>
                                        <div class="mb-3"><input class="form-control form-control-user " type="password" id="inputLoginPassword" placeholder="비밀번호를 입력해주세요." name="userPassword"></div>
                                        <div class="mb-3">
                                            <div class="custom-control custom-checkbox small">
                                                <div class="form-check"><input class="form-check-input custom-control-input" type="checkbox" id="autoLogin" name = "autoLogin"><label class="form-check-label custom-control-label input-box" for="autoLogin">로그인 상태 유지</label></div>
                                            </div>
                                        </div><button class="btn btn-primary d-block btn-user w-100 " id="btn-login" type="submit">로그인</button>
                                        <hr>
                                        <a class="btn btn-primary d-block btn-naver btn-user w-100 mb-2 " role="button" href="${naverUrl}">네이버 아이디로 로그인</a>
                                        <a class="btn btn-primary d-block btn-kakao btn-user w-100 mb-2 " role="button" 
                                        	href="https://kauth.kakao.com/oauth/authorize?client_id=730975601d99f3b911f8fb8fff4edafa&redirect_uri=http://localhost:8088/lunchwb/kakaoLoginCallback&response_type=code">카카오 아이디로 로그인</a>
                                        <a class="btn btn-primary d-block btn-google btn-user w-100 mb-2 " role="button">구글 아이디로 로그인</a>
                                        <hr>
                                    </form>
                                    <div class="text-center">
                                    	<a class="small " href="../../jihee/etc/forgot-password.html">비밀번호 찾기</a>
                                   	</div>
                                    <div class="text-center">
                                    	<a class="small " href="${pageContext.request.contextPath}/join">회원가입</a>
                                   	</div>
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
<script type="text/javascript">

$("#check-email").on("click", function(){
	console.log("아이디 체크");
	
	var id = $('[name = "userEmail"]').val();
	
	console.log(id);
	
 	$.ajax({
		url : "${pageContext.request.contextPath }/user/checkEmail",		
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(id),
		dataType : "json",
		success : function(result){
			console.log(result);
			
			if(result == "success"){
				if($("#msgOverlapEmail").hasClass("collect-text") === false) {
						$("#msgOverlapEmail").addClass("collect-text");
						$("#msgOverlapEmail").removeClass("check-text");
					} 
				$("#msgOverlapEmail").text("사용할 수 있는 이메일 입니다.");
				idChk = id;
			}else {
				if($("#msgOverlapEmail").hasClass("check-text") === false) {
					$("#msgOverlapEmail").addClass("check-text");
					$("#msgOverlapEmail").removeClass("collect-text");
				}
				$("#msgOverlapEmail").text("이미 사용중인 이메일 입니다.");
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	}); 
});

</script>

</html>

