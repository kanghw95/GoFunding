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
#option {
	position: absolute;
	left: 800px;
}

#writeBtn2 {
	position: absolute;
	left: 800px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="wrapper">

	<h1>자유게시판</h1>
	<select id="option">
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
	
	<form id = "writeBtn2">
	<input type="button" value="글쓰기" id = "writing">
	</form>
	
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
					<td align="left"><a href="boardDetail?boardNo=${vo.boardNo }&page=${currentPage}">&nbsp;${vo.boardTitle }</a></td>
					<td align="center">${vo.boardId }</td>
					
					<td align="center">${vo.boardCnt }</td>
					<td align="center">${likenct }</td> <!-- 추천 -->
					<td align="center">${vo.boardDate }</td>
				</tr>
			</c:forEach>
		</c:if>
		
		
		<!-- 앞 페이지 번호 처리 -->
		<tr align="center" height="20">
			<td colspan="5"><c:if test="${currentPage <= 1}"> < </c:if>
				<c:if test="${currentPage > 1}">
					<c:url var="blistST" value="boardList">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<a href="${blistST}"> < </a>
				</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" /> 
				<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						<font color="red" size="4"><b>[${p}]</b></font>
					</c:if>
					<c:if test="${p ne currentPage}">
						<c:url var="blistchk" value="boardList">
							<c:param name="page" value="${p}" />
						</c:url>
						<a href="${blistchk}">${p}</a>
					</c:if>
				</c:forEach> 
				<c:if test="${currentPage >= maxPage}"> > </c:if> 
				<c:if test="${currentPage < maxPage}">
					<c:url var="blistEND" value="boardList">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<a href="${blistEND}"> > </a>
				</c:if></td>
		</tr>
	</table>

	<script>
		$("#writing").on("click", function() {
			var write1 = confirm("글 쓰기 하시겠습니까?");
			
			if(write1 == true) {
				var sessionUserId = '${sessionScope.user.userId}';
				
				console.log("sessionUserId : " + sessionUserId);
		
				if(sessionUserId == 'null' || sessionUserId == ''){
					alert("로그인 후 글 쓰기가 가능합니다.");
					return;
				}	
			}else{
				return false;
			}
			
			var frm = document.getElementById("writeBtn2");
			frm.action = "boardWrite";
			frm.method = "get";
			frm.submit();
//			location.href = "boardWrite";
		})
	</script>
	
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>