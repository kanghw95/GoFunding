<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPROUT! 새싹나눔</title>
<link href="<%=request.getContextPath() %>/resources/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/user/myBoardList.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function myflist() {
		window.open("<%=request.getContextPath()%>/myflist", "myFree", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
	
	function myrlist() {
		window.open("<%=request.getContextPath()%>/myrlist", "myReview", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
		
	function myqlist() {
		window.open("<%=request.getContextPath()%>/myqlist", "myQuestion", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
	
	function myslist() {
		window.open("<%=request.getContextPath()%>/myslist", "myShare", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
	
	function myelist() {
		window.open("<%=request.getContextPath()%>/myelist", "myEvent", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
	

</script>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="wrapper">
		<div class="boardWrapper">
			<h3>
				<i class="fas fa-pencil-alt"></i>&nbsp; 내가 쓴 글 목록
			</h3>
			
		<div class="boardBox">
			<div class="boardContainer free">
				<div> 
					<h4 class="innerTitle">자유 게시판</h4>
					<a href="#" onclick="myflist();"><span class="more">더보기</span></a>
				</div>
				<div class="freeContent">
					<table class="table">
						<c:if test="${!empty freeBoardList }">
							<tr style="background-color: #add9d4;">
								<th>글 번호</th>
								<th>글 제목</th>
								<th style="border-right: none;">작성일</th>
							</tr>
							<c:forEach var="free" items="${freeBoardList }" varStatus="status">
								<tr>
									<td style="text-align: center;">${free.boardNo }</td>
									<td>${free.boardTitle}</td>
									<td style="text-align: center; border-right: none;">${free.boardDate}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty freeBoardList }">
							<span> 작성된 게시글이 없습니다 </span>
						</c:if>
					</table>
				</div>
			</div>
			
			<div class="boardContainer review">
				<div> 
					<h4 class="innerTitle">후기 게시판</h4>
					<a href="#" onclick="myrlist();"><span class="more">더보기</span></a>
				</div>
				<div class="reviewContent">
					<table class="table">
						<c:if test="${!empty reviewBoardList }">
							<tr style="background-color: #add9d4;">
								<th>글 번호</th>
								<th>글 제목</th>
								<th>작성일</th>
							</tr>
							<c:forEach var="review" items="${reviewBoardList }" varStatus="status">
								<tr>
									<td>${review.boardNo }</td>
									<td>${review.boardTitle}</td>
									<td>${review.boardDate}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty reviewBoardList }">
							<span> 작성된 게시글이 없습니다 </span>
						</c:if>
					</table>
				</div>		
			</div>
			
			<div class="boardContainer question">
				<div> 
					<h4 class="innerTitle">질의응답 게시판</h4>
					<a href="#" onclick="myqlist();"><span class="more">더보기</span></a>
				</div>
				<div class="questionContent">
					<table class="table">
						<c:if test="${!empty qBoardList }">
							<tr style="background-color: #add9d4;">
								<th>글 번호</th>
								<th>글 제목</th>
								<th>작성일</th>
							</tr>
							<c:forEach var="q" items="${qBoardList }" varStatus="status">
								<tr>
									<td>${q.boardNo }</td>
									<td>${q.boardTitle}</td>
									<td>${q.boardDate}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty qBoardList }">
							<span> 작성된 게시글이 없습니다 </span>
						</c:if>
					</table>
				</div>		
			</div>
			
			<div class="boardContainer share">
				<div> 
					<h4 class="innerTitle">정보공유 게시판</h4>
					<a href="#" onclick="myslist();"><span class="more">더보기</span></a>
				</div>
				<div class="shareContent">
					<table class="table">
						<c:if test="${!empty sBoardList }">
							<tr style="background-color: #add9d4;">
								<th>글 번호</th>
								<th>글 제목</th>
								<th>작성일</th>
							</tr>
							<c:forEach var="s" items="${sBoardList }" varStatus="status">
								<tr>
									<td>${s.boardNo }</td>
									<td>${s.boardTitle}</td>
									<td>${s.boardDate}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty sBoardList }">
							<span> 작성된 게시글이 없습니다 </span>
						</c:if>
					</table>
				</div>		
			</div>
			
			<div class="boardContainer event">
				<div> 
					<h4 class="innerTitle">이벤트 게시판</h4>
					<a href="#" onclick="myelist();"><span class="more">더보기</span></a>
				</div>
				<div class="eventContent">
					<table class="table">
						<c:if test="${!empty eBoardList }">
							<tr style="background-color: #add9d4;">
								<th>글 번호</th>
								<th>글 제목</th>
								<th>작성일</th>
							</tr>
							<c:forEach var="e" items="${eBoardList }" varStatus="status">
								<tr>
									<td>${e.boardNo }</td>
									<td>${e.boardTitle}</td>
									<td>${e.boardDate}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty eBoardList }">
							<span> 작성된 게시글이 없습니다 </span>
						</c:if>
					</table>
				</div>		
			</div>
		</div>
	</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>