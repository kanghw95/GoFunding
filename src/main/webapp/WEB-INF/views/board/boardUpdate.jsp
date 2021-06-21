<%@page import="com.funding.sprout.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<!-- 스마트 에디터 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/smarteditor/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
</head>

<style>
#Title {
	position: absolute;
	top: 180px;
	left: 200px;
}

.board {
	position: absolute;
	top: 300px;
	left: 300px;
}
</style>

<body>

	<h1 id=Title>자유게시판</h1>
	<form action= "boardUpdate" method="POST">
		<input type="hidden" name="boardNo" value = "${data.boardNo }"/>
		<table class="board">
			<tr>
				<td id="boardTitle1">제목</td>
				<td><input type="text" name="boardTitle" style="width: 650px" value = "${data.boardTitle }"/></td>
			</tr>
			<tr>
				<td id="boardContent1">내용</td>
				<td><input type = "text" id="ir1" style = "width: 650px; height: 350px;" name="boardContent" value = "${data.boardContent }"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" id="writebtn" name="writebtn" value="저장" />
				<input type="button" value="취소" onclick = "history.back(-1)"/>
				</td>
			</tr>
		</table>
	</form>
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
		var btn = document.getElementById("writebtn");
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