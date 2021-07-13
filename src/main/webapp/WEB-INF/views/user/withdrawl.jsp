<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/user/withdrawl.css" rel="stylesheet" type="text/css" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
  
  
  
<script>
$(document).ready(function () {
	//휴대폰 번호 인증
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
	
	$("#withdrawal").on("click", function(){
		
		if(certifyPhoneNumber){
			console.log("핸드폰 인증"+ certifyPhoneNumber)
			
			$.ajax({
				url : "drawlUser",
				type : "POST",
				
				success : function(data) {
					console.log("success 진입");
					console.log(data);
					location.href = "<%=request.getContextPath() %>/user/logout";
				},
				error : function(error) {
					console.log("error 발생");
				}
			
				})
			}else{
				Swal.fire({
					icon: 'error',
					title: '본인 인증 실패',
					text: '데이터를 다시 입력해주세요'
				
			})
			}
	});
});	


</script>

</head>
<body>
<%@include file="/WEB-INF/views/header.jsp"%>
<div class="wrapper">
	<div class="withdrawlContainer">
		<h2 class="withdrawlTitle">SPROUT! 새싹나눔 회원탈퇴</h2>
		<div class="withdrawlReason">
			<div>다음 중 불편했던 점이 있으신가요? </div>
			<br>
			<select name="reason" class="reason">
				<option value="1">이용이 불편하다</option>
				<option value="2">사용빈도가 낮다</option>
				<option value="3">타 사이트를 더 자주 이용한다</option>
				<option value="4">개인정보 기록을 삭제하고 싶다</option>
				<option value="5">콘텐츠가 마음에 들지 않는다</option>
			</select>
		</div>
		<div class="caution">
			<h3 style="margin-bottom: 5px;">탈퇴하기 전, 다음 사항들을 꼭 확인하세요!</h3>
			<span style="color:red; font-size: 14px;">참여 혹은 진행 중인 펀딩이 있을 경우, 종료 전까지 탈퇴는 불가합니다.</span>
			
			<ul>
				<li>
					<span><b>30일 이내 재가입 불가</b>
					<br>
					탈퇴 후 동일 아이디로는 30일 이내 재가입은 불가합니다. </span>
				</li>
				<li>
					<span><b>회원 혜택 수령 불가 </b>
					<br>
					탈퇴 시 지금까지 획득하신 포인트는 전부 소멸됩니다.<br>
					재가입 시에도 해당 포인트는 복구되지 않습니다.</span>
				</li>
				<li>
					<span><b>개인정보 관리</b>
					<br>
					탈퇴 시 고객님의 개인 정보는 가입 시 동의하셨던 사이트 약관 및 개인정보보호법에 의거하여 관리됩니다.</span>
				</li>
			</ul>
		</div>
		<div class="btnContainer">
			<button class="withdrawlBtn btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="fas fa-user-times"></i>&nbsp; 회원탈퇴</button>
			<!-- 본인인증 모달 -->
			  <!-- The Modal -->
			 <div class="modal" id="myModal">
			   <div class="modal-dialog">
			     <div class="modal-content">
			      
			        <!-- Modal Header -->
			       <div class="modal-header">
			         <h4 class="modal-title">본인 인증</h4>
			         <button type="button" class="close" data-dismiss="modal">&times;</button>
			       </div>
			        
			        <!-- Modal body -->
			       <div class="modal-body">
			         	안전한 회원탈퇴 절차를 위하여<br> 
			         	본인 인증 절차를 거치고 있습니다.
			         	회원가입 시 입력한 휴대폰 번호를 입력 후<br> 
			         	인증절차를 진행해주세요.
		 				<div class="frmGroup" id="phoneGroup" style="margin-top: 5px; padding-left: 40px;">
							<input type="text" class="phoneNumber" name="phone" id="phone" placeholder="Phone Number" style="margin-bottom: 3px;">
							<input type="button" id="checkPhoneNumber" class="insideBtn" value="번호확인" style="margin-bottom: 3px;"><br>
							<input type="text" id="certification" class="inputPhone" name="certification" placeholder="인증번호">
							<input type="button" id="checkCerNumber" class="insideBtn" value="인증하기">
						</div>
			       </div>
			        
			        <!-- Modal footer -->
			       <div class="modal-footer">
			         <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			         <button type="button" id="withdrawal">탈퇴하기</button>
			       </div>
			        
			     </div>
			   </div>
			 </div>		
		</div>
		
		
	</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>