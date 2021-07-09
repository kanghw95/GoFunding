<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/message/userMakerRead.css?ver=1.0" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<div id="outer">
	<div id="inner">
	<div id="textArea">
		<table class="table">
	<c:forEach var="msg" items="${msg}" varStatus="status">
			<tr id="text-${msg.MSGROOT}" class="textRow">
				<td>${msg.MSGCONTENT}<br>
				<c:if test="${msg.MSGROOT eq '1'}">
				${msg.MAKER}<br></c:if>
				<fmt:formatDate value="${msg.MSGDATE}" pattern="yy-MM-dd"/></td>
				<td id="deleteBtn"><button type="button" id="msgDelete">X</button>
				<input type="hidden" name="msgNo" id="msgNo" value="${msg.MSGNO}"></td>
			</tr>
	</c:forEach>
		</table>
	</div>
<form id="frm">
	<div class="inputTxt">
	<input name="receiverId" value="${param.receiverId}" type="hidden">
	<input name="makerChk" value="0" type="hidden">
	<input id="txtMsg" name="msgContent" type="text">
	<input id="sendBtn" value="전송" type="button"><br>
	</div>
</form></div></div>
<script>
	var webSocket = new WebSocket("ws://localhost:8090/sprout/msgRead");
	//콘솔 텍스트 에리어 오브젝트
	
	$('#sendBtn').click(function(){
		var text=$('#txtMsg').val();
		console.log(text);
		if(text==''){
			alert("내용을 입력해주세요.");
			$('#txtMsg').focus();
			event.preventDefault();
			return;
		} else {
			$('#frm').attr('action','msgInsert1');
			$('#frm').attr('method','post');
			$('#frm').submit();
		}
	})
	
	$(document).on('click','#msgDelete',function(){
		var num=$(this).next().val();
		console.log(num);
		$.ajax({
			url:'msgDelete',
			type: 'get',
			data: {'num': num},
			success: function(){
				alert('전송성공');
				location.reload();
			},
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
	})
	})
</script>
</body>
</html>