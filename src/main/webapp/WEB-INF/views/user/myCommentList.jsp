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
			<div class="freeContainer" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<span>자유 게시판</span>
					<a href="#" onclick="myfCmtlist();"><span>더보기</span></a>
				</div>
				<div class="freeContent">
					<table>
						<c:if test="${!empty freeBoardCmtMore }">
							<c:forEach var="free" items="${freeBoardCmtMore }" varStatus="status">
								<tr>
									<td>${free.cmtNo }</td>
									<td>${free.cmtContent}</td>
									<td>${free.cmtDate}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
			
			<div class="reviewContainer" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<span>후기 게시판</span>
					<a href="#" onclick="myrCmtlist();"><span>더보기</span></a>
				</div>
				<div class="reviewContent">
					<table>
						<c:if test="${!empty rBoardCmtMore }">
							<c:forEach var="review" items="${rBoardCmtMore }" varStatus="status">
								<tr>
									<td>${review.cmtNo }</td>
									<td>${review.cmtContent}</td>
									<td>${review.cmtDate}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>		
			</div>
			
			<div class="questionContainer" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<span>질의응답 게시판</span>
					<a href="#" onclick="myqCmtlist();"><span>더보기</span></a>
				</div>
				<div class="questionContent">
					<table>
						<c:if test="${!empty qBoardCmtMore }">
							<c:forEach var="q" items="${qBoardCmtMore }" varStatus="status">
								<tr>
									<td>${q.cmtNo }</td>
									<td>${q.cmtContent}</td>
									<td>${q.cmtDate}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>		
			</div>
			
			<div class="shareContainer" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<span>정보공유 게시판</span>
					<a href="#" onclick="mysCmtlist();"><span>더보기</span></a>
				</div>
				<div class="shareContent">
					<table>
						<c:if test="${!empty sBoardCmtMore }">
							<c:forEach var="s" items="${sBoardCmtMore }" varStatus="status">
								<tr>
									<td>${s.cmtNo }</td>
									<td>${s.cmtContent}</td>
									<td>${s.cmtDate}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>		
			</div>
			
			<div class="eventContainer" style="border: 1px solid #ededed; display: inline-block;">
				<div> 
					<span>이벤트 게시판</span>
					<a href="#" onclick="myeCmtlist();"><span>더보기</span></a>
				</div>
				<div class="eventContent">
					<table>
						<c:if test="${!empty eBoardCmtMore }">
							<c:forEach var="e" items="${eBoardCmtMore }" varStatus="status">
								<tr>
									<td>${e.cmtNo }</td>
									<td>${e.cmtContent}</td>
									<td>${e.cmtDate}</td>
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