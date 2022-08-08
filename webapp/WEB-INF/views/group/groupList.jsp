<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>부장님요기요: 나의그룹</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/customModal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/group.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/alert.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap">
	
<script type="text/javascript"src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
<script type="text/javascript"src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>
	
</head>

<body id="page-top">

<div id="wrapper">
	
	<c:import url="/WEB-INF/views/includes/aside/userAside.jsp"></c:import>
	
	<c:import url="/WEB-INF/views/includes/aside/groupAside.jsp"></c:import>
	
	<div id="content-wrapper" class="d-flex flex-column">
		
		<div id="content">
			
			<div id="header-1">
				<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
			</div>
			
               	<div class="container-fluid">
               	
					<h3 class="text-dark mb-4 group-content-title">
						
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -64 640 640" width="1em" height="1em" fill="currentColor" style="font-size: 30px;">
							<path d="M224 256c70.7 0 128-57.31 128-128S294.7 0 224 0C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3c-95.73 0-173.3 77.6-173.3 173.3C0 496.5 15.52 512 34.66 512H413.3C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM479.1 320h-73.85C451.2 357.7 480 414.1 480 477.3C480 490.1 476.2 501.9 470 512h138C625.7 512 640 497.6 640 479.1C640 391.6 568.4 320 479.1 320zM432 256C493.9 256 544 205.9 544 144S493.9 32 432 32c-25.11 0-48.04 8.555-66.72 22.51C376.8 76.63 384 101.4 384 128c0 35.52-11.93 68.14-31.59 94.71C372.7 243.2 400.8 256 432 256z"></path>
	                    </svg>
	                    ${map.groupName}
	                    <c:if test="${authUser.userNo == map.leader}">
		                    <button class="btn btn-sm link-dark" type="button" data-bs-target="#modal-group-name-change" data-bs-toggle="modal">
		                    	<i class="fas fa-pencil-alt"></i>
		                    </button>
	                    </c:if>
	                    
	                    <span class="group-title-btn-area">
	                    	<c:if test="${authUser.userNo == map.leader && map.memberCount > 1}">
		                    	<button class="btn btn-primary group-title-btn" type="button" data-bs-target="#modal-group-leader-pass" data-bs-toggle="modal">
		                    		그룹장 위임
		                    	</button>
	                    	</c:if>
	                    	<c:if test="${authUser.userNo != map.leader || map.memberCount == 1}">
		                    	<button class="btn btn-primary group-title-btn btn-group-leave" type="button" data-bs-target="#modal-group-leave" data-bs-toggle="modal">
		                    		그룹 탈퇴
		                    	</button>
	                    	</c:if>
	                    </span>
	                    
                    </h3>
                    
                   	<div id="groupmem-list" class="card shadow">
                   	
                       <div class="card-header py-3">
                           <p class="text-primary m-0 fw-bold">그룹원 목록</p>
                       </div>
                       
                       <div class="card-body">
                         
                           <div id="groupmem-list-table" class="table-responsive table mt-2" role="grid" aria-describedby="dataTable_info">
                             
                               <table id="dataTable" class="table my-0">
                                	
                                   	<thead>
                                       	<tr>
	                                       	<c:choose>
		                                		<c:when test="${authUser.userNo == map.leader}">
		                                           	<th style="width: 10%;">부장님</th>
		                                           	<th style="width: 10%;">그룹장</th>
		                                           	<th style="width: 20%;">이름</th>
		                                           	<th style="width: 10%;">성별</th>
		                                           	<th style="width: 10%;">출생연도</th>
		                                           	<th style="width: 10%;">연령대</th>
		                                           	<th style="width: 10%;">회원</th>
		                                           	<th style="width: 10%;">내보내기</th>
	                                           	</c:when>
	                                           	<c:otherwise>
	                                           		<th style="width: 10%;">부장님</th>
		                                           	<th style="width: 10%;">그룹장</th>
		                                           	<th style="width: 30%;">이름</th>
		                                           	<th style="width: 10%;">성별</th>
		                                           	<th style="width: 10%;">출생연도</th>
		                                           	<th style="width: 10%;">연령대</th>
		                                           	<th style="width: 10%;">회원</th>
	                                           	</c:otherwise>
	                                        </c:choose>
                                       	</tr>
                                    </thead>
                                  
                                    <tbody id="memberListArea" class="text-dark">
										<c:forEach items="${map.memberList}" var="memberVo" varStatus="status">
											<tr id="memberList" <c:if test="${memberVo.userNo == authUser.userNo}">class="fw-bold"</c:if>>
												<td style="width: 10%;">
													<c:if test="${memberVo.bossCheck == 1}">
	                                           			<img src="${pageContext.request.contextPath}/assets/img/bujang.png" width="24px" />
	                                           		</c:if>
	                                           	</td>
												<td style="width: 10%;">
													<c:if test="${memberVo.userNo == map.leader}">
														<svg class="groupmem-user" xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512" width="1em" height="1em" fill="currentColor">
													        <path d="M438.6 105.4C451.1 117.9 451.1 138.1 438.6 150.6L182.6 406.6C170.1 419.1 149.9 419.1 137.4 406.6L9.372 278.6C-3.124 266.1-3.124 245.9 9.372 233.4C21.87 220.9 42.13 220.9 54.63 233.4L159.1 338.7L393.4 105.4C405.9 92.88 426.1 92.88 438.6 105.4H438.6z"></path>
													    </svg>
													</c:if>													
												</td>
												<c:choose>
		                          	      			<c:when test="${authUser.userNo == map.leader}">
														<td style="width: 30%;">${memberVo.userName}</td>
													</c:when>
													<c:otherwise>
														<td style="width: 40%;">${memberVo.userName}</td>
													</c:otherwise>
												</c:choose>
												<td style="width: 10%;">${memberVo.userSex}</td>
												<td style="width: 10%;">${memberVo.userBirthYear}</td>
												<td style="width: 10%;">${memberVo.userAge}</td>
												<td style="width: 10%;">
													<c:if test="${memberVo.groupOrder != 0}">
														<svg class="groupmem-user" xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512" width="1em" height="1em" fill="currentColor">
													        <path d="M438.6 105.4C451.1 117.9 451.1 138.1 438.6 150.6L182.6 406.6C170.1 419.1 149.9 419.1 137.4 406.6L9.372 278.6C-3.124 266.1-3.124 245.9 9.372 233.4C21.87 220.9 42.13 220.9 54.63 233.4L159.1 338.7L393.4 105.4C405.9 92.88 426.1 92.88 438.6 105.4H438.6z"></path>
													    </svg>
													</c:if>
												</td>
												<c:if test="${authUser.userNo == map.leader}">
													<td style="width: 10%;">
														<c:if test="${memberVo.userNo != authUser.userNo}">
															<svg class="text-danger groupmem-delete" xmlns="http://www.w3.org/2000/svg" viewBox="-96 0 512 512" width="1em" height="1em" fill="currentColor">
													        	<path d="M310.6 361.4c12.5 12.5 12.5 32.75 0 45.25C304.4 412.9 296.2 416 288 416s-16.38-3.125-22.62-9.375L160 301.3L54.63 406.6C48.38 412.9 40.19 416 32 416S15.63 412.9 9.375 406.6c-12.5-12.5-12.5-32.75 0-45.25l105.4-105.4L9.375 150.6c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L160 210.8l105.4-105.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-105.4 105.4L310.6 361.4z"></path>
													    	</svg>
													    </c:if>
													</td>
												</c:if>
											</tr>
										</c:forEach>
                                   </tbody>
                                   <tfoot>
                                       <tr></tr>
                                   </tfoot>
                               </table>
                           </div>
                           
                           <div class="row">
                               <div class="col-md-6 align-self-center">
                                   <p class="dataTables_info" role="status" aria-live="polite">총 인원 : <span id="memberCount">${map.memberCount}</span></p>
                               </div>
                               <div class="col-md-6">
                                   <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                       <ul class="pagination">
                                           <li class="page-item disabled"><a class="page-link" aria-label="Previous" href="#"><span aria-hidden="true">«</span></a></li>
                                           <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                           <li class="page-item"><a class="page-link" href="#">2</a></li>
                                           <li class="page-item"><a class="page-link" href="#">3</a></li>
                                           <li class="page-item"><a class="page-link" aria-label="Next" href="#"><span aria-hidden="true">»</span></a></li>
                                       </ul>
                                   </nav>
                               </div>
                           </div>
                       
                       </div>
                   </div>
                   
                   
                   <!-- 그룹 리더만 -->
                   <c:if test="${authUser.userNo == map.leader}">
	                    
	                    <!-- 그룹원 초대 -->
	                    <div id="groupmem-invt" class="card shadow">
	                       <div class="card-header py-3">
	                           <p class="text-primary m-0 fw-bold">그룹원으로 초대하기</p>
	                       </div>
	                       <div class="card-body">
	                       		<div>
	                           		<input type="email" placeholder="이메일을 입력해주세요" name="userEmail" />
	                           		<button class="btn btn-primary btn-groupmem-invt" type="submit" data-bs-target="#modal-groupmem-invt" data-bs-toggle="modal">초대하기</button>
	                               	<div class="form-check">
	                               		<input id="chk-boss-user" class="form-check-input" type="checkbox" />
	                               		<label class="form-check-label" for="chk-boss-user">부장님이면 체크해주세요</label>
	                               	</div>
	                           </div>
	                       </div>
	                    </div>
	                   
	                    <!-- 그룹원 추가 -->
						<div id="groupmem-add" class="card shadow">
	                       	<div class="card-header py-3">
	                           	<p class="text-primary m-0 fw-bold">그룹원 직접 추가하기</p>
	                       	</div>
	                       	<div class="card-body">
	                          	<div>
	                          		<input type="text" name="userName" placeholder="이름을 입력해주세요" />
	                          		<input type="text" name="userBirthYear" placeholder="출생연도를 입력해주세요" />
	                               	<select class="text-dark" name="userSex">
                                       <option selected disabled>성별</option>
                                       <option value="male">남자</option>
                                       <option value="female">여자</option>
	                               	</select>
	                               	<button class="btn btn-primary btn-groupmem-invt" type="submit" data-bs-toggle="modal" <%-- data-groupno="${map.groupNo}" --%>>추가하기</button>
	                            </div>
	                           	<div class="form-check">
	                           		<input id="chk-boss-notuser" class="form-check-input" type="checkbox" name="bossCheck" value="1"/>
	                           		<label class="form-check-label" for="chk-boss-notuser">부장님이면 체크해주세요<br /></label>
	                           	</div>
							</div>
	              		</div>
                   </c:if>
                   
				</div>
			</div>
           
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
           
    </div>
       
	<a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
        

