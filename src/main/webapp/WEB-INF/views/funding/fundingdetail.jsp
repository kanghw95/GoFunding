<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link href="<%=request.getContextPath() %>/resources/css/funding/fundingdetail/fundingdetail_top/fundingdetail_cover.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/funding/fundingdetail/fundingdetail_top/fundingdetail_sumary.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/funding/fundingdetail/fundingdetail_top/fundingdetail_profile.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/funding/fundingdetail/fundingdetail_top/fundingdetail_chioce.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/funding/fundingdetail/fundingdetail_tap.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/funding/fundingdetail/fundingdetail_content.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/funding/fundingdetail/fundingdetail_reword.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/sweetalert2.css" rel="stylesheet" type="text/css" />
<style type="text/css">
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
        background-color:rgba(0, 0,0, 0);
        top:0;
        left: 0;
        z-index: 1;
    }
    #like{
	width : 24px;
	height : 24px;
}

#unlike{
	width : 24px;
	height : 24px;
}
</style>

</head>

<body>

<jsp:include page="/WEB-INF/views/header.jsp"/>
	<fmt:parseDate value="${funding.fundingfin}" var="paymentday" pattern="yyyy-MM-dd HH:mm:ss"/> 
	<fmt:formatDate value="${funding.deliverydate}" type="DATE" var="deliverydate" pattern="yyyy년 MM월 dd일"/> 

	<div class="wrapper">
		<div role="main" id="content" class="content">
			<div>
				<div class="black_bg"></div>
					<div class="modal_wrap" style="text-align: center;">
						 펀딩 참여전 확인하세요!
						 <hr>
						 지금 신청하고 있는 펀딩은 ${deliverydate} 일에 배송이 시작됩니다.
						 <hr>
						 펀딩은 쇼핑과 달리 배송이후 단순 변심으로 인한 취소, 환불이 어려울 수 있습니다.<br>
						 배송 진행 전 결제 취소는 마이페이지에서 가능합니다.
						 <br>
						 <form action="fundingpay" method="POST" id="fundingpay">
						 <button type="button" id="noagree" style=" border: 1px solid black;">동의 안함</button>
						 <input type="submit" value="동의" id="agree" style=" border: 1px solid black;" >
						 <c:forEach var="reward" items="${reward}">
							 <input type="hidden" id="funding_pay_reword${reward.rewardNo}" name="funding_pay_reword" value="">
							 <input type="hidden" id="funding_pay_reword_price${reward.rewardNo}" name="funding_pay_price" value="0">
							 <input type="hidden" id="funding_pay_rewordEA${reward.rewardNo}" name="funding_pay_rewordEA" value="0">
						</c:forEach>
						 	
						 <input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}">
						 
						 <input type="hidden" id="funding_pay_total_price" name="funding_pay_total_price" value="0">
						 <input type="hidden" id="funding_pay_total_rewordEA" name="funding_pay_total_rewordEA" value="0">
						 <input type="hidden" id="deliverycharge" name="deliverycharge" value="${funding.deliverycharge}">
						 <input type="hidden" id="funding_no" name="funding_no" value="${funding.fundingno}">
						 
						 <input type="hidden" id="cheer_pay" name="cheer_pay" value = "">
						 <input type="hidden" id="cheer_pay_price" name="cheer_pay_price" value = "0">
						 <input type="hidden" id="cheer_pay_EA" name="cheer_pay_EA" value = "0">
						 
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

						<c:if test="${endDate - strDate gt 0}">
						
						<strong class="FundingDetailSummary_dday">D-${endDate - strDate}</strong>
						
						</c:if>
						
						<c:if test="${endDate - strDate le 0}">
						
						<strong style="background-color: #ccc;" class="FundingDetailSummary_dday">종료</strong>
						
						</c:if>
						<h3 class="FundingDetailSummary_title">${funding.fundingtitle}</h3>
						<div class="FundingDetailSummary_graph">
							<div class="FundingDetailSummary_rate">
								<strong class="FundingDetailSummary_number"><fmt:parseNumber var="percent" value="${(funding.currentprice/funding.fundingprice)*100 }" integerOnly="true" />${percent}</strong>%
							</div>
							<div class="FundingDetailSummary_bar">
								<span class="FundingDetailSummary_current" style="width: ${percent}%;"></span>
							</div>
							<span class="FundingDetailSummary_goal">
								<span class="FundingDetailSummary_number"><fmt:formatNumber value="${funding.fundingprice}" pattern="#,###,###"/></span> 원 목표
							</span>
							<span class="FundingDetailSummary_amount">
								<strong class="FundingDetailSummary_number"><fmt:formatNumber value="${funding.currentprice}" pattern="#,###,###"/></strong> 원
							</span>
						</div>
					</div>
					<div class="FundingDetailSummary_profile">
						<div class="FundingDetailSummary_thumbnail">
							<div class="FundingDetailSummary_image" style="background-image: "></div>
						</div>
						<div class="FundingDetailSummary_text">
							<span class="FundingDetailSummary_name" id="maker">${funding.maker}</span>
							<span class="FundingDetailSummary_introduction">소셜벤처 점프와 신발연구소의 콜라보</span>
						</div>
					</div>
					<div class="FundingDetailSummary_reward">
						<div class="FundingDetailSummary_reward_inner">
							<div class="FundingDetailSummary_select">
						<c:if test="${endDate - strDate gt 0}">
						
								<button type="button" id="FundingDetailSummary_button_select" class="FundingDetailSummary_button_select" aria-expanded="false">
									리워드 선택하기
									<span class="FundingDetailSummary_icon"></span>
								</button>
						
						</c:if>
						
						<c:if test="${endDate - strDate le 0}">
						
								<button disabled="disabled" type="button" id="FundingDetailSummary_button_select" class="FundingDetailSummary_button_select" aria-expanded="false">
									리워드 선택하기
									<span class="FundingDetailSummary_icon"></span>
								</button>
						
						</c:if>
								<ul id="FundingDetailSummary_list_reward__2O_UT" class="FundingDetailSummary_list_reward__2O_UT">
									<c:forEach var="reward" items="${reward}">
										<li class="FundingDetailSummary_item__uEGFt">
											<button type="button" id="reword${reward.rewardNo}" class="FundingDetailSummary_button">${reward.rewardTitle} &nbsp;</button>
											<input type="hidden" id="rewardEA${reward.rewardNo}" value="${reward.rewardEA}">
											<input type="hidden"  id="rewardPrice${reward.rewardNo}" value="${reward.rewardPrice}">
										</li>
									</c:forEach>
									<li class="FundingDetailSummary_item__uEGFt">
									<button type="button" id="cheer1" class="FundingDetailSummary_button">(선택) 메이커에게 1,000원 더 응원하기 </button>
									<input type="hidden" id="cheerEA" value="1">
									<input type="hidden" id="cheerPrice" value="1000">
									</li>

								</ul>
							</div>
							<ul id="FundingDetailSummary_list_cart" class="FundingDetailSummary_list_cart">

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
									<span style="font-size: 14px;" class="FundingDetailSummary_amount">무료</span>
								</c:if>
								<c:if test="${funding.deliverycharge ne 0}">
									<span style="font-size: 14px;" class="FundingDetailSummary_amount"><fmt:formatNumber value="${funding.deliverycharge}" pattern="#,###,###"/> 원</span>
								</c:if>	
							</div>
						</div>
						<div class="FundingDetailSummary_button_area">
						
								<c:if test="${endDate - strDate gt 0}">
								
								<button type="button" id="FundingDetailSummary_button_join" class="FundingDetailSummary_button_join" aria-expanded="false" aria-controls="wa_option" aria-hidden="false">펀딩 참여하기</button>
								
								</c:if>
								
								<c:if test="${endDate - strDate le 0}">
								
								<button style="background-color: #ccc;" disabled='disabled' type="button" id="FundingDetailSummary_button_join" class="FundingDetailSummary_button_join" aria-expanded="false" aria-controls="wa_option" aria-hidden="false">펀딩 종료</button>
								
								</c:if>
								
							<a href="#" id="likeButton" onclick="checkId();"  class="naver-splugin Social_wrap FundingDetailSummary_button_share">
							</a>

						</div>
					</div>
				</div>
				<div class="FundingDetailTab_wrap">
					<div class="FundingDetailTab_inner">
						<ul role="tablist" class="FundingDetailTab_list">
							<li class="FundingDetailTab_item" role="presentation">
								<a role="tab" id="wa_story_tab" class="FundingDetailTab_tab" aria-controls="wa_story_tabpanel" aria-current="true" href="#">스토리</a>
							</li>
							<li class="FundingDetailTab_item" role="presentation">
								<a role="tab" id="wa_reward_tab" class="FundingDetailTab_tab" aria-controls="wa_reward_tabpanel" aria-current="false" href="#">리워드</a>
							</li>
							<li class="FundingDetailTab_item" role="presentation">
								<a role="tab" id="wa_review_tab" class="FundingDetailTab_tab" aria-controls="wa_review_tabpanel" aria-current="false" href="#">소식∙후기</a>
							</li>
						</ul>
					</div>
				</div>

				<div class="Alldetail">
					<div class="FundingDetailStoryContent_wrap">
						<div id="wa_story_tabpanel" class="FundingDetailStoryContent_wrap_content" role="tabpanel" aria-labelledby="wa_story_tab">
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
									<div class="FundingDetailEditorTitle_wrap FundingDetailEditorTitle_type_b">
										<strong class="FundingDetailEditorTitle_text">펀딩 후원금 사용계획</strong>
									</div>
									<p class="FundingDetailEditorParagraph_content">
									후원금 사용 계획 적는곳
									</p>
								</div>
							</article>
							<section class="FundingDetailStoryContent_guide">
								<h4 class="FundingDetailStoryContent_title">배송 안내</h4>
								<div class="FundingDetailStoryContent_content">
									<ul class="FundingDetailStoryContent_list_guide">
										<li class="FundingDetailStoryContent_item">리워드는 해당 프로젝트 개설자가 제공합니다.</li>
										<li class="FundingDetailStoryContent_item">100% 달성 시에만 아래 지정일에 배송이 시작됩니다.</li>
									</ul>
									<strong class="FundingDetailStoryContent_subtitle__mm0mM">발송 예정일</strong>
									<ul class="FundingDetailStoryContent_list_date__1xfUX">
										<li class="FundingDetailStoryContent_item">
											<span class="FundingDetailStoryContent_text FundingDetailStoryContent_highlight">
											 예상 발송일 : ${deliverydate}
											</span>
										</li>
									</ul>
								</div>
							</section>
							
						 <section class="FundingDetailStoryContent_reference">
							<h4 class="FundingDetailStoryContent_title">참고정보</h4>
								<ul class="FundingDetailStoryReferenceList_wrap">
									<li class="FundingDetailStoryReferenceList_item">
										<a href="#" class="FundingDetailStoryReferenceList_link" target="_blank">
										<span class="FundingDetailStoryReferenceList_logo">
										</span>
										
										<span class="FundingDetailStoryReferenceList_text">SNS</span>
										</a>
									</li>
									
									<li class="FundingDetailStoryReferenceList_item">
										<a href="#" class="FundingDetailStoryReferenceList_link" target="_blank">
											<span class="FundingDetailStoryReferenceList_logo">
											</span>
											
											<span class="FundingDetailStoryReferenceList_text">홈페이지</span>
										</a>
									</li>
									<li class="FundingDetailStoryReferenceList_item">
										<a onclick="makerMsg();" class="FundingDetailStoryReferenceList_link" target="_blank">
											<span class="FundingDetailStoryReferenceList_logo">

											</span>
											
											<span class="FundingDetailStoryReferenceList_text">문의하기</span>
										</a>
									</li>
								</ul>
							</section>
							
							<section class="FundingDetailStoryParticipationTabPanel_wrap">
								<h4 class="FundingDetailStoryParticipationTabPanel_title">참여내역</h4>
								<p class="FundingDetailStoryParticipationList_summary">
									<strong class="FundingDetailStoryParticipationList_number">
									총 ${historyResult} 명</strong>이 참여하였습니다.
								</p>
								

								<ul class="FundingDetailStoryParticipationList_wrap">
									<c:forEach items="${historyResultDetail}" var="list" >
										<li class="FundingDetailStoryParticipationList_item">
												<div class="FundingDetailStoryParticipationList_thumbnail" style="background-color: black; "></div>
												<div class="FundingDetailStoryParticipationList_date">${list.ORDERDATE}</div>
												<div class="FundingDetailStoryParticipationList_user">
													<span class="FundingDetailStoryParticipationList_name_">${list.ID } 님</span>
													<span class="FundingDetailStoryParticipationList_amount">
														<strong class="FundingDetailStoryParticipationList_number"></strong><fmt:formatNumber value="${list.ORDERTOTALPRICE}" pattern="#,###,###"/>원 참여
													</span>
												</div>
										</li>
									</c:forEach>
								</ul>
								<nav class="Pagination_wrap" role="navigation" aria-label="페이지 네비게이션">
									<button type="button" class="Pagination_previous" aria-label="이전" disabled=""></button>
									<button type="button" class="Pagination_next" aria-label="다음"></button>
								</nav>
							</section>
						</div>
						
						<div id="wa_reward_tabpanel" class="FundingDetailRewardContent_wrap_content__1zKtY" role="tabpanel" aria-labelledby="wa_reward_tab">
							<article class="FundingDetailRewardContent_article__1KLwN">
								<h4 class="blind">리워드 본문</h4>
								<div class="FundingDetailNoContent_wrap__5UAnm">
									<div class="FundingDetailNoContent_inner__3g_8U">
											<p class="FundingDetailNoContent_text__2o3-p">아직 작성된 내용이 없습니다.</p>
									</div>
								</div>
							</article>
						</div>
						
						<div id="wa_review_tabpanel" class="FundingDetailTidingContent_wrap_content__3XgIg" role="tabpanel" aria-labelledby="wa_review_tab">
							<section class="FundingDetailTidingContent_wrap_list__25ZUN">
								<h4 class="blind">소식∙후기 목록</h4>
									<div class="FundingDetailNoContent_wrap__5UAnm">
										<div class="FundingDetailNoContent_inner__3g_8U">
										<p class="FundingDetailNoContent_text__2o3-p">아직 작성된 내용이 없습니다.</p>
										</div>
									</div>
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
												<li class="FundingDetailRewardList_item_information">현재 ${reward.rewardCount}명 펀딩 참여</li>
												<li class="FundingDetailRewardList_item_information">
													<strong class="FundingDetailRewardList_highlight">
														<span class="FundingDetailRewardList_date">발송예상일</span>${deliverydate}
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
<jsp:include page="/WEB-INF/views/footer.jsp"/>
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
		
		// 스토리, 리워드, 소식후기 이동 버튼
		var story_tab = document.getElementById("wa_story_tab");
		var reward_tap = document.getElementById("wa_reward_tab");
		var review_tap = document.getElementById("wa_review_tab");
		
		//스토리, 리워드, 소식후기 이동 버튼 div
		var story_tappanel = document.getElementById("wa_story_tabpanel");
		var reward_tabpanel = document.getElementById("wa_reward_tabpanel");
		var review_tabpanel = document.getElementById("wa_review_tabpanel");
		
		story_tab.addEventListener("click",function(){
					
				story_tab.setAttribute("aria-current","true");
				reward_tap.setAttribute("aria-current","false");
				review_tap.setAttribute("aria-current","false");
				
				story_tappanel.style.display = 'block';
				reward_tabpanel.style.display = 'none';
				review_tabpanel.style.display = 'none';
						
		});
		
		reward_tap.addEventListener("click",function(){
			
			story_tab.setAttribute("aria-current","false");
			reward_tap.setAttribute("aria-current","true");
			review_tap.setAttribute("aria-current","false");
			
			story_tappanel.style.display = 'none';
			reward_tabpanel.style.display = 'block';
			review_tabpanel.style.display = 'none';
			
		});
		
		review_tap.addEventListener("click",function(){
			
			story_tab.setAttribute("aria-current","false");
			reward_tap.setAttribute("aria-current","false");
			review_tap.setAttribute("aria-current","true");
			
			story_tappanel.style.display = 'none';
			reward_tabpanel.style.display = 'none';
			review_tabpanel.style.display = 'block';
			
		});
		
		//리워드  선택하기 
		<c:forEach var="reward" items="${reward}">
			var reword_btn${reward.rewardNo} = document.getElementById("reword${reward.rewardNo}");
			var reword_price${reward.rewardNo} = document.getElementById("rewardPrice${reward.rewardNo}").value;
			var reword_val${reward.rewardNo} = document.getElementById("reword${reward.rewardNo}").innerText;
		</c:forEach>

		var ul_list = document.getElementById("FundingDetailSummary_list_cart"); //ul_list선언
		var fundingpay = document.getElementById("fundingpay"); //pay form선언
		
		var totalprice =  document.getElementById("FundingTotalPrice");
		var totalnumber =  document.getElementById("FundingTotalnumber");
		
		var funding_pay_total_price =  document.getElementById("funding_pay_total_price"); // 결제 페이지용 가격
		var funding_pay_total_rewordEA = document.getElementById("funding_pay_total_rewordEA"); // 결제 페이지용 수량
		
		var funtotalprice = totalprice.innerText;
		var funtotalnumber = totalnumber.innerText;
		
		var li99 = document.createElement("li");
		
		<c:forEach var="reward" items="${reward}">
			var li${reward.rewardNo} = document.createElement("li");
		 
			var funding_pay_reword${reward.rewardNo} = document.getElementById("funding_pay_reword${reward.rewardNo}"); // 결제 페이지 리워드 이름 저장용
			var funding_pay_price${reward.rewardNo} = document.getElementById("funding_pay_reword_price${reward.rewardNo}"); // 결제 페이지 리워드 가격 저장용
			var funding_pay_rewordEA${reward.rewardNo} = document.getElementById("funding_pay_rewordEA${reward.rewardNo}"); // 결제 페이지 리워드 갯수 저장용
		
		</c:forEach>
		
		<c:forEach var="reward" items="${reward}">
		
			reword_btn${reward.rewardNo}.addEventListener("click",function(){
				
				ul_list.style.display = 'block';
				listbtn.setAttribute("aria-expanded","false");
				list.style.display = 'none';
				li${reward.rewardNo}.setAttribute('class','FundingDetailRewardCartItem_wrap');
				li${reward.rewardNo}.innerHTML = "<strong class='FundingDetailRewardCartItem_name'>"+reword_val${reward.rewardNo}+"</strong><div class='FundingDetailRewardCartItem_counter'><input id='reward-cart-item-${reward.rewardNo}' type='number' class='FundingDetailRewardCartItem_input_count' value='1'> <label for='reward-cart-item-${reward.rewardNo}' class='blind'>개수</label> <button type='button' onclick='minus${reward.rewardNo}();' class='FundingDetailRewardCartItem_button_minus'> <span class='FundingDetailRewardCartItem_icon_minus_'></span> <span class='blind'>-</span> </button> <button type='button' onclick='plus${reward.rewardNo}();' class='FundingDetailRewardCartItem_button_plus'> <span class='FundingDetailRewardCartItem_icon_plus'></span> <span class='blind'>+</span> </button></div> <span class='FundingDetailRewardCartItem_amount'><strong id='reword_price_id${reward.rewardNo}'>"+reword_price${reward.rewardNo}+"</strong>원</span> <button id='FundingDetailRewardCartItem_button_delete${reward.rewardNo}' class='FundingDetailRewardCartItem_button_delete'> <span class='FundingDetailRewardCartItem_icon'></span> <span class='blind'>삭제</span></button>";
				
				funtotalprice = parseInt(funtotalprice) + parseInt(reword_price${reward.rewardNo});
				funding_pay_total_price.value = parseInt(funding_pay_total_price.value) + parseInt(reword_price${reward.rewardNo});
				totalprice.innerText = funtotalprice;
				
				funtotalnumber = parseInt(funtotalnumber) + 1;
				funding_pay_total_rewordEA.value = parseInt(funding_pay_total_rewordEA.value) + 1;
				totalnumber.innerText = funtotalnumber;
				
				funding_pay_reword${reward.rewardNo}.value = reword_val${reward.rewardNo};
				funding_pay_price${reward.rewardNo}.value = reword_price${reward.rewardNo};
				funding_pay_rewordEA${reward.rewardNo}.value = parseInt(funding_pay_rewordEA${reward.rewardNo}.value) + 1;
				
				ul_list.appendChild(li${reward.rewardNo});
				
				var deletebtn${reward.rewardNo} = document.getElementById("FundingDetailRewardCartItem_button_delete${reward.rewardNo}");
					deletebtn${reward.rewardNo}.addEventListener("click",function(){
						
						var funding_EA${reward.rewardNo} = document.getElementById("reward-cart-item-${reward.rewardNo}");
						
						var reword_price_id${reward.rewardNo} = document.getElementById("reword_price_id${reward.rewardNo}");
						var each_reword_price_id${reward.rewardNo} = reword_price_id${reward.rewardNo}.innerText;
						
						li${reward.rewardNo}.remove();
						funtotalprice = parseInt(funtotalprice) - parseInt(each_reword_price_id${reward.rewardNo});
						funding_pay_total_price.value = parseInt(funding_pay_total_price.value) - parseInt(each_reword_price_id${reward.rewardNo});
						totalprice.innerText = funtotalprice;
						funtotalnumber = parseInt(funtotalnumber) - parseInt(funding_EA${reward.rewardNo}.value);
						funding_pay_total_rewordEA.value = parseInt(funding_pay_total_rewordEA.value) - parseInt(funding_EA${reward.rewardNo}.value);
						totalnumber.innerText = funtotalnumber;
						
						funding_pay_reword${reward.rewardNo}.value = "";
						funding_pay_price${reward.rewardNo}.value = "0";
						funding_pay_rewordEA${reward.rewardNo}.value =  "0";
						
						});
				
				});
			
		</c:forEach>

		// 메이커 응원하기 버튼
		var cheer_btn1 = document.getElementById("cheer1");
		var cheer_val = document.getElementById("cheer1").innerText;
		var cheer_EA = document.getElementById("cheerEA");
		var cheer_price1 = document.getElementById("cheerPrice");
		
		var cheer_pay = document.getElementById("cheer_pay");
		var cheer_pay_EA = document.getElementById("cheer_pay_EA");
		var cheer_pay_price = document.getElementById("cheer_pay_price");
		
		cheer_btn1.addEventListener("click",function(){
			
			if(funtotalprice == 0 || funtotalnumber == 0){
				Swal.fire('라워드를 하나 이상 선택해주세요!')
				
				return;
			}
			
			ul_list.style.display = 'block';
			listbtn.setAttribute("aria-expanded","false");
			list.style.display = 'none';
			li99.setAttribute('class','FundingDetailRewardCartItem_wrap');
			li99.innerHTML = "<strong class='FundingDetailRewardCartItem_name'>"+cheer_val+"</strong><div class='FundingDetailRewardCartItem_counter'><input id='reward-cart-item-cheer1' type='number' class='FundingDetailRewardCartItem_input_count' value='1'> <label for='reward-cart-item-cheer1' class='blind'>개수</label> <button type='button' onclick='cheer_minus();' class='FundingDetailRewardCartItem_button_minus'> <span class='FundingDetailRewardCartItem_icon_minus_'></span> <span class='blind'>-</span> </button> <button type='button' onclick='cheer_plus();' class='FundingDetailRewardCartItem_button_plus'> <span class='FundingDetailRewardCartItem_icon_plus'></span> <span class='blind'>+</span> </button></div> <span class='FundingDetailRewardCartItem_amount'><strong id='cheer_price_id'>"+cheer_price1.value+"</strong>원</span> <button id='FundingDetailRewardCartItem_button_delete_cheer1' class='FundingDetailRewardCartItem_button_delete'> <span class='FundingDetailRewardCartItem_icon'></span> <span class='blind'>삭제</span></button>";
			
			funtotalprice = parseInt(funtotalprice) + parseInt(cheer_price1.value);
			funding_pay_total_price.value = parseInt(funding_pay_total_price.value) + parseInt(cheer_price1.value);
			totalprice.innerText = funtotalprice;
			
			funtotalnumber = parseInt(funtotalnumber) + 1;
			funding_pay_total_rewordEA.value = parseInt(funding_pay_total_rewordEA.value) + 1;
			totalnumber.innerText = funtotalnumber;
			
			cheer_pay.value = cheer_val;
			cheer_pay_price.value = cheer_price1.value;
			cheer_pay_EA.value = parseInt(cheer_pay_EA.value) + 1;
			
			ul_list.appendChild(li99);
			
			var delete_cheer = document.getElementById("FundingDetailRewardCartItem_button_delete_cheer1");
				delete_cheer.addEventListener("click",function(){
							
					var funding_cheer_EA = document.getElementById("reward-cart-item-cheer1");
					
					var reword_price_cheer_id = document.getElementById("cheer_price_id");
					var each_reword_price_cheer_id = reword_price_cheer_id.innerText;
					
					li99.remove();
					funtotalprice = parseInt(funtotalprice) - parseInt(each_reword_price_cheer_id);
					funding_pay_total_price.value = parseInt(funding_pay_total_price.value) - parseInt(each_reword_price_cheer_id);
					totalprice.innerText = funtotalprice;
					
					funtotalnumber = parseInt(funtotalnumber) - parseInt(funding_cheer_EA.value);
					funding_pay_total_rewordEA.value = parseInt(funding_pay_total_rewordEA.value) - parseInt(funding_cheer_EA.value);
					totalnumber.innerText = funtotalnumber;
					
					cheer_pay.value = "";
					cheer_pay_price.value = "0";
					cheer_pay_EA.value = "0";
					
					});
			
			});
		
		// 리워드 수량변경  +- 버튼 동작
		<c:forEach var="reward" items="${reward}">
			function plus${reward.rewardNo}() {
				
					var funding_EA${reward.rewardNo} = document.getElementById("reward-cart-item-${reward.rewardNo}");
					
					var reword_price_id${reward.rewardNo} = document.getElementById("reword_price_id${reward.rewardNo}");
					var each_reword_price_id${reward.rewardNo} = reword_price_id${reward.rewardNo}.innerText;
					
					reword_price${reward.rewardNo};
					funding_EA${reward.rewardNo}.value ++ ;
					
					each_reword_price_id${reward.rewardNo} = parseInt(each_reword_price_id${reward.rewardNo}) + parseInt(reword_price${reward.rewardNo});
					reword_price_id${reward.rewardNo}.innerText = each_reword_price_id${reward.rewardNo};
					
					funtotalprice = parseInt(funtotalprice) + parseInt(reword_price${reward.rewardNo});
					funding_pay_total_price.value = parseInt(funding_pay_total_price.value) + parseInt(reword_price${reward.rewardNo});
					totalprice.innerText = funtotalprice;
					
					funtotalnumber = parseInt(funtotalnumber) +1;
					funding_pay_total_rewordEA.value = parseInt(funding_pay_total_rewordEA.value) + 1;
					totalnumber.innerText = funtotalnumber;
					
					funding_pay_reword${reward.rewardNo}.value = reword_val${reward.rewardNo};
					funding_pay_price${reward.rewardNo}.value =  parseInt(funding_pay_price${reward.rewardNo}.value) +  parseInt(reword_price${reward.rewardNo});
					funding_pay_rewordEA${reward.rewardNo}.value = parseInt(funding_pay_rewordEA${reward.rewardNo}.value) + 1;
					
			}
			
			
		</c:forEach>
			function cheer_plus() {
				
				var funding_cheer_EA = document.getElementById("reward-cart-item-cheer1");
				
				var reword_price_cheer_id = document.getElementById("cheer_price_id");
				var each_reword_price_cheer_id = reword_price_cheer_id.innerText;
				if(funding_cheer_EA.value < 5){
				cheer_price1;
				funding_cheer_EA.value++;
				
				each_reword_price_cheer_id = parseInt(each_reword_price_cheer_id) + parseInt(cheer_price1.value);
				reword_price_cheer_id.innerText = each_reword_price_cheer_id;
				
				funtotalprice = parseInt(funtotalprice) + parseInt(cheer_price1.value);
				funding_pay_total_price.value = parseInt(funding_pay_total_price.value) + parseInt(cheer_price1.value);
				totalprice.innerText = funtotalprice;
				
				funtotalnumber = parseInt(funtotalnumber) +1;
				funding_pay_total_rewordEA.value = parseInt(funding_pay_total_rewordEA.value) + 1;
				totalnumber.innerText = funtotalnumber;
				
				cheer_pay.value = cheer_val;
				cheer_pay_price.value = parseInt(cheer_pay_price.value) + parseInt(cheer_price1.value);
				cheer_pay_EA.value = parseInt(cheer_pay_EA.value) + 1;
				
				}
		}
		
		<c:forEach var="reward" items="${reward}">
			function minus${reward.rewardNo}() {
				
				var funding_EA${reward.rewardNo} = document.getElementById("reward-cart-item-${reward.rewardNo}");
				
				var reword_price_id${reward.rewardNo} = document.getElementById("reword_price_id${reward.rewardNo}");
				var each_reword_price_id${reward.rewardNo} = reword_price_id${reward.rewardNo}.innerText;
				
				if (funding_EA${reward.rewardNo}.value > 1) {
					
				reword_price${reward.rewardNo};
				funding_EA${reward.rewardNo}.value -- ;
				
				each_reword_price_id${reward.rewardNo} = parseInt(each_reword_price_id${reward.rewardNo}) - parseInt(reword_price${reward.rewardNo});
				reword_price_id${reward.rewardNo}.innerText = each_reword_price_id${reward.rewardNo}
			
				funtotalprice = parseInt(funtotalprice) - parseInt(reword_price${reward.rewardNo});
				funding_pay_total_price.value = parseInt(funding_pay_total_price.value) - parseInt(reword_price${reward.rewardNo});
				totalprice.innerText = funtotalprice;
				
				funtotalnumber = parseInt(funtotalnumber) - 1;
				funding_pay_total_rewordEA.value = parseInt(funding_pay_total_rewordEA.value) - 1;
				totalnumber.innerText = funtotalnumber;
				
				funding_pay_reword${reward.rewardNo}.value = reword_val${reward.rewardNo};
				funding_pay_price${reward.rewardNo}.value = reword_price${reward.rewardNo};
				funding_pay_rewordEA${reward.rewardNo}.value =  parseInt(funding_pay_rewordEA${reward.rewardNo}.value) - 1;
				
					}
			}
		</c:forEach>
		
		function cheer_minus() {
			
			var funding_cheer_EA = document.getElementById("reward-cart-item-cheer1");
			
			var reword_price_cheer_id = document.getElementById("cheer_price_id");
			var each_reword_price_cheer_id = reword_price_cheer_id.innerText;
			if(funding_cheer_EA.value > 1){
			cheer_price1;
			funding_cheer_EA.value--;
			
			each_reword_price_cheer_id = parseInt(each_reword_price_cheer_id) - parseInt(cheer_price1.value);
			reword_price_cheer_id.innerText = each_reword_price_cheer_id;
			
			funtotalprice = parseInt(funtotalprice) - parseInt(cheer_price1.value);
			funding_pay_total_price.value = parseInt(funding_pay_total_price.value) - parseInt(cheer_price1.value);
			totalprice.innerText = funtotalprice;
			
			funtotalnumber = parseInt(funtotalnumber) - 1;
			funding_pay_total_rewordEA.value = parseInt(funding_pay_total_rewordEA.value) - 1;
			totalnumber.innerText = funtotalnumber;
			
			cheer_pay.value = cheer_val;
			cheer_pay_price.value = parseInt(cheer_pay_price.value) - parseInt(cheer_price1.value);
			cheer_pay_EA.value = parseInt(cheer_pay_EA.value) - 1;
			
			}
	}

		
		Number.prototype.formatNumber = function(){

		    if(this==0) return 0;

		    let regex = /(^[+-]?\d+)(\d)/;

		    let nstr = (this + '');

		    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');

		    return nstr;

		};
		
		// 펀딩 참여하기 로그인, 리워드 선택 유무 검사
		var join_btn =  document.getElementById("FundingDetailSummary_button_join"); 
		
		var sessionUserId = '${sessionScope.user.userId}';
	
		join_btn.addEventListener("click",function(){
			
		
			
		
		if(sessionUserId != ''){
			console.log("sessionUserId : " + sessionUserId);
			console.log("funtotalprice : " + funtotalprice);
			
			if(funtotalprice == 0 || funtotalnumber == 0){
				Swal.fire('라워드를 선택해주세요!')
				return;
			}
			$.ajax({
				url: "orderCheck",
				type: "POST",
				data: {"userId" : sessionUserId,
						"fundingno": ${funding.fundingno}
				},
				
				dataType : "text",
				success : function(data){
					console.log(data);
					if(data === "주문 가능"){
						console.log(data);
						
				        document.querySelector('.modal_wrap').style.display ='block';
				        document.querySelector('.black_bg').style.display ='block';
				    function offClick() {
				        document.querySelector('.modal_wrap').style.display ='none';
				        document.querySelector('.black_bg').style.display ='none';
				    }
				    document.querySelector('#noagree').addEventListener('click', offClick);
				    
					} else {
						Swal.fire('중복 주문은 불가합니다. 먼저 주문하신 건을 취소해주세요')
						return;
					}
				},
				error : function(data){
					console.log("ajax는 일단 들어옴 but 실패");
					console.log("error data : " + data)
				}
				})

		} else if(sessionUserId == ''){
			Swal.fire('로그인 후 참여가 가능합니다.')
			return;
		}
		
		
		
	});
		
	function makerMsg(event){
        var maker = $("#maker").text();
        console.log(maker);
    	var pop = window.open("about:blank","content");
		pop.location.href="http://localhost:8090/sprout/message/msgRead1?maker="+maker;		
	}
	var isLiked = '${isliked}';  // 1:좋아요, 0:아님
	var cnt =  '${likedCnt}';
	// 좋아요 아이디 체크
	function checkId() {
		var sessionUserId = '${sessionScope.user.userId}';
			console.log("좋아요 버튼 작동");
			
		if (sessionUserId == 'null' || sessionUserId == '') {
			Swal.fire('로그인 후 좋아요가 가능합니다')
			return;
		}
		
		 console.log("펀딩 번호" + ${funding.fundingno} )
		 console.log("아이디" + sessionUserId )
		$.ajax({
			url : "clickLike",
			type : "POST",
			data : {
				fundingno : ${funding.fundingno},
				Id : sessionUserId
			},
			success : function(cnt) {
				$("#likeButton").empty(); // 기존 image 지우기
				
				var tagHtml = '';
				
				if(isLiked == 0){
					isLiked = 1;  // 좋아요 상태로 바꾸기
					tagHtml = '<a><img src = "../resources/img/fullheart.png" id="unlike">';
				} else {
					isLiked = 0; // 해제 상태로 바꾸기
					tagHtml = '<a><img src = "../resources/img/emptyheart.png" id="like">';
				}
				$("#likeButton").append(tagHtml);
			},
			error:function(e){
				console.log("ajax는 일단 들어옴 but 실패");
				console.log("error data : " + e)
			}
		});
		
	}
		
</script>

<script>

$(function(){ 
	
	// 로드 되면 좋아요 버튼 나타내기
	var isLiked = '${isliked}';  // 1:좋아요, 0:아님
	var cnt =  '${likedCnt}';
	var tagHtml = '';
	
	if(isLiked == 1){// 1:좋아요, 0:아님
		tagHtml = '<img src = "../resources/img/fullheart.png" id="unlike">';
	} else {// 0:아님
		tagHtml = '<img src = "../resources/img/emptyheart.png" id="like">';
	}
	$("#likeButton").append(tagHtml);
	
	
});
</script>
</body>
</html>