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

#wrapper {
	display: table;
	margin-bottom: 80px;
	position: relative;
	padding-top: 110px;
	color: #202020;
}

td {
	font-size: 16px;
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
    margin-left: 698px;
    box-shadow: none;
    border-radius: 10px;
    height: 30px;
    border: 1px;
}

.backReview {
	float: right;
    margin-left: 698px;
    box-shadow: none;
    border-radius: 10px;
    height: 30px;
    border: 1px;
}


.backQuestion {
	float: right;
    margin-left: 660px;
    box-shadow: none;
    border-radius: 10px;
    height: 30px;
    border: 1px;
}


.backShare {
	float: right;
    margin-left: 660px;
    box-shadow: none;
    border-radius: 10px;
    height: 30px;
    border: 1px;
}


.backEvent {
	float: right;
    margin-left: 679px;
    box-shadow: none;
    border-radius: 10px;
    height: 30px;
    border: 1px;
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
	width: 40px;
}

.qnaCon {
	text-align: center;
	height: 250px;
}

.con {
	width: 700px;
    margin: auto;
}

.replyTable {
	height: auto;
    width: 900px;
	border-color: #ccc;
	border-collapse: collapse;
	border-spacing: 0;
	margin: auto;
	border: none;
}

.replyDate {
	text-align: right;
	width: 150px;
}

.replyId {
	text-align: right;
	width: 150px;
}
</style>
<script>
jQuery(function($) {
    $("body").css("display", "none");
    $("body").fadeIn(800);
    $("a.transition").click(function(event){
        event.preventDefault();
        linkLocation = this.href;
        $("body").fadeOut(1000, redirectPage);
    });
    function redirectPage() {
    window.location = linkLocation;
    }
});

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
	<div id="wrapper">
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
<table class="replyTable" id="cmt">
	<c:if test="${!empty freeCmt }">
		<c:forEach var="cmt" items="${freeCmt }" varStatus="status">
			<tr class="cmtList">
				<td>${cmt.cmtContent }</td>
				<td class="replyId">${cmt.id }</td>
				<td class="replyDate">${cmt.cmtDate }</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${!empty reviewCmt }">
		<c:forEach var="cmt" items="${reviewCmt }" varStatus="status">
			<tr class="cmtList">
				<td>${cmt.cmtContent }</td>
				<td class="replyId">${cmt.id }</td>
				<td class="replyDate">${cmt.cmtDate }</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${!empty questionCmt }">
		<c:forEach var="cmt" items="${questionCmt }" varStatus="status">
			<tr class="cmtList">
				<td>${cmt.cmtContent }</td>
				<td class="replyId">${cmt.id }</td>
				<td class="replyDate">${cmt.cmtDate }</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${!empty shareCmt }">
		<c:forEach var="cmt" items="${shareCmt }" varStatus="status">
			<tr class="cmtList">
				<td>${cmt.cmtContent }</td>
				<td class="replyId">${cmt.id }</td>
				<td class="replyDate">${cmt.cmtDate }</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${!empty eventCmt }">
		<c:forEach var="cmt" items="${eventCmt }" varStatus="status">
			<tr class="cmtList">
				<td>${cmt.cmtContent }</td>
				<td class="replyId">${cmt.id }</td>
				<td class="replyDate">${cmt.cmtDate }</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
</body>
