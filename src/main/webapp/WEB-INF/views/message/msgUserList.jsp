<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
	관리자-회원
		<div>
			<table border="1">
				<c:forEach var="msg" items="${msgList}" varStatus="status">
					<tr id="msg">
						<td>이미지</td>
						<td id="msgId">${msg.SENDERID}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	<script>
    $("body").on("click", "[id^=msgId]", function(event) {
                var receiverId = $(this).text();
		    	var pop = window.open("about:blank","content","width=500,height=800");
       			pop.location.href="http://localhost:8090/sprout/message/msgUserRead?receiverId="+receiverId;
            });
</script>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>