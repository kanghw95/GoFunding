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
	<h3>자유 게시판</h3>
	<div class="popupContent">
				<table>
					<c:if test="${!empty freeBoardMore }">
						<c:forEach var="free" items="${freeBoardMore }" varStatus="status">
							<tr>
								<td>${free.boardNo }</td>
								<td>${free.boardTitle}</td>
								<td>${free.boardDate}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
</body>
</html>