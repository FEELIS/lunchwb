<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
<script type="text/javascript"src="${pageContext.request.contextPath}/assets/js/theme.js"></script>


<li id="user-alert" class="nav-item dropdown d-xxl-flex no-arrow">
	<a class="dropdown-toggle nav-link nav-link" aria-expanded="false" data-bs-toggle="dropdown" data-bs-auto-close="outside">
		<span class="badge bg-danger badge-counter"></span>
		<i class="fas fa-bell fa-fw"></i>
	</a>
    <div id="user-alert-list" class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in" data-bs-popper="none">
        <h6 class="dropdown-header">alerts center</h6>
        <ul id="draw-noti-area">
        </ul>
    </div>
</li>



<script type="text/javascript">

//마지막으로 띄운 알림 번호
var lastNoti = 0
//확인하지 않은 알림 개수
var countNoti = 0

$(document).ready(function(){
	notiCount()
})


/* 알림 개수 표시 */
function notiCount(){
	var userNo = "${authUser.userNo}"
	
	$.ajax({
		url : "${pageContext.request.contextPath}/notice/count",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(userNo),
		dataType : "json",
		
		success : function(notiCnt){
			
			if(notiCnt > 3){
				$("#user-alert .badge-counter").text("3+")
			
			}else if(notiCnt == 0){
				$("#user-alert .badge-counter").text("")
				
			}else{
				$("#user-alert .badge-counter").text(notiCnt)
			}	
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	 
	})
}


//알림 개수 뱃지
function drawNotiBadge(notiCnt){
	countNoti = countNoti + notiCnt
	
	if(countNoti > 3){
		$("#user-alert .badge-counter").text("3+")
	
	}else if(countNoti == 0){
		$("#user-alert .badge-counter").text("")
		
		noAlert()
		
	}else{
		$("#user-alert .badge-counter").text(countNoti)
		
	}
	
}


function noAlert(){
	
	var str = ''
		str = '<li id="noti-0" class="dropdown-item d-flex align-items-center">'
		str += '	<div class="text-center">'
		str += '		알림이 없습니다'
		str += '	</div>'
		str += '</li>'
		
	$("#draw-noti-area").append(str)
}


//알림 확인하기
$("#user-alert").on("click", function(){
	
	var notiVo = {
		userNo : "${authUser.userNo}",
		notiNo : lastNoti
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath}/notice/recent/list",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(notiVo),
		dataType : "json",
		
		success : function(notiList){
			
			if(notiList.length > 0){
				$("#noti-0").remove()
				drawNotiBadge(notiList.length, 1)
			}
			
			for(var i=0; i<notiList.length; i++){
				renderNoti(notiList[i])
			}
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	 
	})
	
})


