<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SPROUT! 새싹나눔</title>
<link href="<%=request.getContextPath() %>/resources/css/user/join.css" rel="stylesheet" type="text/css" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
	
	var certifyPhoneNumber = false;
	
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
		
		if($("#sample6_postcode").val() == ""){
			isPassAddress = false;
			console.log("isPassAddress:" + isPassAddress);
		}else{
			$("#address").val( $("#sample6_postcode").val() + "," 
					+ $("#sample6_address").val() + "," 
					+ $("#sample6_detailAddress").val() + "," 
					+ $("#sample6_extraAddress").val());
			
			isPassAddress = true;	
			console.log("isPassAddress:" + isPassAddress);	
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

	$("#btnJoin").on("click", mergeAddress);
	$("#btnJoin").on("click", mergeFav);

	
	
	
		
	$("#btnJoin").on("click", function(){
		

		for(var i = 1; i<4; i++){
			var check_i = document.getElementById("agree_terms_"+i); 
				if(check_i.checked != true){
					
					Swal.fire({
						icon: 'error',
						text: '필수 약관에 동의해주세요!'
					})
					return;
				}
			}
		
		
		if(isPassId && isPassName && isPassPw && isPassEmail && isPassNickName && isPassPhone && idCheck && nickCheck
				&& emailCheck && pwCheck && certifyPhoneNumber){
			console.log("id 유효성" + isPassId + "\n이름 유효성" + isPassName + "\n비번 유효성" + isPassPw + "\n이메일 유효성" + isPassEmail 
					+ "\n닉네임 유효성" + isPassNickName + "\n핸드폰 유효성" + isPassPhone + "\n아이디 중복검사" + idCheck +"\n닉네임 중복검사"+ nickCheck
					+"\n이메일 중복검사"+ emailCheck +"\n비번 일치"+ pwCheck +"\n핸드폰 인증"+ certifyPhoneNumber)
			
			
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
			
		}else{
			Swal.fire({
				icon: 'error',
				title: '회원가입 실패',
				text: '데이터를 다시 입력해주세요'
			})
		}
	});

	
	var agree_terms_all = document.getElementById("agree_terms_all");

	agree_terms_all.addEventListener("click",function(){ 
		
		if(agree_terms_all.getAttribute("aria-hidden") == "false"){
			agree_terms_all.setAttribute("aria-hidden","true");
			$("input:checkbox[name='agree']").prop("checked",true);
			$(".FundingDetailApplicationContent_icon").css(
					{'background-color' : '#1f9eff'});

		}else{
			agree_terms_all.setAttribute("aria-hidden","false");
			 $("input:checkbox[name='agree']").prop("checked",false);
			 $(".FundingDetailApplicationContent_icon").css(
						{'background-color' : ''});
		}
	});
	
	
	function checkSelectAll()  {
		
		var agree_span0 = document.getElementById("agree_span0");
		  // 전체 체크박스
		  var checkboxes = document.querySelectorAll('input[name="agree"]');
		  // 선택된 체크박스
		  var checked = document.querySelectorAll('input[name="agree"]:checked');
		  // select all 체크박스
		  var selectAll = document.querySelector('input[name="all_agree"]');
		  
		  if(checkboxes.length === checked.length)  {
		    selectAll.checked = true;
		    agree_terms_all.setAttribute("aria-hidden","true");
		    agree_span0.style.backgroundColor = "#1f9eff"
		  }else {
		    selectAll.checked = false;
		    agree_terms_all.setAttribute("aria-hidden","false");
		    agree_span0.style.backgroundColor = ""
		    
		  }

		}
	
	function checkColorChange(number)  {
		
		var i = number;
		
		var agree_span = document.getElementById("agree_span"+number);
		
		console.log(agree_span);
		
		if(agree_span.style.backgroundColor == ""){
			agree_span.style.backgroundColor = "#1f9eff"
		}else if(agree_span.style.backgroundColor = "#1f9eff"){
			agree_span.style.backgroundColor = ""
		}
	};
	

	
});
		
	
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="wrapper">
	<div class="joinContainer">
		<h2 class="joinTitle">SPROUT! 새싹나눔 회원가입</h2>
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
			<div class="frmGroup" style="margin-top: 10px; margin-bottom: 10px;">
				<label for="gender" style="font-weight: bold; font-size: 20px;">성별</label>
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
				
				<div id="phoneCheck"></div>
				<input type="text" id="phone" class="inputPhone" name="userPhone" placeholder="전화번호를 입력해주세요">
				<input type="button" id="checkPhoneNumber" class="insideBtn" value="번호확인">
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
			
			<section class="FundingDetailApplicationContent_section">
				<h3 class="FundingDetailApplicationContent_subtitle">약관 동의</h3>
				<div class="FundingDetailApplicationContent_terms">
					<div class="FundingDetailApplicationContent_bundle">
						<div class="FundingDetailApplicationContent_checkbox undefined">
							<input id="agree_terms_all" type="checkbox" aria-hidden="false" name="all_agree" class="FundingDetailApplicationContent_input">
								<label for="agree_terms_all" class="FundingDetailApplicationContent_label">
								<span  id="agree_span0" class="FundingDetailApplicationContent_icon"></span>
								약관 및 개인정보 관련 사항(선택 동의 포함)에 모두 동의합니다.
								</label>
						</div>
					</div>
					<div class="FundingDetailApplicationContent_group__292es">
						<div class="FundingDetailApplicationContent_checkbox">
							<input name="agree" id="agree_terms_1" type="checkbox" class="FundingDetailApplicationContent_input" onclick="checkSelectAll(); checkColorChange(1);">
								<label for="agree_terms_1" class="FundingDetailApplicationContent_label">
									<span id="agree_span1" class="FundingDetailApplicationContent_icon"></span>(필수) 개인정보의 수집 및 이용에 동의합니다. </label>
								<a href="#" class="FundingDetailApplicationContent_link">자세히 보기</a>
						</div>
						<div class="FundingDetailApplicationContent_checkbox">
							<input id="agree_terms_2" type="checkbox" name="agree" onclick="checkSelectAll(); checkColorChange(2); " class="FundingDetailApplicationContent_input">
								<label for="agree_terms_2" class="FundingDetailApplicationContent_label">
									<span id="agree_span2" class="FundingDetailApplicationContent_icon"></span>(필수) 개인정보의 제3자 제공에 동의합니다.</label>
								<a href="#" class="FundingDetailApplicationContent_link">자세히 보기</a>
						</div>
						<div class="FundingDetailApplicationContent_checkbox">
							<input id="agree_terms_3" type="checkbox" name="agree" onclick="checkSelectAll(); checkColorChange(3);" class="FundingDetailApplicationContent_input">
								<label for="agree_terms_3" class="FundingDetailApplicationContent_label">
									<span id="agree_span3" class="FundingDetailApplicationContent_icon"></span>(필수) ‘새싹나눔 펀딩 약관’에 동의합니다.</label>
								<a href="#" class="FundingDetailApplicationContent_link">자세히 보기</a>
						</div>
						<div class="FundingDetailApplicationContent_checkbox">
							<input id="agree_terms_4" type="checkbox" name="agree" onclick="checkSelectAll(); checkColorChange(4);" class="FundingDetailApplicationContent_input">
								<label for="agree_terms_4" class="FundingDetailApplicationContent_label">
									<span id="agree_span4" class="FundingDetailApplicationContent_icon"></span>(선택) 새싹나눔 마케팅 알림 수신에 동의합니다.</label>
						</div>
					</div>
				</div>
			</section>
			
			
			<div class="frmGroup" style="margin-top: 10px;">
				<button type="reset" class="insideBtn">취소</button>
				<button type="button" id="btnJoin" class="btn draw-border">회원가입</button>
			</div>

		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>