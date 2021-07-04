<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css">
<link href="<%=request.getContextPath() %>/resources/css/admin/formList.css?after" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="wrapper">
<div class="outer">
<div class="inner">
<h3>펀딩 반려 목록</h3>
<div id="category">
	<form id="frm">
	<select name="fundingCategory" id="fundingCategory">
		<option value="종류" selected disabled>-종류별-</option>
		<option value="" >전체</option>
		<option value="일자리 창출">일자리 창출</option>
		<option value="공정 무역">공정 무역</option>
		<option value="친환경">친환경</option>
		<option value="기부">기부</option>
		<option value="작은 가게">작은 가게</option>
		<option value="미디어">미디어</option>
		<option value="창작자">창작자</option>
	</select>
</form>
</div>
<div>
	<table class="tabDiv">
		<tr>
			<c:forEach var="app" items="${formReject}" varStatus="status">
			<c:if test="${status.index%4==0}">
			</tr><tr>
			</c:if>
			<td id="formTitle">
				<i class="fas fa-seedling fa-3x sprout"></i><br>
				${app.fundingTitle}
				<input type="hidden" id="applyNo" value="${app.applyNo}">
			</td>
		</c:forEach>
		</tr>
	</table>
</div>
</div>
</div>
</div>
<script>
	$("#fundingCategory").change(function(){
		var fundingCategory=$("#fundingCategory option:selected").val();
		console.log(fundingCategory);
		$("#frm").attr("action","formRejectCate");
		$("#frm").attr("method","get");
		$("#frm").submit();
	});
</script>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
