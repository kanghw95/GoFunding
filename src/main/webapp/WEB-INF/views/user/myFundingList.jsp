<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

		<div class="top-area">
			<select>
				<option>전체</option>
				<option>결제 완료 펀딩</option>
				<option>환불한 펀딩</option>
			</select>
		</div>

		<div class="myFundingList">
			<c:if test="${!empty fundingList }">
				<c:forEach var="myFunding" items="${fundingList }" varStatus="status">
					<ul>
						<li>
							<a href="<%=request.getContextPath()%>/myfundingdetail?fundingNo=${myFunding.fundingNo }"> 
							<span class="fundingBox">
								<span class="orderDate">${myFunding.orderDate }</span>
								<span class="fundingStatus"></span>
								<br>
								<b class="fundingTitle">${myFunding.fundingTitle }</b>
								<span class="maker">${myFunding.maker }</span>
								<br>
								<b class="orderStatus"></b>
								<button class="refund">환불하기</button>
								<input type="hidden" name="fundingNo" value="${myFunding.fundingNo }">
							</span>
							</a>
						</li>
					</ul>
				</c:forEach>
			</c:if>
			
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>