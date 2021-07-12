<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/common.css" rel="stylesheet" type="text/css" />
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

$(document).ready(function() {

// 주소 하나로 합치기 
	var mergeAddr = function(){
		if($("#sample6_postcode").val() == ""){
			Swal.fire({
				icon: 'error',
				title: '주소 오류',
				text: '주소를 다시 검색해주세요'
			})
		}else{
			$("#address").val( $("#sample6_postcode").val() + "," 
					+ $("#sample6_address").val() + "," 
					+ $("#sample6_detailAddress").val() + "," 
					+ $("#sample6_extraAddress").val());
		
		}
}
	
	
	$("#merge").on('click', mergeAddr);
	$('#merge').on('click', function(){
		var userAddress = $("#address").val();
		console.log(userAddress);
		
		$.ajax({
			url: "modifyaddr",
			type: "POST",
			data: {"userAddress" : userAddress },
			
			success: function(data){
				console.log(data);
				console.log("정보수정 성공성공");
				Swal.fire(
						'수정 성공!',
						'주소가 정상적으로 수정되었습니다',
						'success'
					);
				$("#currentAddr").val(userAddress);					
			},
			error: function(data){
				Swal.fire({
					icon: 'error',
					title: '주소 오류',
					text: '주소 수정에 실패했습니다'
				})
			}
		})
	
	
	});
	
	
});

</script>
</head>
<body>
<div class="wrapper">
	<div class="joinContainer">
		
		<h3>주소 수정하기</h3>
		<h4>현재 주소</h4>
		<input type="text" id="currentAddr" value="${user.userAddress }" style="border: none;">

		<form id="addrCheck">	
			<input type="text" class="inputPost" id="sample6_postcode" name="postcode" readonly  placeholder="우편번호">
			<input type="button" class="insideBtn" onclick="sample6_execDaumPostcode()" value="주소 검색" >
			<input type="text" class="inputBox" id="sample6_address" name="address1" readonly  placeholder="주소">
			<input type="text" class="inputBox" id="sample6_detailAddress" name="address2"  placeholder="상세주소">
			<input type="text" class="inputBox" id="sample6_extraAddress" name="address3" readonly  placeholder="참고항목">
			<input type="hidden" id="address" name="userAddress" >
				
			<input type="button" id="merge" class="insideBtn" value="수정하기">
		</form>
	</div>
</div>
</body>
</html>