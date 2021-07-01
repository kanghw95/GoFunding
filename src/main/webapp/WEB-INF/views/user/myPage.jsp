<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="<%=request.getContextPath() %>/resources/css/common.css" rel="stylesheet" type="text/css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="wrapper">
	<div class="myPageWrapper">
		<div class="profileBackground">
			
		</div>
		<div class="myPageInner">
			<div class="myPageHeader">
			</div>
			<div class="myPageContentWrapper">
				<div class="myPage_nonMaker">
					<div class="profileContainer">
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>