//알림리스트 그리기
function renderNoti(notiVo){
	lastNoti = notiVo.notiNo

	var str = ''
	str += '<li id="noti-'+notiVo.notiNo+'" class="dropdown-item d-flex align-items-center">'
	
	switch(notiVo.notiType){
		//그룹원 초대
		case 1: 
			str += '	<div class="bg-secondary icon-circle"></div>'
			str += '	<div  class="alert-p-area-2">'
			str += '		<p class="alert-choice">'+notiVo.groupName+'에 초대되었습니다.</p>'
			str += '	</div>'
			str += '	<div class="btn-group" role="group">'
			str += '		<button class="btn btn-primary btn-alert-ok btn-alert-invite-ok" type="button" data-type="1" data-notino="'+notiVo.notiNo+'" data-groupno="'+notiVo.groupNo+'"'
			str += '			data-leader="'+notiVo.sendUser+'">수락</button>'
			str += '		<button class="btn btn-primary btn-alert-opposite btn-alert-invite-reject" type="button" data-type="1" data-notino="'+notiVo.notiNo+'" data-groupno="'+notiVo.groupNo+'"'
			str += '			data-leader="'+notiVo.sendUser+'">거절</button>'
			str += '	</div>'
			break

		//초대 수락 
		case 2:
			str += '	<div class="bg-warning icon-circle"></div>'
			str += '	<div class="alert-p-area-1">'
			str += '		<p class="alert-basic">'+notiVo.sendEmail+'님이 '+notiVo.groupName+'의 초대를 수락하였습니다.</p>'
			str += '	</div>'
			str += '	<div class="btn-group" role="group">'
			str += '		<button class="btn btn-primary btn-alert-check" type="button" data-notino="'+notiVo.notiNo+'">확인</button>'
			str += '	</div>'
			break
		
		//초대 거절 
		case 3:
			str += '	<div class="bg-warning icon-circle"></div>'
			str += '	<div class="alert-p-area-1">'
			str += '		<p class="alert-basic">'+notiVo.sendEmail+'님이 '+notiVo.groupName+'의 초대를 거절하였습니다.</p>'
			str += '	</div>'
			str += '	<div class="btn-group" role="group">'
			str += '		<button class="btn btn-primary btn-alert-check" type="button" data-notino="'+notiVo.notiNo+'">확인</button>'
			str += '	</div>'
			break
		
		//그룹원 탈퇴
		case 4:
			str += '	<div class="bg-success icon-circle"></div>'
			str += '	<div class="alert-p-area-1">'
			str += '		<p class="alert-basic">'+notiVo.sendName+'님이 '+notiVo.groupName+'을 탈퇴하였습니다.</p>'
			str += '	</div>'
			str += '	<div class="btn-group" role="group">'
			str += '		<button class="btn btn-primary btn-alert-check" type="button" data-notino="'+notiVo.notiNo+'">확인</button>'
			str += '	</div>'
			break
			
		//그룹원 강퇴
		case 5:
			str += '	<div class="bg-danger icon-circle"></div>'
			str += '	<div class="alert-p-area-1">'
			str += '		<p class="alert-basic">'+notiVo.groupName+'에서 퇴장되었습니다.</p>'
			str += '	</div>'
			str += '	<div class="btn-group" role="group">'
			str += '		<button class="btn btn-primary btn-alert-check" type="button" data-notino="'+notiVo.notiNo+'">확인</button>'
			str += '	</div>'
			break
		
		//그룹장 위임
		case 6:
			str += '	<div class="bg-primary icon-circle"></div>'
			str += '	<div class="alert-p-area-1">'
			str += '		<p class="alert-basic">'+notiVo.groupName+'의 그룹장이 되었습니다.</p>'
			str += '	</div>'
			str += '	<div class="btn-group" role="group">'
			str += '		<button class="btn btn-primary btn-alert-check" type="button" data-notino="'+notiVo.notiNo+'">확인</button>'
			str += '	</div>'
			break
		
		//그룹명 변경
		case 7:
			str += '	<div class="bg-primary icon-circle"></div>'
			str += '	<div class="alert-p-area-1">'
			str += '		<p class="alert-basic">'+notiVo.alertCmt+'</p>'
			str += '	</div>'
			str += '	<div class="btn-group" role="group">'
			str += '		<button class="btn btn-primary btn-alert-check" type="button" data-notino="'+notiVo.notiNo+'">확인</button>'
			str += '	</div>'
			break
		
		//신고된 리뷰 삭제
		case 8:
			str += '	<div class="bg-dark icon-circle"></div>'
			str += '	<div class="alert-p-area-1">'
			str += '		<p class="alert-basic">'+notiVo.reviewDate+'에 남겨주신 리뷰가 '+notiVo.reportCateName+'의 사유로 삭제조치되었습니다.</p>'
			str += '	</div>'
			str += '	<div class="btn-group" role="group">'
			str += '		<button class="btn btn-primary btn-alert-check" type="button" data-notino="'+notiVo.notiNo+'">확인</button>'
			str += '	</div>'
			break
			
		//문의 답변 알림
		case 9:
			str += '	<div class="bg-info icon-circle"></div>'
			str += '	<div class="alert-p-area-2">'
			str += '		<p class="alert-choice">문의('+notiVo.inquiryTitle+')에 대한 답변이 등록되었습니다.</p>'
			str += '	</div>'
			str += '	<div class="btn-group" role="group">'
			str += '		<a href="${pageContext.request.contextPath}/customer/readInquiryForm/'+notiVo.inquiryNo+'"'
			str += '			<button class="btn btn-primary btn-alert-ok btn-alert-reply" type="button" data-notino="'+notiVo.notiNo+'">보기</button>'
			str += '		</a>'
			str += '		<button class="btn btn-primary btn-alert-opposite btn-alert-reply" type="button" data-notino="'+notiVo.notiNo+'">확인</button>'
			str += '	</div>'
			break
			
		//부장님 초대
		case 10:
			str += '	<div class="bg-secondary icon-circle"></div>'
			str += '	<div class="alert-p-area-2">'
			str += '		<p class="alert-choice">'+notiVo.groupName+'에 부장님으로 초대되었습니다.</p>'
			str += '	</div>'
			str += '	<div class="btn-group" role="group">'
			str += '		<button class="btn btn-primary btn-alert-ok btn-alert-invite-ok" type="button" data-type="10" data-notino="'+notiVo.notiNo+'" data-groupno="'+notiVo.groupNo+'"'
			str += '			data-leader="'+notiVo.sendUser+'">수락</button>'
			str += '		<button class="btn btn-primary btn-alert-opposite btn-alert-invite-reject" type="button" data-type="10" data-notino="'+notiVo.notiNo+'" data-groupno="'+notiVo.groupNo+'"'
			str += '			data-leader="'+notiVo.sendUser+'">거절</button>'
			str += '	</div>'
			break
	}
	
	str += '</li>'
	
	$("#draw-noti-area").append(str)
}


