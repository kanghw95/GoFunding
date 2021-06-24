<%@page import="com.funding.sprout.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

#boardId {
	position: absolute;
	left: 50px;
	top: 190px;
}

#Cmtcount {
	position: absolute;
	left: 100px;
	top: 190px;
}

#boardcnt {
	position: absolute;
	left: 160px;
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

#page{
	position : absolute;
	left : 800px;
	top : 650px;
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
	
	<div id = "boardId">${data.boardId }</div>
	<div id = "Cmtcount">댓글수 <%-- ${data.boardCnt } --%></div>
	<div id = "boardcnt">${data.boardCnt }</div>
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
	
	<div id = "page">
	<c:url var="boardList" value="boardList">
					<c:param name="page" value="${currentPage}" />
				</c:url><a href="${boardList}">목록</a>
	</div>
	
	<script>
		$("#modify").on("click", function() {
			var modify1 = confirm("수정하시겠습니까?");
 			
			if(modify1 == true) {
				var sessionUserId = '${sessionScope.user.userId}';
				var boardId = '${data.boardId}';
				
				console.log("sessionUserId" + sessionUserId);
				console.log("boardId:" + boardId);
				
				if(sessionUserId=='null' || sessionUserId==''){
					alert("로그인 후 수정 가능합니다.");
					return;
				}
				if(boardId=='null' || boardId==''){
					alert("작성자가 아니므로 글 수정이 되지 않습니다.");
					return;	
				}
				if(boardId != sessionUserId){
					alert("작성자가 아니므로 글 수정이 되지 않습니다.");
					return;
				}	
			} else{
				return false;
			}
				
			var frm = document.getElementById("frmUpdate");
			frm.action = "bRewrite";
			frm.method = "post";
			frm.submit();
		});
	
		
		$("#delete").on("click", function() {
			var delete1 = confirm("삭제하시겠습니까?");
			if(delete1 == true) {
				var sessionUserId = '${sessionScope.user.userId}';
				var boardId = '${data.boardId}';
				
				if(sessionUserId == 'null' || sessionUserId == ''){
					alert("로그인 후 삭제 가능합니다")
					return;
				}
				if(boardId == 'null' || boardId == ''){
					alert("작성자가 아니므로 글 삭제가 되지 않습니다")
					return;
				}
				if(boardId != sessionUserId){
					alert("작성자가 아니므로 글 삭제가 되지 않습니다")
					return;
				}
			}else{
				return false;
			}	
		
			var frm = document.getElementById("frmUpdate");
			frm.action = "boardDelete";
			frm.method="post";
			frm.submit();
			//location.href = "boardDelete";
		});
	</script>
</body>
</html>