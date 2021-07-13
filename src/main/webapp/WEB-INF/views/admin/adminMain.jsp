<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath() %>/resources/css/admin/adminMain.css?ver=1.1" rel="stylesheet" type="text/css" />
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
					<td class="collect"><span>펀딩 신청 관리</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select class="detailBtn funding" id="" name="category">
					<option value="신청펀딩">신청펀딩</option>
					<option value="승인펀딩">승인펀딩</option>
					<option value="반려펀딩">반려펀딩</option>
					</select></td>
					<td class="collect"><span>커뮤니티 관리</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select class="detailBtn community" name="category">
					<option value="자유게시판">자유게시판</option>
					<option value="후기게시판">후기게시판</option>
					<option value="질답게시판">질답게시판</option>
					<option value="이벤트게시판">이벤트게시판</option>
					<option value="정보공유게시판">정보공유게시판</option>
					</select></td>
					<td class="collect"><span>공지/문의사항 관리</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select class="detailBtn qna" name="category">
					<option value="공지사항">공지사항</option>
					<option value="FAQ">FAQ</option> 
					<option value="QNA">QNA</option> 
					</select></td>
				</tr>
				<c:forEach var="formList1" items="${formList1}" varStatus="status">
				<tr>
					<td id="app-${status.count}" class="goToDetail">${formList1.APPL}</td>
					<td id="comm-${status.count}" class="goToDetail">${formList2[status.index].FREE}</td>
					<td id="noti-${status.count}" class="goToDetail">${formList3[status.index].NOTICE}</td>
				</tr>
				</c:forEach>
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
					<tr>
					<td>환불</td>
					<td>${order.REFUNDCNT}</td>
					<td><fmt:formatNumber value="${order.REFUNDTOTALPRICE}" pattern="#,###" /></td>
					</tr>
					</c:forEach>
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
					<td>
					<fmt:formatNumber value="${order.REFUNDTOTALPRICE}" pattern="#,###" />
					</td>					
					<td>
					<fmt:formatNumber value="${order.ORDERTOTALPRICE-order.REFUNDTOTALPRICE}" pattern="#,###" />
					</td>					
					<td>
					<c:out value="${order.ORDERCNT}"></c:out>
					</td>					
					<td>
					<c:out value="${order.REFUNDCNT}"></c:out>
					</td>					
					<td>
					<c:out value="${order.ORDERCNT-order.REFUNDCNT}"></c:out> <!-- TODO -->
					</td>					
					</c:forEach>					
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
		<c:forEach var="formList1" items="${formList1}" varStatus="status">
			<span id="fnd-${status.count}">${formList1.FND}</span>
			<span id="appl-${status.count}">${formList1.APPL}</span>
			<span id="rjc-${status.count}">${formList1.RJC}</span>
		</c:forEach>
		<c:forEach var="formList2" items="${formList2}" varStatus="status">
			<span id="free-${status.count}">${formList2.FREE}</span>
			<span id="review-${status.count}">${formList2.REVIEW}</span>
			<span id="question-${status.count}">${formList2.QUESTION}</span>
			<span id="event-${status.count}">${formList2.EVENT}</span>
			<span id="sha-${status.count}">${formList2.SHA}</span>
		</c:forEach>
		<c:forEach var="formList3" items="${formList3}" varStatus="status">
			<span id="notice-${status.count}">${formList3.NOTICE}</span>
			<span id="faq-${status.count}">${formList3.FAQ}</span>
			<span id="qna-${status.count}">${formList3.QNA}</span>
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
<script>

	jQuery(function($) {
		$("body").css("display", "none");
		$("body").fadeIn(2000);
		$("a.transition").click(function(event) {
			event.preventDefault();
			linkLocation = this.href;
			$("body").fadeOut(1000, redirectPage);
		});
		function redirectPage() {
			window.location = linkLocation;
		}
	});

	window.onload = function() {
		console.log("회원 정지 해제 시작");
		$.ajax({
			url : "reportStop",
			type : "POST",
			success : function(data) {
				console.log("성공");
			}
		})
	}
	
	$(".funding").change(function(){
		var category=$(".funding option:selected").val();
		if(category=="반려펀딩"){
			var rjc1=$("#rjc-1").text(); var rjc2=$("#rjc-2").text();
			$("#app-1").text(rjc1); $("#app-2").text(rjc2);
		} else if(category=="승인펀딩"){
			var fnd1=$("#fnd-1").text(); var fnd2=$("#fnd-2").text();
			$("#app-1").text(fnd1); $("#app-2").text(fnd2);
		} else if(category=="신청펀딩"){
			var appl1=$("#appl-1").text(); var appl2=$("#appl-2").text();
			$("#app-1").text(appl1); $("#app-2").text(appl2);
		}
	});	
	$(".community").change(function(){
		var category=$(".community option:selected").val();
		if(category=="후기게시판"){
			var review1=$("#review-1").text(); var review2=$("#review-2").text();
			$("#comm-1").text(review1); $("#comm-2").text(review2);
		} else if(category=="질답게시판"){
			var question1=$("#question-1").text(); var question2=$("#question-2").text();
			$("#comm-1").text(question1); $("#comm-2").text(question2);
		} else if(category=="이벤트게시판"){
			var event1=$("#event-1").text(); var event2=$("#event-2").text();
			$("#comm-1").text(event1); $("#comm-2").text(event2);
		} else if(category=="정보공유게시판"){
			var sha1=$("#sha-1").text(); var sha2=$("#sha-2").text();
			$("#comm-1").text(sha1); $("#comm-2").text(sha2);
		} else if(category=="자유게시판"){
			var free1=$("#free-1").text(); var free2=$("#free-2").text();
			$("#comm-1").text(free1); $("#comm-2").text(free2);
		}
	});	
	$(".qna").change(function(){
		var category=$(".qna option:selected").val();
		if(category=="FAQ"){
			var faq1=$("#faq-1").text(); var faq2=$("#faq-2").text();
			$("#noti-1").text(faq1); $("#noti-2").text(faq2);
		} else if(category=="QNA"){
			var qna1=$("#qna-1").text(); var qna2=$("#qna-2").text();
			$("#noti-1").text(qna1); $("#noti-2").text(qna2);
		} else if(category=="공지사항"){
			var notice1=$("#notice-1").text(); var notice2=$("#notice-2").text();
			$("#noti-1").text(notice1); $("#noti-2").text(notice2);
		}
	});	
    $("body").on("click", "[id^=app-]", function(event) {
    	var category=$(".funding option:selected").val();
		if(category=="반려펀딩"){
			location.href='<%=request.getContextPath()%>/formReject';
		} else if(category=="승인펀딩"){
			location.href='<%=request.getContextPath()%>/fundingList';
		} else if(category=="신청펀딩"){
			location.href='<%=request.getContextPath()%>/formList';
		}
    });
    $("body").on("click", "[id^=comm-]", function(event) {
		var category=$(".community option:selected").val();
		if(category=="후기게시판"){
			location.href='<%=request.getContextPath()%>/reviewboardlist';
		} else if(category=="질답게시판"){
			location.href='<%=request.getContextPath()%>/questionboardlist';
		} else if(category=="이벤트게시판"){
			location.href='<%=request.getContextPath()%>/eventboardlist';
		} else if(category=="정보공유게시판"){
			location.href='<%=request.getContextPath()%>/shareboardlist';
		} else if(category=="자유게시판"){
			location.href='<%=request.getContextPath()%>/freeboardlist';
		}
    });
    $("body").on("click", "[id^=noti-]", function(event) {
		var category=$(".qna option:selected").val();
		if(category=="FAQ"){
			location.href='<%=request.getContextPath()%>/faq';
		} else if(category=="QNA"){
			location.href='<%=request.getContextPath()%>/qna';
		} else if(category=="공지사항"){
			location.href='<%=request.getContextPath()%>/notice';
		}
    });
</script>
</body>
</html>