<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 페이지</title>
</head>
<style>
.table{
	position: absolute;
	top:200px;
	left:600px;
	width:50%;
	height:50%;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	
		<table class="table" border="1"><!-- align="center" -->
		  <thead>
		    <tr>
		      <th>신고할 아이디</th>
		      <td><input type="text" placeholder="내용을 입력해주세요"></td>
		    </tr>
		  </thead>
		  
		  	<tbody>	
		    <tr>
		      <th>신고 유형</th>
		      	<td>	
		      <select id="option">
				<option value="">욕설</option>
				<option value="">도배</option>
				<option value="">도배</option>
				<option value="">도배</option>
				<option value="">도배</option>
			  </select>
				</td>
		    </tr>
		    
		    <tr>
		      <th>신고 사유</th>
		      <td><input type="text" placeholder="내용을 입력해주세요"></td>
		 
		    </tr>
		    <tr>
		      <th>추가 신고 사항</th>
		      <td>신고할 아이디에 관해 추가적으로 더 신고할 게시글이 있다면<br>아래에 해당 게시글의 링크를 적어주세요<br><br><br>
		      <textarea placeholder="내용을 입력해주세요" rows="3" cols="90"></textarea>
		      <button type="button">추가하기</button></td>
		    </tr>
		  </tbody>
		</table>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>