var certifyPhoneNumber="idChk";
var ischkName=false;
var ischkEmail=false;
var ischkPhone=false;

//이메일 정규식
var emailReg = /^[a-zA-Z0-9-_]+[a-zA-Z0-9]*[@]{1}[a-zA-Z0-9]+[a-zA-Z0-9]*[.]{1}[a-zA-Z]{1,3}$/;
//이름 정규식
var nameReg = /^[가-힣]{2,4}$/; // 2~4글자 한글이름
//휴대전화 정규식
var phoneReg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
// 휴대폰 번호 인증
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
					certifyPhoneNumber = "match";
					console.log("certifyPhoneNumber : " + certifyPhoneNumber );
					Swal.fire(
						'인증 성공!',
						'휴대폰 인증이 정상적으로 완료되었습니다',
						'success')
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

$("#userName").blur(function(event){ 
	if(nameReg.test($("#userName").val())){
			$(".warnName").empty();
			$(".warnName").append("<td id=\"chkName\">완료</td>");
			$("#chkName").css("color", "blue");
			ischkName = true;
			console.log("ischkName: " + ischkName);
	} else {
			$(".warnName").empty();
			$(".warnName").append("<td id=\"chkName\">이름을 확인해주세요.</td>");
			$("#chkName").css("color", "red");
			ischkName = false;
			console.log("ischkName: " + ischkName);
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
	if(ischkName&&ischkEmail&&ischkPhone&&certifyPhoneNumber=="match"){
		var userName=$("#userName").val();
		var userEmail=$("#userEmail").val();
		var phone=$("#phone").val();
		console.log(userName);
		console.log(userEmail);
		console.log(phone);
		$.ajax({
			type: "POST",
			url: "chkId",
			data: {
				"userName" : userName,
				"userEmail" : userEmail,
				"phone" : phone,
				"phoneChk" : certifyPhoneNumber
			},
			dataType: "json",
			success: function(result){
				Swal.fire({
			          icon: 'info',
			          text: "회원님의 ID는 "+result.userId+" 입니다.",
			         })
			},
			error: function(){
				Swal.fire({
			          icon: 'info',
			          text: "일치하는 정보가 없습니다.",
			         })
			}
		});
	} else {
		alert("작성된 내용을 확인해주세요.");
	}
})