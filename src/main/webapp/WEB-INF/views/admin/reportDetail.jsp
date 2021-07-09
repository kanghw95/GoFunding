<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resource	s/css/admin/reportDetail.css?ver=1.0" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/admin/reportDetail.js"></script>
<script>
function back() {
	location.href="report"
}

function userStop() {
	var stopId = document.getElementById("userStop").value;
	var title = document.getElementById("rptTitle").value;
	var no = document.getElementById("rptNo").value;
	console.log("정지시킬 아이디 : " + stopId);
	console.log("조회할 제목 : " + title);
	console.log("조회할 번호 : " + no);
	if (confirm("정말 계정을 정지하겠습니까?")) {
		$.ajax({
			url : "userStop",
			type : "POST",
			traditional : true,
			data : {
				stopId : stopId,
				title : title,
				no : no
			},
			success : function(data) {
				console.log("성공");
			},
			error : function(error) {
				console.log("에러");
			}
 		})
	} else {
		console.log("계정 정지 취소");
	}
}	

function userPass() {
	var title = document.getElementById("rptTitle").value;
	var no = document.getElementById("rptNo").value;
	console.log("조회할 제목 : " + title);
	console.log("조회할 번호 : " + no);
	$.ajax({
		url : "userPass",
		type : "POST",
		traditional : true,
		data : {
			title : title,
			no : no
		},
		success : function(data) {
			console.log("성공");
		},
		error : function(error) {
			console.log("에러");
		}
		})
}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<div class="space">
		<div class="wrapper">
			<img src="resources/img/admin/list.png" class="list">&nbsp;
			<p class="reportDetail">신고 상세</p>
			<button class="back" onclick="back()">목록으로</button>
		</div>
		<table>
			<c:forEach var="report" items="${rDetail }" varStatus="status">
				<tr>
					<th class="th">신고 아이디</th>
					<td>${report.reportId }</td>
					<th class="th">신고 유형</th>
					<td>${report.reportType }</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<th class="reason">신고 사유</th>
					<td colspan="3">${report.reportWr }</td>
				</tr>
				<c:if test="${empty report.reportTitle }">
					<tr>
						<th class="title">신고 게시글 제목</th>
						<td colspan="3">-</td>
					</tr>
				</c:if>
				<c:if test="${!empty report.reportTitle }">
					<tr>
						<th class="title">신고 게시글 제목</th>
						<td colspan="3">${report.reportTitle }</td>
					</tr>
				</c:if>
				<tr>
					<th class="content">신고 게시글(댓글) 내용</th>
					<td colspan="3">${report.reportContent }</td>
				</tr>
				<input type="hidden" id="userStop" value=${report.reportId }>
				<input type="hidden" id="rptTitle" value=${report.reportTitle }>
				<input type="hidden" id="rptNo" value=${report.reportNo }>
			</c:forEach>
		</table><br>
	<button class="pass" onclick="userPass()">통과</button>
	<button class="stop" onclick="userStop()">정지</button>
	</div>
	<div class="footer">
	</div>
</body>
</html>