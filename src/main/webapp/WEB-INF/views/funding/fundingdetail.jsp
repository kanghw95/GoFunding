
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link href="<%=request.getContextPath() %>/resources/css/fundingdetail_top/fundingdetail_cover.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/fundingdetail_top/fundingdetail_sumary.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/fundingdetail_top/fundingdetail_profile.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/fundingdetail_top/fundingdetail_chioce.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/fundingdetail_tap.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/fundingdetail_content.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/fundingdetail_reword.css" rel="stylesheet" type="text/css" />
<style type="text/css">

.modal {

   position: absolute;
   overflow: hidden;
   top: 10px;
   right: 10px;
   z-index: 10;
   font-family: '서울남산 장체 L', sans-serif;
   font-size: 12px;
   text-align: center;
   background: white;
   border-radius: 12px;
   border: 3px solid #CFCFCF;
   
}

.modal2 {
   position: absolute;
   overflow: hidden;
   top: 10px;
   right: 70px;	
   z-index: 10;
   height : 54px;
   font-family: '서울남산 장체 L', sans-serif;
   font-size: 12px;
   font-weight : bolder;
   text-align: center;
   background: white;
   padding: 0 7 0 7;
        border-radius: 12px;
        border: 3px solid #CFCFCF;
}

   .modal_wrap{
   		
        display: none;
        width: 300px;
        height: 500px;
        position: absolute;
        top:17%;
        left: 50%;
        margin: -100px 0 0 -100px;
        background:white;
        z-index: 2;
        border-radius: 12px;
        border: 3px solid #CFCFCF;
        
    }
    .black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .modal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -35px;
        right: 0;
    }
    .modal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
</style>

</head>
<script>
window.onload = function()  {
	 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
    document.querySelector('#noagree').addEventListener('click', offClick);
    document.getElementById("FundingDetailSummary_button_join").addEventListener('click', onClick);
    
};

</script>

