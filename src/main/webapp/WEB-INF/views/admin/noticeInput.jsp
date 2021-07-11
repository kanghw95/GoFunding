<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
body {
    font-family: 'NanumSquare', sans-serif !important;
}

.space {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 80px;
}

#wrapper {
	display: table;
	margin-bottom: 80px;
	position: relative;
	padding-top: 110px;
	color: #202020;
}

th {
	font-size: 15px;
}

td {
	font-size: 16px;
}

.list {
	width: 35px;
	line-height: 40px;
}

.userManage {
	display: table-cell;
	vertical-align: middle;
	font-size: 20px;
}

.input {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
}

.title {
	width: 896px;
    padding: 0px;
    height: 30px;
}

.content {
	width: 898px;
    padding: 0px;
    height: 500px;
}

.ok {
	float: right;
	margin-left: 75px;
	box-shadow: none;
	border-radius: 10px;
	height: 30px;
}

.footer {
	height: 200px;
}
</style>
<script>
function insertNotice() {
	console.log("해윙~");
	var title = document.getElementById("title").value;
	var content = document.getElementById("content").value;
	console.log(title);
	console.log(content);
	$.ajax({
		url : "noticeInput",
		type : "POST",
		traditional : true,
		data : {
			title : title,
			content : content
		},
		dataType : "JSON",
		success : function(data) {
			console.log("성공~");
		},
		error : function(error) {
			console.log("문의답글 에러");
		}
	})
	faqForm.submit();
}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
<div class="space">
	<div id="wrapper">
		<img src="resources/img/admin/list.png" class="list">&nbsp;
		<p class="userManage">공지사항</p>
	</div>
</div> 
<div class="input">
	<form method="GET" action="notice" id="faqForm" name="faqForm">
		제 목 <input type="text" class="title" id="title"><br><br>
		내 용<textarea class="content" id="content"></textarea><br><br>
		<input type="button" class="ok" value="확인" onclick="insertNotice()">
	</form>
</div>
<div class="footer">
</div>
</body>
</html>