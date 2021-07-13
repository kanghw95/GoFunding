<%@page import="com.funding.sprout.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트게시글 수정</title>
<!-- 스마트 에디터 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/smarteditor/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
</head>

<style>
.list{
	width : 50px;
	height : 50px;
	margin-left: 10px;
}

.free{
	margin-left: 70px;
	margin-top: -50px;
}

.board{
	margin-top: 50px;
	margin-bottom: 100px;
	margin-left: 20px; 
	width: 100%;
}

.button{
	margin-top: -30px;
	margin-left: 1030px;
}
.title{
	resize: none;
}
</style>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="wrapper">

	<div>
		<img src="../resources/img/admin/list.png" class="list">
		<h1 class=free>이벤트게시판</h1>
	</div>

	<form action="eventupdate2" method="POST">
		<input type="hidden" name="boardNo" value="${data.boardNo }" />
		
		<table class="board">
			<tr>
				<td id="boardTitle1">제목</td>
				<td><textarea class="title" name="boardTitle" rows="3" cols="150" value="${data.boardTitle }">${data.boardTitle }</textarea></td>
			</tr>
			
			<tr>
				<td id="boardContent1">내용</td>
				<td><textarea id="ir1" name="boardContent" rows="35" cols="150">${data.boardContent }</textarea></td>
			</tr>
		</table>
	</form>
		<div class="button">
			<button type="button" id="eventwritebtn" name="writebtn">저장</button>
			<button type="button" onclick="history.back(-1)">취소</button>			
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
		<script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
    			oAppRef: oEditors,
    			elPlaceHolder: "ir1",
    			sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
						fCreator : "createSEditor2"
					});
		</script>

		<script type="text/javascript">
			window.onload = function() {
				//버튼을 누를때 실행
				var btn = document.getElementById("eventwritebtn");
				btn.onclick = function() {
					submitContents(btn);
				}
			}

			// '저장' 버튼을 누르는 등 저장을 위한 액션을 했을때 submitContents가 호출된다고 가정한다.
			function submitContents(elClickedObj) {
				// 에디터의 내용이 textarea에 적용된다.
				oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

				// 에디터의 내용에 대한 값 검증은 이곳에서
				// document.getElementsById("irl").value를 이용해서 처리한다.

				try {
					// 해당 오브젝터가 위치한 form이 submit이 됨
					elClickedObj.form.submit();
				} catch (e) {
				}
			}
		</script>
</html>