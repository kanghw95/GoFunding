var cnt=0; 
var infoCnt=0; 
var rewardCnt=0;
let ischkid=false;
let isprivacy=false;
var check = 3;
var warning="중복확인 버튼을 눌러주세요.";

$(".datepick").each(function () { //펀딩 시작~종료 기간 달력 선택
	$(this).datepicker();
});

$.datepicker.setDefaults({
	dateFormat: 'yy-mm-dd',	//날짜 포맷
	prevText: '이전 달', //마우스 오버시 이전달 텍스트
	nextText: '다음 달', //마우스 오버시 다음달 텍스트
	closeText: '닫기', //닫기 버튼 텍스트 변경
	currentText: '오늘', // 오늘 텍스트 변경
	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //한글 월 표시
	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //한글 월 표시
	dayNames: ['일', '월', '화', '수', '목', '금', '토'], //한글 요일 표시
	dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'], //한글 요일 표시
	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], //한글 요일 표시
	showMonthAfterYear: true, //true : 년 월  false : 월 년 순
	yearSuffix: '년',	
	showButtonPanel: true, //오늘 버튼과 달력 닫기 버튼 보기 옵션
	minDate: 0 //오늘 이전 선택 불가
});

jQuery.datepicker._gotoToday = function (id) { //오늘 버튼 클릭 시 오늘 날짜 선택
	var target = jQuery(id);
	var inst = this._getInst(target[0]);
	if (this._get(inst, 'gotoCurrent') && inst.currentDay) {
		inst.selectedDay = inst.currentDay;
		inst.drawMonth = inst.selectedMonth = inst.currentMonth;
		inst.drawYear = inst.selectedYear = inst.currentYear;
	} else {
		var date = new Date();
		inst.selectedDay = date.getDate();
		inst.drawMonth = inst.selectedMonth = date.getMonth();
		inst.drawYear = inst.selectedYear = date.getFullYear();
		this._setDateDatepicker(target, date);
	}
	this._notifyChange(inst);
	this._adjustDate(target);
	this._setDateDatepicker(target, date);
	this._selectDate(id, this._getDateDatepicker(target));
}

$("#submitBtn").click(function (msg) { //입력 정보 insert 컨트롤러 전송
	$('#frm').attr('action', 'formSend');
	$('#frm').attr('method', 'post');
});

$('#addInput').click(function () { //추가 버튼 클릭 시 makerInfos 메소드 호출
	if(infoCnt<4){
		infoCnt++;
		add_makerInfos();
	} else {
		alert("입력은 5개까지 가능합니다.");
	}
});

$('#closeInfoBtn').click(function(){ //삭제 버튼 클릭 시 아래 행 부터 삭제
	console.log(infoCnt);
	if(infoCnt>1){
		infoCnt--;
	} else if (infoCnt==1){
		infoCnt=0;
	}
	$('#tbody1 > tr:last').remove();
});

function add_makerInfos() { //메이커 참고 정보 기입 행 추가 생성
	var tbody = document.getElementById('tbody1');
	var row = tbody.insertRow(tbody.rows.length);
	var td1 = row.insertCell();
	var td2 = row.insertCell();
	td1.setAttribute("width","260");
	td2.innerHTML = '<input type="text" id="addInputInfo" name="makerInfo" class="inputText" placeholder="내용을 입력해주세요.">';
};

$('#addReward').click(function () { //추가 버튼 클릭 이벤트 아래 메소드 호출
	if(rewardCnt<4){
		rewardCnt++;
		add_rewards();
	} else {
		alert("입력은 5개까지 가능합니다.");
	}
});

$('.closeRewardBtn').click(function(){ //삭제 버튼 클릭 시 아래 행 부터 삭제
	console.log(rewardCnt);
	if(rewardCnt>1){
		rewardCnt--;
	} else if (rewardCnt==1){
		rewardCnt=0;
	}
	$('#tbody2 > tr:last').remove();
});

