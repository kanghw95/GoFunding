<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
펀딩 반려 목록
<div>
	<form id="frm">
	<select name="fundingCategory" id="fundingCategory">
		<option value="종류" selected disabled>-종류별-</option>
		<option value="" >전체</option>
		<option value="일자리창출">일자리창출</option>
		<option value="공정무역">공정무역</option>
		<option value="친환경">친환경</option>
		<option value="기부">기부</option>
		<option value="작은가게">작은가게</option>
		<option value="미디어">미디어</option>
		<option value="창작자">창작자</option>
	</select>
</form>
</div>
<div>
	<table border="1">
		<tr>
			<c:forEach var="app" items="${formReject}">
			<td id="formTitle">
				이미지<br>
				${app.fundingTitle}
				<input type="text" id="applyNo" value="${app.applyNo}">
			</td>
		</c:forEach>
		</tr>
	</table>
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
</body>
</html>