<body>
	<fmt:parseDate value="${funding.fundingfin}" var="paymentday" pattern="yyyy-MM-dd HH:mm:ss"/> 

	
	<div class="wrap">
		<div role="main" id="content" class="content">
			<div>
				<div class="black_bg"></div>
					 <div class="modal_wrap" style="text-align: center;">
					 펀딩 참여전 확인하세요!
					 <hr>
					 지금 신청하고 있는 펀딩은 <fmt:formatDate value="${paymentday}" pattern="yyyy년 MM월 dd일"/> 일에 실제 결제가 이루어집니다.
					 <hr>
					 펀딩은 쇼핑과 달리 실결제 이후, 단순 변심으로 인한 취소, 환불이 어려울 수 있습니다.<br>
					 결제 진행 전, 예약 결제 취소는 마이페이지에서 가능합니다.
					 <br>
					 <form action="fundingpay" method="POST" id="fundingpay">
					 <button type="button" id="noagree" style=" border: 1px solid black;">동의 안함</button>
					 <input type="submit" value="동의" id="agree" style=" border: 1px solid black;" >
					 <c:forEach var="reward" items="${reward}">
						 <input type="hidden" id="funding_pay_reword${reward.rewardNo}" name="funding_pay_reword" value="">
						 <input type="hidden" id="funding_pay_reword_price${reward.rewardNo}" name="funding_pay_price" value="">
						 <input type="hidden" id="funding_pay_rewordEA${reward.rewardNo}" name="funding_pay_rewordEA" value="0">
					</c:forEach>
					 	
					 <input type="hidden" id="funding_pay_total_price" name="funding_pay_total_price" value="0">
					 <input type="hidden" id="funding_pay_total_rewordEA" name="funding_pay_total_rewordEA" value="0">
					 <input type="hidden" id="deliverycharge" name="deliverycharge" value="${funding.deliverycharge}">
					 <input type="hidden" id="funding_no" name="funding_no" value="${funding.fundingno}">
					 
					 </form>
					</div>
				<div class="FundingDetailTop_wrap">
					<div class="FundingDetailCover_wrap">
						<div class="slick-slider FundingDetailCover_list_image slick-initialized">
							<div class="slick-list">
								<div class="slick-track" style="width: 750px; opacity: 1; transform: translate3d(0px, 0px, 0px);">
									<div data-index="0" class="slick-slide slick-active slick-center slick-current" tabindex="-1" aria-hidden="false" style="outline: none; width: 750px;">
										<div>
											<div class="FundingDetailCover_thumbnail" tabindex="-1" style="width: 100%; display: inline-block;">
												<img src="<%=request.getContextPath() %>/resources/fundingimg/${funding.fundingtitle}.jpg" width="" height="" alt="" class="FundingDetailCover_image">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="FundingDetailSummary">
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd" />
						<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
						<fmt:parseDate value="${funding.fundingfin}" var="endPlanDate" pattern="yyyy-MM-dd" />
						<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>

						<strong class="FundingDetailSummary_dday">D-${endDate - strDate}</strong>
						<h3 class="FundingDetailSummary_title">${funding.fundingtitle}</h3>
						<div class="FundingDetailSummary_graph">
							<div class="FundingDetailSummary_rate">
								<strong class="FundingDetailSummary_number">0</strong>%
							</div>
							<div class="FundingDetailSummary_bar">
								<span class="FundingDetailSummary_current" style="width: 62%;"></span>
							</div>
							<span class="FundingDetailSummary_goal">
							<span class="FundingDetailSummary_number">${funding.fundingprice}</span>원 목표
							</span>
							<span class="FundingDetailSummary_amount">
							<strong class="FundingDetailSummary_number">0</strong>원
							</span>
						</div>
					</div>
					<div class="FundingDetailSummary_profile">
						<div class="FundingDetailSummary_thumbnail">
							<div class="FundingDetailSummary_image" style="background-image: url(&quot;https://happybean-phinf.pstatic.net/20210603_58/1622698284928gx2QN_JPEG/pr.jpg&quot;);"></div>
						</div>
						<div class="FundingDetailSummary_text">
							<span class="FundingDetailSummary_name">${funding.maker}</span>
							<span class="FundingDetailSummary_introduction">소셜벤처 점프와 신발연구소의 콜라보</span>
						</div>
					</div>
					<div class="FundingDetailSummary_reward">
						<div class="FundingDetailSummary_reward_inner">
							<div class="FundingDetailSummary_select">
								<button type="button" id="FundingDetailSummary_button_select" class="FundingDetailSummary_button_select" aria-expanded="false">
									리워드 선택하기
									<span class="FundingDetailSummary_icon"></span>
								</button>
								<ul id="FundingDetailSummary_list_reward__2O_UT" class="FundingDetailSummary_list_reward__2O_UT">
									<c:forEach var="reward" items="${reward}">
										<li class="FundingDetailSummary_item__uEGFt">
											<button type="button" id="reword${reward.rewardNo}" class="FundingDetailSummary_button__3drOk">${reward.rewardTitle} &nbsp;</button>
											<input type="hidden" id="rewardEA${reward.rewardNo}" value="${reward.rewardEA}">
											<input type="hidden"  id="rewardPrice${reward.rewardNo}" value="${reward.rewardPrice}">
										</li>
									</c:forEach>
									<li class="FundingDetailSummary_item__uEGFt">
									<button type="button" id="cheer1" class="FundingDetailSummary_button__3drOk">(선택) 메이커에게 1,000원 더 응원하기</button>
									</li>

								</ul>
							</div>
							<ul id="FundingDetailSummary_list_cart__3t2SB" class="FundingDetailSummary_list_cart__3t2SB">

							</ul>
							<div class="FundingDetailSummary_total">
								<div class="FundingDetailSummary_count">
									총 수량<span id="FundingTotalnumber" class="FundingDetailSummary_number">0</span>개
								</div>
								<div class="FundingDetailSummary_amount">
									<strong class="FundingDetailSummary_name">총 금액</strong>
									<strong class="FundingDetailSummary_description">
									<span id="FundingTotalPrice" class="FundingDetailSummary_number">0</span>원</strong>
								</div>
							</div>
							<div class="FundingDetailSummary_delivery">
								<span class="FundingDetailSummary_name">배송비</span>
								<c:if test="${funding.deliverycharge eq 0}">
								<span class="FundingDetailSummary_amount">무료</span>
								</c:if>
								<c:if test="${funding.deliverycharge ne 0}">
								<span class="FundingDetailSummary_amount">${funding.deliverycharge}원</span>
								</c:if>	
							</div>
						</div>
						<div class="FundingDetailSummary_button_area">
							<button type="button" id="FundingDetailSummary_button_join"
								class="FundingDetailSummary_button_join"
								aria-expanded="false" aria-controls="wa_option"
								aria-hidden="false">펀딩 참여하기</button>
							<a href="#"
								class="naver-splugin Social_wrap FundingDetailSummary_button_share"
								role="button" aria-label="공유하기" aria-hidden="false"
								data-style="unity-v2" data-blog-source-form="2"
								splugin-id="9881009287">
								<svg width="25" height="22" viewBox="0 0 25 22"> </svg>
							</a>
						</div>
					</div>
				</div>
				<div class="FundingDetailTab_wrap">
					<div class="FundingDetailTab_inner">
						<ul role="tablist" class="FundingDetailTab_list">
							<li class="FundingDetailTab_item" role="presentation"><a
								role="tab" id="wa_story_tab" class="FundingDetailTab_tab"
								aria-controls="wa_story_tabpanel" aria-current="true"
								href="#">스토리</a></li>
							<li class="FundingDetailTab_item" role="presentation"><a
								role="tab" id="wa_reward_tab"
								class="FundingDetailTab_tab"
								aria-controls="wa_reward_tabpanel" aria-current="false"
								href="#">리워드</a></li>
							<li class="FundingDetailTab_item" role="presentation"><a
								role="tab" id="wa_review_tab"
								class="FundingDetailTab_tab"
								aria-controls="wa_review_tabpanel" aria-current="false"
								href="#">소식∙후기</a></li>
						</ul>
					</div>
				</div>

				<div class="Alldetail">
					<div class="FundingDetailStoryContent_wrap">
						<div id="wa_story_tabpanel" class="FundingDetailStoryContent_wrap_content"
							role="tabpanel" aria-labelledby="wa_story_tab">
							<article class="FundingDetailStoryContent_article">
								<h4 class="blind">스토리 본문</h4>
								<div class="FundingDetailArticle_wrap">
									<strong class="FundingDetailEditorParagraph_title">${funding.fundingtitle}</strong>
									<p class="FundingDetailEditorParagraph_content">
									${funding.fundingcontent}
									</p>
									<div class="FundingDetailEditorSingleImage_wrap">
										<img
											src=""
											alt="" width="" height=""
											class="FundingDetailEditorSingleImage_image">
									</div>
									<div
										class="FundingDetailEditorTitle_wrap FundingDetailEditorTitle_type_b">
										<strong class="FundingDetailEditorTitle_text">펀딩 후원금 사용계획</strong>
									</div>
									<p class="FundingDetailEditorParagraph_content">
									후원금 사용 계획 적는곳
									</p>
								</div>
							</article>
							<section class="FundingDetailStoryContent_guide">
								<h4 class="FundingDetailStoryContent_title">결제방법 및 배송 안내</h4>
								<div class="FundingDetailStoryContent_content">
									<ul class="FundingDetailStoryContent_list_guide">
										<li class="FundingDetailStoryContent_item">리워드는 해당 프로젝트 개설자가 제공합니다.</li>
										<li class="FundingDetailStoryContent_item">100% 달성 시에만 아래 지정일에 결제됩니다.</li>
									</ul>
									<strong class="FundingDetailStoryContent_subtitle__mm0mM"> 결제 및 발송 예정일</strong>
									<ul class="FundingDetailStoryContent_list_date__1xfUX">
										<li class="FundingDetailStoryContent_item">
										<fmt:parseDate value="${funding.fundingfin}" var="paymentday" pattern="yyyy-MM-dd"/> 
										<fmt:formatDate value="${funding.deliverydate}" type="DATE" var="deliverydate" pattern="yyyy년 MM월 dd일"/> 
											<span class="FundingDetailStoryContent_text FundingDetailStoryContent_highlight">
											1차 결제 : <fmt:formatDate value="${paymentday}" pattern="yyyy년 MM월 dd일"/>, 예상 발송일 : ${deliverydate}
											</span>
										</li>
										<li class="FundingDetailStoryContent_item">
											<span class="FundingDetailStoryContent_text">
											2차 결제 : 0000년 0월 00일, 예상 발송일 : 0000년 0월 00일
											</span>
										</li>
									</ul>
								</div>
							</section>
							<section class="FundingDetailStoryParticipationTabPanel_wrap">
								<h4 class="FundingDetailStoryParticipationTabPanel_title">참여내역</h4>
								<p class="FundingDetailStoryParticipationList_summary">
									<strong class="FundingDetailStoryParticipationList_number">
									총 명</strong>이 참여하였습니다.
								</p>
								<ul class="FundingDetailStoryParticipationList_wrap">
									<li class="FundingDetailStoryParticipationList_item"><div
											class="FundingDetailStoryParticipationList_thumbnail"
											style="background-image: url(&quot;https://ssl.pstatic.net/happyimg2/img3/social/comment/img/default_profile.jpg&quot;);"></div>
										<div class="FundingDetailStoryParticipationList_date">9999.99.99 00:00:00</div>
										<div class="FundingDetailStoryParticipationList_user">
											<span class="FundingDetailStoryParticipationList_name_">kang님</span>
											<span class="FundingDetailStoryParticipationList_amount">
												<strong class="FundingDetailStoryParticipationList_number"></strong>원 참여
											</span>
										</div>
									</li>
								</ul>
								<nav class="Pagination_wrap" role="navigation" aria-label="페이지 네비게이션">
									<button type="button" class="Pagination_previous" aria-label="이전" disabled=""></button>
									<button type="button" class="Pagination_next" aria-label="다음"></button>
								</nav>
							</section>
						</div>
						<section class="FundingDetailStoryContent_wrap_reward">
							<div class="FundingDetailRewardList_wrap">
								<h4 class="FundingDetailRewardList_title">리워드 안내</h4>
								<ul class="FundingDetailRewardList_list">
								<c:forEach var="reward" items="${reward}">
									<li class="FundingDetailRewardList_item">
									<strong class="FundingDetailRewardList_amount_">
										<span class="FundingDetailRewardList_number">${reward.rewardPrice}원</span>펀딩참여
									</strong>
									<div class="FundingDetailRewardList_text_">
											<strong class="FundingDetailRewardList_name">
											${reward.rewardTitle}
											</strong>
											<div class="FundingDetailRewardList_count">
												<strong>${reward.rewardEA}</strong> 개 남음
											</div>
											<ul class="FundingDetailRewardList_information">
												<li class="FundingDetailRewardList_item_information">현재0명 펀딩 참여</li>
												<li class="FundingDetailRewardList_item_information">
													<strong class="FundingDetailRewardList_highlight">
														<span class="FundingDetailRewardList_date">발송예상일</span>0000.0.00
													</strong>
												</li>
											</ul>
										</div>
									</li>
									
									</c:forEach>

								</ul>
								<a class="FundingDetailRewardList_link" href="#">자세히 보기
									<span class="FundingDetailRewardList_icon"></span>
								</a>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		//리워드 선택 list 열고 닫기
		var listbtn = document.getElementById("FundingDetailSummary_button_select");
		var list = document.getElementById("FundingDetailSummary_list_reward__2O_UT");
		
		listbtn.addEventListener("click",function(){
			
			if(listbtn.getAttribute("aria-expanded") == "false"){
			listbtn.setAttribute("aria-expanded","true");
			list.style.display = 'block';
			}else{
				listbtn.setAttribute("aria-expanded","false");
				list.style.display = 'none';
			}
		});
		
		//리워드 리스트에서 선택하기 
		var reword_btn1 = document.getElementById("reword1");
		var reword_price1 = document.getElementById("rewardPrice1").value;
		var reword_val1 = document.getElementById("reword1").innerText;
		
		var reword_btn2 = document.getElementById("reword2");
		var reword_price2 = document.getElementById("rewardPrice2").value;
		var reword_val2 = document.getElementById("reword2").innerText; 
		
		var cheer_btn1 = document.getElementById("cheer1");
		var cheer_val1 = document.getElementById("cheer1").innerText;
		
		var ul_list = document.getElementById("FundingDetailSummary_list_cart__3t2SB"); //ul_list선언
		var fundingpay = document.getElementById("fundingpay"); //pay form선언
		
		var totalprice =  document.getElementById("FundingTotalPrice");
		var totalnumber =  document.getElementById("FundingTotalnumber");
		
		var funding_pay_total_price =  document.getElementById("funding_pay_total_price"); // 결제 페이지용 가격
		var funding_pay_total_rewordEA = document.getElementById("funding_pay_total_rewordEA"); // 결제 페이지용 수량
		
		
		
		var funtotalprice = totalprice.innerText;
		var funtotalnumber = totalnumber.innerText;
		
		var li1 = document.createElement("li");
		var li2 = document.createElement("li");
		var li3 = document.createElement("li");
		 <c:forEach var="reward" items="${reward}">
		 
			var funding_pay_reword${reward.rewardNo} = document.getElementById("funding_pay_reword${reward.rewardNo}"); // 결제 페이지 리워드 이름 저장용
			var funding_pay_price${reward.rewardNo} = document.getElementById("funding_pay_reword_price${reward.rewardNo}"); // 결제 페이지 리워드 가격 저장용
			var funding_pay_rewordEA${reward.rewardNo} = document.getElementById("funding_pay_rewordEA${reward.rewardNo}"); // 결제 페이지 리워드 갯수 저장용
		
		</c:forEach>
			
		reword_btn1.addEventListener("click",function(){
			ul_list.style.display = 'block';
			listbtn.setAttribute("aria-expanded","false");
			list.style.display = 'none';
			li1.setAttribute('class','FundingDetailRewardCartItem_wrap__vdT7T');
			li1.innerHTML = "<strong class='FundingDetailRewardCartItem_name__1BPbo'>"+reword_val1+"</strong> <div class='FundingDetailRewardCartItem_counter__1jk_P'> <input id='reward-cart-item-9' type='number' class='FundingDetailRewardCartItem_input_count__Em-cm' value='1'> <label for='reward-cart-item-9' class='blind'>개수</label> <button type='button' class='FundingDetailRewardCartItem_button_minus__1zWpw' disabled=''> <span class='FundingDetailRewardCartItem_icon_minus__1Jcwy'></span> <span class='blind'>-</span> </button> <button type='button' class='FundingDetailRewardCartItem_button_plus__13l8X'> <span class='FundingDetailRewardCartItem_icon_plus__3xFSP'></span> <span class='blind'>+</span> </button></div> <span class='FundingDetailRewardCartItem_amount__1WmUb'><strong>"+reword_price1+"</strong>원</span> <button id='FundingDetailRewardCartItem_button_delete1' class='FundingDetailRewardCartItem_button_delete__feY-l'> <span class='FundingDetailRewardCartItem_icon__3CScL'></span> <span class='blind'>삭제</span></button>";
			
			funtotalprice = parseInt(funtotalprice) + parseInt(reword_price1);
			funding_pay_total_price.value = parseInt(funding_pay_total_price.value) + parseInt(reword_price1);
			totalprice.innerText = funtotalprice;
			
			funtotalnumber = parseInt(funtotalnumber) + 1;
			funding_pay_total_rewordEA.value = parseInt(funding_pay_total_rewordEA.value) + 1;
			totalnumber.innerText = funtotalnumber;
			
			funding_pay_reword1.value = reword_val1;
			funding_pay_price1.value = reword_price1;
			funding_pay_rewordEA1.value = parseInt(funding_pay_rewordEA1.value) + 1;
			
			ul_list.appendChild(li1);
			
			var deletebtn1 = document.getElementById("FundingDetailRewardCartItem_button_delete1");
				deletebtn1.addEventListener("click",function(){
							
					li1.remove();
					funtotalprice = parseInt(funtotalprice) - parseInt(reword_price1);
					funding_pay_total_price.value = parseInt(funding_pay_total_price.value) - parseInt(reword_price1);
					totalprice.innerText = funtotalprice;
					
					funtotalnumber = parseInt(funtotalnumber) - 1;
					funding_pay_total_rewordEA.value = parseInt(funding_pay_total_rewordEA.value) - 1;
					totalnumber.innerText = funtotalnumber;
					
					funding_pay_reword1.value = "";
					funding_pay_price1.value = "";
					funding_pay_rewordEA1.value =  parseInt(funding_pay_rewordEA1.value) - 1;
					
					});
			
			});
		
		reword_btn2.addEventListener("click",function(){
			ul_list.style.display = 'block';
			listbtn.setAttribute("aria-expanded","false");
			list.style.display = 'none';
			li2.setAttribute('class','FundingDetailRewardCartItem_wrap__vdT7T');
			li2.innerHTML = "<strong class='FundingDetailRewardCartItem_name__1BPbo'>"+reword_val2+"</strong> <div class='FundingDetailRewardCartItem_counter__1jk_P'> <input id='reward-cart-item-9' type='number' class='FundingDetailRewardCartItem_input_count__Em-cm' value='1'> <label for='reward-cart-item-9' class='blind'>개수</label> <button type='button' class='FundingDetailRewardCartItem_button_minus__1zWpw' disabled=''> <span class='FundingDetailRewardCartItem_icon_minus__1Jcwy'></span> <span class='blind'>-</span> </button> <button type='button' class='FundingDetailRewardCartItem_button_plus__13l8X'> <span class='FundingDetailRewardCartItem_icon_plus__3xFSP'></span> <span class='blind'>+</span> </button></div> <span class='FundingDetailRewardCartItem_amount__1WmUb'><strong>"+reword_price2+"</strong>원</span> <button id='FundingDetailRewardCartItem_button_delete2' class='FundingDetailRewardCartItem_button_delete__feY-l'> <span class='FundingDetailRewardCartItem_icon__3CScL'></span> <span class='blind'>삭제</span></button>";
		
			funtotalprice = parseInt(funtotalprice) + parseInt(reword_price2);
			funding_pay_total_price.value = parseInt(funding_pay_total_price.value) + parseInt(reword_price2);
			totalprice.innerText = funtotalprice;
		
			funtotalnumber = parseInt(funtotalnumber) + 1;
			funding_pay_total_rewordEA.value = parseInt(funding_pay_total_rewordEA.value) + 1;
			totalnumber.innerText = funtotalnumber;
			
			funding_pay_reword2.value = reword_val2;
			funding_pay_price2.value = reword_price2;
			funding_pay_rewordEA2.value = parseInt(funding_pay_rewordEA2.value) + 1;
			
			ul_list.appendChild(li2);
			
			var deletebtn2 = document.getElementById("FundingDetailRewardCartItem_button_delete2");
				deletebtn2.addEventListener("click",function(){
						
				li2.remove();
				funtotalprice = parseInt(funtotalprice) - parseInt(reword_price2);
				funding_pay_total_price.value = parseInt(funding_pay_total_price.value) - parseInt(reword_price2);
				totalprice.innerText = funtotalprice;
				
				funtotalnumber = parseInt(funtotalnumber) - 1;
				funding_pay_total_rewordEA.value = parseInt(funding_pay_total_rewordEA.value) - 1;
				totalnumber.innerText = funtotalnumber;

				funding_pay_reword2.value = "";
				funding_pay_price2.value = "";
				funding_pay_rewordEA2.value =  parseInt(funding_pay_rewordEA2.value) - 1;
				
				});

			});
		
		cheer_btn1.addEventListener("click",function(){
			ul_list.style.display = 'block';
			listbtn.setAttribute("aria-expanded","false");
			list.style.display = 'none';
			li3.setAttribute('class','FundingDetailRewardCartItem_wrap__vdT7T');
			li3.appendChild(textNode3);
			ul_list.appendChild(li3);

			});
		
		
</script>
</body>
</html>