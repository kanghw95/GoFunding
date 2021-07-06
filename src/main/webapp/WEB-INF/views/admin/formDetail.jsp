<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/admin/formDetail.css?ver=1.0" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"/>
<div class="wrapper">
	<div class="outer">
		<div class="inner">
			<h3>펀딩 신청관리 상세페이지</h3>
			<div id="tabDiv">
				<c:forEach var="app" items="${formDetail}">
					<form id="frm">
						<table class="table">
							<tr class="title">
								<td class="titleNo">${app.applyNo}</td>
								<td class="titleCenter">${app.fundingTitle}</td>
								<td class="titleId" colspan="2">${app.id}</td>
							</tr>
							<tr class="line">
								<td id="formTitle" colspan="4"><br>업체명 : ${app.maker}<br><br>
									업체 소개 : ${app.description}<br><br>
									담당자 : ${app.id}<br><br>
									연락처 : ${app.makerTel}<br><br>
									이메일(선택) : ${app.makerEmail}<br><br>
									참고 링크 : ${app.makerInfo}<br><br>
									펀딩 주제 : ${app.fundingTitle}<br><br>
									펀딩 분류 : ${app.fundingCategory}<br><br>
									펀딩 소개 : ${app.fundingContent}<br><br>
									펀딩 목표 금액 : ${app.fundingPrice}<br><br>
									펀딩 시작일 : <fmt:formatDate value="${app.fundingStart}" pattern="yy-MM-dd" /><br><br>
									펀딩 종료일 : <fmt:formatDate value="${app.fundingFin}" pattern="yy-MM-dd" /><br><br>
									후원금 사용 계획 : ${app.fundingPlan}<br><br>
									리워드 소개 : ${app.rewardDesc}<br><br>
									리워드 품목 : ${app.rewardTitle}<br><br>
									리워드 금액 : ${app.rewardPrice}원<br><br>
									리워드 개수 : ${app.rewardEA}개<br><br>
									배송일자 : <fmt:formatDate value="${app.deliveryDate}" pattern="yy-MM-dd" /><br><br>
									배송비 : ${app.deliveryCharge}<br><br>
								</td>
							</tr>
							<tr class=title>
								<td class="lineBtn">
									<button type="button" onclick="history.back()" id="list">목록으로</button>
								</td><td class="titleCenter"></td>
								<td colspan="2">
									<button type="button" id="permitForm">승인</button>
								</td>
							</tr>
							<tr>
								<td colspan="2"><br><textarea id="feedback" cols="120" rows="10" placeholder="거절 사유 :"></textarea></td>
								<td colspan="2"><br><button type="button" id="rejectForm">&nbsp;거절</button></td>
							</tr>
						</table>
						<input type="hidden" name="applyNo" id="applyNo"
							value="${app.applyNo}"> <input type="hidden" name="maker"
							value="${app.maker}"> <input type="hidden"
							name="description" value="${app.description}"> <input
							type="hidden" name="id" value="${app.id}"> <input
							type="hidden" name="fundingTitle" value="${app.fundingTitle}">
						<input type="hidden" name="fundingCategory"
							value="${app.fundingCategory}"> <input type="hidden"
							name="fundingContent" value="${app.fundingContent}"> <input
							type="hidden" name="fundingPrice" value="${app.fundingPrice}">
						<input type="hidden" name="start" value="${app.fundingStart}">
						<input type="hidden" name="end" value="${app.fundingFin}">
						<input type="hidden" name="rewardDesc" value="${app.rewardDesc}">
						<input type="hidden" name="rewardTitle" value="${app.rewardTitle}">
						<input type="hidden" name="rewardPrice" value="${app.rewardPrice}">
						<input type="hidden" name="rewardEA" value="${app.rewardEA}">
						<input type="hidden" name="delivery" value="${app.deliveryDate}">
						<input type="hidden" name="deliveryCharge"
							value="${app.deliveryCharge}">
					</form>
				</c:forEach>
			</div>
			</div>
			</div>
			</div>
			<script>
					$(document).on('click', '#permitForm', function() {
						$("#frm").attr("action","formPermit");
						$("#frm").attr("method","post");
						$('#frm').submit();
					});
					$("#rejectForm").click(function() {
						var applyNo=$("#applyNo").val();
						var feedback=$("#feedback").val();
						if(feedback==""||null){
							alert('거절 사유를 입력해주세요.');
						} else{
							$.ajax({
								url: 'formReject',
								data: {'applyNo':applyNo, 'feedback':feedback},
								type: 'get',
								success: function(){
									alert('전송성공');
									window.location.href="http://localhost:8090/sprout/formReject";
								},
								error: function(request, status, error){
									alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}
							})
						}
					});
				</script>
</body>
</html>