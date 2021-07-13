<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/user/main.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/user/util.css" rel="stylesheet" type="text/css" />

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/user/main.js"></script>
<style>
body {
	padding: 20px;
	background-color: #ededed;
}

table {
	width: 700px;
	font-size: 15px;
	margin-top: 90px !important;
}
th {
	font-weight: bold !important;
}

.wrapper{
	padding-top: 15px !important;
	margin-left: 30px;
}

.column1, .column2, .column3 {
	background-color: #fff;
	padding-top: 10px !important;
	padding-bottom: 10px !important;
}

.column1 {
	width: 8%;
	padding-left: 0 !important;
	padding-right: 0 !important;
	
	text-align: center;
}

.column2 {
	width: 50%;
}

.column3 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="wrapper">
	
		<h2>이벤트 게시판</h2>
		
		
	<c:if test="${!empty eBoardMore }">
		<div class="table100-head">
			<table>
					<thead>
						<tr class="row100 head">
							<th class="cell100 column1" style="background-color: #add9d4 !important;">글 번호</th>
							<th class="cell100 column2" style="background-color: #add9d4 !important;">글 제목</th>
							<th class="cell100 column3" style="background-color: #add9d4 !important;">작성일</th>
						</tr>
					</thead>
				</table>
		</div>
		<div class="table100-body js-pscroll ps ps--active-y">		
			<table>
				<tbody>
					<c:forEach var="e" items="${eBoardMore }" varStatus="status">
						<tr class="row100 body">
							<td class="cell100 column1">${e.boardNo }</td>
							<td class="cell100 column2">${e.boardTitle}</td>
							<td class="cell100 column3">${e.boardDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>		
				</c:if>
				<c:if test="${empty eBoardMore }">
					<span> 작성된 게시글이 없습니다 </span>
				</c:if>
	</div>
		
</body>
</html>