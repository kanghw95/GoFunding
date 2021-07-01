<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css">
<link href="<%=request.getContextPath() %>/resources/css/message/msgUserMaker.css?ver=1.0" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div id="outer">
	<div class="tabs">
	<i class="far fa-comments fa-2x"></i>&nbsp;메시지(회원-메이커)
			<table id="table">
				<c:forEach var="msg" items="${msgList1}" varStatus="status">
					<tr id="msg" class="msg">
						<td rowspan="2" class="tdImg"><i class="far fa-envelope fa-3x"></i></td>
						<td id="msgTitle">${msg.fundingTitle}</td>
						<td><input type="hidden" value="${msg.receiverId}" /></td>
						<td id="msgMaker">${msg.maker}</td>
					</tr>
					<tr id="underline">
						<td colspan="3" id="msgContent">${msg.msgContent}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</div>
	<script>
    $("body").on("click", "[id^=msgTitle]", function(event) {
                var receiverId = $(this).next().children().val();
                console.log(receiverId);
		    	var pop = window.open("about:blank","content","width=430,height=800");
       			pop.location.href="http://localhost:8090/sprout/message/msgRead1?receiverId="+receiverId;
            });
</script>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>