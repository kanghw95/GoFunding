<%@page import="com.funding.sprout.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기게시글 등록</title>
<!-- 스마트 에디터 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/smarteditor/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
</head>

<style>
#list{
	width : 50px;
	height : 50px;
	float: left;
	position: absolute;
	top:100px;
	left:10px;
}
.free{
	position: absolute;
	top:80px;
	left:70px;
}

.board{
	margin-top: 100px;
	margin-bottom: 100px;
	margin-right: 100px;
	margin-left: 100px;
	width: 100%;
}

.button{
	position: absolute;
	right:5px;
	bottom:200px;	
}
</style>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="wrapper">
	
	<%
		User user = (User) session.getAttribute("user");
	%>
	<div>
			<img src="../resources/img/admin/list.png" id="list">
			<h1 class=free>자유게시판</h1>
		
		<form id="insert" >
			<input type="hidden" name="userid" value="<%=user.getUserId()%>">
	

		<table class="board">
			<tr class = "title">
				<td>제목</td>
				<td><textarea rows="3" cols="150" name="boardTitle" id="boardTitle"></textarea></td>
			</tr>
			
			<tr>
				<td id="boardContent1">내용</td>
				<td><textarea rows="40" cols="150" id="ir1" name="boardContent"></textarea></td>
			</tr>
			
			<tr class = "button">
				<td colspan="2">
				<button type="button" id="writebtn" name="writebtn" class="btn btn-primary btn-lg">글등록</button>
				<button type="button" id="cancelbtn" onclick="history.back(-1)" class="btn btn-secondary btn-lg">취소</button></td>
			</tr>
		</table>
	</form>
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
							var frm = document.getElementById("insert");
							frm.action="insert";
							frm.method="post";
							frm.submit();
						});
			})
		</script>
	</div>
		</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>