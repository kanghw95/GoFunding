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
			<div class="FundingDetailReportContent_wrap__3dTJX">
				<h2 class="FundingDetailReportContent_title__Ac_gs">펀딩 신청이 완료되었습니다.</h2>
				<section class="FundingDetailReportContent_section__2eXEY">
					<div class="FundingDetailReportContent_header__fkv3p">
						<span class="FundingDetailReportContent_funder__3nM2Q">${funding.maker}</span>
							<strong class="FundingDetailReportContent_subject__z9q_J">${funding.fundingtitle}</strong>
							<strong class="FundingDetailReportContent_total__jhdNn">총<span class="FundingDetailReportContent_amount__1UFlV">
								<span class="FundingDetailReportContent_number__245_F">${totalPrice}</span>원</span>
							</strong>
					</div>
					<dl class="FundingDetailReportContent_list_order__3n7yw">
						<dt class="FundingDetailReportContent_name__-jyUO">리워드 내역</dt>
						<dd class="FundingDetailReportContent_description__AL7vy">
							<c:forEach var="reward" items="${reward}" varStatus="status">
							<div class="FundingDetailReportContent_item___GCD9">
								<c:if test="${reward ne ''}">
									<span class="FundingDetailReportContent_item_name__3Ke91">${reward} ${rewardEA[status.index]}개</span>
									<span class="FundingDetailReportContent_item_price__12MHY">
										<span class="FundingDetailReportContent_number__245_F">${rewardPrice[status.index]}</span>원
									</span>
								</c:if>
							</div>
						</c:forEach>
							<div class="FundingDetailReportContent_item___GCD9">
								<span class="FundingDetailReportContent_item_name__3Ke91">배송비</span>
									<c:if test="${funding.deliverycharge eq 0}">
										<span class="FundingDetailReportContent_item_price__12MHY">무료</span>
									</c:if>
									<c:if test="${funding.deliverycharge ne 0}">
										<span class="FundingDetailReportContent_item_price__12MHY">${funding.deliverycharge}원</span>
									</c:if>	
							</div>
						</dd>
						<dt class="FundingDetailReportContent_name__-jyUO">결제방법</dt>
						<dd class="FundingDetailReportContent_description__AL7vy">${paycat}결제</dd>
						<dt class="FundingDetailReportContent_name__-jyUO">발송 예상일</dt>
						<fmt:formatDate value="${funding.deliverydate}" type="DATE" var="deliverydate" pattern="yyyy년 MM월 dd일"/> 
						<dd class="FundingDetailReportContent_description__AL7vy">${deliverydate}</dd>
					</dl>
				</section>
				<div class="FundingDetailReportContent_links__2Rupu">
					<a class="FundingDetailReportContent_link_list__CKVq0" href="/sprout">메인 페이지</a>
					<a href="#" class="FundingDetailReportContent_link_my__2ANDe">My 펀딩</a>
				</div>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>