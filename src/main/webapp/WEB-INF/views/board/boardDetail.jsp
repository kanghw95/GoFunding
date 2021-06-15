<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 페이지</title>
<script src = "https://code.jquery.com/jquery-3.6.0.js"></script>
	<style>
	
		#Title{
			position : absolute;
			left : 50px;
			top : 100px; 		
		}
		
		#Date{
			position: absolute;
			left : 50px;
			top : 160px;
			
		}
		
		#Declaration{
			position: absolute;
			left : 730px;
			top : 160px;
			background-color: white;
		}
		
		#boardCnt{
			position: absolute;
			left : 70px;
			top : 190px;
		}
		
		#Content1{
			position: absolute;
			left : 70px;
			top : 250px;
		}
		
		#Content2{
			position: absolute;
			left : 70px;
			top : 300px;
		}
		
		#Reply{
			position: absolute;
			left : 70px;
			top : 500px;
		}
		
		#button{
			position: absolute;
			left : 800px;
			top : 500px;
		}
	</style>

</head>
<body>

	<h1>자유게시판</h1>
			
			<div id = "Title">
			<h2>${data.boardTitle }</h2>
			</div>
			
			<div id = "Date">
			${data.boardDate }
			</div>
			
			<div id = "Declaration">
			신고
			
			<input type = "button" value = "수정" >	
			<input type = "button" value = "삭제" id = "delete">				
	
			</div>
			
			<div id = "boardCnt">
			댓글수
			${data.boardCnt }
			</div>
		
			<div id = "Content1">
			<h3>글 내용</h3>
			</div>
			
			<div id = "Content2">
			<textarea name = "content" rows = "10" cols = "100">${data.boardContent }</textarea>
			</div>
			
			<div id = "Reply">
			<textarea name = "title" placeholder="댓글 입력창" rows="3" cols="100"></textarea>
			</div>
			
			<div id = "button">
			<input type = "button" value = "등록">
			</div>
					
	<script>
		$("#delete").on("click", function() {
			location.href = "boardDelete"
		})
	</script>
</body>
</html>