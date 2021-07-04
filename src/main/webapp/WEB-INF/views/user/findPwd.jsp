<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/user/findId.css?ver=1.0" rel="stylesheet" type="text/css" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="wrapper">
		<div class="outer">
		<div class="inner">
			<div class="idPwd">
			<h2>비밀번호찾기</h2><br>
			<table class=table>
			<tr class="warning warnId"></tr>
			<tr>
				<td class="inputTd">
				<input type="text" id="userId" class="form inputId" placeholder="아이디"><br><br>
				</td>
				<td></td>			
			</tr>
			<tr class="warning warnEmail"></tr>
			<tr>
				<td class="inputTd">		
				<input type="text" id="userEmail" class="form inputEmail" placeholder="이메일"><br><br>
				</td>	
				<td></td>			
			</tr>
			<tr class="warning warnPhone"></tr>
			<tr>
				<td class="inputTd">
				<input type="text" id="phone" class="form inputPhone" placeholder="핸드폰번호">
				</td>			
				<td class="btnTd">
				<button type="button" id="chkPhoneBtn" class="btns">인증번호받기</button><br><br>
				</td>			
			</tr>
			<tr>
				<td class="inputTd">
				<input type="text" id="chkNum" class="form chkNum" placeholder="인증번호">
				</td>			
				<td class="btnTd">
				<button type="button" id="chkNumBtn" class="btns">인증번호확인</button><br><br><br>
				</td>			
			</tr>
			</table>
			</div>
			<div class="join">
			<br><button type="button" id="sendBtn">본인인증하기</button><br><br><br>
			아이디가 기억나지 않는다면? <a class="joinBtn" href="<%=request.getContextPath() %>/user/findId">아이디찾기</a><br>		
			아직 회원이 아니라면? <a class="joinBtn" href="<%=request.getContextPath() %>/user/join">회원가입</a>			
			</div>
			</div>
			</div>
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/user/findPwd.js"></script>
</body>
</html>