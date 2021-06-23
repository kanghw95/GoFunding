<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.tabs {
	margin-top: 50px;
	padding-bottom: 40px;
	background-color: #ffffff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	width: 700px;
	margin: 0 auto;
}

/* 탭 스타일 */
.tab_item {
	width: calc(100%/ 3);
	height: 50px;
	border-bottom: 3px solid #333333;
	background-color: #f8f8f8;
	line-height: 50px;
	font-size: 16px;
	text-align: center;
	color: #333333;
	display: block;
	float: left;
	text-align: center;
	font-weight: bold;
	transition: all 0.2s ease;
}

.tab_item:hover {
	opacity: 0.75;
}

/* 라디오 버튼 UI삭제*/
input[name="tab_item"] {
	display: none;
}

/* 탭 컨텐츠 스타일 */
.tab_content {
	display: none;
	padding: 40px 40px 0;
	clear: both;
	overflow: hidden;
}

/* 선택 된 탭 콘텐츠를 표시 */
#all:checked ~ #all_content, #programming:checked ~ #programming_content,
	#design:checked ~ #design_content {
	display: block;
}

/* 선택된 탭 스타일 */
.tabs input:checked+.tab_item {
	background-color: #333333;
	color: #fff;
}
</style>
</head>
<body>
	메시지~~
	<div class="tabs">
		<input id="all" type="radio" name="tab_item" checked> <label
			class="tab_item" for="all">Tab 1</label> <input id="programming"
			type="radio" name="tab_item"> <label class="tab_item"
			for="programming">Tab 2</label> <input id="design" type="radio"
			name="tab_item"> <label class="tab_item" for="design">Tab
			3</label>
		<div class="tab_content" id="all_content">
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
		<div class="tab_content" id="programming_content">
			https://velog.io/@henotony</div>
		<div class="tab_content" id="design_content">Thanks a lot</div>
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