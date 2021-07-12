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
	<h3>정보공유 게시판</h3>
	<div class="popupContent">
				<table>
					<c:if test="${!empty sBoardMore }">
						<c:forEach var="s" items="${sBoardMore }" varStatus="status">
							<tr>
								<td>${s.boardNo }</td>
								<td>${s.boardTitle}</td>
								<td>${s.boardDate}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
</body>
</html>