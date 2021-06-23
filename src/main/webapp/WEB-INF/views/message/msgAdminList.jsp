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
	회원-관리자
	<div class="tabs">
			<table border="1">
				<c:forEach var="msg" items="${msgList}" varStatus="status">
					<tr id="msg">
						<td>이미지</td>
						<td id="msgId">${msg.SENDERID}</td>
					</tr>
					<tr></tr>
				</c:forEach>
			</table>
		</div>
	<script>
    $("body").on("click", "[id^=msgId]", function(event) {
                var receiverId = $(this).text();
		    	var pop = window.open("about:blank","content","width=500,height=800");
       			pop.location.href="http://localhost:8090/sprout/message/msgAdminRead?receiverId="+receiverId;
            });
</script>
</body>
</html>