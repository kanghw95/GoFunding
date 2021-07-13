<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPROUT! 새싹나눔</title>
<link href="<%=request.getContextPath() %>/resources/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/user/myFundingList.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="wrapper">

		<h3>
			<i class="fas fa-clipboard-check"></i>&nbsp; 내가 참여한 펀딩
		</h3>

		<div class="myFundingList">
			<c:if test="${!empty fundingList }">
				<c:forEach var="myFunding" items="${fundingList }" varStatus="status">
				<div class="myFundingBox">
					<ul>
						<li>
							<a href="<%=request.getContextPath()%>/myfundingdetail?fundingNo=${myFunding.fundingNo }"> 
							<span class="fundingBox">
								<span class="orderDate">${myFunding.orderDate }</span>
								<span class="fundingStatus">
									펀딩 종료일 : <fmt:formatDate value="${myFunding.fundingfin}" pattern="yy-MM-dd" />
								</span>
								<br>
								<b class="fundingTitle">${myFunding.fundingTitle }</b><br>
								<span class="maker">by. ${myFunding.maker }</span>
								<br>
								<b class="orderStatus">
									<c:if test="${myFunding.paymentType eq '1'}">
										결제 완료
									</c:if>
									<c:if test="${myFunding.paymentType eq '0'}">
										주문 완료
									</c:if>
									<c:if test="${myFunding.paymentType eq '2'}">
										배송 준비중
									</c:if>
									<c:if test="${myFunding.paymentType eq '3'}">
										배송 중
									</c:if>
									<c:if test="${myFunding.paymentType eq '4'}">
										배송 완료
									</c:if>
									<c:if test="${myFunding.paymentType eq '5'}">
										환불 완료
									</c:if>
								</b>
								<input type="hidden" name="fundingNo" value="${myFunding.fundingNo }">
							</span>
							</a>
						</li>
					</ul>
					</div>
				</c:forEach>
			</c:if>
			
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>