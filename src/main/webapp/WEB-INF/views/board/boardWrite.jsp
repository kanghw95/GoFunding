<%@page import="com.funding.sprout.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<script src = "https://code.jquery.com/jquery-3.6.0.js"></script>
	<style>
		
		#BULLETINEBOARD{
			position : absolute;
			left : 50px;
			top : 170px;	
		}

		#Title1{
			position : absolute;
			left : 150px;
			top : 230px;
		}
		
		#Title2{
			position : absolute;
			left : 230px;
			top : 250px;
		}
		
		#Content{
			position : absolute;
			left : 150px;
			top : 350px;	
		}
	
		#File1{
			position: absolute;
			left : 150px;
			top : 700px;
			height : 30px;
		}
		
		#File2{
			position : absolute;
			left : 350px;
			top : 700px;
		}
		
		#Insert{
			position: absolute;
			right : 350px;
			top : 800px;
		}
		
		#reset{
			position: absolute;
			right : 250px;
			top : 800px;
		}
		
		#Cancel{
			position: absolute;
			right : 150px;
			top : 800px;
		}
	</style>

</head>
<body>
	<div id = "BULLETINEBOARD">
	<h1>자유게시판</h1>
	</div>	
	
	<div id = "Title1">
		<h2>제목</h2>
	</div>	
	
	<form action = "boardInsert" method = "POST">
			<textarea placeholder="제목 입력" rows="3" cols="50" id = "Title2" name = "boardTitle"></textarea>		
			<textarea placeholder="글 내용 입력" rows = "20" cols = "230" id = "Content" name = "boardContent"></textarea>
		
			<input type = "file" id = "File1">
			<textarea name = "file" placeholder = "파일 이름" rows="2" cols="50" id = "File2"></textarea>
			<%User user = (User) session.getAttribute("userId"); %>
			
		<input type = "submit" value = "글 등록" id = "Insert">
		<input type = "reset" value = "다시 쓰기" id = "reset">
		<input type = "button" value = "목록으로" id = "Cancel">
	</form>
	
		<script>
			$("#Insert").on("click" , function() {
					location.href = "boardList";
			})
			
			$("#Cancel").on("click" , function() {
					location.href = "boardList";
			})
		</script>
</body>
</html>