/* 초대-수락 버튼을 눌렀을 때 */
$("#draw-noti-area").on("click", ".btn-alert-invite-ok", function(){
	var userNo = "${authUser.userNo}"
	
	console.log("초대 수락 버튼 누름")
	
	return false 
	
	$.ajax({
		url : "${pageContext.request.contextPath}/group/count",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(userNo),
		dataType : "json",
		
		ssuccess : function(groupCount){
			
			if(groupCount > 3){
				alert("수락 불가: 그룹은 4개까지 보유가능합니다.")
			
			}else{
				var notiVo = {
					notiType : $(this).attr("data-type"),
					notiNo : $(this).attr("data-notino"),  //삭제용(db/view)
					userNo : $(this).attr("data-leader"),
					groupNo : $(this).attr("data-groupno"),
					sendUser : "${authUser.userNo}",
					groupOrder : groupCount+1 //그룹원 추가용
				}
				
				alertInviteOk(notiVo)
			}
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	})
})


/* 초대 수락 */
function alertInviteOk(notiVo){
	
	$.ajax({
		url : "${pageContext.request.contextPath}/notice/group/invite/ok",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(notiVo),
		dataType : "json",
		
		ssuccess : function(result){
			
			if(result == "success"){
				var notiNo = notiVo.notiNo
				$("#noti-"+notiNo).remove()
				
				drawNotiBadge(-1)
				
			}else{
				console.log("초대 수락 처리 실패")
			
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	})
}



/* 초대-거절 버튼을 눌렀을 때 */
$("#draw-noti-area").on("click", ".btn-alert-invite-reject", function(){
	var notiVo = {
		notiType : $(this).attr("data-type"),
		notiNo : $(this).attr("data-notino"), 
		userNo : $(this).attr("data-leader"),
		groupNo : $(this).attr("data-groupno"),
		sendUser : "${authUser.userNo}"
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath}/notice/group/invite/reject",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(notiVo),
		dataType : "json",
		
		success : function(result){
			
			if(result == "success"){
				var notiNo = notiVo.notiNo
				$("#noti-"+notiNo).remove()

				drawNotiBadge(-1)
				
			}else{
				console.log("초대 거절 처리 실패")
			
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	})
	
})


/* 문의 답변 알림 버튼 눌렀을 때 */
$("#draw-noti-area").on("click", ".btn-alert-reply", function(){
	notiNo = $(this).attr("data-notino")
	alertCheck(notiNo)
})


/* 알림 - 단순 확인 버튼 눌렀을 때 */
$("#draw-noti-area").on("click", ".btn-alert-check", function(){
	var notiNo = $(this).attr("data-notino")
	alertCheck(notiNo)
})


/* 알림 확인 처리 */
function alertCheck(notiNo){
	
	$.ajax({
		url : "${pageContext.request.contextPath}/notice/check",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(notiNo),
		dataType : "json",
		
		success : function(result){
			
			if(result == "success"){
				$("#noti-"+notiNo).remove()
				
				drawNotiBadge(-1)
				
			}else{
				console.log("알림 확인 처리 실패")
			
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	})
}




</script>



</body>
</html>