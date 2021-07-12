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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function myflist() {
		window.open("<%=request.getContextPath()%>/myflist", "myFree", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
	
	function myrlist() {
		window.open("<%=request.getContextPath()%>/myrlist", "myFree", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
		
	function myqlist() {
		window.open("<%=request.getContextPath()%>/myqlist", "myFree", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
	
	function myslist() {
		window.open("<%=request.getContextPath()%>/myslist", "myFree", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
	
	function myelist() {
		window.open("<%=request.getContextPath()%>/myelist", "myFree", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
	

</script>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="wrapper">
		<div class="boardWrapper">
			<div class="freeContainer" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<span>자유 게시판</span>
					<a href="#" onclick="myflist();"><span>더보기</span></a>
				</div>
				<div class="freeContent">
					<table>
						<c:if test="${!empty freeBoardList }">
							<c:forEach var="free" items="${freeBoardList }" varStatus="status">
								<tr>
									<td>${free.boardNo }</td>
									<td>${free.boardTitle}</td>
									<td>${free.boardDate}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
			
			<div class="reviewContainer" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<span>후기 게시판</span>
					<a href="#" onclick="myrlist();"><span>더보기</span></a>
				</div>
				<div class="reviewContent">
					<table>
						<c:if test="${!empty reviewBoardList }">
							<c:forEach var="review" items="${reviewBoardList }" varStatus="status">
								<tr>
									<td>${review.boardNo }</td>
									<td>${review.boardTitle}</td>
									<td>${review.boardDate}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>		
			</div>
			
			<div class="questionContainer" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<span>질의응답 게시판</span>
					<a href="#" onclick="myqlist();"><span>더보기</span></a>
				</div>
				<div class="questionContent">
					<table>
						<c:if test="${!empty qBoardList }">
							<c:forEach var="q" items="${qBoardList }" varStatus="status">
								<tr>
									<td>${q.boardNo }</td>
									<td>${q.boardTitle}</td>
									<td>${q.boardDate}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>		
			</div>
			
			<div class="shareContainer" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<span>정보공유 게시판</span>
					<a href="#" onclick="myslist();"><span>더보기</span></a>
				</div>
				<div class="shareContent">
					<table>
						<c:if test="${!empty sBoardList }">
							<c:forEach var="s" items="${sBoardList }" varStatus="status">
								<tr>
									<td>${s.boardNo }</td>
									<td>${s.boardTitle}</td>
									<td>${s.boardDate}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>		
			</div>
			
			<div class="eventContainer" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<span>이벤트 게시판</span>
					<a href="#" onclick="myelist();"><span>더보기</span></a>
				</div>
				<div class="eventContent">
					<table>
						<c:if test="${!empty eBoardList }">
							<c:forEach var="e" items="${eBoardList }" varStatus="status">
								<tr>
									<td>${e.boardNo }</td>
									<td>${e.boardTitle}</td>
									<td>${e.boardDate}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>		
			</div>
		
		</div>
	
	
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>