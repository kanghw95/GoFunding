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
	function myfCmtlist() {
		window.open("<%=request.getContextPath()%>/myfcmtlist", "myFree", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
	
	function myrCmtlist() {
		window.open("<%=request.getContextPath()%>/myrcmtlist", "myReview", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
		
	function myqCmtlist() {
		window.open("<%=request.getContextPath()%>/myqcmtlist", "myQuestion", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
	
	function mysCmtlist() {
		window.open("<%=request.getContextPath()%>/myscmtlist", "myShare", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
	
	function myeCmtlist() {
		window.open("<%=request.getContextPath()%>/myecmtlist", "myEvent", "width=1000px, height=500px, resizable = no, left= 490, top=140");
	};
	

</script>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="wrapper">
		<div class="boardWrapper">
		
			<h3>
				<i class="fas fa-reply"></i>&nbsp; 내가 쓴 댓글 목록
			</h3>
			
		<div class="boardBox">
		
			<div class="boardContainer free" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<h4 class="innerTitle">자유 게시판</h4>
					<a href="#" onclick="myfCmtlist();"><span class="more">더보기</span></a>
				</div>
				<div class="freeContent">
					<table class="table">
						<c:if test="${!empty freeBoardCmtMore }">
							<tr style="background-color: #add9d4;">
								<th>댓글 번호</th>
								<th>댓글 제목</th>
								<th style="border-right: none;">작성일</th>
							</tr>
							<c:forEach var="free" items="${freeBoardCmtMore }" varStatus="status">
								<tr>
									<td style="text-align: center;">${free.cmtNo }</td>
									<td>${free.cmtContent}</td>
									<td style="text-align: center;">${free.cmtDate}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty freeBoardCmtMore }">
							<span> 작성된 게시글이 없습니다 </span>
						</c:if>
					</table>
				</div>
			</div>
			
			<div class="boardContainer review" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<h4 class="innerTitle">후기 게시판</h4>
					<a href="#" onclick="myrCmtlist();"><span class="more">더보기</span></a>
				</div>
				<div class="reviewContent">
					<table>
						<c:if test="${!empty rBoardCmtMore }">
							<tr style="background-color: #add9d4;">
								<th>댓글 번호</th>
								<th>댓글 제목</th>
								<th style="border-right: none;">작성일</th>
							</tr>
							<c:forEach var="review" items="${rBoardCmtMore }" varStatus="status">
								<tr>
									<td style="text-align: center;">${review.cmtNo }</td>
									<td>${review.cmtContent}</td>
									<td style="text-align: center;">${review.cmtDate}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty rBoardCmtMore }">
							<span> 작성된 게시글이 없습니다 </span>
						</c:if>
					</table>
				</div>		
			</div>
			
			<div class="boardContainer question" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<h4 class="innerTitle">질의응답 게시판</h4>
					<a href="#" onclick="myqCmtlist();"><span class="more">더보기</span></a>
				</div>
				<div class="questionContent">
					<table>
						<c:if test="${!empty qBoardCmtMore }">
							<tr style="background-color: #add9d4;">
								<th>댓글 번호</th>
								<th>댓글 제목</th>
								<th style="border-right: none;">작성일</th>
							</tr>
							<c:forEach var="q" items="${qBoardCmtMore }" varStatus="status">
								<tr>
									<td style="text-align: center;">${q.cmtNo }</td>
									<td>${q.cmtContent}</td>
									<td style="text-align: center;">${q.cmtDate}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty qBoardCmtMore }">
							<span> 작성된 게시글이 없습니다 </span>
						</c:if>
					</table>
				</div>		
			</div>
			
			<div class="boardContainer share" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<h4 class="innerTitle">정보공유 게시판</h4>
					<a href="#" onclick="mysCmtlist();"><span class="more">더보기</span></a>
				</div>
				<div class="shareContent">
					<table>
						<c:if test="${!empty sBoardCmtMore }">
							<tr style="background-color: #add9d4;">
								<th>댓글 번호</th>
								<th>댓글 제목</th>
								<th style="border-right: none;">작성일</th>
							</tr>
							<c:forEach var="s" items="${sBoardCmtMore }" varStatus="status">
								<tr>
									<td style="text-align: center;">${s.cmtNo }</td>
									<td>${s.cmtContent}</td>
									<td style="text-align: center;">${s.cmtDate}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty sBoardCmtMore }">
							<span> 작성된 게시글이 없습니다 </span>
						</c:if>
					</table>
				</div>		
			</div>
			
			<div class="boardContainer event" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<h4 class="innerTitle">이벤트 게시판</h4>
					<a href="#" onclick="myeCmtlist();"><span class="more">더보기</span></a>
				</div>
				<div class="eventContent">
					<table>
						<c:if test="${!empty eBoardCmtMore }">
							<tr style="background-color: #add9d4;">
								<th>댓글 번호</th>
								<th>댓글 제목</th>
								<th style="border-right: none;">작성일</th>
							</tr>
							<c:forEach var="e" items="${eBoardCmtMore }" varStatus="status">
								<tr>
									<td style="text-align: center;">${e.cmtNo }</td>
									<td>${e.cmtContent}</td>
									<td style="text-align: center;">${e.cmtDate}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty eBoardCmtMore }">
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