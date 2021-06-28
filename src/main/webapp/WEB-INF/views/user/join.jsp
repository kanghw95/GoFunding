<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath() %>/resources/css/userdetail_join/join.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/common.css" rel="stylesheet" type="text/css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
// 주소 검색 api
function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					if (data.userSelectedType === 'R') {
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						document.getElementById("sample6_extraAddress").value = extraAddr;

					} else {
						document.getElementById("sample6_extraAddress").value = '';
					}

					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					document.getElementById("sample6_detailAddress").focus();
				}
			}).open();
}
</script>
<script>
$(document).ready(function () {
	// 공백 체크 정규식
	var emptyReg = /\s/g;
	// id 정규식
	var idReg = /^[a-z0-9]{4,12}$/; // 4-12자리 영소문자, 숫자만
	// 이름 정규식
	var nameReg = /^[가-힣]{2,4}$/; // 2~4글자 한글이름
	// 비밀번호 정규식
	var pwReg = /^[A-Za-z0-9!@#$%^&*]{8,25}$/;  //비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.
	// 닉네임 정규식
	var nickNameReg = /^[가-힣A-Za-z0-9]{1,8}$/;
	// 이메일 정규식
	var emailReg = /^[a-zA-Z0-9]+[a-zA-Z0-9]*[@]{1}[a-zA-Z0-9]+[a-zA-Z0-9]*[.]{1}[a-zA-Z]{1,3}$/;
	// 휴대전화 정규식
	var phoneReg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	
	var isPassId = false;
	var isPassName = false;
	var isPassPw = false;
	var isPassPw2 = false;
	var isPassEmail = false;
	var isPassNickName = false;
	var isPassAgree = false;
	var isPassPhone = false;
	var isPassAddress = false;
	var isPassFav = false;
	
	var idCheck = false;
	var nickCheck = false;
	var emailCheck = false;
	var pwCheck = false;
	
	// 아이디 중복검사
	var checkId = function(){
		console.log("checkId keyup~~");
		var id = $("#id").val();
		console.log(id);
		
		if(id == ""){
			$("#idCheck").text("아이디를 입력해주세요");
			$("#id").focus();
			return;
		}
		
		$.ajax({
			url: "idCheck",
			type: "POST",
			data: {"userId":id},
			
			success : function(data){
				console.log(data);
				if(data === "사용가능"){
					console.log(data);
					$("#idCheck").text("사용 가능한 아이디입니다");
					$("#idCheck").css("color", "blue");
					idCheck = true;
					console.log("idCheck:" + idCheck);
				} else {
					$("#idCheck").text("이미 존재하는 아이디입니다. 다른 아이디를 사용해주세요");
					$("#idCheck").css("color", "red");
					$("#id").focus();
					idCheck = false;
					console.log("idCheck:" + idCheck);
				}
			},
			error : function(data){
				console.log("ajax는 일단 들어옴 but 실패");
				console.log("error data : " + data)
			}
		}) // 아이디 중복 체크 ajax
		
	}// checkId 끝
		
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
				data: {"userEmail":email},
				
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
	var checkIdReg = function(){
		if(idReg.test($("#id").val())){
			$("#idCheck").text("사용 가능한 아이디입니다");
			$("#idCheck").css("color", "blue");
			isPassId = true;
			console.log("isPassId: " + isPassId);
		}else {
			$("#idCheck").text("4~12자리 영소문자 및 숫자로 된 아이디를 입력해주세요");
			$("#idCheck").css("color", "red");
			$("#id").focus();
			isPassId = false;
			console.log("isPassId: " + isPassId);
		}
	}
	
	var checkPw1 = function(){
		var pw = $("#pw").val();
		if(pw == ""){
			$("#pwCheck").text("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다");
			$("#pwCheck").css("color", "red");
		}
		else if(pwReg.test($("pw").val())){
			console.log(pwReg.test($("pw").val()));
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
	
	
	var checkNameReg = function(){
		if(nameReg.test($("#name").val())){
			$("#nameCheck").text("환영합니다");
			$("#nameCheck").css("color", "blue");
			isPassName = true;
			console.log("isPassName : " + isPassName);
		}else{
			$("#nameCheck").text("이름을 다시 한번 확인해주세요");
			$("#nameCheck").css("color", "red");
			$("#name").focus();
			isPassName = false;
			console.log("isPassName : " + isPassName);
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
	
	
	// 주소 하나로 합치기 
	var mergeAddress = function(){
		
		$("#address").val( $("#sample6_postcode").val() + "," 
				+ $("#sample6_address").val() + "," 
				+ $("#sample6_detailAddress").val() + "," 
				+ $("#sample6_extraAddress").val());
		
		isPassAddress = true;	
		console.log("isPassAddress:" + isPassAddress);
	}
	
	// 관심사 하나로 합치기
	var mergeFav = function(){
		
		$(".fav:checked").each(function(){
			$("#favorite").append($(".fav:checked").val());
			console.log($(".fav:checked").val());
		})
		
		if($("#favorite").val() == ""){
			isPassFav = false;
			console.log($("#favorite").val());
			console.log("isPassFav:" + isPassFav);
		} else{
			isPassFav = true;
			console.log("isPassFav:" + isPassFav);
		}
	}


	var joinClick = function(){
		var frmData = $("#frmJoin").serialize(); 
		
		$.ajax({
			url: "doJoin",
			type: "POST",
			data: frmData,
			
			success: function(data){
				console.log(data);
				console.log("회원가입 성공성공");
				location.href="<%=request.getContextPath()%>/user/login";
			},
			error: function(data){
				console.log(data);
				console.log("ajax는 들어왔는데 실패쓰");
			}
			
		})
	}
	
	
	$("#id").on("keyup", checkId);
	$("#id").on("keyup", checkIdReg);
	$("#pw").on("keyup", checkPw1);
	$("#pw2").on("keyup", checkPw2);
	$("#nickName").on("keyup", checkNick);
	$("#nickName").on("keyup", checkNickNameReg);
	$("#name").on("keyup", checkNameReg);
	$("#email").on("keyup", checkEmail);
	$("#email").on("keyup", checkEmailReg);
	$("#phone").on("keyup", checkPhoneReg);


	
	/*if(isPassId && isPassName && isPassPw && isPassPw2 && isPassEmail && isPassNickName && isPassPhone && isPassAddress && isPassFav && idCheck && nickCheck
			&& emailCheck && pwCheck){*/
		$(".btnJoin").on("click", mergeAddress);
		$(".btnJoin").on("click", mergeFav);
		$(".btnJoin").on("click", joinClick);		
	
	
	/*$(".btnJoin").on("click", function(){
		console.log("클림됨");
	})*/

		
		

	
})//$function 끝	
	
	
		
	
</script>

<body>
	<div class="joinContainer">
		<h2>SPROUT! 새싹나눔 회원가입</h2>
		<form id="frmJoin">
			<div class="frmGroup">
				<div id="idCheck"></div>
				<input type="text" class="inputBox" id="id" name="userId" placeholder="아이디를 입력해주세요"> 
			</div>
			<div class="frmGroup">
				<div id="nameCheck"></div>
				<input type="text" class="inputBox" id="name" name="userName" placeholder="이름을 입력해주세요">
			</div>
			<div class="frmGroup">
				<div id="pwCheck"></div>
				<input type="password" class="inputBox" id="pw" name="userPwd" placeholder="비밀번호를 입력해주세요">
			</div>
			
			<div class="frmGroup">
				<div id="pw2Check"></div>
				<input type="password" class="inputBox" id="pw2" name="userPwd2" placeholder="비밀번호를 다시 한번 입력해주세요">
			</div>

			<div class="frmGroup">
				<div id="emailCheck"></div>
				<input type="text" class="inputBox" id="email" name="userEmail" placeholder="이메일을 입력해주세요">
			</div>
			<div class="frmGroup">
				<div id="nickCheck"></div>
				<input type="text" class="inputBox" id="nickName" name="userNick" placeholder="사용하실 닉네임을 입력하세요">
			</div>
			<div class="frmGroup">
				<label for="gender">성별</label>
				<input type="radio" id="gender1" name="gender" value="m">남
				<input type="radio" id="gender2" name="gender" value="f">여
			</div>
			<div class="frmGroup">
				<input type="text" id="age" name="userAge" placeholder="나이를 입력해주세요 ex) 20세 : 20">
			</div>
			<div class="frmGroup">
				<input type="text" class="inputPost" id="sample6_postcode" name="postcode" readonly  placeholder="우편번호">
				<input type="button" class="insideBtn" onclick="sample6_execDaumPostcode()" value="주소 검색" >
				<input type="text" class="inputBox" id="sample6_address" name="address1" readonly  placeholder="주소">
				<input type="text" class="inputBox" id="sample6_detailAddress" name="address2"  placeholder="상세주소">
				<input type="text" class="inputBox" id="sample6_extraAddress" name="address3" readonly  placeholder="참고항목">
				<input type="hidden" id="address" name="userAddress">
			</div>
			
			<div class="frmGroup">
				<input type="button" class="insideBtn" value="인증하기"><div id="phoneCheck"></div>
				<input type="text" id="phone" name="userPhone" placeholder="전화번호를 입력해주세요">
			</div>
			
			<div class="frmGroup">
				<span style="font-size: 16px; font-weight: bold;">관심사</span><br>
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
				<button type="button" class="btnJoin">회원가입</button>
			</div>

		</form>
	</div>
</body>
</html>