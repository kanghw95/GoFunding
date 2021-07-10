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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script>
	

	
	function deleteUser(){
		console.log("delete 함수 들어옴");
		
		var userId = $("#userId").val();
		console.log("input hidden 이용 userId: " + userId);
		
	}



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
			<input type="hidden" id="userId" name="userId" value="${user.userId }">
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
			         	안전한 회원탈퇴 절차를 위하여 본인 인증 절차를 거치고 있습니다.
			         	회원가입 시 입력한 휴대폰 번호를 입력 후 인증절차를 진행해주세요.
			         	<label for="phone">Phone Number</label>
			         	<input type="text" class="phoneNumber" name="phone" id="phone">
			       </div>
			        
			        <!-- Modal footer -->
			       <div class="modal-footer">
			         <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
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