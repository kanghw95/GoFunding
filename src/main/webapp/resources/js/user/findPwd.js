var certifyPhoneNumber="idChk";
var ischkId=false;
var ischkEmail=false;
var ischkPhone=false;

//id 정규식
var idReg = /^[a-zA-Z0-9]{4,12}$/; // 4-12자리 영소문자, 숫자만 (테스트때문에 대문자 추가)
//이메일 정규식
var emailReg = /^[a-zA-Z0-9-_]+[a-zA-Z0-9]*[@]{1}[a-zA-Z0-9]+[a-zA-Z0-9]*[.]{1}[a-zA-Z]{1,3}$/;
//휴대전화 정규식
var phoneReg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
//휴대폰 번호 인증
$("#chkPhoneBtn").click(function(){
	var phoneNumber = $("#phone").val();
	Swal.fire("인증번호 발송 완료!");
	
	$.ajax({
		type: "POST",
		url: "sendSMS",
		data: {"phoneNumber" : phoneNumber},
		
		success: function(data){
			console.log("성공!!");
			console.log("success data:" + data);
			$("#chkNumBtn").click(function(){
				if($.trim(data) == $("#chkNum").val()){
					Swal.fire(
						'인증 성공!',
						'휴대폰 인증이 정상적으로 완료되었습니다',
						'success')
					certifyPhoneNumber = "match";
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

$("#userId").blur(function(event){ 
	if(idReg.test($("#userId").val())){
			$(".warnId").empty();
			$(".warnId").append("<td id=\"chkId\">완료</td>");
			$("#chkId").css("color", "blue");
			ischkId = true;
			console.log("ischkId: " + ischkId);
	} else {
			$(".warnId").empty();
			$(".warnId").append("<td id=\"chkId\">아이디를 확인해주세요.</td>");
			$("#chkId").css("color", "red");
			ischkId = false;
			console.log("ischkId: " + ischkId);
	}
});

$("#userEmail").blur(function(event){ 
	if(emailReg.test($("#userEmail").val())){
		$(".warnEmail").empty();
		$(".warnEmail").append("<td id=\"chkEmail\">완료</td>");
		$("#chkEmail").css("color", "blue");
		ischkEmail = true;
		console.log("ischkEmail: " + ischkEmail);
	} else {
		$(".warnEmail").empty();
		$(".warnEmail").append("<td id=\"chkEmail\">이메일을 확인해주세요.</td>");
		$("#chkEmail").css("color", "red");
		ischkEmail = false;
		console.log("ischkEmail: " + ischkEmail);
	}
});

$("#phone").blur(function(event){ 
	if(phoneReg.test($("#phone").val())){
		$(".warnPhone").empty();
		$(".warnPhone").append("<td id=\"chkPhone\">완료</td>");
		$("#chkPhone").css("color", "blue");
		ischkPhone = true;
		console.log("ischkPhone: " + ischkPhone);
	} else {
		$(".warnPhone").empty();
		$(".warnPhone").append("<td id=\"chkPhone\">전화번호를 확인해주세요. (-제외)</td>");
		$("#chkPhone").css("color", "red");
		ischkPhone= false;
		console.log("ischkPhone: " + ischkPhone);
	}
});

$("#sendBtn").click(function(){ //비밀번호 확인 버튼
	if(ischkId&&ischkEmail&&ischkPhone&&certifyPhoneNumber=="match"){
		var userId=$("#userId").val();
		var userEmail=$("#userEmail").val();
		var phone=$("#phone").val();
		console.log(userId);
		console.log(userEmail);
		console.log(phone);
		$.ajax({
			type: "POST",
			url: "chkPwd",
			data: {
				"userId" : userId,
				"userEmail" : userEmail,
				"phone" : phone,
				"phoneChk" : certifyPhoneNumber
			},
			dataType: "json",
			success: function(result){
				alert("회원님의 비밀번호는 "+result.userPwd+" 입니다.");
			},
			error: function(){
				alert("일치하는 정보가 없습니다.");
			}
		});
	} else {
		alert("작성된 내용을 확인해주세요.");
	}
})