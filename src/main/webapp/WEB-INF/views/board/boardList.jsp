<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
#select {
	position: absolute;
	left: 800px;
}

#writeBtn {
	position: absolute;
	left: 800px;
}
</style>
</head>
<body>
	<h1>자유게시판</h1>
	<select id="select">
		<option value="">자유게시판</option>
		<option value="">후기게시판</option>
		<option value="">QnA게시판</option>
		<option value="">기부게시판</option>
		<option value="">정보공유게시판</option>
	</select>

	<input type="radio" name="radio">최신순
	<input type="radio" name="radio">추천순
	<input type="radio" name="radio">조회순
	<input type="radio" name="radio">댓글순
	<br>
	<br>

	<input type="button" value="글쓰기" id="writeBtn">

	<br>
	<br>

	<table>
		<tr bgcolor="#a8dba8">
			<td align="center" width="60">NO</td>
			<td align="center" width="380">제목</td>
			<td align="center" width="100">작성자</td>
			<td align="center" width="100">조회</td>
			<td align="center" width="100">추천</td>
			<td align="center" width="100">작성일</td>
		</tr>

		<!-- 글이 없을 경우 -->
		<c:if test="${listCount eq 0}">
			<tr>
				<td colspan="6" align="center"><br>
				<br> 게시판에 저장된 글이 없습니다.<br>
				<br></td>
			</tr>
		</c:if>

		<c:if test="${listCount ne 0 }">
			<c:forEach var="vo" items="${list}">
				<tr>
					<td align="center">${vo.boardNo }</td>
					<td align="left"><a
						href="boardDetail?boardNo=${vo.boardNo }&page=${currentPage}">&nbsp;${vo.boardTitle }</a></td>
					<td align="center">${vo.boardId }</td>
					<td align="center">${vo.boardCnt }</td>
					<%--	<td align = "center">${vo.getLike }</td> --%>
					<td align="center">0</td>
					<td align="center">${vo.boardDate }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	<script>
		$("#writeBtn").on("click", function() {
			location.href = "boardWrite";
		})
	</script>
</body>
</html>