</body>

<script type="text/javascript">

var groupNo = $("[name = 'groupNo']").val() 
console.log(groupNo)

$(".form-check-input").on("click", function(){
	console.log("부장님 여부 체크")
	
	if($(".form-check-input").is(":checked")){
		
		$.ajax({
			url : "${pageContext.request.contextPath}/group/beBoss",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(groupNo),
			dataType : "json",
			
			success : function(result){
				console.log(result)
				
				if(result == "can't"){
					if(confirm("부장님을 교체하시겠습니까?") != true) {
						$(".form-check-input").prop("checked", false)
					}
				}
				
			}, 
			
			error : function(XHR, status, error) {
				console.error(status + " : " + error)
				
			}
		})
	}
	
})


/* 초대할 그룹원 확인 */
$("#groupmem-invt button").on("click", function(){
	console.log("그룹원 초대 버튼 클릭")
	
	var userEmail = $("[name = 'userEmail']").val()
	if(userEmail == null || userEmail == ""){
		alert("이메일을 입력해주세요")
		return false
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath}/group/userCheck",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(userEmail),
		dataType : "json",
		
		success : function(checkMap){
			console.log(checkMap)
			
			//해당 이메일 유저 초대 가능
			if(checkMap.state == "possible"){
				//
				invt(checkMap.userNo)
		
			//해당 이메일 유저 초대 불가(그룹 개수 초과)
			}else if(checkMap.state == "impossible"){
				alert(userEmail + " 님을 초대할 수 없습니다")
			
			//이메일 회원 없음
			}else{
				alert("해당하는 유저가 존재하지 않습니다")
			}
		}
	})
})


