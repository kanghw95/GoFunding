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
   	$(document).ready(function(){
   		var pwdCnt=0;
   	var ischkId=false;
   	var ischkPwd=false;
   		$(".chkPwd").on('click',function(){
   			$(".chkPwd").toggleClass('active');
   			if($(".chkPwd").hasClass('active')){
   				$(this).prev().prev().prev().prev().prev().attr('type','text');
   			} else {
   				$(this).prev().prev().prev().prev().prev().attr('type','password');
   			}
   		})
	// id 정규식
	var idReg = /^[a-z0-9]{4,12}$/; // 4-12자리 영소문자, 숫자만
   	$(".inputId").blur(function(event){ 
	if(idReg.test($(".inputId").val())){
			$(".warnId").empty();
			$(".warnId").append("<td id=\"chkId\">안녕하세요.</td>");
			$("#chkId").css("color", "blue");
			ischkId = true;
			console.log("ischkId: " + ischkId);
	} else {
			$(".warnId").empty();
			$(".warnId").append("<td id=\"chkId\">이름을 확인해주세요.</td>");
			$("#chkId").css("color", "red");
			ischkId = false;
			console.log("ischkId: " + ischkId);
	}
   	})
	// 비밀번호 정규식
	var pwReg = /^[A-Za-z0-9!@#$%^&*]{8,25}$/; //비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.
   	$(".inputPwd").blur(function(event){ 
	if(pwReg.test($(".inputPwd").val())){
			$(".warnPwd").empty();
			$(".warnPwd").append("<td id=\"chkPwd\">안녕하세요.</td>");
			$("#chkPwd").css("color", "blue");
			ischkPwd = true;
			console.log("ischkPwd: " + ischkPwd);
	} else {
			$(".warnPwd").empty();
			$(".warnPwd").append("<td id=\"chkPwd\">비밀번호를 확인해주세요.</td>");
			$("#chkPwd").css("color", "red");
			ischkPwd = false;
			console.log("ischkPwd: " + ischkPwd);
	}
   	})
});
   </script>
<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="wrapper">
	<form action="<%=request.getContextPath() %>/user/loginPost" method="post">
		<c:if test="${empty user}">
		<div class="outer">
		<div class="login loginDiv">
			<div class="idPwd">
			<h1>로그인</h1>
			<div class="warning warnId"></div>
				<input type="text" name="userId" class="form inputId"
					placeholder="아이디"><br><br>
			<div class="warning warnPwd"></div>
				<input type="password" name="userPwd" class="form inputPwd"
					placeholder="비밀번호"><br><br>
				<a class="chk findId" href="<%=request.getContextPath() %>/user/findId">아이디</a> /
				<a class="chk findPwd" href="<%=request.getContextPath() %>/user/findPwd">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="chk chkPwd">비밀번호 확인하기</a><br><br>
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
				<br>아직 회원이 아니라면? <a href="<%=request.getContextPath() %>/user/join">회원가입</a>
			</div>
			</div>
			</div>
		</c:if>
	</form>
	<c:if test="${!empty user}">
		<div class="login">
			<a href="<%=request.getContextPath() %>/user/logout">로그아웃</a>
			<a href="<%=request.getContextPath() %>/message/msgList1">회원-메이커메세지</a>
			<a href="<%=request.getContextPath() %>/message/msgList3">메이커-회원메세지</a>
			<a href="<%=request.getContextPath() %>/message/msgList2">회원-회원메세지</a>
			<a href="<%=request.getContextPath() %>/message/msgAdminList">회원-관리자메세지</a>
			<c:if test="${user.userId eq 'admin'}">
			<a href="<%=request.getContextPath() %>/message/msgUserList">관리자-회원메세지</a></c:if>
		</div>
	</c:if>
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
