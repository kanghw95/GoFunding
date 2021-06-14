<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<script src = "https://code.jquery.com/jquery-3.6.0.js"></script>
	<style>
		#Title{
			position : absolute;
			left : 100px;
			top : 70px;
		}
		
		#Content{
			position : absolute;
			left : 50px;
			top : 170px;	
		}
	
		#File1{
			position: absolute;
			left : 50px;
			top : 400px;
			height : 30px;
		}
		
		#File2{
			position : absolute;
			left : 250px;
			top : 400px;
		}
		
		#Btn{
			position: absolute;
			left : 650px;
			top : 500px;
		}
		
		#CancelBtn{
			position: absolute;
			left : 750px;
			top : 500px;
		}
	</style>

</head>
<body>
	<h1>자유게시판</h1>
			<h2>제목</h2>
			<textarea name = "title" placeholder="제목 입력" rows="3" cols="50" id = "Title"></textarea>
			
			<hr>
			
			<textarea name = "content" placeholder="글 내용 입력" rows = "10" cols = "100" id = "Content"></textarea>
			
			<div>
			<input type = "file" id = "File1">
			<textarea name = "file" placeholder = "파일 이름" rows="2" cols="50" id = "File2"></textarea>
			</div>

		<input type = "button" value = "글 등록" id = "Btn">
		<input type = "button" value = "취소" id = "CancelBtn">
		
		<script>
			$("#Btn").on("click" , function() {
					location.href = "boardList";
			})
			
			$("#CancelBtn").on("click" , function() {
					location.href = "boardList";
			})
		</script>
</body>
</html>