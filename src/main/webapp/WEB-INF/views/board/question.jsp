<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질의응답게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
.list{
	width : 50px;
	height : 50px;
	margin-left: 10px;
}

.free{
	margin-left: 70px;
	margin-top: -50px;
}

.write-button{
	margin-left: 1050px;
	margin-bottom: 20px;
}

.table{
	margin-left: 10px;
	margin-top: 50px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<div class="wrapper">
	
	<img src="../resources/img/admin/list.png" class="list">
	<h1 class="free">질의응답게시판</h1>
	
<!-- 	<select id="option" onChange="window.location.href=this.value">
		<option value="http://localhost:8090/sprout/board/list">자유게시판 이동</option>
		<option value="http://localhost:8090/sprout/board/review">후기게시판 이동</option>
		<option value="">QnA게시판</option>
		<option value="">기부게시판</option>
		<option value="">정보공유게시판</option>
	</select> -->
	
<!-- 	<div class="radio">
	<input type="radio" name="radio">최신순
	<input type="radio" name="radio">추천순
	<input type="radio" name="radio">조회순
	<input type="radio" name="radio">댓글순
	</div> -->
	
	<div class="write-button">
	<form id="questionwriteBtn2">
	<button type="button">글쓰기</button>
	</form>
	</div>
	
	<div class="table">
	<table width="1100" height="800">
		<tr bgcolor="#a8dba8">
			<td align="center" width="80">NO</td>
			<td align="center" width="400">제목</td>
			<td align="center" width="120">작성자</td>
			<td align="center" width="80">조회</td>
			<td align="center" width="80">추천</td>
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
			<c:forEach var="vo" items="${list}" varStatus="status">
				<tr>
					<td align="center">${vo.boardNo }</td>
					<td align="left"><a href="questiondetail?boardNo=${vo.boardNo }&page=${currentPage}" class="title">${vo.boardTitle }</a>
					&nbsp;
					
					<!-- 제목 옆에 댓글수 -->
						<c:if test="${vo.cmt ne 0}">
							<small>(${vo.cmt})</small>
					</c:if>
					
					<c:if test="${vo.cmt eq 0}">
						<small></small>
					</c:if>			
					</td>
	
					<td align="center">${vo.boardId }</td>
					<td align="center">${vo.boardCnt }</td>
					<td align="center">${vo.likecnt }</td> <!-- 추천 -->
					<td align="center">${vo.boardDate }</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<!-- 앞 페이지 번호 처리 -->
		<tr align="center" height="20">
			<td colspan="5"><c:if test="${currentPage <= 1}"> < </c:if>
				<c:if test="${currentPage > 1}">
					<c:url var="question" value="question">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<a href="${question}"> < </a>
				</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" /> 
				<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						<font color="red" size="4"><b>${p}</b></font>
					</c:if>
					<c:if test="${p ne currentPage}">
						<c:url var="question" value="question">
							<c:param name="page" value="${p}" />
						</c:url>
						<a href="${question}">${p}</a>
					</c:if>
				</c:forEach> 
				<c:if test="${currentPage >= maxPage}"> > </c:if> 
				<c:if test="${currentPage < maxPage}">
					<c:url var="question" value="question">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<a href="${question}"> > </a>
				</c:if></td>
			</tr>
		</table>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>

	<script>
		$(".write-button").on("click", function() {
			var write1 = confirm("글 쓰기 하시겠습니까?");
			
			if(write1 == true) {
				var sessionUserId = '${sessionScope.user.userId}';
						
				if(sessionUserId == 'null' || sessionUserId == ''){
					alert("로그인 후 글 쓰기가 가능합니다.");
					return;
				}	
			}else{
				return false;
			}
			
			var frm = document.getElementById("questionwriteBtn2");
			frm.action = "questionwrite";
			frm.method = "get";
			frm.submit();
		});
	</script>
</html>