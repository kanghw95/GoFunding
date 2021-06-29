<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id"
	content="787043379258-f7m1f543ukem253a55cm7kc569hijh0r.apps.googleusercontent.com">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<link href="<%=request.getContextPath() %>/resources/css/user/login.css?ver=1.0" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/user/loginPost" method="post">
		<c:if test="${empty user}">
		<div class="outer">
		<div class="login loginDiv">
			<div class="idPwd">
			<h1>로그인</h1>
				<input type="text" name="userId" class="form inputId"
					placeholder="아이디"><br><br>
				<input type="password" name="userPwd" class="form inputPwd"
					placeholder="비밀번호"><br><br>
				<a class="chk findId" href="<%=request.getContextPath() %>/user/findUserId">아이디/비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;
				<a class="chk chkPwd" href="#">비밀번호 확인하기</a><br><br>
				<button type="submit" class="btns loginBtn">로그인</button><br><br>
				<hr>
			</div>
			<div>
			<div class="g-signin2" data-onsuccess="onSignIn"><img width="50" height="50"
					src="<c:url value='/resources/img/google_login.png'/>"></div>
				<a href="${kakaoAuthUrl}"> <img width="50" height="50"
					src="<c:url value='/resources/img/kakao_login.png'/>"></a>
				<a href="${naverAuthUrl}"> <img width="50" height="50"
					src="<c:url value='/resources/img/naver_login.png'/>">
				</a><br>
			</div>
			<div>
				<br>아직 회원이 아니라면? <a href="#">회원가입</a>
			</div>
			</div>
			</div>
		</c:if>
	</form>
	<c:if test="${!empty user}">
		<div>
			<a href="<%=request.getContextPath() %>/user/logout">로그아웃</a>
			<a href="<%=request.getContextPath() %>/message/msgList1">회원-메이커메세지</a>
			<a href="<%=request.getContextPath() %>/message/msgList3">메이커-회원메세지</a>
			<a href="<%=request.getContextPath() %>/message/msgList2">회원-회원메세지</a>
			<a href="<%=request.getContextPath() %>/message/msgAdminList">회원-관리자메세지</a>
			<c:if test="${user.userId eq 'admin'}">
			<a href="<%=request.getContextPath() %>/message/msgUserList">관리자-회원메세지</a></c:if>
		</div>
	</c:if>
	<script>
    function onSignIn(googleUser) {
    	// 프로필 가져오기
    	var profile = googleUser.getBasicProfile();
    	// 로그인 정보 전달하기
    	var profile1 = Object.values(profile);
	var userName=profile1[1];
	var userEmail=profile1[5];
    	console.log(profile);
    	console.log(userName);
    	console.log(userEmail);
    	
    	$.ajax({
    		url : 'googleCallback',
    		data : {
    			'userName' : userName,
    			'userEmail' : userEmail
    		},
    		method : 'POST'
    	});
    	}
    	function onLoad() {
    	gapi.load('auth2,signin2', function() {
    	var auth2 = gapi.auth2.init();
    	auth2.then(function() {
    	// 로그인 객체 가져오기
    	var isSignedIn = auth2.isSignedIn.get();
    	// 접속되어 있는 유저
    	var currentUser = auth2.currentUser.get();
    	gapi.signin2.render('googleSigninButton', {
    	'onsuccess' : 'onSignIn', // 로그인이 되면 onSignIn 함수를 호출한다.
    	'longtitle' : true,
    	'theme' : 'dark',
    	'width' : '0'
    	});
    	});
    	});
    	}
    </script>
</body>
</html>