function add_rewards() { //리워드 추가 정보 기입 행 추가 생성
	var tbody = document.getElementById('tbody2');
	var row = tbody.insertRow(tbody.rows.length);
	var td1 = row.insertCell();
	var td2 = row.insertCell();
	td1.innerHTML = '<input type="text" id="rewardPrice" class="inputReward" name="rewardPrice" placeholder="금액">' +
		'&nbsp;원 달성 시&nbsp;<input type="text" id="rewardTitle" class="inputReward" name="rewardTitle" placeholder="리워드 종류">&nbsp;';
	td2.innerHTML = '최대&nbsp;<input type="text" class="inputReward" name="rewardEA" id="rewardEA" placeholder="개수">개';
};

$('#addInfo').click(function(){ //세부사항 작성 영역 보이기감추기
	cnt++;
	if(cnt%2==1){
		$('#infoDetail').css('display','block');
	} else {
		$('#infoDetail').css('display','none');
	}
});

$('#openPrivacy').click(function(){ //개인정보동의 모달창 생성
	$('.wrap1').fadeIn();
});

$('.closePrivacy').click(function(){ //개인정보동의 모달창 삭제
	$('.wrap1').fadeOut();
});

$('#standards').click(function(){ //펀딩개설기준 모달창 생성
	$('.wrap2').fadeIn();
});
 
$('.closeStandard').click(function(){ //펀딩개설기준 모달창 삭제
	$('.wrap2').fadeOut();
});

$(document).ready(function(){
	$("#direct").hide();
})

$(document).on("change", "#email", function(){ //직접입력 선택시 도메인 입력 text 출력 TODO
	if($("#direct").val()==""){
		$("#direct").show();
	} else if(("#direct").val()!="") {
		$("#direct").hide();
	}
});

$("#privacyChk").change(function(){ //개인정보 수집 및 이용 동의 체크박스 : 체크 되어야만 프로젝트 개설 버튼 활성화
	if($("#privacyChk").is(":checked")){
		isprivacy=true;
		if(ischkid==true){
			$("#submitBtn").attr("disabled",false);
		} else {
			$("#submitBtn").attr("disabled",true);
		}
	} else {
		isprivacy=false;
		$("#submitBtn").attr("disabled",true);
	}
})

$("#nameChk").click(function(){ //주체명(메이커명) 중복 확인
	var maker=$("#maker").val();
	if(maker==""||maker==null){
		alert("아이디를 입력해주세요.");
	} else {
		$.ajax({
			url: 'makerChk',
			type: 'get',
			data: {'maker': maker},
			success: function(msg){
				idChk(msg);
				removeWarn();
				
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	}
});

function removeWarn(){ //중복확인 버튼 클릭 요청 문구 삭제
	$("#warning").empty();
	if($("#chkInform").val()=="사용할 수 있는 아이디 입니다."){
		ischkid=true;
		if(isprivacy==true&&check == 0){
			$("#submitBtn").attr("disabled",false);
		} else {
			$("#submitBtn").attr("disabled",true);
		}
	} else {
		ischkid=false;
	}
};

$("#maker").blur(function(event){ //중복확인 하지 않았을때 submit 비활성화
	if($("#warning").text()==""||$("#warning").text()==null){
		$("#warning").append(warning);
		ischkid=false;
		check = 2;
		console.log(check);
		
		if(isprivacy==true&&check == 0){
			$("#submitBtn").attr("disabled",false);
		} else {
			$("#submitBtn").attr("disabled",true);
		}
	}
});

function idChk(msg){ //중복확인 결과 텍스트 생성
	if(msg=='no'){
		$("#chkInform").val("사용할 수 있는 아이디 입니다.");
		check = 0;
		console.log(check);
	} else {
		$("#chkInform").val(msg+"는 사용할 수 없는 아이디 입니다.");
		$("#maker").val("");
	}
}
