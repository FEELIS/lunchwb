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
    <!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>
	
</head>

<body id="page-top">
    <div id="wrapper">
        <c:import url="/WEB-INF/views/includes/aside/userAside.jsp"></c:import>
        <div class="d-flex flex-column" id="content-wrapper">
            <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
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
                                        <form method="post" action="${pageContext.request.contextPath}/user/modifyUser" class="user" id="updateForm">
                                            <div class="mb-3">
                                            	<strong class="join-text">아이디</strong>
                                            	<input id="infoEmail" class="form-control form-control-user input-box btn-radius" name = "userEmail" value="${userInfo.userEmail}"readonly>
                                           	</div>
                                            <div class="mb-3">
                                            	<strong class="join-text">새 비밀번호</strong>
                                            	<input class="form-control form-control-user input-box btn-radius" type="password" id="inputPassword" placeholder="비밀번호를 입력해주세요." name="userPassword">
                                           	</div>
                                            <div class="mb-3">
                                            	<strong class="join-text">새 비밀번호 확인</strong>
                                            	<input class="form-control form-control-user input-box btn-radius" type="password" id="checkPassword" placeholder="비밀번호를 한 번 더 입력해주세요." name="checkPassword">
                                           	</div>
                                            <div class="mb-3">
                                            	<strong class="join-text">닉네임</strong>
                                            	<input class="form-control form-control-user input-box" type="text" id="inputJoinNickname" placeholder="사용하실 닉네임을 입력해주세요" value="${userInfo.userName}" name="userName">
                                           	</div>
                                            <div class="mb-3">
                                            	<strong class="join-text">생년월일</strong>
                                            	<input id=inputBirthDate type="number" value="${userInfo.userBirthYear}" name="userBirthYear" placeholder="출생연도를 적어주세요." min="1900" max="2100">
                                           	</div>
                                            <div class="mb-3"><strong class="join-text">성별</strong>
                                            	<select class="form-select gender-box" style="width: 150px;height: auto;" name="userSex">
                                            		<option value="male" <c:if test="${userInfo.userSex eq 'male' }">selected</c:if>>남자</option>
                                                   	<option value="female" <c:if test="${userInfo.userSex eq 'female' }">selected</c:if>>여자</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                            	<button class="btn btn-primary d-block btn-user w-100 btn-radius" id="btn-submit" type="submit">수정하기</button>
                                           	</div>
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
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
</body>

<script type="text/javascript">

$("#btn-submit").on("click", function(){
	console.log("버튼 확인");
	
	var password = $('#updateForm [name = userPassword]').val();
	var checkPassword = $('#updateForm [name = checkPassword]').val();
	var name = $('#updateForm [name = userName]').val();
	var birth = $('#updateForm [name = userBirthYear]').val();
	var sex = $('#updateForm [name = userSex]').val();
	
	console.log(password);
	console.log(checkPassword);
	console.log(name);
	console.log(birth);
	console.log(sex);
	
	if(password =="" || password == null){
		alert("비밀번호를 확인해주세요.");
		return false;
	}
	
	if(password != checkPassword){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	
	if(name == "" || name == null){
		alert("이름을 입력해주세요.");
		return false;
	}
	
	if(birth == "" || birth == null){
		alert("생년월일을 입력해주세요.");
		return false;
	}
	
	if(sex == "" || sex == null){
		alert("성별을 입력해주세요.");
		return false;
	}
	//return true;
});

</script>



</html>

