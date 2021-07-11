<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/admin/notice.css?ver=1.0" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/admin/notice.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
body {
    font-family: 'NanumSquare', sans-serif !important;
}

.input {
	float: right;
    margin-left: 720px;
    box-shadow: none;
    border-radius: 10px;
    height: 30px;
}

a {
	text-decoration-line: none;
	color: black;
}

a:hover {color:#00BFFF;}
a:active {color:#00BFFF;}

.no {
	width: 40px;
}

.box {
	width: 40px;
}

.title {
	width: 500px;
}

.id {
	width: 75px;
}

.cnt {
	width: 55px;
}

.like {
	width: 55px;
}

td, th, tr {
   	border: 1px solid #ccc;
}

td {
	border: none;
	color: #757575;
   	height: 45px;
}

th {
	border: none;
	height: 45px;
}

.boardNo {
	color: #757575;
}
</style>
<script>
function input() {
	location.href="noticeWrt"
}

function tag(no) {
	console.log(a);
}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<div id="space">
		<div id="wrapper">
			<img src="resources/img/admin/list.png" id="list">&nbsp;
			<p id="userManage">공지사항</p>
			<button class="input" onclick="input()">글쓰기</button>
		</div>
		<input type="radio" name="radio" id="event" value="new" onclick="noticeRadio()">최신순
		<input type="radio" name="radio" id="event" value="like" onclick="noticeRadio()">추천순
		<input type="radio" name="radio" id="event" value="cnt" onclick="noticeRadio()">조회순
		<input type="radio" name="radio" id="event" value="cmt" onclick="noticeRadio()">댓글순
	</div> 
	<div id="userInfo">
		<table class="tg" border="1" id="tr">
			<tr>
				<th class="no">NO</th>
				<th class="box"><input type="checkbox" id="checkAll" onclick="checkAll()"></th>
				<th class="title">제목</th>
				<th class="id">작성자</th>
				<th class="cnt">조회</th>
				<th class="like">추천</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="notice" items="${notice }" varStatus="status">
				<tr name="boardList" id="boardList" class="search">
					<td class="noBox"><input type="text" name="boardNo" class="boardNo" value=${notice.boardNo } readonly></td>
					<td><input type="checkbox" name="check" onclick='checkOne()'></td>
					<td><a href="noticeDetail?no=${notice.boardNo }">${notice.boardTitle}</a></td>
					<td>${notice.boardId}</td>
					<td>${notice.boardCnt}</td>
					<td>0</td>
					<td>${notice.boardDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="under">
		<select id="select">
			<option value="0">--선택--</option>
			<option value="1">제목</option>
			<option value="2">작성자</option>
		</select> <input type="text" id="text" name="userId">
		<div id="paging">
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a href="notice${pageMaker.makeQuery(pageMaker.startPage - 1)}" id="num"><</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li><a href="notice${pageMaker.makeQuery(idx)}" id="num">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="notice${pageMaker.makeQuery(pageMaker.endPage + 1)}" id="num">></a></li>
				</c:if>
			</ul>
		</div>
		<br>
		<button id="searchBtn" onclick="searchNotice()">검색</button>
		<button id="deleteBtn" onclick="deleteNotice()">삭제</button>
	</div>
</body>
</html>
