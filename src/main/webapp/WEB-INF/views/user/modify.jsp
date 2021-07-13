<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SPROUT! 새싹나눔</title>
<link href="<%=request.getContextPath() %>/resources/css/user/modify.css" rel="stylesheet" type="text/css" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
$(document).ready(function () {
	// 공백 체크 정규식
	var emptyReg = /\s/g;

	// 비밀번호 정규식
	var pwReg = /^[A-Za-z0-9!@#$%^&*]{8,25}$/;  //비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.
	// 닉네임 정규식
	var nickNameReg = /^[가-힣A-Za-z0-9]{1,8}$/;
	// 이메일 정규식
	var emailReg = /^[a-zA-Z0-9]+[a-zA-Z0-9]*[@]{1}[a-zA-Z0-9]+[a-zA-Z0-9]*[.]{1}[a-zA-Z]{1,3}$/;
	// 휴대전화 정규식
	var phoneReg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	
	var isPassPw = false;
	var isPassNickName = false;
	var isPassEmail = false;
	var isPassPhone = false;
	var isPassFav = false;
	
	var emailCheck = false;
	var pwCheck = false;
	
	var certifyPhoneNumber = false;
	

	// 닉네임 중복 검사
	var checkNick = function(){
		console.log("닉네임 중복확인~");
		var nick = $("#nickName").val();
		console.log(nick);
		
		if(nick == ""){
			$("#nickCheck").text("닉네임을 입력해주세요");
			$("#nickCheck").css("color", "red");
			$("#nickName").focus();
			return;
		}
		
		$.ajax({
			url: "nickCheck",
			type: "POST",
			data: {"userNick":nick},
			
			dataType : "text",
			success : function(data){
				console.log(data);
				if(data === "사용가능"){
					console.log(data);
					$("#nickCheck").text("사용 가능한 닉네임입니다");
					$("#nickCheck").css("color", "blue");
					nickCheck = true;
					console.log("nickCheck:" + nickCheck);
				} else {
					$("#nickCheck").text("이미 존재하는  닉네임입니다. 다른 닉네임을 사용해주세요");
					$("#nickCheck").css("color", "red");
					$("#nickName").focus();
					nickCheck = false;
					console.log("nickCheck:" + nickCheck);
				}
			},
			error : function(data){
				console.log("ajax는 일단 들어옴 but 실패");
				console.log("error data : " + data)
			}
			})
		}// checkNick 
		
		var checkEmail = function(){
			console.log("이메일 중복확인~");
			var email = $("#email").val();
			console.log(email);
			
			if(email == ""){
				$("#emailCheck").text("이메일을 입력해주세요");
				$("#emailCheck").css("color", "red");
				$("#email").focus();
				return;
			}
			
			$.ajax({
				url: "emailCheck",
				type: "POST",
				data: {"userEmail" : email},
				
				dataType : "text",
				success : function(data){
					console.log(data);
					if(data === "사용가능"){
						console.log(data);
						$("#emailCheck").text("사용 가능한 이메일입니다");
						$("#emailCheck").css("color", "blue");
						emailCheck = true;
						console.log("emailCheck:" + emailCheck);
					} else {
						$("#emailCheck").text("이미 존재하는  이메일입니다. 다른 이메일을 사용해주세요");
						$("#emailCheck").css("color", "red");
						$("#email").focus();
						emailCheck = false;
						console.log("emailCheck:" + emailCheck);
					}
				},
				error : function(data){
					console.log("ajax는 일단 들어옴 but 실패");
					console.log("error data : " + data)
				}
				})
			
		}// checkEmail 끝
		
		
		// 비밀번호 일치 여부
		var checkPw2 = function(){
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			
			if(pw == pw2){
				$("#pw2Check").text("비밀번호가 일치합니다");
				$("#pw2Check").css("color", "blue");
				pwCheck = true;
				console.log("pwCheck:" + pwCheck);
			}else{
				$("#pw2Check").text("비밀번호가 일치하지 않습니다");
				$("#pw2Check").css("color", "red");
				$("#pw2Check").focus();
				pwCheck = false;
				console.log("pwCheck:" + pwCheck);
			}
			
		} // checkPw2 끝
	
	// 유효성 검사
	
	var checkPw1 = function(){
		var pw = $("#pw").val();
		if(pw == ""){
			$("#pwCheck").text("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다");
			$("#pwCheck").css("color", "red");
		}
		else if(pwReg.test(pw)){
			console.log(pwReg.test(pw));
			$("#pwCheck").text("사용 가능한 비밀번호입니다");
			$("#pwCheck").css("color", "blue");
			isPassPw = true;
			console.log("isPassPw:" + isPassPw);
		}else {
			$("#pwCheck").text("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다");
			$("#pwCheck").css("color", "red");
			$("#pw").focus();
			isPassPw = false;
			console.log("isPassPw:" + isPassPw);
		}
	}
		
	
		
	var checkEmailReg = function(){
		if(emailReg.test($("#email").val())){
			$("#emailCheck").text("사용 가능한 이메일입니다");
			$("#emailCheck").css("color", "blue");
			isPassEmail = true;
			console.log("isPassEmail: " + isPassEmail);
		}else {
			$("#emailCheck").text("이메일 형식을 확인해주세요");
			$("#emailCheck").css("color", "red");
			$("#email").focus();
			isPassEmail = false;
			console.log("isPassEmail: " + isPassEmail);
		}
	}
	
	var checkNickNameReg = function(){
		if(nickNameReg.test($("#nickName").val())){
			$("#nickCheck").text("사용 가능한 닉네임입니다");
			$("#nickCheck").css("color", "blue");
			isPassNickName = true;
			console.log("isPassNickName: " + isPassNickName);
		}else{
			$("#nickCheck").text("1~8자리 닉네임을 설정하세요 (단, 자음이나 모음만으로는 불가)");
			$("#nickCheck").css("color", "red");
			$("#nickName").focus();
			isPassNickName = false;
			console.log("isPassNickName: " + isPassNickName);
		}
	}
	
	
	var checkPhoneReg = function(){
		if(phoneReg.test($("#phone").val())){
			$("#phoneCheck").text("인증하기 버튼을 눌러주세요");
			$("#phoneCheck").css("color", "blue");
			isPassPhone = true;
			console.log("isPassPhone: " + isPassPhone);
		}else{
			$("phoneCheck").text("전화번호의 형식이 올바르지 않습니다");
			$("#phoneCheck").css("color", "red");
			isPassPhone = false;
			console.log("isPassPhone: " + isPassPhone);
		}
	}
	
	

	
	// 관심사 하나로 합치기
	var mergeFav = function(){
		
		// 선택된 목록 가져오기
		var query = 'input[name="interest"]:checked';
		var selected = document.querySelectorAll(query); 
		
		//선택된 목록에서 value 찾기
		var fav = "";
		selected.forEach((el) => {
			fav += el.value + ",";
		})
		 
		console.log("fav : " + fav);

		var result = fav.replace(/,$/, '');
		
		console.log("result: " + result);
		
		$("#favorite").val(result);
		
		
		if($("#favorite").val() == ""){
			isPassFav = false;
			console.log($("#favorite").val());
			console.log("isPassFav:" + isPassFav);
		} else{
			isPassFav = true;
			console.log("isPassFav:" + isPassFav);
		}
	}

	// 휴대폰 번호 인증
	$("#checkPhoneNumber").click(function(){
		var phoneNumber = $("#phone").val();
		Swal.fire("인증번호 발송 완료!");
		
		$.ajax({
			type: "POST",
			url: "sendSMS",
			data: {"phoneNumber" : phoneNumber},
			
			success: function(data){
				console.log("성공!!");
				console.log("success data:" + data);
				$("#checkCerNumber").click(function(){
					if($.trim(data) == $("#certification").val()){
						Swal.fire(
							'인증 성공!',
							'휴대폰 인증이 정상적으로 완료되었습니다',
							'success'
						)
						certifyPhoneNumber = true;
						console.log("certifyPhoneNumber : " + certifyPhoneNumber );
					}else{
						Swal.fire({
							icon: 'error',
							title: '인증 오류',
							text: '인증번호가 올바르지 않습니다'
						})
					}
				})
			} // 번호인증 버튼 success 끝
		})
		
	}) // 번호인증 버튼 click 끝
	
	

	
	 
	
	$("#pw").on("keyup", checkPw1);
	$("#pw2").on("keyup", checkPw2);
	$("#nickName").on("keyup", checkNick);
	$("#nickName").on("keyup", checkNickNameReg);
	$("#email").on("keyup", checkEmail);
	$("#email").on("keyup", checkEmailReg);
	$("#phone").on("keyup", checkPhoneReg);

	$("#btnModify").on("click", mergeFav);

	
		
	$("#btnModify").on("click", function(){
			
		if(isPassPw && pwCheck && certifyPhoneNumber){
			console.log("\n비번 유효성" + isPassPw + "\n이메일 유효성" + isPassEmail 
					+ "\n닉네임 유효성" + isPassNickName + "\n핸드폰 유효성" + isPassPhone +"\n닉네임 중복검사"+ nickCheck
					+"\n이메일 중복검사"+ emailCheck +"\n비번 일치"+ pwCheck +"\n핸드폰 인증"+ certifyPhoneNumber)
			
			var frmData = $("#frmModify").serialize(); 
			
			$.ajax({
				url: "domodify",
				type: "POST",
				data: frmData,
				
				success: function(data){
					console.log(data);
					console.log("정보수정 성공성공");
					location.href="<%=request.getContextPath()%>/myPage";
				},
				error: function(data){
					console.log(data);
					console.log("ajax는 들어왔는데 실패쓰");
				}
				
			})
			
		}else{
			Swal.fire({
				icon: 'error',
				title: '회원가입 실패',
				text: '데이터를 다시 입력해주세요'
			})
		}
	});

	
});
		
		
function modifyAddress() {
	window.open("<%=request.getContextPath()%>/user/addrpopup", "myAddress", "width=1000px, height=500px, resizable = no, left= 490, top=140");
};


</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="wrapper">
	<div class="modifyContainer">
		<h2 class="modifyTitle">SPROUT! 새싹나눔 회원 정보 수정</h2>
		<form id="frmModify">
			<div class="frmGroup">
				<label for="id" style="font-weight: bold; font-size: 20px;">아이디</label>
				<input type="text" class="inputBox" id="id" name="userId" value="${user.userId }" readonly> 
				<div id="idCheck"></div>
			</div>
			<div class="frmGroup">
				<label for="name" style="font-weight: bold; font-size: 20px;">이름</label>
				<input type="text" class="inputBox" id="name" name="userName" value="${user.userName }" readonly>
				<div id="nameCheck"></div>
			</div>
			<div class="frmGroup">
				<label for="pw" style="font-weight: bold; font-size: 20px;">비밀번호</label>
				<input type="password" class="inputBox" id="pw" name="userPwd" placeholder="비밀번호를 입력해주세요">
				<div id="pwCheck"></div>
			</div>
			
			<div class="frmGroup">
				<input type="password" class="inputBox" id="pw2" name="userPwd2" placeholder="비밀번호를 다시 한번 입력해주세요">
				<div id="pw2Check"></div>
			</div>

			<div class="frmGroup">
				<label for="email" style="font-weight: bold; font-size: 20px;">이메일</label>
				<input type="text" class="inputBox" id="email" name="userEmail" value="${user.userEmail }">
				<div id="emailCheck"></div>
			</div>
			<div class="frmGroup">
				<label for="nickName" style="font-weight: bold; font-size: 20px;">닉네임</label>
				<input type="text" class="inputBox" id="nickName" name="userNick" value="${user.userNick }">
				<div id="nickCheck"></div>
			</div>
			<div class="frmGroup" style="margin-top: 10px; margin-bottom: 10px;">
				<label for="gender" style="font-weight: bold; font-size: 20px;">성별</label>
				<input type="radio" id="gender1" name="gender" value="m">남
				<input type="radio" id="gender2" name="gender" value="f">여
			</div>
			<div class="frmGroup">
				<input type="text" id="age" name="userAge" value="${user.userAge }">
			</div>
			<div class="frmGroup">
				<label for="address" style="font-weight: bold; font-size: 20px;">주소</label>&nbsp;&nbsp;
				<input type="button" class="insideBtn" onclick="modifyAddress();" value="수정하기" ><br>
			</div>
			
			<div class="frmGroup">
				<label for="phone" style="font-weight: bold; font-size: 20px;">전화번호</label>
				<div id="phoneCheck"></div>
				<input type="text" id="phone" class="inputPhone" name="userPhone" value="${user.userPhone }">
				<input type="button" id="checkPhoneNumber" class="insideBtn" value="번호확인"><br>
				<input type="text" id="certification" class="inputPhone" name="certification" placeholder="인증번호를 입력해주세요">
				<input type="button" id="checkCerNumber" class="insideBtn" value="인증하기">
			</div>
			
			<div class="frmGroup" style="margin-top: 15px;">
				<span style="font-size: 20px; font-weight: bold;">관심사</span><br>
				<div style="margin-top:5px; margin-bottom: 5px;">
				<label><input type="checkbox" class="fav" id="interest1" name="interest" value="일자리창출">일자리창출</label>
				<label><input type="checkbox" class="fav" id="interest2" name="interest" value="친환경">친환경</label>
				<label><input type="checkbox" class="fav" id="interest3" name="interest" value="작은 가게">작은 가게</label>
				<br>				
				<label><input type="checkbox" class="fav" id="interest4" name="interest" value="공정무역">공정무역</label>
				<label><input type="checkbox" class="fav" id="interest5" name="interest" value="기부">기부</label>
				<label><input type="checkbox" class="fav" id="interest6" name="interest" value="미디어">미디어</label>
				<label><input type="checkbox" class="fav" id="interest7" name="interest" value="창작자">창작자</label>
				<input type="hidden" id="favorite" name="userFav">
				</div>
			</div>
			<div class="frmGroup">
				<button type="reset" class="insideBtn">취소</button>
				<button type="button" id = "btnModify" class="btn draw-border">정보 수정</button>
			</div>

		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>