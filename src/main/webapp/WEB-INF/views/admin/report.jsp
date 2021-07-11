<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resource	s/css/admin/qna.css?ver=1.6" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resource	s/css/admin/report.css?ver=1.0" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/admin/report.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<div class="space">
		<div id="wrapper">
			<img src="resources/img/admin/list.png" class="list">&nbsp;
			<p class="reportList">신고내역</p>
		</div> 
	</div>
	<div class="reportInfo">
		<form method="POST" id="reportForm" name="reportForm" action="reportDetail">
			<table class="tg" border="1" id="tr">
				<tr>
					<th class="no">No</th>
					<th class="box"><input type="checkbox" id="check" onclick="checkAll()"></th>
					<th class="place">종류(위치)</th>
					<th class="type">질문유형</th>
					<th class="rId">신고 아이디</th>
					<th class="reason">신고 사유</th>
					<th class="state">신고 상태</th>
				</tr>
				<c:forEach var="rpt" items="${report }" varStatus="status">
					<tr class="search">
						<td class="noBox"><input type="text" name="boardNo" class="boardNo" id="qnaNo" value=${rpt.reportNo } readonly></td>
						<td><input type="checkbox" name="check" onclick="checkOne()"></td>
						<c:if test="${!empty rpt.reportTitle }">
							<td>
								<span>게시글</span>
							</td>
						</c:if>
						<c:if test="${empty rpt.reportTitle }">
							<td>
								<span>댓글</span>
							</td>
						</c:if>
						<td>${rpt.reportType }</td>
						<td>${rpt.reportId }</td>
						<td>${rpt.reportWr }</td>
						<c:if test="${rpt.reportState eq 'N'.charAt(0)}">
							<td>
								<span class="wait">처리 대기</span><br>
								<input type="button" class="deal" value="상세보기" 
								id="${rpt.reportTitle }" name="${rpt.reportNo }" onclick="detail(this.id, this.name)">
							</td>
						</c:if>
						<c:if test="${rpt.reportState ne 'N'.charAt(0)}">
							<td>
								<span class="commit">처리완료</span><br>
								<input type="button" class="deal" value="확인하기"
								id="${rpt.reportTitle}" name="${rpt.reportNo}" onclick="detail(this.id, this.name)">
							</td>
						</c:if>
					</tr>
					<input type="hidden" id="rptNo" name="no">
					<input type="hidden" id="rptTitle" name="title">
					<input type="hidden" name="dt" value=${rpt.reportTitle }>
				</c:forEach>
			</table>
		</form>
	</div>
	<div class="under">
		<select id="select">
			<option value="0">--선택--</option>
			<option value="1">욕설</option>
			<option value="2">도배</option>
			<option value="3">성적발언</option>
			<option value="4">기타</option>
		</select>
		<button class="searchBtn" onclick="searchReport()">검색</button>
	</div>
</body>
</html>