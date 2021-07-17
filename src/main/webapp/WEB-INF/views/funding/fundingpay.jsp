
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
</head>
<link href="<%=request.getContextPath() %>/resources/css/funding/fundingpay/fundingpay.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link href="<%=request.getContextPath() %>/resources/css/sweetalert2.css" rel="stylesheet" type="text/css" />
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="wrapper">
	<div role="main" id="content" class="content">
		<form action="fundingresult" method="POST" id="fundingpayresult">
			<c:forEach var="reward" items="${reward}" varStatus="status">
					<c:if test="${reward ne ''}">
						<input type="hidden" name="reward" value="${reward}">
						<input type="hidden" name="rewardEA" value="${rewordEA[status.index]}">
						<input type="hidden" name="rewardPrice" value="${price[status.index]}">
					</c:if>
			</c:forEach>

			<c:if test="${cheer_pay ne ''}">
					<input type="hidden" name="cheer" value="${cheer_pay}">
					<input type="hidden" name="cheerEA" value="${cheer_pay_EA}">
					<input type="hidden" name="cheerPrice" value="${cheer_pay_price}">
			</c:if>
			
			<input type="hidden" name="totalPrice" value="${funding_pay_price+funding.deliverycharge}">
			<input type="hidden" name="userId" value="${sessionScope.user.userId}">
			<input type="hidden" id="userAddr" name="userAddr" value="${sessionScope.user.userAddress}">
			<input type="hidden" name="fundingno" value="${funding.fundingno}">
			<input type="hidden" id="paycat" name="paycat" value="">
			<input type="hidden" id="payname" name="name" value="${sessionScope.user.userName}">
			<input type="hidden" id="tel_head" name=tel_head value="${sessionScope.user.userPhone}">
			<input type="hidden" id="message" name=message value="">
		</form>
		
		<div>
			<div class="FundingDetailApplicationContent_wrap">
				<section class="FundingDetailApplicationContent_section_title">
					<a href="detail?no=${funding.fundingno}">
						<h2 class="FundingDetailApplicationContent_title">${funding.fundingtitle}</h2>
					</a>
						<span class="FundingDetailApplicationContent_funder">${funding.maker}</span>
				</section>
				<section class="FundingDetailApplicationContent_section">
					<h3 class="FundingDetailApplicationContent_subtitle">펀딩내역</h3>
					<ul class="FundingDetailApplicationContent_list_order">
						<c:forEach var="reward" items="${reward}" varStatus="status">
							<c:if test="${reward ne ''}">
								<li class="FundingDetailApplicationContent_item">
									<strong class="FundingDetailApplicationContent_name">${reward}</strong>
									<span class="FundingDetailApplicationContent_count">
										<em class="FundingDetailApplicationContent_number">${rewordEA[status.index]}</em>개</span>
										<span class="FundingDetailApplicationContent_amount">
											<em class="FundingDetailApplicationContent_number"><fmt:formatNumber value="${price[status.index]}" pattern="#,###,###"/></em>원</span>
								</li>
							</c:if>

						</c:forEach>
							<c:if test="${cheer_pay ne ''}">
								<li class="FundingDetailApplicationContent_item">
									<strong class="FundingDetailApplicationContent_name">${cheer_pay}</strong>
									<span class="FundingDetailApplicationContent_count">
										<em class="FundingDetailApplicationContent_number">${cheer_pay_EA}</em>개</span>
										<span class="FundingDetailApplicationContent_amount">
											<em class="FundingDetailApplicationContent_number"><fmt:formatNumber value="${cheer_pay_price}" pattern="#,###,###"/></em>원</span>
								</li>
							</c:if>
							<li class="FundingDetailApplicationContent_item_addition">
								<strong class="FundingDetailApplicationContent_name">배송비
								<fmt:formatDate value="${funding.deliverydate}" type="DATE" var="deliverydate" pattern="yyyy년 MM월 dd일"/> 
									<span class="FundingDetailApplicationContent_date">${deliverydate} 발송 예정</span>
								</strong>
								<span class="FundingDetailApplicationContent_amount">
									<c:if test="${deliverycharge eq 0}">
										<em class="FundingDetailApplicationContent_number">무료</em></span>
									</c:if>
									<c:if test="${deliverycharge ne 0}">
										<em class="FundingDetailApplicationContent_number"></em>${funding.deliverycharge}원</span>
									</c:if>	
										
							</li>
					</ul>
					<fmt:parseDate value="${funding.fundingfin}" var="paymentday" pattern="yyyy-MM-dd HH:mm:ss"/> 
					<div class="FundingDetailApplicationContent_total">
						<strong class="FundingDetailApplicationContent_item">총<span class="FundingDetailApplicationContent_count">
							<span class="FundingDetailApplicationContent_number">${funding_pay_rewordEA}</span>개</span>
						</strong>
						<strong class="FundingDetailApplicationContent_item">총<span class="FundingDetailApplicationContent_amount">
							<span class="FundingDetailApplicationContent_number"><fmt:formatNumber value="${funding_pay_price+funding.deliverycharge}" pattern="#,###,###"/></span>원</span>
						</strong>
					</div>
				</section>
				<section class="FundingDetailApplicationContent_section">
					<h3 class="FundingDetailApplicationContent_subtitle">배송지 정보</h3>
					<div class="FundingDetailApplicationContent_address">
						<div class="FundingDetailApplicationContent_radio">
							<input type="radio" name="address" id="wa_default_address" aria-controls="wa_default_address_box" class="FundingDetailApplicationContent_input_type" value="PRIMARY_SHIPPING" checked="">
								<label for="wa_default_address"ㅠ class="FundingDetailApplicationContent_label_type">기본배송지</label>
							<input type="radio" name="address" id="wa_new_address" class="FundingDetailApplicationContent_input_type" value="DIRECT_INPUT">
								<label for="wa_new_address" class="FundingDetailApplicationContent_label_type">직접입력</label>
						</div>
						<dl class="FundingDetailApplicationContent_list_basic" id="wa_default_address_box" aria-hidden="false"
							aria-labelledby="wa_default_address">
							<div class="FundingDetailApplicationContent_item">
								<dt class="FundingDetailApplicationContent_title">이름</dt>
								<dd class="FundingDetailApplicationContent_description">${sessionScope.user.userName}</dd>
							</div>
							<div class="FundingDetailApplicationContent_item">
								<dt class="FundingDetailApplicationContent_title">연락처</dt>
								<dd class="FundingDetailApplicationContent_description">${sessionScope.user.userPhone}</dd>
							</div>
							<div class="FundingDetailApplicationContent_item">
								<dt class="FundingDetailApplicationContent_title">주소</dt>
								<dd class="FundingDetailApplicationContent_description">${sessionScope.user.userAddress}</dd>
							</div>
						</dl>
						<div class="FundingDetailApplicationContent_list_input" id="wa_new_address_box" aria-hidden="true" aria-labelledby="wa_new_address">
							<div class="FundingDetailApplicationContent_item">
								<label for="input_name" class="FundingDetailApplicationContent_label">이름</label>
									<input type="text" id="input_name" class="FundingDetailApplicationContent_input_text">
							</div>
							<div class="FundingDetailApplicationContent_item">
								<label for="input_tel_head" class="FundingDetailApplicationContent_label">연락처</label>
									<input type="text" id="input_tel_head" class="FundingDetailApplicationContent_input_text" value="">
							</div>
							<div class="FundingDetailApplicationContent_item">
								<label for="input_zipcode"
									class="FundingDetailApplicationContent_label">주소</label>
								<div class="FundingDetailApplicationContent_zipcode">
									<input type="text" id="input_zipcode" class="FundingDetailApplicationContent_input_zipcode" readonly="" value="">
									<button type="button" onclick="sample6_execDaumPostcode()" class="FundingDetailApplicationContent_button_zipcode__1rDcO">주소검색</button>
								</div>
								<input type="text" id="input_address1" class="FundingDetailApplicationContent_input_address" readonly="" value="">
								<input type="text" id="input_address2" class="FundingDetailApplicationContent_input_address" placeholder="상세주소 입력" value="">
								<div class="FundingDetailApplicationContent_checkline">
									<input type="checkbox" id="input_check" aria-hidden="false"
										class="FundingDetailApplicationContent_input_checkline">
										<label for="input_check" class="FundingDetailApplicationContent_label_checkline">
										</label>
								</div>
							</div>
						</div>
						<div class="FundingDetailApplicationContent_item FundingDetailApplicationContent_message">
							<label for="input_message" class="FundingDetailApplicationContent_label">배송 메시지</label>
							<textarea id="input_message" class="FundingDetailApplicationContent_textarea"></textarea>
						</div>
					</div>
				</section>
				<p class="FundingDetailApplicationContent_guide">* 결제/배송 메일은 펀딩 신청자의 메일로 발송됩니다. 배송관련 SMS는 배송지에 입력한 전화번호로 발송됩니다.</p>
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
				<div style="text-align: center;">
					<button style="margin-right: 50px;" type="button" id="FundingDetailApplicationContent_button_join_card" class="FundingDetailApplicationContent_button_join__E6XFt">펀딩 참여하기<br>(카드결제)</button>
					<button type="button" id="FundingDetailApplicationContent_button_join_bank" class="FundingDetailApplicationContent_button_join__E6XFt">펀딩 참여하기<br>(계좌이체)</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	<script>
	var reward = null 
	var payresult = document.getElementById("fundingpayresult"); 
	var paycat = document.getElementById("paycat"); 
	
	var input_name = document.getElementById("input_name"); 
	var payname = document.getElementById("payname"); 
	
	var input_tel_head = document.getElementById("input_tel_head"); 
	var tel_head = document.getElementById("tel_head"); 
	
	var input_message = document.getElementById("input_message"); 
	var message = document.getElementById("message"); 
	
	var userAddr = document.getElementById("userAddr");
	var zipcode = document.getElementById("input_zipcode");
	var input_address1 = document.getElementById("input_address1"); 
	var input_address2 = document.getElementById("input_address2"); 
	
	var address_check = 0;
	
	// 휴대전화 정규식
	var phoneReg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	
	//배송지 직접입력 
	var dafault_address_btn = document.getElementById("wa_default_address");
	var new_address_btn = document.getElementById("wa_new_address");

	var dafault_address = document.getElementById("wa_default_address_box");
	var new_address = document.getElementById("wa_new_address_box");
	
	new_address_btn.addEventListener("click",function(){ // 배송지 추가
		address_check = 1;
		if(new_address.getAttribute("aria-hidden") == "true"){
			new_address.setAttribute("aria-hidden","false");
			dafault_address.setAttribute("aria-hidden","true");
		}
	});
	dafault_address_btn.addEventListener("click",function(){ // 기본 배송지
		address_check = 0;
		if(dafault_address.getAttribute("aria-hidden") == "true"){
			dafault_address.setAttribute("aria-hidden","false");
			new_address.setAttribute("aria-hidden","true");
		}
	});
	
	// 주소 배송지 목록 추가
	var input_check = document.getElementById("input_check");
	var new_address_input = document.getElementById("new_address_input");
	
	input_check.addEventListener("click",function(){ 
		
		if(input_check.getAttribute("aria-hidden") == "false"){
			input_check.setAttribute("aria-hidden","true");
			new_address_input.style = "background-color : #1f9eff";
		}else{
			input_check.setAttribute("aria-hidden","false");
			new_address_input.style = "background-color : none";
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
	

	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp28987277'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	function requestPay() {

	    // IMP.request_pay(param, callback) 호출
	    IMP.request_pay({ // param
	        pg: "html5_inicis",
	        pay_method: "card",
	        merchant_uid: 'merchant_' + new Date().getFullYear()+(new Date().getMonth()+1)+ new Date().getDate() + new Date().getHours() + new Date().getMinutes() + new Date().getSeconds(),
	        name: reward,
	        amount: "${funding_pay_price+funding.deliverycharge}",
	        buyer_email: "${sessionScope.user.userEmail}",
	        buyer_name: "${sessionScope.user.userName}",
	        buyer_tel: "${sessionScope.user.userPhone}",
	        buyer_addr: "${sessionScope.user.userAddress}",
	        buyer_postcode: "01181"
	    }, function (rsp) { // callback
	   		 	console.log(rsp);
	        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	            // jQuery로 HTTP 요청
	           $.ajax({
	        	type : "POST",
	        	url : "<%=request.getContextPath()%>/verifyIamport/" + rsp.imp_uid,
	        }).done(function(data) {
		            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		            
		           	if(rsp.paid_amount == data.response.amount){
			           	 var msg = '결제가 완료되었습니다.';
			             msg += '\n고유ID : ' + rsp.imp_uid;
			             msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			             msg += '\결제 금액 : ' + rsp.paid_amount;
			             msg += '카드 승인번호 : ' + rsp.apply_num;
			             console.log(data);
			             console.log(msg);
			           	Swal.fire({
			           	  icon: 'success',
			           	  title: '결제 성공!',
			           	  text: '주문 결과 페이지로 이동합니다',
			           	})
		           	 	
			           	paycat.value = "카드 간편";
			           	message.value = input_message.value;
			           	
			          	if(input_name.value != ''){
			          		payname.value = input_name.value;
			          	 	tel_head.value = input_tel_head.value;
			           	}
			          	if(input_address1.value != ''){
			          		userAddr.value = zipcode.value + input_address1.value + input_address2.value;
			            }
			       
			           	payresult.submit();
			           	
		        	} else {
			           	Swal.fire({
				           	  icon: 'error',
				           	  title: '결제 실패!',
				           	  text: '결제 과정에서 오류가 발생했습니다.',
				           	})
		        	}
		           	
		           })
		          }else{
			          console.log(rsp.error_msg);
			           	Swal.fire({
				           	  icon: 'error',
				           	  title: '결제 실패!',
				           	  text: '결제 과정에서 오류가 발생했습니다.' +  rsp.error_msg,
				           	})
	          }
		     });
	  }
	
	function requestBankPay() {
		 // IMP.request_pay(param, callback) 호출
	    IMP.request_pay({ // param
	        pg: "html5_inicis",
	        pay_method: "vbank",
	        merchant_uid: 'merchant_' + new Date().getFullYear()+(new Date().getMonth()+1)+ new Date().getDate() + new Date().getHours() + new Date().getMinutes() + new Date().getSeconds(),
	        name: reward,
	        amount: "${funding_pay_price+funding.deliverycharge}",
	        buyer_email: "${sessionScope.user.userEmail}",
	        buyer_name: "${sessionScope.user.userName}",
	        buyer_tel: "${sessionScope.user.userPhone}",
	        buyer_addr: "${sessionScope.user.userAddress}",
	        buyer_postcode: "01181"
	    }, function (rsp) { // callback
	   		 	console.log(rsp);
	        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	            // jQuery로 HTTP 요청
	           $.ajax({
	        	type : "POST",
	        	url : "<%=request.getContextPath()%>/verifyIamport/" + rsp.imp_uid,
	        }).done(function(data) {
		            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		            
		           	if(rsp.paid_amount == data.response.amount){
		           	 var msg = '결제가 완료되었습니다.';
		             msg += '\n고유ID : ' + rsp.imp_uid;
		             msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		             msg += '\결제 금액 : ' + rsp.paid_amount;
		             msg += '카드 승인번호 : ' + rsp.apply_num;
		             console.log(data);
		             console.log(msg);
		             Swal.fire({
			           	  icon: 'success',
			           	  title: '결제 성공!',
			           	  text: '주문 결과 페이지로 이동합니다',
			           	})
		           	 
		           	paycat.value = "계좌 이체";
		           	message.value = input_message.value;

		           	
		          	if(input_name.value != ''){
		          		payname.value = input_name.value;
		          	 	tel_head.value = input_tel_head.value;
		           	}
		          	if(input_address1.value != ''){
		          		userAddr.value = zipcode.value + input_address1.value + input_address2.value;
		            }
		           	
		           	payresult.submit();
		           	
		        	} else {
			           	Swal.fire({
				           	  icon: 'error',
				           	  title: '결제 실패!',
				           	  text: '결제 과정에서 오류가 발생했습니다.',
				           	})
		        	}
		           	
		           })
		          }else{
			          console.log(rsp.error_msg);
			           	Swal.fire({
				           	  icon: 'error',
				           	  title: '결제 실패!',
				           	  text: '결제 과정에서 오류가 발생했습니다.' +  rsp.error_msg,
				           	})
	          }
		     });
	  }

	// 펀딩 참여하기 체크리스트 검사
	var join_btn_bank = document.getElementById("FundingDetailApplicationContent_button_join_bank"); 
	join_btn_bank.addEventListener("click",function(){
		for(var i = 1; i<4; i++){
			var check_i = document.getElementById("agree_terms_"+i); 
				if(check_i.checked != true){
		           	Swal.fire({
			           	  icon: 'warning',
			           	  text: '필수 약관에 동의해주세요!',
			           	})
					return;
				}
			}
		<c:set var="doneLoop" value="false"/>
			<c:forEach items="${reward}" var="reward" varStatus = "status">
				<c:if test="${not doneLoop}">
						<c:if test = "${reward ne '' && reward ne null}">
							<c:set var="doneLoop" value="true"/>
								reward = "${reward}";
						</c:if>
				</c:if>
		</c:forEach>
		if(address_check == 1){
			if(input_name.value == '' || input_name.value == null){
				Swal.fire({
			          icon: 'info',
			          text: '이름을 입력해주세요!',
			         })
				$("#input_name").focus();
				return false;
			}
			
			if(input_tel_head.value == '' || input_tel_head.value == null){
				Swal.fire({
			          icon: 'info',
			          text: '번호를 입력해주세요!',
			         })
				$("#input_tel_head").focus();
				return false;
			}
			if (!phoneReg.test(input_tel_head.value)) {
				Swal.fire({
			          icon: 'warning',
			          text: '전화번호의 형식이 올바르지 않습니다!',
			         })
				$("#input_tel_head").focus();
				return false;
			}
			
			if(zipcode.value == '' || zipcode.value == null){
				Swal.fire({
			          icon: 'info',
			          text: '주소를 입력해주세요!',
			         })
				$("#input_zipcode").focus();
				return false;
			}
		}
		
		requestBankPay();
});
	
	var join_btn_card =  document.getElementById("FundingDetailApplicationContent_button_join_card"); 
	join_btn_card.addEventListener("click",function(){
		for(var i = 1; i<4; i++){
			var check_i = document.getElementById("agree_terms_"+i); 
				if(check_i.checked != true){
		           	Swal.fire({
			           	  icon: 'warning',
			           	  text: '필수 약관에 동의해주세요!',
			           	})
					return;
				}
			}

		<c:set var="doneLoop" value="false"/>
			<c:forEach items="${reward}" var="reward" varStatus = "status">
				<c:if test="${not doneLoop}">
						<c:if test = "${reward ne '' && reward ne null}">
							<c:set var="doneLoop" value="true"/>
								reward = "${reward}";
						</c:if>
				</c:if>
		</c:forEach>
		
		if(address_check == 1){
			if(input_name.value == '' || input_name.value == null){
				Swal.fire({
			          icon: 'info',
			          text: '이름을 입력해주세요!',
			         })
				$("#input_name").focus();
				return false;
			}
			
			if(input_tel_head.value == '' || input_tel_head.value == null){
				Swal.fire({
			          icon: 'info',
			          text: '번호를 입력해주세요!',
			         })
				$("#input_tel_head").focus();
				return false;
			}
			if (!phoneReg.test(input_tel_head.value)) {
				Swal.fire({
			          icon: 'warning',
			          text: '전화번호의 형식이 올바르지 않습니다!',
			         })
				$("#input_tel_head").focus();
				return false;
			}
			
			if(zipcode.value == '' || zipcode.value == null){
				Swal.fire({
			          icon: 'info',
			          text: '주소를 입력해주세요!',
			         })
				$("#input_zipcode").focus();
				return false;
			}
		}
		
		requestPay();
		
});
	
	
	
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
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
							document.getElementById("input_address1").value = addr;
							document.getElementById("input_address1").value += extraAddr
						}

					} else {
						document.getElementById("input_address2").value = '';
					}
					document.getElementById('input_zipcode').value = data.zonecode;
					document.getElementById("input_address2").focus();
				}
			}).open();
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function numberDeleteCommas(x) {
    return x.toString().replace(",", "");
}

</script>

</body>
</html>