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
	<div role="main" id="content" class="content">
		<div>
			<div class="FundingDetailReportContent_wrap__3dTJX">
				<h2 class="FundingDetailReportContent_title__Ac_gs">펀딩 신청이
					완료되었습니다.</h2>
				<section class="FundingDetailReportContent_section__2eXEY">
					<div class="FundingDetailReportContent_header__fkv3p">
						<span class="FundingDetailReportContent_funder__3nM2Q">별별마켓</span><strong
							class="FundingDetailReportContent_subject__z9q_J">귀엽게
							시작하는 제로웨이스트 라이프</strong><strong
							class="FundingDetailReportContent_total__jhdNn">총<span
							class="FundingDetailReportContent_amount__1UFlV"><span
								class="FundingDetailReportContent_number__245_F">9,700</span>원</span></strong>
					</div>
					<dl class="FundingDetailReportContent_list_order__3n7yw">
						<dt class="FundingDetailReportContent_name__-jyUO">리워드 내역</dt>
						<dd class="FundingDetailReportContent_description__AL7vy">
							<div class="FundingDetailReportContent_item___GCD9">
								<span class="FundingDetailReportContent_item_name__3Ke91">무해습관
									리유저블컵 기본세트(컵 1개 + 원캡 1개) 1개</span><span
									class="FundingDetailReportContent_item_price__12MHY"><span
									class="FundingDetailReportContent_number__245_F">9,700</span>원</span>
							</div>
							<div class="FundingDetailReportContent_item___GCD9">
								<span class="FundingDetailReportContent_item_name__3Ke91">배송비</span><span
									class="FundingDetailReportContent_item_price__12MHY">무료</span>
							</div>
						</dd>
						<dt class="FundingDetailReportContent_name__-jyUO">결제방법</dt>
						<dd class="FundingDetailReportContent_description__AL7vy">카드
							간편결제</dd>
						<dt class="FundingDetailReportContent_name__-jyUO">결제 예정일</dt>
						<dd class="FundingDetailReportContent_description__AL7vy">2021.07.06</dd>
						<dt class="FundingDetailReportContent_name__-jyUO">발송 예상일</dt>
						<dd class="FundingDetailReportContent_description__AL7vy">2021.07.13</dd>
					</dl>
				</section>
				<div class="FundingDetailReportContent_links__2Rupu">
					<a class="FundingDetailReportContent_link_list__CKVq0"
						href="/fundings/home">펀딩 리스트</a><a
						href="/my/timeline#type=funding"
						class="FundingDetailReportContent_link_my__2ANDe">My 해피빈</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>