/* 회원 > 그룹원으로 초대 하기 */
/* 
function invt(groupNo){
	
	if(confirm(userEmail + " 님을 초대하시겠습니까?") == true){
		
		var bossCheck = 0
	 	if($("#chk-boss-notuser").is(":checked")){
	 		bossCheck = 1
	 	}
		
		var groupInvt = {
				groupNo: groupNo,
				userEmail: userEmail
				bossCheck: bossCheck
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath }/group/invtMember",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(groupInvt),
			dataType : "json",
			
			success : function(memberVo){
				
				alert("멤버가 추가되었습니다")
				
				$("#groupmem-invt [name = 'userEmail']").val()
				$("#groupmem-invt #chk-boss-user").val("")
				
				var memberCount = $("#memberCount").text()
				$("#memberCount").text(Number(memberCount)+1)
				console.log(memberCount)
				
				render(memberVo)
				
			}, 
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
				
			}
		})
	}
}

 */

/* 그룹원 직접 추가 */
$("#groupmem-add button").on("click", function(){
	console.log("비회원 그룹 멤버 추가 버튼 클릭")
	/* 
	var $this = $(this)
	var groupNo = $this.data("groupno")
	 */
	var userName = $("#groupmem-add [name ='userName']").val()
	if(userName == null || userName == ""){
		alert("이름을 입력해주세요")
		return false
	}

	var userBirthYear = $("#groupmem-add [name ='userBirthYear']").val()
	if(userBirthYear == null || userBirthYear == ""){
		alert("출생연도를 입력해주세요")
		return false
	}
	
	var userSex = $("#groupmem-add [name = 'userSex']").val()
	if(userSex == null || userSex == ""){
		alert("성별을 선택해주세요")
		return false
	}
	
	var bossCheck = 0
 	if($("#chk-boss-notuser").is(":checked")){
 		bossCheck = 1
 	}
	
	var groupVo = {
			groupNo: groupNo,
			userName: userName,
			userBirthYear: userBirthYear,
			userSex: userSex,
			bossCheck: bossCheck
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath }/group/addMember",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(groupVo),
		dataType : "json",
		
		success : function(memberVo){
			
			alert("멤버가 추가되었습니다")

			$("#groupmem-add [name ='userName']").val("")
			$("#groupmem-add [name ='userBirthYear']").val("")
			$("#groupmem-add [name = 'userSex']").val("성별")
			$("#groupmem-add #chk-boss-notuser").val("")
			
			var memberCount = $("#memberCount").text()
			$("#memberCount").text(Number(memberCount)+1)
			console.log(memberCount)
			
			render(memberVo)
			
		}, 
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
			
		}
	})
	
})


