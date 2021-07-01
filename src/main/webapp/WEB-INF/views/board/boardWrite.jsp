<%@page import="com.funding.sprout.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<!-- 스마트 에디터 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/smarteditor/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
</head>

<style>
/* #title {
	position: absolute;
	top: 180px;
	left: 200px;
}


#writebtn{
	position : absolute;
	left : 700px;
	top : 600px; 
}
#cancelbtn{
	position : absolute;
	left : 770px;
	top : 600px; 
} */

.title{

}

.board {
	position: absolute;
	top: 300px;
	left: 300px;
}

.button{
	
}

</style>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="wrapper">
	
	<%
		User user = (User) session.getAttribute("user");
	%>
	<div>
		<h1 id=title>자유게시판</h1>
		<form id="boardInsert">
			<input type="hidden" name="userid" value="<%=user.getUserId()%>">
	</div>

		<!--  	<input type = "file" id = "File1">
		<textarea name = "file" placeholder = "파일 이름" rows="2" cols="50" id = "File2"></textarea> -->

		<table class="board">
			<tr class = "title">
				<td>제목</td>
				<td><input type="text" name="boardTitle" id = "boardTitle" style="width: 645px" /></td>
			</tr>
			
			<tr>
				<td id="boardContent1">내용</td>
				<td>
				<textarea rows="10" cols="30" id="ir1" name="boardContent" style="width: 650px; height: 350px;"></textarea>
				<!-- <input type = "text" id="ir1" style = "width: 650px; height: 350px;" name="boardContent"> -->
				</td>
			</tr>
			
			<tr class = "button">
				<td colspan="2">
				<input type="button" id="writebtn" name="writebtn" value = "글등록"/>
				<input type="button" id = "cancelbtn" value="취소" onclick = "history.back(-1)"/></td>
			</tr>
		</table>
	</form>
		<script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
    			oAppRef: oEditors,
    			elPlaceHolder: "ir1",
    			sSkinURI: "<%=request.getContextPath()%>
			/smarteditor/SmartEditor2Skin.html",
						fCreator : "createSEditor2"
					});

			/* window.onload = function() {  */
			//버튼을 누를때 실행
			$(function() {
				$("#writebtn").on(
						"click",
						function() {
							var title = $("#boardTitle").val();

							oEditors.getById["ir1"].exec(
									"UPDATE_CONTENTS_FIELD", []);
							//스마트 에디터 값을 텍스트컨텐츠로 전달 / 값을 불러올 땐 document.get으로 받아오기
							var content = document.getElementById("ir1").value;
							var result = confirm("글 등록 하시겠습니까?");

							if (result == true) {
								if (title == '' || title == 'null') {
									alert("제목을 입력해주세요")
									console.log("순찬1");
									return;
								}
								if (content == '' || content == 'null'
										|| content == '<p><br></p>') {
									alert("내용을 입력해주세요")
									console.log("순찬2");
									//		 			oEditors.getById["ir1"].exec("FOCUS"); //포커싱
									return;
								}
								console.log("순찬3");
							} else {
								return false;
							}
							var frm = document.getElementById("boardInsert");
							frm.action = "boardInsert";
							frm.method = "post";
							frm.submit();
						});
			})

			/* 		var btn = document.getElementById("writebtn");
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
			} */
		</script>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>