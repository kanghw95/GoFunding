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
	회원-메이커
	<div class="tabs">
			<table border="1">
				<c:forEach var="msg" items="${msgList1}" varStatus="status">
					<tr id="msg">
						<td rowspan="2">이미지</td>
						<td id="msgTitle">${msg.fundingTitle}</td>
						<td><input type="hidden" value="${msg.receiverId}" /></td>
						<td id="msgMaker">${msg.maker}</td>
					</tr>
					<tr>
						<td colspan="2" id="msgContent">${msg.msgContent}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	<script>
    $("body").on("click", "[id^=msgTitle]", function(event) {
                var receiverId = $(this).next().children().val();
                console.log(receiverId);
		    	var pop = window.open("about:blank","content","width=500,height=800");
       			pop.location.href="http://localhost:8090/sprout/message/msgRead1?receiverId="+receiverId;
            });
</script>
</body>
</html>