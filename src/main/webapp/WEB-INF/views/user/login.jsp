<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<link href="<%=request.getContextPath() %>/resources/css/user/login.css?ver=1.0" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
<script>
var googleUser = {};
var startApp = function() {
  gapi.load('auth2', function(){
    // Retrieve the singleton for the GoogleAuth library and set up the client.
    auth2 = gapi.auth2.init({
      client_id: '787043379258-f7m1f543ukem253a55cm7kc569hijh0r.apps.googleusercontent.com',
      cookiepolicy: 'single_host_origin',
      // Request scopes in addition to 'profile' and 'email'
      //scope: 'additional_scope'
    });
    attachSignin(document.getElementById('customBtn'));
  });
};

function attachSignin(element) {
  console.log(element.id);
  auth2.attachClickHandler(element, {},
      function(googleUser) {
        var profile = googleUser.getBasicProfile();
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
           		method : 'POST',
           		success : function(date){
           			window.location.href = '/sprout/funselect';           			
           		}
           	});
      }, function(error) {
        alert(JSON.stringify(error, undefined, 2));
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
   	$("#loginBtn").click(function(){
  		if(ischkId==true&&ischkPwd==true){
		$("#frm").attr('action','<%=request.getContextPath() %>/user/loginPost');
   		$("#frm").attr('method','post');
   		$("#frm").submit();
		} else if(ischkId==false&&ischkPwd==true){
  			alert('아이디 형식을 확인해 주세요.');
  		} else if(ischkId==true&&ischkPwd==false){
			alert('비밀번호 형식을 확인해 주세요.');
 		} else if(ischkId==false&&ischkPwd==false){
 			alert('아이디와 비밀번호 형식을 확인해 주세요.');
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
	<form id="frm">
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
				<button type="button" class="btns loginBtn" id="loginBtn">로그인</button><br><br>
				<hr>
			</div>
			<div id="gSignInWrapper">
			<div id="customBtn" class="customGPlusSignIn"><img width="50" height="50" class="customBtn"
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
		</div>
	</c:if>
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script>startApp();</script>
</body>
</html>