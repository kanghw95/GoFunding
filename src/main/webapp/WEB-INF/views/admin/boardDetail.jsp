<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
body {
    font-family: 'NanumSquare', sans-serif !important;
}

.space {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 80px;
}

.wrapper {
	display: table;
	margin-bottom: 80px;
}

.list {
	width: 35px;
	line-height: 40px;
}

.qnaList {
	display: table-cell;
	vertical-align: middle;
	font-size: 20px;
}

.backFree {
	float: right;
    margin-left: 700px;
    box-shadow: none;
    border-radius: 10px;
    height: 30px;
}

.backReview {
	float: right;
    margin-left: 700px;
    box-shadow: none;
    border-radius: 10px;
    height: 30px;
}


.backQuestion {
	float: right;
        margin-left: 664px;
    box-shadow: none;
    border-radius: 10px;
    height: 30px;
}


.backShare {
	float: right;
    margin-left: 664px;
    box-shadow: none;
    border-radius: 10px;
    height: 30px;
}


.backEvent {
	float: right;
    margin-left: 680px;
    box-shadow: none;
    border-radius: 10px;
    height: 30px;
}



.info {
	width: 900px;
	border-color: #ccc;
	border-collapse: collapse;
	border-spacing: 0;
	margin-left: auto;
	margin-right: auto;
}

.replyArea {
	display: inline-block;
	width: 900px;
}

.title {
	width: 630px;
	height: 50px;
	text-align: center;
}

.noId {
	text-align: center;
	width: 130px;
}

.qnaNo {
	border: none;
	text-align: center;
	outline: none;
	width: 20px;
}

.qnaCon {
	text-align: center;
	height: 250px;
}

.con {
	width: 700px;
    margin: auto;
}
</style>
<script>
function backFree() {
	location.href="freeboardlist";
}

function backReview() {
	location.href="reviewboardlist";
}

function backQuestion() {
	location.href="questionboardlist";
}

function backShare() {
	location.href="shareboardlist";
}

function backEvent() {
	location.href="eventboardlist";
}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
<div class="space">
	<div class="wrapper">
		<img src="resources/img/admin/list.png" class="list">&nbsp;
		<c:if test="${!empty free }">
			<p class="qnaList">자유게시판</p>
			<button class="backFree" onclick="backFree()">목록으로</button>
		</c:if>
		<c:if test="${!empty review }">
			<p class="qnaList">후기게시판</p>
			<button class="backReview" onclick="backReview()">목록으로</button>
		</c:if>
		<c:if test="${!empty question }">
			<p class="qnaList">질의응답게시판</p>
			<button class="backQuestion" onclick="backQuestion()">목록으로</button>
		</c:if>
		<c:if test="${!empty share }">
			<p class="qnaList">정보공유게시판</p>
			<button class="backShare" onclick="backShare()">목록으로</button>
		</c:if>
		<c:if test="${!empty event }">
			<p class="qnaList">이벤트게시판</p>
			<button class="backEvent" onclick="backEvent()">목록으로</button>
		</c:if>
	</div>
</div> 
<table border="1" class="info">
	<c:if test="${!empty free }">
		<c:forEach var="free" items="${free }" varStatus="status">
		    <tr>
		        <td class="noId"><input type="text" class="qnaNo" id="qnaNo" value=${free.boardNo } readonly></td>
		        <td class="title">${free.boardTitle }</td>
		        <td class="noId">${free.boardId }</td>
		    </tr>
		    <tr>
		    	<td class="qnaCon">내용</td>
		        <td colspan="2" class="content">
		        	<div class="con">${free.boardContent }</div>
		        </td>
		    </tr>
		</c:forEach>
	</c:if>
		<c:if test="${!empty review }">
		<c:forEach var="review" items="${review }" varStatus="status">
		    <tr>
		        <td class="noId"><input type="text" class="qnaNo" id="qnaNo" value=${review.boardNo } readonly></td>
		        <td class="title">${review.boardTitle }</td>
		        <td class="noId">${review.boardId }</td>
		    </tr>
		    <tr>
		    	<td class="qnaCon">내용</td>
		        <td colspan="2" class="content">
		        	<div class="con">${review.boardContent }</div>
		        </td>
		    </tr>
		</c:forEach>
	</c:if>
		<c:if test="${!empty question }">
		<c:forEach var="question" items="${question }" varStatus="status">
		    <tr>
		        <td class="noId"><input type="text" class="qnaNo" id="qnaNo" value=${question.boardNo } readonly></td>
		        <td class="title">${question.boardTitle }</td>
		        <td class="noId">${question.boardId }</td>
		    </tr>
		    <tr>
		    	<td class="qnaCon">내용</td>
		        <td colspan="2" class="content">
		        	<div class="con">${question.boardContent }</div>
		        </td>
		    </tr>
		</c:forEach>
	</c:if>
		<c:if test="${!empty share }">
		<c:forEach var="share" items="${share }" varStatus="status">
		    <tr>
		        <td class="noId"><input type="text" class="qnaNo" id="qnaNo" value=${share.boardNo } readonly></td>
		        <td class="title">${share.boardTitle }</td>
		        <td class="noId">${share.boardId }</td>
		    </tr>
		    <tr>
		    	<td class="qnaCon">내용</td>
		        <td colspan="2" class="content">
		        	<div class="con">${share.boardContent }</div>
		        </td>
		    </tr>
		</c:forEach>
	</c:if>
		<c:if test="${!empty event }">
		<c:forEach var="event" items="${event }" varStatus="status">
		    <tr>
		        <td class="noId"><input type="text" class="qnaNo" id="qnaNo" value=${event.boardNo } readonly></td>
		        <td class="title">${event.boardTitle }</td>
		        <td class="noId">${event.boardId }</td>
		    </tr>
		    <tr>
		    	<td class="qnaCon">내용</td>
		        <td colspan="2" class="content">
		        	<div class="con">${event.boardContent }</div>
		        </td>
		    </tr>
		</c:forEach>
	</c:if>
</table><br>

</body>