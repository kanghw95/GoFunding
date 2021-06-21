<%@page import="com.funding.sprout.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
#Title {
	position: absolute;
	left: 50px;
	top: 100px;
}

#Date {
	position: absolute;
	left: 50px;
	top: 160px;
}

#Declaration {
	position: absolute;
	left: 650px;
	top: 160px;
}

#modify {
	position: absolute;
	left: 700px;
	top: 160px;
}

#delete {
	position: absolute;
	left: 750px;
	top: 160px;
}

#boardCnt {
	position: absolute;
	left: 70px;
	top: 190px;
}

#Content1 {
	position: absolute;
	left: 70px;
	top: 250px;
}

#Content2 {
	position: absolute;
	left: 70px;
	top: 300px;
}

#Reply {
	position: absolute;
	left: 70px;
	top: 500px;
}

#button {
	position: absolute;
	left: 800px;
	top: 500px;
}
</style>

</head>
<body>

	<h1>자유게시판</h1>

	<div id = "Title">
		<h2>${data.boardTitle }</h2>
	</div>

	<div id = "Date">${data.boardDate }</div>

		<input type = "button" value = "신고" id = "Declaration"> 
		
		<form id="frmUpdate">
		<input type = "hidden" name = "boardNo" value = "${data.boardNo }">
		<input type = "button" value = "수정" id = "modify"> 
		<input type = "button" value = "삭제" id = "delete">
		</form>
	

	<div id = "boardCnt">댓글수 ${data.boardCnt }</div>

	<div id = "Content1">
		<h3>글 내용</h3>
	</div>

	<div id = "Content2">
		<!-- <textarea name = "content" rows = "10" cols = "100"> -->
		${data.boardContent }
		<!-- </textarea> -->
	</div>

	<div id = "Reply">
		<textarea name = "title" placeholder= "댓글 입력창" rows = "3" cols = "100"></textarea>
	</div>

	<div id = "button">
		<input type = "button" value = "등록">
	</div>

	<input type = "button" value = "목록" onclick = "history.back(-1)">

	<script>
		$("#modify").on("click", function() {
 			var sessionUserId = '${sessionScope.user.userId}';
			var boardId = '${data.boardId}';
			
			console.log("sessionUserId" + sessionUserId);
			console.log("boardId:" + boardId);
			
			if(sessionUserId=='null' || sessionUserId==''){
				alert("로그인 후 수정 가능합니다.")
				return;
			}
			if(boardId=='null' || boardId==''){
				alert("작성자가 아니므로 글 수정이 되지 않습니다.")
				return;
			}
			if(boardId != sessionUserId){
				alert("작성자가 아니므로 글 수정이 되지 않습니다.")
				return;
			}
			
			var frm = document.getElementById("frmUpdate");
			frm.action = "bRewrite";
			frm.method = "post";
			frm.submit();
		});
	
		$("#delete").on("click", function() {
			var frm = document.getElementById("frmUpdate");
			frm.action = "boardDelete";
			frm.method="post";
			frm.submit();
			//location.href = "boardDelete";
		});
	</script>
</body>
</html>