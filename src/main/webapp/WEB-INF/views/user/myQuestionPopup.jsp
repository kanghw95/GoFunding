<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/common.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<h3>질의응답 게시판</h3>
	<div class="popupContent">
				<table>
					<c:if test="${!empty qBoardMore }">
						<c:forEach var="q" items="${qBoardMore }" varStatus="status">
							<tr>
								<td>${q.boardNo }</td>
								<td>${q.boardTitle}</td>
								<td>${q.boardDate}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
</body>
</html>