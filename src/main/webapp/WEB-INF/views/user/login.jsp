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
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/user/loginPost"
		method="post">
		<c:if test="${empty user}">
			<div class="form-group">
				<input type="text" name="userId" class="form-control"
					placeholder="아이디">
			</div>
			<div class="form-group">
				<input type="password" name="userPwd" class="form-control"
					placeholder="비밀번호">
			</div>
			<div class="col-xs-4">
				<button type="submit" class="btns">로그인</button>
			</div>
			<br>
			<div class="g-signin2" data-onsuccess="onSignIn"></div>
			<div>
				<a href="${naverAuthUrl}"> <img width="200" height="50"
					src="<c:url value='/resources/img/naver_login.png'/>"></a> <br>
				<a href="${kakaoAuthUrl}"> <img width="200" height="50"
					src="<c:url value='/resources/img/kakao_login.png'/>">
				</a>
			</div>
		</c:if>
	</form>
	<c:if test="${!empty user}">
		<div>
			<a href="<%=request.getContextPath() %>/user/logout">로그아웃</a>
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