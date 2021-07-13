<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPROUT! 새싹나눔</title>
<link href="<%=request.getContextPath() %>/resources/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/user/myFundingDetail.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style type="text/css">
.modal_wrap{
	display: none;
	width: 300px;
	height: 500px;
	position: absolute;
	top:30%;
	left: 50%;
	margin: -100px 0 0 -100px;
	background:white;
	z-index: 2;
	border-radius: 12px;
	border: 3px solid #CFCFCF;
}
.black_bg{
	display: none;
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	background-color:rgba(0, 0,0, 0);
	top:0;
	left: 0;
	z-index: 1;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	 <fmt:parseDate value="${fundingfin}" var="paymentday" pattern="yyyy년MM월dd"/> 
	<div class="wrapper">
				<div class="black_bg"></div>
				<div class="modal_wrap" style="text-align: center;">
					취소 전에 확인하세요!
					 <hr>
					 지금 신청하고 있는 펀딩은 ${paymentday}일에 배송이 시작됩니다.
					 <hr>
					 펀딩은 쇼핑과 달리 배송이후 단순 변심으로 인한 취소, 환불이 어려울 수 있습니다.<br>
					 <br>
					<form action="insertOrderRefund" id="funRefund" method="post">
					
					 <button type="button" id="noagree" style=" border: 1px solid black;">취소</button>
					 <input type="submit" value="환불" id="agree" style=" border: 1px solid black;" >
					
						<c:forEach var="rewardDetail" items="${fundingReward }" varStatus="status">
							<input type="text" id="orderDetailNo${rewardDetail.orderDetailNo}" name="orderDetailNo" value="${rewardDetail.orderDetailNo}">
						</c:forEach>
						<c:forEach var="rewardDetail" items="${fundingReward }" varStatus="status" begin="1" end="1">
							<input type="text" id="orderNo" name="orderNo" value="${rewardDetail.orderNo}">
							<input type="text" id="fundingNo" name="fundingNo" value="${rewardDetail.fundingNo}">
							<input type="text" id="totalPrice" name="totalPrice" value="">
						</c:forEach>
						<c:forEach var="rewardDetail" items="${fundingReward }" varStatus="status">
							<input type="text" id="rewardEA" name="rewardEA" value="${rewardDetail.rewardCount}">
							<input type="text" id="reward" name="reward" value="${rewardDetail.rewardTitle}">
						</c:forEach>
					</form>
				</div>
		
		<div class="detailBox">
		<h3 style="margin-bottom: 30px;">
			<i class="fas fa-clipboard-check"></i>&nbsp; 내가 참여한 펀딩
		</h3>
				
	<c:forEach var="fundingDetail" items="${fundingDetail }" varStatus="status" begin="1" end="1">
		<div class="fundingContainer">
			<div class="orderInfoContainer">
				<p class="fundingStatus">${fundingStatus }</p>
				<p class="fundingTitle"><b>펀딩 이름: </b>${fundingDetail.fundingTitle }</p>
				<p class="maker"><b>메이커: </b>${fundingDetail.maker }</p>
				<p class="orderNo"><b>주문 번호: </b>${fundingDetail.orderNo }</p>
				<p class="orderStatus"><b>주문 상태: </b>
				<c:if test="${fundingDetail.orderStatus eq 0 }">
					<b>주문 확인</b>
				</c:if>
				<c:if test="${fundingDetail.orderStatus eq 1 }">
					<b>결제 완료</b>
				</c:if>
				<c:if test="${fundingDetail.orderStatus eq 2 }">
					<b>배송 준비중</b>
				</c:if>
				<c:if test="${fundingDetail.orderStatus eq 3 }">
					<b>배송 중</b>
				</c:if>
				<c:if test="${fundingDetail.orderStatus eq 4 }">
					<b>배송 완료</b>
				</c:if>
				<c:if test="${fundingDetail.orderStatus eq 5 }">
					<b>환불 완료</b>
				</c:if>
				</p>
				<p id="Price" class="orderNo"></p>
			</div>
			
			<div class="fundingDetail">
				<c:if test="${!empty fundingReward }">
					<c:forEach var="rewardDetail" items="${fundingReward }" varStatus="status">
						<h3 class="rewardTitle">${rewardDetail.rewardTitle }</h3>
						<p class="rewardOption">
							<span class="rewardPrice"> ${rewardDetail.rewardPrice }원</span>
							<span class="rewardCount"> ${rewardDetail.rewardCount }개</span>
							<span class="rTotalPrice"> ${rewardDetail.rTotalPrice }원</span>
							<input type="hidden" id="rewardPirce${rewardDetail.orderDetailNo}" value="${rewardDetail.rTotalPrice }">
						</p>
					</c:forEach>
				</c:if>
			<div class="btnContainer">
				<button class="refundBtn" id="cancelBtn">결제 취소</button>
			</div>
			</div>
		</div>
	</c:forEach>
	</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

<script>
$(document).ready(function () {	
	var totalRewardPirce = 0;
	<c:forEach var="rewardDetail" items="${fundingReward }" varStatus="status">
		totalRewardPirce +=  parseInt($("#rewardPirce${rewardDetail.orderDetailNo}").val());
	</c:forEach>
	$("#totalPrice").val(totalRewardPirce);
	$("#Price").html("<b>총 추문 금액: </b>"+ totalRewardPirce +"원")

	
	var cancelBtn =  document.getElementById("cancelBtn"); 
	<c:forEach var="fundingDetail" items="${fundingDetail }" varStatus="status" begin="1" end="1">
	var orderStatus = ${fundingDetail.orderStatus};
	</c:forEach>

	
	cancelBtn.addEventListener("click",function(){
				
		if(orderStatus == 4 || orderStatus == 3 || orderStatus == 2 ){
			alert("배송 관련 작업중에는 환불이 불가능합니다.")
			return;
		}else if(orderStatus == 5){
			alert("환불이 완료된 건입니다.")
			return;
		}
		
		document.querySelector('.modal_wrap').style.display ='block';
		document.querySelector('.black_bg').style.display ='block';

	});
	function offClick() {
		document.querySelector('.modal_wrap').style.display ='none';
		document.querySelector('.black_bg').style.display ='none';
	}
document.querySelector('#noagree').addEventListener('click', offClick);

	});
</script>
</html>