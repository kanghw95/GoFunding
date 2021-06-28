<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../resources/css/userdetail_join/join.css" rel="stylesheet" type="text/css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	// 아이디 중복 체크
	var idcheck = false;
	
	$(function(){
		$("#idcheck").click(function(){
			console.log("중복확인 클릭~");
			
			var id = $("#id").val();
			
			console.log(id);
			
			if(id == ""){
				alert("아이디를 입력하고 중복확인을 눌러주세요");
				$("#id").focus();
				return;
			}
			
			$.ajax({
				url: "idCheck",
				type: "POST",
				data: id,
				
				dataType : "text",
				success : function(data){
					console.log(data);
					if(data === "사용가능"){
						alert("사용 가능한 아이디입니다");
						idcheck = true;
						
					} else {
						alert("이미 존재하는 아이디입니다. 다른 아이디를 사용해주세요");
						idcheck = false;
						
					}
				},
				error : function(data){
					console.log("ajax는 일단 들어옴 but 실패");
				}
			}) // 아이디 중복 체크 ajax
		}) // 중복 체크 버튼 클릭
		
		// 회원가입 버튼 눌렀을 때
		
		
		
	}) // $function 끝
	
</script>
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
					document.getElementById("sample6_detailAddress")
							.focus();
				}
			}).open();
}
</script>
</head>
<body class="bodyContent">
	<form id="frmJoin">
		<table>
			<tr>
				<td><input type="text" name="id" id="id" placeholder="아이디를 입력해주세요"></td>
				<td><div>
						<span id="idcheck">중복확인</span>
					</div>
					<div>
						<span class="desc"> 4~15자의 영문자, 숫자만 사용 가능합니다.</span>
					</div></td>
				</tr>
				<tr>
					<td><input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요"></td>
					<td><div>
							<span id="nicknamecheck">중복확인</span>
						</div>
						<div>
							<span class="desc"> 1~8자의 한글, 영문자, 숫자만 사용 가능합니다.</span>
						</div></td>
				</tr>
				<tr>
					<td><input type="password" name="password1" id="password1" placeholder="비밀번호를 입력해주세요"></td>
					<td><span class="desc" style="float: left;"> 8~15자의
							영문자, 숫자, <br>특수문자 (!, @, #, $, %, ^, &, *)만 사용 가능합니다.
					</span></td>
				</tr>
				<tr>
					<td><input type="password" name="password2" id="password2" placeholder="비밀번호를 다시 한번 입력해주세요"></td>
					<td><span id="passcheck" style="float: left;"></span></td>
				</tr>
				<tr>
					<td><input type="text" id="sample6_postcode" name="postcode"
						readonly style="margin-bottom: 5px" placeholder="주소 검색을 해주세요"></td>
					<td style="padding-top: 0px; text-align: left;"><input
						type="button" onclick="sample6_execDaumPostcode()" value="주소 검색"
						class="findPostCode"></td>
				</tr>
				<tr>
					<td><input type="text" id="sample6_address" name="address1"
						readonly style="margin-bottom: 5px"></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" id="sample6_detailAddress"
						name="address2" style="margin-bottom: 5px" placeholder="상세주소를 입력해주세요"></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" id="sample6_extraAddress"
						name="address3" readonly style="margin-bottom: 5px"></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="tel" id="tel" placeholder="전화번호를 입력해주세요"></td>
					<td><span class="desc" style="float: left;"> 10~13자의
							숫자만 사용 가능합니다.</span></td>
				</tr>
				<tr>
					<td><input type="text" name="email" id="email" placeholder="이메일을 입력해주세요"></td>
					<td><span class="desc" style="float: left;"> 8~15자의
							영문자, 숫자, @만 사용 가능합니다.</span></td>
				</tr>
			<tr>
				<td style="text-align: center;">
					<div>관심사 <br>
					<label><input type="checkbox" id="interest" name="interest" value="일자리창출">일자리창출</label>
					<label><input type="checkbox" id="interest" name="interest" value="친환경">친환경</label>
					<label><input type="checkbox" id="interest" name="interest" value="작은 가게">작은 가게</label>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<div>
					<label><input type="checkbox" id="interest" name="interest" value="공정무역">공정무역</label>
					<label><input type="checkbox" id="interest" name="interest" value="기부">기부</label>
					<label><input type="checkbox" id="interest" name="interest" value="미디어">미디어</label>
					<label><input type="checkbox" id="interest" name="interest" value="창작자">창작자</label>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align: center;"><input type="button" value="회원가입" class="btnJoin" id="btnJoin"></td>
				<td></td>
			</tr>
		</table>
	</form>
	
	<script>
		$("#btnJoin").on("click", function(){
			var frmdata = $("#frmJoin").serialize();
			console.log(frmdata);
			$.ajax({
				url: "doJoin",
				type: "POST",
				data: frmdata,
				
				success: function(data){
					console.log("성공성공성공~");
					if(data > 0){
						alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
						location.href="login";
					}else {
						console.log(data);
						alert("회원가입이 되지 않았습니다. id, pw를 다시 입력해주세요.")
						$("#id").val("").focus();
					}
				},
				eroor: function(){
					console.log("회원가입 실패")
				}
			})
		})
	
	</script>
</body>
</html>