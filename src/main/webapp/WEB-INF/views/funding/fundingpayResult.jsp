<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 결제 결과</title>
<link href="<%=request.getContextPath() %>/resources/css/funding/fundingpay/fundingpayResult.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="wrapper">
	<div role="main" id="content" class="content">
		<div>
			<div class="FundingDetailReportContent_wrap">
				<h2 class="FundingDetailReportContent_title">펀딩 신청이 완료되었습니다.</h2>
				<section class="FundingDetailReportContent_section">
					<div class="FundingDetailReportContent_header">
						<span class="FundingDetailReportContent_funder">${funding.maker}</span>
							<strong class="FundingDetailReportContent_subject">${funding.fundingtitle}</strong>
							<strong class="FundingDetailReportContent_total">총<span class="FundingDetailReportContent_amount">
								<span class="FundingDetailReportContent_number">${totalPrice}</span>원</span>
							</strong>
					</div>
					<dl class="FundingDetailReportContent_list_order">
						<dt class="FundingDetailReportContent_name">리워드 내역</dt>
						<dd class="FundingDetailReportContent_description">
						<c:forEach var="reward" items="${reward}" varStatus="status">
							<div class="FundingDetailReportContent_item">
								<c:if test="${reward ne ''}">
									<span class="FundingDetailReportContent_item_name">${reward} </span>
									<span class="FundingDetailReportContent_item_price">
										<span class="FundingDetailReportContent_number">${rewardEA[status.index]}개 | ${rewardPrice[status.index]}</span>원
									</span>
								</c:if>
										

							</div>
						</c:forEach>

							
							<div class="FundingDetailReportContent_item">
								<c:if test="${cheer ne null}">
									<span class="FundingDetailReportContent_item_name">${cheer}</span>
									<span class="FundingDetailReportContent_item_price">
										<span class="FundingDetailReportContent_number">${cheerEA}개 | ${cheerPrice}</span>원
									</span>
								</c:if><br><br>
								<span class="FundingDetailReportContent_item_name">배송비</span>
									<c:if test="${funding.deliverycharge eq 0}">
										<span class="FundingDetailReportContent_item_price">무료</span>
									</c:if>
									<c:if test="${funding.deliverycharge ne 0}">
										<span class="FundingDetailReportContent_item_price">${funding.deliverycharge}원</span>
									</c:if>	
							</div>
						</dd>
						<dt class="FundingDetailReportContent_name">결제방법</dt>
						<dd class="FundingDetailReportContent_description">${paycat}결제</dd>
						<dt class="FundingDetailReportContent_name">발송 예상일</dt>
						<fmt:formatDate value="${funding.deliverydate}" type="DATE" var="deliverydate" pattern="yyyy년 MM월 dd일"/> 
						<dd class="FundingDetailReportContent_description">${deliverydate}</dd>
					</dl>
				</section>
				<div class="FundingDetailReportContent_links">
					<a class="FundingDetailReportContent_link_list" href="/sprout">메인 페이지</a>
					<a href="<%=request.getContextPath()%>/myPage" class="FundingDetailReportContent_link_my">My 펀딩</a>
				</div>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>