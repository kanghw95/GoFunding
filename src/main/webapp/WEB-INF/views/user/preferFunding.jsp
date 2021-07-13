<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPROUT! 새싹나눔</title>
<link href="<%=request.getContextPath() %>/resources/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/user/preferFunding.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="wrapper">
		<div class="preferWrapper">
			<h3>
				<i class="far fa-heart"></i>&nbsp; 관심 펀딩
			</h3>
			
			<div class="fundingBox">
			<c:if test="${preferList eq null}">
				<span>관심 펀딩이 존재하지 않습니다.</span>
			</c:if>
			<div class="fundingContainer">
			<c:if test="${preferList ne null}">
				<c:forEach var="vo" items="${preferList}" varStatus="status">
				<input type="hidden" name="no" value="${vo.fundingNo}">
				<table class="table">
					<tr>
						<td style="width: 267px; justify-content: center;">
							<div class="FundingCard_img_wrap">
								<img loading="lazy" src="resources/fundingimg/${vo.fundingTitle}.jpg" alt="${vo.fundingTitle}" width="267" height="200" class="fundingCard_img">
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 267px; height: 40px; font-size: 15px;">
							<div class="fundingCard_content">
								<strong class="fundingCard_title">${vo.fundingTitle}</strong>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 267px; height: 30px;">
							<div class="fundingCard_organization">by. ${vo.maker}</div>
						</td>
					</tr>
					
					<tr>
						<td style="width: 267px; text-align: center;">
							<div class="fundingCard_figure">
								<a href="<%=request.getContextPath()%>/funding/detail?no=${vo.fundingNo}" class="fundingCard_wrap">참여하기</a>			
							</div>
						</td>
					</tr>
				</table>
				</c:forEach>
			</c:if>
			</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>