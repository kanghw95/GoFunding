<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="<%=request.getContextPath() %>/resources/css/admin/adminMain.css?ver=1.0"
	rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<!-- Custom fonts for this template-->
<link
	href="../../../resources/sb-admin-2/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="<%=request.getContextPath()%>/sb-admin-2/css/sb-admin-2.min.css"
	rel="stylesheet">
<meta name="google-signin-client_id"
	content="787043379258-f7m1f543ukem253a55cm7kc569hijh0r.apps.googleusercontent.com">
<meta name="google-signin-scope"
	content="https://www.googleapis.com/auth/analytics.readonly">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">
		<div class="outer">
			<div class="inner">
				<div class="other"></div>
				<div class="analytics">
					<h3>현재 선호되는 펀딩</h3>
					<div class="anal age">
						<div class="card-body">
							<div class="chart-pie pt-4 pb-2">
								<canvas id="myPieChart"></canvas>
							</div>
							<div class="mt-4 text-center small">
								<span class="mr-2"> <i class="fas fa-circle text-primary"></i>10-20대</span>
								<span class="mr-2"> <i class="fas fa-circle text-success"></i>30-40대</span> 
								<span class="mr-2"> <i class="fas fa-circle text-info"></i>50-60대</span>
							</div>
						</div>
					</div>
					<div class="anal category">
    			        <div class="card-body">
							<div class="chart-pie pt-4 pb-2">
								<canvas id="myPieChart1"></canvas>
							</div>
							<div class="mt-4 text-center small">
								<span class="mr-2"> <i class="fas fa-circle text-primary"></i>일자리 창출</span>
								<span class="mr-2"> <i class="fas fa-circle text-success"></i>공정 무역</span>
								<span class="mr-2"> <i class="fas fa-circle text-info"></i>친환경</span>
								<span class="mr-2"> <i class="fas fa-circle text-primary"></i>기부</span>
								<span class="mr-2"> <i class="fas fa-circle text-success"></i>작은 가게</span>
								<span class="mr-2"> <i class="fas fa-circle text-info"></i>미디어</span>
								<span class="mr-2"> <i class="fas fa-circle text-info"></i>창작자</span>
							</div>
						</div>
					</div>
					<div class="anal gender">
            			<div class="card-body">
							<div class="chart-pie pt-4 pb-2">
								<canvas id="myPieChart2"></canvas>
							</div>
							<div class="mt-4 text-center small">
								<span class="mr-2"> <i class="fas fa-circle text-primary"></i>남자</span>
								<span class="mr-2"> <i class="fas fa-circle text-success"></i>여자</span>
							</div>
						</div>
					</div>
				</div>
				<div class="analytics">
					<div class="payment">
                         <div class="chart-area">
                          <canvas id="myAreaChart"></canvas>
                        </div>
					</div>
					</div>
				<div class="analytics">
				<!-- The Sign-in button. This will run `queryReports()` on success. -->
				<p class="g-signin2" data-onsuccess="queryReports"></p>

				<!-- The API response will be printed here. -->
				<textarea cols="80" rows="20" id="query-output"></textarea>
				</div>
			<div>
				
			</div>
			</div>
		</div>
		<div>
		<input type="text" id="stat1020" value="${stat1020}">
		<input type="text" id="stat3040" value="${stat3040}">
		<input type="text" id="stat5060" value="${stat5060}">
		<input type="text" id="cate1" value="${cate1}">
		<input type="text" id="cate2" value="${cate2}">
		<input type="text" id="cate3" value="${cate3}">
		<input type="text" id="cate4" value="${cate4}">
		<input type="text" id="cate5" value="${cate5}">
		<input type="text" id="cate6" value="${cate6}">
		<input type="text" id="cate7" value="${cate7}">
		<input type="text" id="male" value="${male}">
		<input type="text" id="female" value="${female}">
		</div>
	</div>
	<script language=JavaScript>
	var days='<c:out value="${days}"/>';

	</script>
	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath()%>/sb-admin-2/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/sb-admin-2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="<%=request.getContextPath()%>/sb-admin-2/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="<%=request.getContextPath()%>/sb-admin-2/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="<%=request.getContextPath()%>/sb-admin-2/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="<%=request.getContextPath()%>/sb-admin-2/js/demo/chart-area-demo.js"></script>
	<script src="<%=request.getContextPath()%>/sb-admin-2/js/demo/chart-pie-demo.js"></script>
	<script src="https://apis.google.com/js/client:platform.js"></script>
</body>
</html>