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
        <li class="nav-item"><a class="nav-link group-nav-menu" href="#">동기모임<br /></a></li>
        <li class="nav-item"><a class="nav-link group-nav-menu group-nav-active" href="#">개발1팀<br /></a></li>
        <li class="nav-item"><a class="nav-link group-nav-menu" href="#">정필1팀</a></li>
        <li class="nav-item"><a class="nav-link group-nav-menu" href="#">정필2팀</a></li>
    </ul>
    <ul class="navbar-nav">
        <li><button class="btn btn-primary group-nav-btn" type="button" data-bs-target="#modal-group-order-change" data-bs-toggle="modal">그룹 순서 변경</button></li>
        <li><a class="btn btn-primary group-nav-btn" role="button" href="add"> 새 그룹 추가</a></li>
    </ul>
</aside>
