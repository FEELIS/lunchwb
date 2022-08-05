<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
</head>

<body>

<aside id="group-aside">

    <div id="group-aside-header"></div>
    
    <div>
        <p id="group-nav-title" class="nav-link no-drag">나의그룹</p>
    </div>
    
    <ul id="group-aside-ul" class="text-center navbar-nav">
        <li class="nav-item"></li>
        <li class="nav-item"></li>
        
        <c:forEach items="${map.groupList}" var="groupVo">	
	        <li class="nav-item">
	        	<a class="nav-link group-nav-menu 
	        		<c:if test='${groupVo.groupNo == map.groupNo}'> group-nav-active </c:if>" 
	        		href="${pageContext.request.contextPath}/group/list?no=${groupVo.groupNo}">
	        		${groupVo.groupName}<br />
	        	</a>
	        </li>
        </c:forEach>
        
    </ul>
    <ul class="navbar-nav">
    	
    	<c:if test="${map.groupCount > 1}">
        	<li><button id="btn-order-change" class="btn btn-primary group-nav-btn" type="button" data-bs-target="#modal-group-order-change" data-bs-toggle="modal" data-count="${map.groupCount}">그룹 순서 변경</button></li>
        </c:if>
        
        <c:if test="${map.groupCount < 4}">
        	<li><a class="btn btn-primary group-nav-btn" role="button" href="add"> 새 그룹 추가</a></li>
        </c:if>
    </ul>
</aside>

   
   
<!-- 그룹 순서 변경 모달 -->
<div id="modal-group-order-change" class="modal fade" role="dialog" tabindex="-1" data-bs-auto-close="outside" aria-expanded="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-header-custom">
                <div><span>그룹 순서 변경</span></div><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div id="group-order" class="modal-body modal-body-custom">
            	<c:forEach items="${map.groupList}" var="groupVo">
            		<div class="group-order-area">
                    	<p id="order-${groupVo.groupOrder}">
                    		<i class="icon ion-arrow-up-b" <c:if test="${groupVo.groupOrder == 1}"> style="color: rgba(0,0,0,0); cursor: dafault; pointer-events: none;"</c:if>></i>
                    		${groupVo.groupName}
                    		<i class="icon ion-arrow-down-b" <c:if test="${groupVo.groupOrder == map.groupCount}">style="color: rgba(0,0,0,0); cursor: dafault; pointer-events: none;"</c:if>></i>
                    	</p>
                	</div>
            	</c:forEach>
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">변경</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>
   
   
   
<!-- 그룹 이름 변경 모달 -->
<div id="modal-group-name-change" class="modal fade" role="dialog" tabindex="-1" data-bs-auto-close="outside" aria-expanded="false">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-header-custom">
                <div><span>그룹 이름 변경</span></div><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body modal-body-custom">
                <p class="modal-group-p">현재 그룹 이름 : <span class="group-color-blue">개발1팀</span></p><input type="text" placeholder="변경할 그룹 이름을 입력해주세요" />
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">변경</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>
   
   
<!-- 그룹 탈퇴 확인 모달 -->
<div id="modal-group-leave" class="modal fade" role="dialog" tabindex="-1" aria-expanded="false">
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
<div id="modal-groupmem-out" class="modal fade" role="dialog" tabindex="-1" aria-expanded="false">
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
<div id="modal-group-leader-pass" class="modal fade" role="dialog" tabindex="-1" aria-expanded="false">
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
<div id="modal-groupmem-invt" class="modal fade" role="dialog" tabindex="-1" aria-expanded="false">
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

<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>

</body>

<script type="text/javascript">

$("#btn-order-change").on("click", function(){
	console.log("그룹 순서 변경 모달 열기")
})


</script>

</html>