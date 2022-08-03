<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<aside id="group-aside">

    <div id="group-aside-header"></div>
    
    <div>
        <p id="group-nav-title" class="nav-link no-drag">나의그룹</p>
    </div>
    
    <ul id="group-aside-ul" class="text-center navbar-nav">
        <li class="nav-item"></li>
        <li class="nav-item"></li>
        
        <c:forEach items="${map.groupList}" var="groupVo" varStatus="status">	
	        <li class="nav-item">
	        	<a class="nav-link group-nav-menu <c:if test='${groupVo.groupNo == map.groupNo}'>group-nav-active</c:if>" 
	        		href="${pageContext.request.contextPath}/group/list?no=${groupVo.groupNo}">
	        		${groupVo.groupName}<br />
	        	</a>
	        </li>
        </c:forEach>
        
    </ul>
    <ul class="navbar-nav">
    	
    	<c:if test="${map.groupCount > 1}">
        	<li><button class="btn btn-primary group-nav-btn" type="button" data-bs-target="#modal-group-order-change" data-bs-toggle="modal">그룹 순서 변경</button></li>
        </c:if>
        
        <c:if test="${map.groupCount < 4}">
        	<li><a class="btn btn-primary group-nav-btn" role="button" href="add"> 새 그룹 추가</a></li>
        </c:if>
    </ul>
</aside>
