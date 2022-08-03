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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">
</head>

<body id="page-top">

<div id="wrapper">
	
	<c:import url="/WEB-INF/views/includes/aside/userAside.jsp"></c:import>
	
	<c:import url="/WEB-INF/views/includes/aside/groupAside.jsp"></c:import>
	
	<div id="content-wrapper" class="d-flex flex-column">
		
		<div id="content">
			
			<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
			
               	<div class="container-fluid">
               	
					<h3 class="text-dark mb-4 group-content-title">
						
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -64 640 640" width="1em" height="1em" fill="currentColor" style="font-size: 30px;">
							<path d="M224 256c70.7 0 128-57.31 128-128S294.7 0 224 0C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3c-95.73 0-173.3 77.6-173.3 173.3C0 496.5 15.52 512 34.66 512H413.3C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM479.1 320h-73.85C451.2 357.7 480 414.1 480 477.3C480 490.1 476.2 501.9 470 512h138C625.7 512 640 497.6 640 479.1C640 391.6 568.4 320 479.1 320zM432 256C493.9 256 544 205.9 544 144S493.9 32 432 32c-25.11 0-48.04 8.555-66.72 22.51C376.8 76.63 384 101.4 384 128c0 35.52-11.93 68.14-31.59 94.71C372.7 243.2 400.8 256 432 256z"></path>
	                    </svg>
	                    개발1팀
	                    <button class="btn btn-sm link-dark" type="button" data-bs-target="#modal-group-name-change" data-bs-toggle="modal">
	                    	<i class="fas fa-pencil-alt"></i>
	                    </button>
	                    
	                    <span class="group-title-btn-area">
	                    	<button class="btn btn-primary group-title-btn" type="button" data-bs-target="#modal-group-leader-pass" data-bs-toggle="modal">
	                    		그룹장 위임
	                    	</button>
	                    	<button class="btn btn-primary group-title-btn btn-group-leave" type="button" data-bs-target="#modal-group-leave" data-bs-toggle="modal">
	                    		그룹 탈퇴
	                    	</button>
	                    </span>
	                    
                    </h3>
                    
                   	<div id="groupmem-list" class="card shadow">
                   	
                       <div class="card-header py-3">
                           <p class="text-primary m-0 fw-bold">그룹원 목록</p>
                       </div>
                       
                       <div class="card-body">
                         
                           <div id="groupmem-list-table" class="table-responsive table mt-2" role="grid" aria-describedby="dataTable_info">
                             
                               <table id="dataTable" class="table my-0">
                                	
                                	<colgroup>
                                		<col style="width: 10%;">
                                		<col style="width: 10%;">
                                		<col style="width: 25%;">
                                		<col style="width: 15%;">
                                		<col style="width: 15%;">
                                		<col style="width: 10%;">
                                		<col style="width: 15%;">
                                	</colgroup>
									
                                   	<thead>
                                       	<tr>
                                           <th>부장님</th>
                                           <th>그룹장</th>
                                           <th>이름</th>
                                           <th>연령대</th>
                                           <th>성별</th>
                                           <th>회원</th>
                                           <th>내보내기</th>
                                       	</tr>
                                    </thead>
                                  
                                    <tbody class="text-dark">
										<c:forEach items="${map.memberList}" var="memberVo" varStatus="status">		                                   
											<tr>
												<td>
													<c:if test="${memberVo.bossCheck == 1}">
	                                           			<img src="부장.png" width="24px" />
	                                           		</c:if>
	                                           	</td>
												<td>
													<c:if test="${memberVo.leaderCheck == 1}">
														<svg class="groupmem-user" xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512" width="1em" height="1em" fill="currentColor">
													        <path d="M438.6 105.4C451.1 117.9 451.1 138.1 438.6 150.6L182.6 406.6C170.1 419.1 149.9 419.1 137.4 406.6L9.372 278.6C-3.124 266.1-3.124 245.9 9.372 233.4C21.87 220.9 42.13 220.9 54.63 233.4L159.1 338.7L393.4 105.4C405.9 92.88 426.1 92.88 438.6 105.4H438.6z"></path>
													    </svg>
													</c:if>													
												</td>
												<td>${memberVo.memberName}</td>
												<td>${memberVo.memberSex}</td>
												<td>${memberVo.memberAge}</td>
												<td>
													<c:if test="${!empty memberVo.userNo}">
														<svg class="groupmem-user" xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512" width="1em" height="1em" fill="currentColor">
													        <path d="M438.6 105.4C451.1 117.9 451.1 138.1 438.6 150.6L182.6 406.6C170.1 419.1 149.9 419.1 137.4 406.6L9.372 278.6C-3.124 266.1-3.124 245.9 9.372 233.4C21.87 220.9 42.13 220.9 54.63 233.4L159.1 338.7L393.4 105.4C405.9 92.88 426.1 92.88 438.6 105.4H438.6z"></path>
													    </svg>
													</c:if>
												</td>
												<td>
													<c:if test="${memberVo.leaderCheck == 1}">
														<svg class="text-danger groupmem-delete" xmlns="http://www.w3.org/2000/svg" viewBox="-96 0 512 512" width="1em" height="1em" fill="currentColor">
												        	<path d="M310.6 361.4c12.5 12.5 12.5 32.75 0 45.25C304.4 412.9 296.2 416 288 416s-16.38-3.125-22.62-9.375L160 301.3L54.63 406.6C48.38 412.9 40.19 416 32 416S15.63 412.9 9.375 406.6c-12.5-12.5-12.5-32.75 0-45.25l105.4-105.4L9.375 150.6c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L160 210.8l105.4-105.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-105.4 105.4L310.6 361.4z"></path>
												    	</svg>
												    </c:if>
												</td>
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
                                   <p class="dataTables_info" role="status" aria-live="polite">총 인원 : 13</p>
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
                   <div id="groupmem-invt" class="card shadow">
                       <div class="card-header py-3">
                           <p class="text-primary m-0 fw-bold">그룹원으로 초대하기</p>
                       </div>
                       <div class="card-body">
                           <div><input type="email" placeholder="이메일을 입력해주세요" name="email" /><button class="btn btn-primary btn-groupmem-invt" type="button" data-bs-target="#modal-groupmem-invt" data-bs-toggle="modal">초대하기</button>
                               <div class="form-check"><input id="chk-boss-user" class="form-check-input" type="checkbox" /><label class="form-check-label" for="chk-boss-user">부장님이면 체크해주세요</label></div>
                           </div>
                       </div>
                   </div>
                   <div id="groupmem-add" class="card shadow">
                       <div class="card-header py-3">
                           <p class="text-primary m-0 fw-bold">그룹원 직접 추가하기</p>
                       </div>
                       <div class="card-body">
                           <div><input type="text" placeholder="이름을 입력해주세요" /><select>
                                   <optgroup label="This is a group">
                                       <option value="12" selected>This is item 1</option>
                                       <option value="13">This is item 2</option>
                                       <option value="14">This is item 3</option>
                                   </optgroup>
                               </select><select>
                                   <optgroup label="This is a group">
                                       <option value="12" selected>This is item 1</option>
                                       <option value="13">This is item 2</option>
                                       <option value="14">This is item 3</option>
                                   </optgroup>
                               </select><button class="btn btn-primary btn-groupmem-invt" type="button" data-bs-toggle="modal">추가하기</button></div>
                           <div class="form-check"><input id="chk-boss-notuser" class="form-check-input" type="checkbox" /><label class="form-check-label" for="chk-boss-notuser">부장님이면 체크해주세요<br /></label></div>
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
   
   
   
