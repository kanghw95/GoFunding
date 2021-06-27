
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
<link href="<%=request.getContextPath() %>/resources/css/fundingpay/fundingpay.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body>
	<div role="main" id="content" class="content">
		<div>
			<div class="FundingDetailApplicationContent_wrap__3lh7-">
				<section
					class="FundingDetailApplicationContent_section_title__6xAZn">
					<a href="detail?no=${funding.fundingno}"><h2
							class="FundingDetailApplicationContent_title__2BYvK">${funding.fundingtitle}</h2></a><span
						class="FundingDetailApplicationContent_funder__1eTbL">${funding.maker}</span>
				</section>
				<section class="FundingDetailApplicationContent_section__gfh97">
					<h3 class="FundingDetailApplicationContent_subtitle__mdStj">펀딩내역</h3>
					<ul class="FundingDetailApplicationContent_list_order__20w1j">
					<c:forEach var="reward" items="${reward}" varStatus="status">
						<c:if test="${reward ne ''}">
						<li class="FundingDetailApplicationContent_item__3hhAd">
							<strong class="FundingDetailApplicationContent_name__28fMG">${reward}</strong>
							<span class="FundingDetailApplicationContent_count__IZBVx">
								<em class="FundingDetailApplicationContent_number__2kFus">${rewordEA[status.index]}</em>개</span>
								<span class="FundingDetailApplicationContent_amount__aTe92">
									<em class="FundingDetailApplicationContent_number__2kFus">${price[status.index]}</em>원</span>
						</li>
						</c:if>
					</c:forEach>
									<li class="FundingDetailApplicationContent_item_addition__EPV2y">
										<strong class="FundingDetailApplicationContent_name__28fMG">배송비
										<fmt:formatDate value="${funding.deliverydate}" type="DATE" var="deliverydate" pattern="yyyy년 MM월 dd일"/> 
											<span class="FundingDetailApplicationContent_date__3KleL">${deliverydate} 발송 예정</span>
										</strong>
										<span class="FundingDetailApplicationContent_amount__aTe92">
											<c:if test="${deliverycharge eq 0}">
											<em class="FundingDetailApplicationContent_number__2kFus">무료</em></span>
											</c:if>
											<c:if test="${deliverycharge ne 0}">
											<em class="FundingDetailApplicationContent_number__2kFus">배송비</em>${funding.deliverycharge}원</span>
											</c:if>	
										
									</li>
					</ul>
					<fmt:parseDate value="${funding.fundingfin}" var="paymentday" pattern="yyyy-MM-dd HH:mm:ss"/> 
					<div class="FundingDetailApplicationContent_total__1pwx-">
						<strong class="FundingDetailApplicationContent_date__3KleL"><fmt:formatDate value="${paymentday}" pattern="yyyy년 MM월 dd일"/> 결제 예정</strong>
						<strong class="FundingDetailApplicationContent_item__3hhAd">총<span class="FundingDetailApplicationContent_count__IZBVx"><span
								class="FundingDetailApplicationContent_number__2kFus">${funding_pay_rewordEA}</span>개</span></strong><strong
							class="FundingDetailApplicationContent_item__3hhAd">총<span
							class="FundingDetailApplicationContent_amount__aTe92"><span
								class="FundingDetailApplicationContent_number__2kFus">${funding_pay_price}</span>원</span></strong>
					</div>
				</section>
				<section class="FundingDetailApplicationContent_section__gfh97">
					<h3 class="FundingDetailApplicationContent_subtitle__mdStj">배송지 정보</h3>
					<div class="FundingDetailApplicationContent_address__rKPWo">
						<div class="FundingDetailApplicationContent_radio__GXncM">
							<input type="radio" name="address" id="wa_default_address"
								aria-controls="wa_default_address_box"
								class="FundingDetailApplicationContent_input_type__2gqMr"
								value="PRIMARY_SHIPPING" checked=""><label
								for="wa_default_address"
								class="FundingDetailApplicationContent_label_type__1LZJ6">기본배송지</label>
							<button type="button"
								class="FundingDetailApplicationContent_button_list__7AlKd">배송지
								목록</button>
							<input type="radio" name="address" id="wa_new_address"
								class="FundingDetailApplicationContent_input_type__2gqMr"
								value="DIRECT_INPUT"><label for="wa_new_address"
								class="FundingDetailApplicationContent_label_type__1LZJ6">직접입력</label>
						</div>
						<dl class="FundingDetailApplicationContent_list_basic__F5tPH" id="wa_default_address_box" aria-hidden="false"
							aria-labelledby="wa_default_address">
							<div class="FundingDetailApplicationContent_item__3hhAd">
								<dt class="FundingDetailApplicationContent_title__2BYvK">이름</dt>
								<dd class="FundingDetailApplicationContent_description__2wk3i">${sessionScope.user.userName}</dd>
							</div>
							<div class="FundingDetailApplicationContent_item__3hhAd">
								<dt class="FundingDetailApplicationContent_title__2BYvK">연락처</dt>
								<dd class="FundingDetailApplicationContent_description__2wk3i">${sessionScope.user.userPhone}</dd>
							</div>
							<div class="FundingDetailApplicationContent_item__3hhAd">
								<dt class="FundingDetailApplicationContent_title__2BYvK">주소</dt>
								<dd class="FundingDetailApplicationContent_description__2wk3i">${sessionScope.user.userAddress}</dd>
							</div>
						</dl>
						<div class="FundingDetailApplicationContent_list_input__DNaub"
							id="wa_new_address_box" aria-hidden="true"
							aria-labelledby="wa_new_address">
							<div class="FundingDetailApplicationContent_item__3hhAd">
								<label for="input_name"
									class="FundingDetailApplicationContent_label__3WPCE">이름</label><input
									type="text" id="input_name"
									class="FundingDetailApplicationContent_input_text__1vbSp">
							</div>
							<div class="FundingDetailApplicationContent_item__3hhAd">
								<label for="input_tel_head"
									class="FundingDetailApplicationContent_label__3WPCE">연락처</label>
									<input type="text" id="input_tel_head" class="FundingDetailApplicationContent_input_text__1vbSp" value="">
							</div>
							<div class="FundingDetailApplicationContent_item__3hhAd">
								<label for="input_zipcode"
									class="FundingDetailApplicationContent_label__3WPCE">주소</label>
								<div class="FundingDetailApplicationContent_zipcode__2Jdu9">
									<input type="zipcode" id="input_zipcode"
										class="FundingDetailApplicationContent_input_zipcode__3rEpT"
										readonly="" value="">
									<button type="button" onclick="sample6_execDaumPostcode()" class="FundingDetailApplicationContent_button_zipcode__1rDcO">주소검색</button>
								</div>
								<input type="text" id="input_address1"
									class="FundingDetailApplicationContent_input_address__IFygD"
									readonly="" value=""><input
									type="text" id="input_address2"
									class="FundingDetailApplicationContent_input_address__IFygD"
									placeholder="상세주소 입력" readonly="" value="">
								<div class="FundingDetailApplicationContent_checkline__-E-HP">
									<input type="checkbox" id="input_check" aria-hidden="false"
										class="FundingDetailApplicationContent_input_checkline__2MGj1">
										<label for="input_check" class="FundingDetailApplicationContent_label_checkline__1lw6z">
											<span id="new_address_input" class="FundingDetailApplicationContent_icon__3inag"></span>
											입력한 주소를 배송지 목록에 추가
										</label>
								</div>
							</div>
						</div>
						<div
							class="FundingDetailApplicationContent_item__3hhAd FundingDetailApplicationContent_message__3OJBc">
							<label for="input_message"
								class="FundingDetailApplicationContent_label__3WPCE">배송
								메시지</label>
							<textarea id="input_message"
								class="FundingDetailApplicationContent_textarea__1bwF3"></textarea>
						</div>
					</div>
				</section>
				<p class="FundingDetailApplicationContent_guide__3vpdM">* 결제/배송
					알림은 펀딩 신청자의 네이버 아이디로 발송됩니다. 배송관련 SMS는 배송지에 입력한 전화번호로 발송됩니다.</p>
				<section class="FundingDetailApplicationContent_section__gfh97">
					<h3 class="FundingDetailApplicationContent_subtitle__mdStj">약관
						동의</h3>
					<div class="FundingDetailApplicationContent_terms__2Jx3e">
						<div class="FundingDetailApplicationContent_bundle__3ztI-">
							<div
								class="FundingDetailApplicationContent_checkbox__1z5rX undefined">
								<input id="agree_terms_all" type="checkbox" aria-hidden="false" name="all_agree"
									class="FundingDetailApplicationContent_input__1Q10H"><label
									for="agree_terms_all"
									class="FundingDetailApplicationContent_label__3WPCE"><span  id="agree_span0"
									class="FundingDetailApplicationContent_icon__3inag"></span>약관 및
									개인정보 관련 사항(선택 동의 포함)에 모두 동의합니다.</label>
							</div>
						</div>
						<div class="FundingDetailApplicationContent_group__292es">
							<div class="FundingDetailApplicationContent_checkbox__1z5rX">
								<input name="agree" id="agree_terms_1" type="checkbox" class="FundingDetailApplicationContent_input__1Q10H" onclick="checkSelectAll(); checkColorChange(1);">
									<label for="agree_terms_1" class="FundingDetailApplicationContent_label__3WPCE">
										<span id="agree_span1" class="FundingDetailApplicationContent_icon__3inag"></span>(필수) 개인정보의 수집 및 이용에 동의합니다.
									</label>
									<a href="#" class="FundingDetailApplicationContent_link__2JXht">자세히 보기</a>
							</div>
							<div class="FundingDetailApplicationContent_checkbox__1z5rX">
								<input id="agree_terms_2" type="checkbox" name="agree" onclick="checkSelectAll(); checkColorChange(2); "
									class="FundingDetailApplicationContent_input__1Q10H"><label
									for="agree_terms_2"
									class="FundingDetailApplicationContent_label__3WPCE"><span id="agree_span2"
									class="FundingDetailApplicationContent_icon__3inag"></span>(필수)
									개인정보의 제3자 제공에 동의합니다.</label><a href="#"
									class="FundingDetailApplicationContent_link__2JXht">자세히 보기</a>
							</div>
							<div class="FundingDetailApplicationContent_checkbox__1z5rX">
								<input id="agree_terms_3" type="checkbox" name="agree" onclick="checkSelectAll(); checkColorChange(3);"
									class="FundingDetailApplicationContent_input__1Q10H"><label
									for="agree_terms_3"
									class="FundingDetailApplicationContent_label__3WPCE"><span id="agree_span3"
									class="FundingDetailApplicationContent_icon__3inag"></span>(필수)
									‘해피빈 펀딩 약관’에 동의합니다.</label><a href="#"
									class="FundingDetailApplicationContent_link__2JXht">자세히 보기</a>
							</div>
							<div class="FundingDetailApplicationContent_checkbox__1z5rX">
								<input id="agree_terms_4" type="checkbox" name="agree" onclick="checkSelectAll(); checkColorChange(4);"
									class="FundingDetailApplicationContent_input__1Q10H"><label
									for="agree_terms_4"
									class="FundingDetailApplicationContent_label__3WPCE"><span id="agree_span4"
									class="FundingDetailApplicationContent_icon__3inag"></span>(선택)
									해피빈 마케팅 알림 수신에 동의합니다.</label>
							</div>
						</div>
					</div>
				</section>
				<button type="button" class="FundingDetailApplicationContent_button_join__E6XFt" onclick="requestPay()">펀딩 참여하기</button>
			</div>
		</div>
	</div>
	<script>
	//배송지 직접입력 
	var dafault_address_btn = document.getElementById("wa_default_address");
	var new_address_btn = document.getElementById("wa_new_address");

	var dafault_address = document.getElementById("wa_default_address_box");
	var new_address = document.getElementById("wa_new_address_box");
	
	new_address_btn.addEventListener("click",function(){ // 배송지 추가
		
		if(new_address.getAttribute("aria-hidden") == "true"){
			new_address.setAttribute("aria-hidden","false");
			dafault_address.setAttribute("aria-hidden","true");
		}
	});
	dafault_address_btn.addEventListener("click",function(){ // 기본 배송지
		
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
			$(".FundingDetailApplicationContent_icon__3inag").css(
					{'background-color' : '#1f9eff'});

		}else{
			agree_terms_all.setAttribute("aria-hidden","false");
			 $("input:checkbox[name='agree']").prop("checked",false);
			 $(".FundingDetailApplicationContent_icon__3inag").css(
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
	        merchant_uid: "ORD20180131-0000012",
	        name: "${reward[0]}",
	        amount: "${funding_pay_price}",
	        buyer_email: "gildong@gmail.com",
	        buyer_name: "강현우",
	        buyer_tel: "010-4242-4242",
	        buyer_addr: "서울특별시 강남구 신사동",
	        buyer_postcode: "01181"
	    }, function (rsp) { // callback
		    if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
		        // jQuery로 HTTP 요청
		        jQuery.ajax({
		            url: "https://www.myservice.com/payments/complete", // 가맹점 서버
		            method: "POST",
		            headers: { "Content-Type": "application/json" },
		            data: {
		                imp_uid: rsp.imp_uid,
		                merchant_uid: rsp.merchant_uid
		            }
		        }).done(function (data) {
		          // 가맹점 서버 결제 API 성공시 로직
		        })
		      } else {
		        alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
		      }
		    });
	  }
	
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
</body>
</html>