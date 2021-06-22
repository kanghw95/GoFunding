
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
<body>
	<div role="main" id="content" class="content">
		<div>
			<div class="FundingDetailApplicationContent_wrap__3lh7-">
				<section
					class="FundingDetailApplicationContent_section_title__6xAZn">
					<a href="/fundings/detail/F169"><h2
							class="FundingDetailApplicationContent_title__2BYvK">${funding.fundingtitle}</h2></a><span
						class="FundingDetailApplicationContent_funder__1eTbL">${funding.maker}</span>
				</section>
				<section class="FundingDetailApplicationContent_section__gfh97">
					<h3 class="FundingDetailApplicationContent_subtitle__mdStj">펀딩내역</h3>
					<ul class="FundingDetailApplicationContent_list_order__20w1j">
						<li class="FundingDetailApplicationContent_item__3hhAd"><strong
							class="FundingDetailApplicationContent_name__28fMG">선택 리워드 내용 표시</strong><span
							class="FundingDetailApplicationContent_count__IZBVx"><em
								class="FundingDetailApplicationContent_number__2kFus">선택 리워드 갯수 표시</em>개</span><span
							class="FundingDetailApplicationContent_amount__aTe92"><em
								class="FundingDetailApplicationContent_number__2kFus">선택 리워드 금액 표시</em>원</span></li>
						<li class="FundingDetailApplicationContent_item_addition__EPV2y"><strong
							class="FundingDetailApplicationContent_name__28fMG">배송비<span
								class="FundingDetailApplicationContent_date__3KleL">선택 리워드 발송 날짜</span></strong><span
							class="FundingDetailApplicationContent_amount__aTe92"><em
								class="FundingDetailApplicationContent_number__2kFus">배송비</em>원</span></li>
					</ul>
					<div class="FundingDetailApplicationContent_total__1pwx-">
						<strong class="FundingDetailApplicationContent_date__3KleL">2021.06.29결제 예정</strong>
						<strong class="FundingDetailApplicationContent_item__3hhAd">총<span class="FundingDetailApplicationContent_count__IZBVx"><span
								class="FundingDetailApplicationContent_number__2kFus">${funding_pay_rewordEA}</span>개</span></strong><strong
							class="FundingDetailApplicationContent_item__3hhAd">총<span
							class="FundingDetailApplicationContent_amount__aTe92"><span
								class="FundingDetailApplicationContent_number__2kFus">${funding_pay_price}</span>원</span></strong>
					</div>
				</section>
				<section class="FundingDetailApplicationContent_section__gfh97">
					<h3 class="FundingDetailApplicationContent_subtitle__mdStj">배송지
						정보</h3>
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
						<dl class="FundingDetailApplicationContent_list_basic__F5tPH"
							id="wa_default_address_box" aria-hidden="false"
							aria-labelledby="wa_default_address">
							<div class="FundingDetailApplicationContent_item__3hhAd">
								<dt class="FundingDetailApplicationContent_title__2BYvK">이름</dt>
								<dd class="FundingDetailApplicationContent_description__2wk3i">강현우</dd>
							</div>
							<div class="FundingDetailApplicationContent_item__3hhAd">
								<dt class="FundingDetailApplicationContent_title__2BYvK">연락처</dt>
								<dd class="FundingDetailApplicationContent_description__2wk3i">010-4514-1635</dd>
							</div>
							<div class="FundingDetailApplicationContent_item__3hhAd">
								<dt class="FundingDetailApplicationContent_title__2BYvK">주소</dt>
								<dd class="FundingDetailApplicationContent_description__2wk3i">(우)14696
									경기도 부천시 범안로22번길 52 (괴안동) 우성팰리스 503호</dd>
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
									class="FundingDetailApplicationContent_label__3WPCE">연락처</label><input
									type="text" id="input_tel_head"
									class="FundingDetailApplicationContent_input_text__1vbSp"
									value="010"><span
									class="FundingDetailApplicationContent_bar__1O-Fk"></span><input
									type="text" id="input_tel_body"
									class="FundingDetailApplicationContent_input_text__1vbSp"
									value="4514"><span
									class="FundingDetailApplicationContent_bar__1O-Fk"></span><input
									type="text" id="input_tel_tail"
									class="FundingDetailApplicationContent_input_text__1vbSp"
									value="1635">
							</div>
							<div class="FundingDetailApplicationContent_item__3hhAd">
								<label for="input_zipcode"
									class="FundingDetailApplicationContent_label__3WPCE">주소</label>
								<div class="FundingDetailApplicationContent_zipcode__2Jdu9">
									<input type="zipcode" id="input_zipcode"
										class="FundingDetailApplicationContent_input_zipcode__3rEpT"
										readonly="" value="14696">
									<button type="button_zipcode"
										class="FundingDetailApplicationContent_button_zipcode__1rDcO">주소검색</button>
								</div>
								<input type="text" id="input_address1"
									class="FundingDetailApplicationContent_input_address__IFygD"
									readonly="" value="경기도 부천시 범안로22번길 52 (괴안동)"><input
									type="text" id="input_address2"
									class="FundingDetailApplicationContent_input_address__IFygD"
									placeholder="상세주소 입력" readonly="" value="우성팰리스 503호">
								<div class="FundingDetailApplicationContent_checkline__-E-HP">
									<input type="checkbox" id="input_check"
										class="FundingDetailApplicationContent_input_checkline__2MGj1"><label
										for="input_check"
										class="FundingDetailApplicationContent_label_checkline__1lw6z"><span
										class="FundingDetailApplicationContent_icon__3inag"></span>입력한
										주소를 배송지 목록에 추가</label>
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
								<input id="agree_terms_all" type="checkbox"
									class="FundingDetailApplicationContent_input__1Q10H"><label
									for="agree_terms_all"
									class="FundingDetailApplicationContent_label__3WPCE"><span
									class="FundingDetailApplicationContent_icon__3inag"></span>약관 및
									개인정보 관련 사항(선택 동의 포함)에 모두 동의합니다.</label>
							</div>
						</div>
						<div class="FundingDetailApplicationContent_group__292es">
							<div class="FundingDetailApplicationContent_checkbox__1z5rX">
								<input id="agree_terms_1" type="checkbox"
									class="FundingDetailApplicationContent_input__1Q10H"><label
									for="agree_terms_1"
									class="FundingDetailApplicationContent_label__3WPCE"><span
									class="FundingDetailApplicationContent_icon__3inag"></span>(필수)
									개인정보의 수집 및 이용에 동의합니다.</label><a href="#"
									class="FundingDetailApplicationContent_link__2JXht">자세히 보기</a>
							</div>
							<div class="FundingDetailApplicationContent_checkbox__1z5rX">
								<input id="agree_terms_2" type="checkbox"
									class="FundingDetailApplicationContent_input__1Q10H"><label
									for="agree_terms_2"
									class="FundingDetailApplicationContent_label__3WPCE"><span
									class="FundingDetailApplicationContent_icon__3inag"></span>(필수)
									개인정보의 제3자 제공에 동의합니다.</label><a href="#"
									class="FundingDetailApplicationContent_link__2JXht">자세히 보기</a>
							</div>
							<div class="FundingDetailApplicationContent_checkbox__1z5rX">
								<input id="agree_terms_3" type="checkbox"
									class="FundingDetailApplicationContent_input__1Q10H"><label
									for="agree_terms_3"
									class="FundingDetailApplicationContent_label__3WPCE"><span
									class="FundingDetailApplicationContent_icon__3inag"></span>(필수)
									‘해피빈 펀딩 약관’에 동의합니다.</label><a href="#"
									class="FundingDetailApplicationContent_link__2JXht">자세히 보기</a>
							</div>
							<div class="FundingDetailApplicationContent_checkbox__1z5rX">
								<input id="agree_terms_4" type="checkbox"
									class="FundingDetailApplicationContent_input__1Q10H"><label
									for="agree_terms_4"
									class="FundingDetailApplicationContent_label__3WPCE"><span
									class="FundingDetailApplicationContent_icon__3inag"></span>(선택)
									해피빈 마케팅 알림 수신에 동의합니다.</label>
							</div>
						</div>
					</div>
				</section>
				<button type="submit"
					class="FundingDetailApplicationContent_button_join__E6XFt">펀딩
					참여하기</button>
			</div>
		</div>
	</div>
</body>
</html>