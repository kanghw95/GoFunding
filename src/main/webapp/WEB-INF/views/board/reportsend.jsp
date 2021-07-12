<%@page import="com.funding.sprout.vo.User"%>
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
	left:900px;
}
.button{
	position: absolute;
	top:1050px;
	left:1950px;
}
.textarea1, .textarea2, .textarea3{
	resize:none;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<%
		request.setCharacterEncoding("UTF-8");
		User user = (User) session.getAttribute("user");
	//	String boardId = request.getParameter("boardId");
	%>
		<table class="table" border="1" width="1140" height="800"><!-- align="center" -->
		  <thead>
		    <tr>
		      <th>신고할 아이디</th>
		      	<td>${reportBoardId }</td>
		    </tr>
		  </thead>
		  
		  	<tbody>	
		    <tr>
		      <th>신고 유형</th>
		      	<td>	
		      		<select id="option">
						<option value="">욕설</option>
						<option value="">도배</option>
						<option value="">광고</option>
						<option value="">기타</option>
			  		</select>
				</td>
		    </tr>
		    
		       <tr>
		          <th>신고 사유</th>
		          	<td><textarea class="textarea1" style="width:100%; height:100%; border:0;"></textarea></td>
		       </tr>
		      
		        <tr>
		          <th>신고 글 제목</th>
		          <td>${reportBoardTitle }</td>
		        </tr>
		        
		        <tr>
		          <th>신고 글 내용</th>
		       		<td>${reportBoardCotent }</td>
		        </tr>
		        
			    <tr>
			      <th>신고 사유</th>
			    	<td><textarea class="textarea2" style="width:100%; height:100%; border:0;"></textarea></td>
			    </tr>
			    
			    <tr>
			      	<th>추가 신고 사항</th>
			      	<td><textarea class="textarea3" style="width:100%; height:100%; border:0;"></textarea></td>
			    </tr>	
		    	<tr>
		    		<th>신고자아이디</th>
		    			<td><%=user.getUserId()%></td>
		   	 	</tr>
		  </tbody>
		</table>
		
		<div class="button">
		<button type="button">등록</button>
		<button type="button" onclick="history.back(-1)">취소</button>
		</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>