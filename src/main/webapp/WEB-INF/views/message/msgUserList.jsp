<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/message/msgUserUser.css?ver=1.0" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"/>
	<div class="wrapper">
	<div id="outer">
	<div class="tabs">
	<i class="far fa-comments fa-2x"></i>&nbsp;메시지(관리자-회원)
			<table id="table">
				<c:forEach var="msg" items="${msgList}" varStatus="status">
					<tr id="msg">
						<td class="tdImg"><i class="far fa-envelope fa-3x"></i></td>
						<td id="msgId">${msg.SENDERID}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</div>
		</div>
	<script>
    $("body").on("click", "[id^=msgId]", function(event) {
                var receiverId = $(this).text();
		    	var pop = window.open("about:blank","content","width=518, height=600");
       			pop.location.href="<%=request.getContextPath() %>/message/msgUserRead?receiverId="+receiverId;
            });
</script>
</body>
</html>
