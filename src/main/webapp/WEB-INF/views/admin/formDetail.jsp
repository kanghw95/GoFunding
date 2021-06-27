<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Insert title here</title>
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			</head>

			<body>
				펀딩 신청관리 상세페이지
				<div>
					<c:forEach var="app" items="${formDetail}">
						<form id="frm">
						<table border="1">
								<tr>
									<td>${app.applyNo}</td>
									<td>${app.id}님의 펀딩 신청</td>
									<td colspan="2">${app.id}</td>
								</tr>
								<tr>
									<td id="formTitle" colspan="4">
										업체명 : ${app.maker}<br>
										업체 소개 : ${app.description}<br>
										담당자 : ${app.id}<br>
										연락처 : ${app.makerTel}<br>
										이메일(선택) : ${app.makerEmail}<br>
										참고 링크 : ${app.makerInfo}<br>
										펀딩 주제 : ${app.fundingTitle}<br>
										펀딩 분류 : ${app.fundingCategory}<br>
										펀딩 소개 : ${app.fundingContent}<br>
										펀딩 목표 금액 : ${app.fundingPrice}<br>
										펀딩 시작일 :
										<fmt:formatDate value="${app.fundingStart}" pattern="yy-MM-dd" /><br>
										펀딩 종료일 :
										<fmt:formatDate value="${app.fundingFin}" pattern="yy-MM-dd" /><br>
										후원금 사용 계획 : ${app.fundingPlan}<br>
										리워드 소개 : ${app.rewardDesc}<br>
										리워드 품목 : ${app.rewardTitle}<br>
										리워드 금액 : ${app.rewardPrice}원<br>
										리워드 개수 : ${app.rewardEA}개<br>
										배송일자 :
										<fmt:formatDate value="${app.deliveryDate}" pattern="yy-MM-dd" /><br>
										배송비 : ${app.deliveryCharge}
									</td>
								</tr>
							<tr>
								<td>
									<button type="button" onclick="history.back()">목록으로</button>
								</td>
								<td></td>
								<td colspan="2">
									<button type="button" id="permitForm">승인</button>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<textarea id="feedback" cols="30" rows="10" placeholder="거절 사유 :"></textarea>
								</td>
								<td colspan="2"><button type="button" id="rejectForm">거절</button></td>
							</tr>
						</table>
						<input type="hidden" name="applyNo" id="applyNo" value="${app.applyNo}">
						<input type="hidden" name="maker" value="${app.maker}">
						<input type="hidden" name="description" value="${app.description}">
						<input type="hidden" name="id" value="${app.id}">
						<input type="hidden" name="fundingTitle" value="${app.fundingTitle}">
						<input type="hidden" name="fundingCategory" value="${app.fundingCategory}">
						<input type="hidden" name="fundingContent" value="${app.fundingContent}">
						<input type="hidden" name="fundingPrice" value="${app.fundingPrice}">
						<input type="hidden" name="start" value="${app.fundingStart}">
						<input type="hidden" name="end" value="${app.fundingFin}">
						<input type="hidden" name="rewardDesc" value="${app.rewardDesc}">
						<input type="hidden" name="rewardTitle" value="${app.rewardTitle}">
						<input type="hidden" name="rewardPrice" value="${app.rewardPrice}">
						<input type="hidden" name="rewardEA" value="${app.rewardEA}">
						<input type="hidden" name="delivery" value="${app.deliveryDate}">
						<input type="hidden" name="deliveryCharge" value="${app.deliveryCharge}">
					</form>
					</c:forEach>
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