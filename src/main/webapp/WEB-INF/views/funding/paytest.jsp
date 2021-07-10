<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
			<c:if test="${fundinglist eq null}">
				<tr>
					<td colspan="6" align="center"><br><br>펀딩이 존재하지않습니다.<br><br></td>
				</tr>
			</c:if>

			<c:if test="${fundinglist ne null}">
				<c:forEach var="vo" items="${fundinglist}" varStatus="status">
					<li class="fundingContent_item">
							<a href="funding/detail?no=${vo.fundingno}" class="fundingCard_wrap">
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">
										<jsp:useBean id="currTime" class="java.util.Date" />

										<jsp:useBean id="now" class="java.util.Date" />
										<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
										<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
										<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
										<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
										
										<c:choose>
											<c:when test="${(endDate-strDate) gt 0 }">
												<span class="fundingCard_date">${endDate - strDate } 일 남음</span>
											</c:when>
											<c:otherwise>
											<span class="fundingCard_date">종료</span>
											</c:otherwise>
										</c:choose>
											<span class="fundingCard_amount"><strong class="FundingCard_number__n_hbd"> <fmt:formatNumber value="${vo.currentprice}" pattern="#,###,###"/></strong> 원</span>
										</div>
									</div>
							</a>
					</li>
					
				</c:forEach>
			</c:if>
			

				
</body>
</html>