<!-- 그룹 이름 변경 모달 -->
<div id="modal-group-name-change" class="modal fade" role="dialog" tabindex="-1" data-bs-auto-close="outside" ara-expanded="false">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-header-custom">
                <div><span>그룹 이름 변경</span></div><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body modal-body-custom">
                <p class="modal-group-p" placeholder>현재 그룹 이름 : <span class="group-color-blue">개발1팀</span></p><input type="text" placeholder="변경할 그룹 이름을 입력해주세요" />
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">변경</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>
   
   
<!-- 그룹 탈퇴 확인 모달 -->
<div id="modal-group-leave" class="modal fade" role="dialog" tabindex="-1" ara-expanded="false">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body-custom">
                <div class="modal-group-p">
                    <p class="modal-group-p group-color-blue">개발1팀</p>
                    <p class="modal-group-p">탈퇴하시겠습니까?<br /></p>
                </div>
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">확인</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>
   
   
<!-- 그룹원 내보내기 모달 -->
<div id="modal-groupmem-out" class="modal fade" role="dialog" tabindex="-1" ara-expanded="false">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body-custom">
                <div>
                    <p class="modal-group-p group-color-blue">남궁옥분1</p>
                    <p class="modal-group-p">내보내시겠습니까?<br /></p>
                </div>
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">확인</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>
   
   
   
<!-- 그룹장 위임 모달 -->
<div id="modal-group-leader-pass" class="modal fade" role="dialog" tabindex="-1" ara-expanded="false">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body-custom">
                <div>
                    <p class="modal-group-p">그룹장을 위임할 그룹원을</p>
                    <p class="modal-group-p">선택해주세요</p><select id="dropdown-group-leader-pass">
                        <optgroup label="This is a group">
                            <option value="12" selected>This is item 1</option>
                            <option value="13">This is item 2</option>
                            <option value="14">This is item 3</option>
                        </optgroup>
                    </select>
                </div>
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">확인</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>
   
   
<!-- 그룹원 초대(회원) 확인 모달 -->
<div id="modal-groupmem-invt" class="modal fade" role="dialog" tabindex="-1" ara-expanded="false">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body-custom">
                <div>
                    <p class="modal-group-p group-color-blue">feelis0720@naver.com</p>
                    <p class="modal-group-p">초대하시겠습니까?<br /></p>
                </div>
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">확인</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>

    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
       

</body>
</html>