function render(memberVo){
	console.log("render()")
	
	var str = ''
		str += '<tr>'
		str += '	<td style="width: 10%;">'
	
	if(memberVo.bossCheck == 1){
		str += '		<img src="${pageContext.request.contextPath}/assets/img/bujang.png" width="24px" />'
	}
		str += '	</td>'
		str += '	<td style="widt: 10%;"></td>'	
		str += '	<td style="width: 30%;">' + memberVo.userName + '</td>'
		str += '	<td style="width: 10%;">' + memberVo.userSex + '</td>'
		str += '	<td style="width: 10%;">' + memberVo.userBirthYear + '</td>'
		str += '	<td style="width: 10%;">' + memberVo.userAge + '</td>'
		str += '	<td style="width: 10%;"></td>'
		str += '	<td style="width: 10%;">'
		str += '		<svg class="text-danger groupmem-delete" xmlns="http://www.w3.org/2000/svg" viewBox="-96 0 512 512" width="1em" height="1em" fill="currentColor">'
        str += '			<path d="M310.6 361.4c12.5 12.5 12.5 32.75 0 45.25C304.4 412.9 296.2 416 288 416s-16.38-3.125-22.62-9.375L160 301.3L54.63 406.6C48.38 412.9 40.19 416 32 416S15.63 412.9 9.375 406.6c-12.5-12.5-12.5-32.75 0-45.25l105.4-105.4L9.375 150.6c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L160 210.8l105.4-105.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-105.4 105.4L310.6 361.4z"></path>'
	    str += '		</svg>'
	    str += '	</td>'
	    str += '</tr>'
		
	    
	    $("#memberListArea").append(str)
}


</script>

</html>