<%@page import="com.funding.sprout.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트게시글 등록</title>
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

.title{
	resize: none;
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
</style>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="wrapper">
	
	<%
		User user = (User) session.getAttribute("user");
	%>
		<div>
			<img src="../resources/img/admin/list.png" class="list">
			<h1 class=free>이벤트게시판</h1>
		
				<form id="eventinsert" >
					<input type="hidden" name="userid" value="<%=user.getUserId()%>">
						<table class="board" style="width=1100 height=600;">
							<tr>
								<td>제목</td>
								<td><textarea rows="3" cols="150" class = "title" name="boardTitle" id="boardTitle"></textarea></td>
							</tr>
					
							<tr>
								<td id="boardContent1">내용</td>
								<td><textarea rows="35" cols="150" id="ir1" name="boardContent"></textarea></td>
							</tr>			
						</table>
				</form>
				
				<div class="button">
					<button type="button" id="writebtn" name="writebtn" class="btn btn-primary btn-lg">글등록</button>
					<button type="button" id="cancelbtn" onclick="history.back(-1)" class="btn btn-secondary btn-lg">취소</button>
				</div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>

		<script type="text/javascript">
			var oEditors=[];
			nhn.husky.EZCreator.createInIFrame({
    			oAppRef:oEditors,
    			elPlaceHolder:"ir1",
    			sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
						fCreator:"createSEditor2"
						});

			/* window.onload = function() {  */
			//버튼을 누를때 실행
			$(function() {
				$("#writebtn").on(
						"click",
						function() {
							var title=$("#boardTitle").val();

							oEditors.getById["ir1"].exec(
									"UPDATE_CONTENTS_FIELD", []);
							//스마트 에디터 값을 텍스트컨텐츠로 전달 / 값을 불러올 땐 document.get으로 받아오기
							var content = document.getElementById("ir1").value;
							var result = confirm("글 등록 하시겠습니까?");

							if (result == true) {
								if (title=='' || title=='null') {
									alert("제목을 입력해주세요")
									return;
								}
								if (content=='' || content=='null'
										|| content == '<p><br></p>') {
									alert("내용을 입력해주세요")
									//		 			oEditors.getById["ir1"].exec("FOCUS"); //포커싱
									return;
								}
							} else {
								return false;
							}
							var frm = document.getElementById("eventinsert");
							frm.action="eventinsert";
							frm.method="post";
							frm.submit();
						});
			})
		</script>
</html>