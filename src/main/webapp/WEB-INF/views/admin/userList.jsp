<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/admin/userList.css?ver=1.0" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/admin/userList.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<div id="space">
		<div id="wrapper">
			<img src="resources/img/admin/list.png" id="list">&nbsp;
			<p id="userManage">회원관리</p>
		</div>
		<c:if test="${!empty usercount }">
		<p id="userCount">사용자수 : ${usercount }</p>
		</c:if>
		<c:if test="${empty usercount }">
		<p id="userCount">사용자수 : 값이 없습니다.</p>
		</c:if>
	</div>
	<div id="userInfo">
		<table class="tg" border="1" id="tr">
			<tr>
				<th>NO</th>
				<th><input type="checkbox" id="checkAll" onclick="checkAll()"></th>
				<th>이메일</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>전화번호</th>
				<th>성별</th>
				<th>나이</th>
				<th>포인트</th>
				<th>신고누적횟수</th>
			</tr>
			<c:if test="${!empty userlist }">
				<c:forEach var="user" items="${userlist }" varStatus="status">
					<tr name="userList" id="userList" class="search">
						<td class="noBox"><input type="text" name="userNo" class="userNo" value=${user.userNo } readonly></td>
						<td><input type="checkbox" name="check" onclick='checkOne()'></td>
						<td>${user.userId }</td>
						<td>${user.userName}</td>
						<td>${user.userNick}</td>
						<td>${user.userPhone}</td>
						<td>${user.gender}</td>
						<td>${user.userAge}</td>
						<td>${user.point}</td>
						<td>${user.reportCnt}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<div id="under">
		<select id="select">
			<option value="0">--선택--</option>
			<option value="1">이메일</option>
			<option value="2">이름</option>
			<option value="3">닉네임</option>
		</select> <input type="text" id="text" name="userId">
		<div id="paging">
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a
						href="userlist${pageMaker.makeQuery(pageMaker.startPage - 1)}"><</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li><a href="userlist${pageMaker.makeQuery(idx)}" id="num">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="userlist${pageMaker.makeQuery(pageMaker.endPage + 1)}">></a></li>
				</c:if>
			</ul>
		</div>
		<br>
		<button id="searchBtn" onclick="searchUser()">검색</button>
		<button id="deleteBtn" onclick="deleteUser()">삭제</button>
	</div>

</body>
</html>