<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<meta name="og:type" content="article">

<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/yogiyo.css" rel="stylesheet" type="text/css">

<!-- fonts -->
<link href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css" rel="stylesheet" type="text/css">

<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>


<title>내 문의 상세보기</title>
</head>
<body>
	<div id="wrapper">
		<!-- aside -->
		<c:import url="/WEB-INF/views/includes/aside/aside.jsp"></c:import>
		<!-- /aside -->

		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">

			<!-- header -->
			<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
			<!-- /header -->
			
			</div>
			<!-- content -->
			
			<!-- footer -->
			<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
			<!-- /footer -->
		</div>
		<!-- content-wrapper -->
	</div>
	<!-- wrapper -->
</body>
</html>