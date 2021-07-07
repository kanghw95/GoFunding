<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer>
<div class="footerWrapper">
	<div class="companyWrapper">
		<span class="footerLogo">SPROUT!</span>
		<div class="footer-cont company">
				<em>㈜GoFunding</em>
				<p class="innerContent"><b>만든이</b> 강현우, 권순찬, 김혜인, 박준태, 하도경</p>
				<p class="innerContent"><b>주소지</b> 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F</p>
				<p class="copyright">Copyright&copy; GoFunding All Right Reserved</p>
		</div>
	</div>
		<div class="footer-cont cs">
				<p class="innerContent sendMsg"><b id="loginId" onclick="userAdminMsg();">1:1 상담신청 </b>&#x2709;</p>
				<p class="innerContent">관리자에게로의 문의는 1:1 상담을 이용해주세요.</p>
				<input type="hidden" id="loginId" value="${user.userId}">
		</div>
	
</div>
<script>
function userAdminMsg() {
	var receiverId = $("#loginId").val();
	console.log(receiverId);
	if(receiverId==""){
		alert('로그인해주세요.');
	} else if(receiverId!="") {
	var pop = window.open("about:blank","content");
		pop.location.href="http://localhost:8090/sprout/message/msgAdminRead?receiverId="+receiverId;
}
};
</script>	
</footer>
