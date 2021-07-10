<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath() %>/resources/css/admin/adminMain.css?ver=1.0" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<!-- Custom fonts for this template-->
<link
	href="<%=request.getContextPath() %>/sb-admin-2/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<%=request.getContextPath()%>/sb-admin-2/css/sb-admin-2.min.css" rel="stylesheet">
<meta name="google-signin-client_id" content="787043379258-f7m1f543ukem253a55cm7kc569hijh0r.apps.googleusercontent.com">
<meta name="google-signin-scope" content="https://www.googleapis.com/auth/analytics.readonly">
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"/>
	<div class="wrapper">
		<div class="outer">
			<div class="inner">
				<div class="notice">
					<h3>알림 모아보기</h3>
				<div class="fundingDiv">
				<table class="noticeTab" >
				<tr class=noticeTitle>
					<td><span>펀딩 신청 관리</span>&nbsp;&nbsp;<button class="detailBtn funding">상세보기</button></td>
					<td><span>커뮤니티 관리</span>&nbsp;&nbsp;<button class="detailBtn community">상세보기</button></td>
					<td><span>펀딩 신청 관리</span>&nbsp;&nbsp;<button class="detailBtn qna">상세보기</button></td>
				</tr>
				<tr>
					<td>1</td>
					<td>1</td>
					<td>1</td>
				</tr>
				<tr>
					<td>2</td>
					<td>2</td>
					<td>2</td>
				</tr>
				</table>
				</div>
				</div>
				<div class="analytics analFunding">
					<h3>현재 선호되는 펀딩</h3>
					<div class="anal age">
						<div class="card-body">
							<div class="chart-pie pt-4 pb-2">
							<h5>연령별</h5>
								<canvas id="myPieChart"></canvas>
							</div>
							<div class="mt-4 text-center small">
								<span class="mr-2"> <i class="fas fa-circle icon1"></i>10-20대</span><br>
								<span class="mr-2"> <i class="fas fa-circle icon2"></i>30-40대</span><br>
								<span class="mr-2"> <i class="fas fa-circle icon3"></i>50-60대</span>
							</div>
						</div>
					</div>
					<div class="anal category">
    			        <div class="card-body">
							<div class="chart-pie pt-4 pb-2">
							<h5>분류별</h5>
								<canvas id="myPieChart1"></canvas>
							</div>
							<div class="mt-4 text-center small">
								<span class="mr-2"> <i class="fas fa-circle icon1"></i>일자리 창출</span>
								<span class="mr-2"> <i class="fas fa-circle icon2"></i>공정 무역</span><br>
								<span class="mr-2"> <i class="fas fa-circle icon3"></i>친환경</span>
								<span class="mr-2"> <i class="fas fa-circle icon4"></i>기부</span>
								<span class="mr-2"> <i class="fas fa-circle icon5"></i>작은 가게</span><br>
								<span class="mr-2"> <i class="fas fa-circle icon6"></i>미디어</span>
								<span class="mr-2"> <i class="fas fa-circle icon7"></i>창작자</span>
							</div>
						</div>
					</div>
					<div class="anal gender">
            			<div class="card-body">
							<div class="chart-pie pt-4 pb-2">
							<h5>성별</h5>
								<canvas id="myPieChart2"></canvas>
							</div>
							<div class="mt-4 text-center small">
								<span class="mr-2"> <i class="fas fa-circle icon1"></i>남자</span><br>
								<span class="mr-2"> <i class="fas fa-circle icon2"></i>여자</span><br><br>
							</div>
						</div>
					</div>
				</div>
				<div class="analytics analCommunity">
					<h3>커뮤니티</h3>
					<div class="anal age">
						<div class="card-body">
							<div class="chart-pie pt-4 pb-2">
							<h5>연령별</h5>
								<canvas id="myPieChart3"></canvas>
							</div>
							<div class="mt-4 text-center small">
								<span class="mr-2"> <i class="fas fa-circle icon1"></i>10-20대</span><br>
								<span class="mr-2"> <i class="fas fa-circle icon2"></i>30-40대</span><br>
								<span class="mr-2"> <i class="fas fa-circle icon3"></i>50-60대</span>
							</div>
						</div>
					</div>
					<div class="anal category">
    			        <div class="card-body">
							<div class="chart-pie pt-4 pb-2">
							<h5>분류별</h5>
								<canvas id="myPieChart4"></canvas>
							</div>
							<div class="mt-4 text-center small">
								<span class="mr-2"> <i class="fas fa-circle icon1"></i>자유게시판</span>
								<span class="mr-2"> <i class="fas fa-circle icon2"></i>후기게시판</span><br>
								<span class="mr-2"> <i class="fas fa-circle icon3"></i>질답게시판</span>
								<span class="mr-2"> <i class="fas fa-circle icon4"></i>이벤트게시판</span><br>
								<span class="mr-2"> <i class="fas fa-circle icon5"></i>정보공유게시판</span>
							</div>
						</div>
					</div>
					<div class="anal gender">
            			<div class="card-body">
							<div class="chart-pie pt-4 pb-2">
							<h5>성별</h5>
								<canvas id="myPieChart5"></canvas>
							</div>
							<div class="mt-4 text-center small">
								<span class="mr-2"> <i class="fas fa-circle icon1"></i>남자</span><br>
								<span class="mr-2"> <i class="fas fa-circle icon2"></i>여자</span><br><br>
							</div>
						</div>
					</div>
				</div>
				<div class="analytics analPayment">
					<div class="payment">
                         <div class="chart-area">
                         <h3>펀딩 결제 현황</h3>
                          <canvas id="myAreaChart"></canvas>
                        </div>
					</div>
					</div>
					<div class="analytics paymentTabs paymentTab1">
					<div class="paymentTab">
					<h5 class="divTitle">펀딩 금액</h5>
					<table id="fundingTab1">
					<tr class="tabTitle">
					<td>상태</td>
					<td>건수</td>
					<td>금액</td>
					</tr>
					<c:forEach var="order" items="${order1}">
					<tr>
					<td>결제</td>
					<td>${order.ORDERCNT}</td>
					<td><fmt:formatNumber value="${order.ORDERTOTALPRICE}" pattern="#,###" /></td>
					</tr>
					</c:forEach>
					<!--<c:forEach  var="payment" items="${payment1}">-->
					<tr>
					<td>환불</td>
					<td></td>
					<td></td>
					</tr>
					<!--</c:forEach>-->
					</table>
					</div>
					<div class="paymentTab">
					<h5 class="divTitle">펀딩 현황</h5>
					<table id="fundingTab2">
					<tr class="tabTitle">
					<td>진행</td>
					<td>신청</td>
					<td>반려</td>
					<td>종료</td>
					</tr>
					<c:forEach var="funding" items="${funding}">
					<tr>
					<td>${funding.PROCEEDING}</td>
					<td>${funding.APPLY}</td>
					<td>${funding.REJECT}</td>
					<td>${funding.FINISH}</td>
					</tr>
					</c:forEach>
					</table>
					</div>
					</div>
					<div class="analytics paymentTabs paymentTab2">
					<div class="totalTab">
					<h5 class="divTitle">펀딩 총 현황</h5>
					<table id="fundingTab3">
					<tr class="tabTitle">
					<td colspan="3">금액</td>
					<td colspan="3">건수</td>
					<td colspan="4">펀딩</td>
					</tr>
					<tr>
					<td>결제</td>					
					<td>환불</td>					
					<td>총 결제 금액</td>					
					<td>결제</td>					
					<td>환불</td>					
					<td>총 결제 건수</td>					
					<td>진행</td>					
					<td>신청</td>					
					<td>반려</td>					
					<td>종료</td>					
					</tr>
					<tr>
					<c:forEach var="order" items="${order1}" varStatus="status">
					<td>
					<fmt:formatNumber value="${order.ORDERTOTALPRICE}" pattern="#,###" />
					</td>
					</c:forEach>					
					<!--<c:forEach var="payment" items="${payment1}" varStatus="status">-->
					<td>
					<c:out value=""></c:out>
					</td>					
					<!--</c:forEach>-->					
					<c:forEach var="order1" items="${order1}" varStatus="status">
					<td>
					<!--<c:forEach var="payment" items="${payment1}" varStatus="status">-->
					<c:out value=""></c:out>
					<!--</c:forEach>-->					
					</td>					
					</c:forEach>					
					<c:forEach var="order2" items="${order1}" varStatus="status">
					<td>
					<c:out value="${order2.ORDERCNT}"></c:out>
					</td>					
					</c:forEach>					
					<!--<c:forEach var="payment1" items="${payment1}" varStatus="status">-->
					<td>
					<c:out value=""></c:out>
					</td>					
					<!--</c:forEach>-->					
					<!--<c:forEach var="payment2" items="${payment1}" varStatus="status">-->
					<td>
					<c:forEach var="order3" items="${order1}" varStatus="status">
					<c:out value="${order3.ORDERCNT}"></c:out> <!-- TODO -->
					</c:forEach>					
					</td>					
					<!--</c:forEach>-->					
					<c:forEach var="funding" items="${funding}" varStatus="status">
					<td>
					<c:out value="${funding.PROCEEDING}"></c:out>
					</td>
					<td>
					<c:out value="${funding.APPLY}"></c:out>
					</td>
					<td>
					<c:out value="${funding.REJECT}"></c:out>
					</td>
					<td>
					<c:out value="${funding.FINISH}"></c:out>
					</td>					
					</c:forEach>					
					</tr>
					</table>
					</div> 
					</div>
				<div class="analytics hidden">
				<!-- The Sign-in button. This will run `queryReports()` on success. -->
				<p class="g-signin2" data-onsuccess="queryReports"></p>

				<!-- The API response will be printed here. -->
				<textarea cols="80" rows="20" id="query-output"></textarea>
				</div>
			<div>
				
			</div>
			</div>
		</div>
		<div class="hidden">
		<input type="text" id="statF1020" value="${statF1020}">
		<input type="text" id="statF3040" value="${statF3040}">
		<input type="text" id="statF5060" value="${statF5060}">
		<input type="text" id="statC1020" value="${statC1020}">
		<input type="text" id="statC3040" value="${statC3040}">
		<input type="text" id="statC5060" value="${statC5060}">
		<input type="text" id="cateF1" value="${cateF1}">
		<input type="text" id="cateF2" value="${cateF2}">
		<input type="text" id="cateF3" value="${cateF3}">
		<input type="text" id="cateF4" value="${cateF4}">
		<input type="text" id="cateF5" value="${cateF5}">
		<input type="text" id="cateF6" value="${cateF6}">
		<input type="text" id="cateF7" value="${cateF7}">
		<input type="text" id="cateC1" value="${cateC1}">
		<input type="text" id="cateC2" value="${cateC2}">
		<input type="text" id="cateC3" value="${cateC3}">
		<input type="text" id="cateC4" value="${cateC4}">
		<input type="text" id="cateC5" value="${cateC5}">
		<input type="text" id="maleF" value="${maleF}">
		<input type="text" id="femaleF" value="${femaleF}">
		<input type="text" id="maleC" value="${maleC}">
		<input type="text" id="femaleC" value="${femaleC}">
		<input type="text" id="111" value="${order1}">
		<c:forEach var="days" items="${days}" varStatus="status">
			<span id="day-${status.count}">${days.TOTAL}</span>
			<span id="date-${status.count}">${days.ORDERDATE}</span>
		</c:forEach>
		</div>
	</div>
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