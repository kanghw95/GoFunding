<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div style="margin-top: 150px;" class="wrap">
		에러메시지  : ${msg}
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>