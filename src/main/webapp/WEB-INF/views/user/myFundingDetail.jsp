<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="wrapper">
		<div class="fundingContainer">
			<div class="orderInfoContainer" style="border: 1px solid #ededed">
				<p class="fundingStatus"></p>
				<p class="fundingTitle"><b>펀딩 이름: </b>${fundingDetail.fundingTitle }</p>
				<p class="maker"><b>메이커: </b>${fundingDetail.maker }</p>
				<p class="orderNo"><b>주문 번호: </b>${fundingDetail.orderNo }</p>
			</div>
			
			<div class="fundingDetail" style="border: 1px solid #ededed">
				<c:if test="${!empty fundingReward }">
					<c:forEach var="rewardDetail" items="${fundingReward }" varStatus="status">
						<h3 class="rewardTitle">${rewardDetail.rewardTitle }</h3>
						<p class="rewardOption">
							<span class="rewardPrice"> ${rewardDetail.rewardPrice }원</span>
							<span class="rewardCount"> ${rewardDetail.rewardCount }개</span>
							<span class="rTotalPrice"> ${rewardDetail.rewardCount }원</span>
						</p>
					</c:forEach>
				</c:if>
			</div>
			<div class="btnContainer">
				<button class="refundBtn">결제 취소</button>
			</div>
		</div>
	
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>