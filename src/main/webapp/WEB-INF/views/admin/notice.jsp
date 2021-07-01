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
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<div id="space">
		<div id="wrapper">
			<img src="resources/img/admin/list.png" id="list">&nbsp;
			<p id="userManage">공지사항</p>
		</div>
		<input type="radio" name="radio" id="event" value="new" onclick="noticeRadio()">최신순
		<input type="radio" name="radio" id="event" value="like" onclick="noticeRadio()">추천순
		<input type="radio" name="radio" id="event" value="cnt" onclick="noticeRadio()">조회순
		<input type="radio" name="radio" id="event" value="cmt" onclick="noticeRadio()">댓글순
	</div> 
	<div id="userInfo">
		<table class="tg" border="1" id="tr">
			<tr>
				<th>NO</th>
				<th><input type="checkbox" id="checkAll" onclick="checkAll()"></th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회</th>
				<th>추천</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="notice" items="${notice }" varStatus="status">
				<tr name="boardList" id="boardList" class="search">
					<td class="noBox"><input type="text" name="boardNo" class="boardNo" value=${notice.boardNo } readonly></td>
					<td><input type="checkbox" name="check" onclick='checkOne()'></td>
					<td>${notice.boardTitle}</td>
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
