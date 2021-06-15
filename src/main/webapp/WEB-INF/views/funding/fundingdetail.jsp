
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/fundingdetail_top/fundingdetail_cover.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/fundingdetail_top/fundingdetail_sumary.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/fundingdetail_top/fundingdetail_profile.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/fundingdetail_top/fundingdetail_chioce.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/fundingdetail_tap.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/fundingdetail_content.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/fundingdetail_reword.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<div class="wrap">
		<div role="main" id="content" class="content">
			<div>
				<div class="FundingDetailTop_wrap">
					<div class="FundingDetailCover_wrap">
						<div
							class="slick-slider FundingDetailCover_list_image slick-initialized">
							<div class="slick-list">
								<div class="slick-track"
									style="width: 750px; opacity: 1; transform: translate3d(0px, 0px, 0px);">
									<div data-index="0"
										class="slick-slide slick-active slick-center slick-current"
										tabindex="-1" aria-hidden="false"
										style="outline: none; width: 750px;">
										<div>
											<div class="FundingDetailCover_thumbnail__3EBD3"
												tabindex="-1" style="width: 100%; display: inline-block;">
												<img
													src="<%=request.getContextPath() %>/resources/fundingimg/${funding.fundingtitle}.jpg"
													width="" height="" alt=""
													class="FundingDetailCover_image__3JSh-">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="FundingDetailSummary_summary">

						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						<fmt:parseDate value="${today}" var="strPlanDate"
							pattern="yyyy-MM-dd" />
						<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}"
							integerOnly="true" var="strDate"></fmt:parseNumber>
						<fmt:parseDate value="${funding.fundingfin}" var="endPlanDate"
							pattern="yyyy-MM-dd" />
						<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}"
							integerOnly="true" var="endDate"></fmt:parseNumber>

						<strong class="FundingDetailSummary_dday__6d9qe">D-${endDate - strDate}</strong>
						<h3 class="FundingDetailSummary_title__3zmN4">${funding.fundingtitle}</h3>
						<div class="FundingDetailSummary_graph__3tXzw">
							<div class="FundingDetailSummary_rate__4Rz_M">
								<strong class="FundingDetailSummary_number__3xyc9">62</strong>%
							</div>
							<div class="FundingDetailSummary_bar__1wact">
								<span class="FundingDetailSummary_current__2bGJi"
									style="width: 62%;"></span>
							</div>
							<span class="FundingDetailSummary_goal__2Yfil"> <span
								class="FundingDetailSummary_number__3xyc9">${funding.fundingprice}</span>원
								목표
							</span> <span class="FundingDetailSummary_amount__7Ploe"> <strong
								class="FundingDetailSummary_number__3xyc9">624,000</strong>원
							</span>
						</div>
					</div>
					<div class="FundingDetailSummary_profile__300Ph">
						<div class="FundingDetailSummary_thumbnail__2b070">
							<div class="FundingDetailSummary_image__qODvx"
								style="background-image: url(&quot;https://happybean-phinf.pstatic.net/20210603_58/1622698284928gx2QN_JPEG/pr.jpg&quot;);"></div>
						</div>
						<div class="FundingDetailSummary_text__2ncys">
							<span class="FundingDetailSummary_name__1B3YW">${funding.maker}</span><span
								class="FundingDetailSummary_introduction__3Zzxo">소셜벤처 점프와
								신발연구소의 콜라보</span>
						</div>
					</div>
					<div class="FundingDetailSummary_reward__37UNd">
						<div class="FundingDetailSummary_reward_inner__RRaVg">
							<div class="FundingDetailSummary_select__11YDc">
								<button type="button"
									class="FundingDetailSummary_button_select__z82SF"
									aria-expanded="false">
									리워드 선택하기<span class="FundingDetailSummary_icon__nPdnD"></span>
								</button>
							</div>
							<div class="FundingDetailSummary_total__1G7lf">
								<div class="FundingDetailSummary_count__1muox">
									총 수량<span class="FundingDetailSummary_number__3xyc9">0</span>개
								</div>
								<div class="FundingDetailSummary_amount__7Ploe">
									<strong class="FundingDetailSummary_name__1B3YW">총 금액</strong><strong
										class="FundingDetailSummary_description__2gvz4"><span
										class="FundingDetailSummary_number__3xyc9">0</span>원</strong>
								</div>
							</div>
							<div class="FundingDetailSummary_delivery__1fPO9">
								<span class="FundingDetailSummary_name__1B3YW">배송비</span><span
									class="FundingDetailSummary_amount__7Ploe">무료</span>
							</div>
						</div>
						<div class="FundingDetailSummary_button_area__3AU_L">
							<button type="button"
								class="FundingDetailSummary_button_join__mOiIi"
								aria-expanded="false" aria-controls="wa_option"
								aria-hidden="false">펀딩 참여하기</button>
							<a href=":;0"
								class="naver-splugin Social_wrap__2vzNR FundingDetailSummary_button_share__257Pl"
								role="button" aria-label="공유하기" aria-hidden="false"
								data-style="unity-v2" data-blog-source-form="2"
								splugin-id="9881009287"><svg width="25" height="22"
									viewBox="0 0 25 22">
									<path fill="currentColor" fill-rule="nonzero"
										d="M17.23 4.309V.5a.5.5 0 0 1 .846-.362l6.77 6.462a.5.5 0 0 1 0 .723l-6.77 6.462a.5.5 0 0 1-.845-.362V9.616h-3.192c-2.335 0-4.13.7-5.471 1.865a6.626 6.626 0 0 0-1.137 1.27 3.921 3.921 0 0 0-.32.543c-.23.516-1.005.315-.955-.248.44-4.976 3.599-8.737 8.03-8.737h3.045zm1-2.64v3.14a.5.5 0 0 1-.5.5h-3.543c-3.24 0-5.727 2.351-6.671 5.783.123-.122.255-.244.396-.366 1.519-1.32 3.546-2.11 6.127-2.11h3.692a.5.5 0 0 1 .5.5v3.14l5.545-5.293-5.545-5.294zm.847 19.255V15.27h1v6.654H0V4.31h6.654v1H1v15.615h18.077z"></path></svg></a>
						</div>

					</div>
				</div>
				<div class="FundingDetailTab_wrap__wZXxP">
					<div class="FundingDetailTab_inner__12OmQ">
						<ul role="tablist" class="FundingDetailTab_list__-hYbS">
							<li class="FundingDetailTab_item__1sN0t" role="presentation"><a
								role="tab" id="wa_story_tab" class="FundingDetailTab_tab__2PFWI"
								aria-controls="wa_story_tabpanel" aria-current="true"
								href="#">스토리</a></li>
							<li class="FundingDetailTab_item__1sN0t" role="presentation"><a
								role="tab" id="wa_reward_tab"
								class="FundingDetailTab_tab__2PFWI"
								aria-controls="wa_reward_tabpanel" aria-current="false"
								href="#">리워드</a></li>
							<li class="FundingDetailTab_item__1sN0t" role="presentation"><a
								role="tab" id="wa_review_tab"
								class="FundingDetailTab_tab__2PFWI"
								aria-controls="wa_review_tabpanel" aria-current="false"
								href="#">소식∙후기</a></li>
						</ul>
					</div>
				</div>

				<div class="">
					<div class="FundingDetailStoryContent_wrap__1XbqX">
						<div id="wa_story_tabpanel"
							class="FundingDetailStoryContent_wrap_content__3tHbO"
							role="tabpanel" aria-labelledby="wa_story_tab">
							<article class="FundingDetailStoryContent_article__1hUIA">
								<h4 class="blind">스토리 본문</h4>
								<div class="FundingDetailArticle_wrap__3_Ij_">
									<strong class="FundingDetailEditorParagraph_title__2o5M9">일상의
										신발에 따뜻한 생각을 담은 발걸음 프로젝트</strong>
									<p class="FundingDetailEditorParagraph_content__3l1rd">'점프
										1'은 누구나 차별 없는 사회를 꿈꾸는 소셜벤처 ‘점프’와 세상의 모든 예쁜 신발을 생각하는 맞춤형 신발 플랫폼
										그룹 ‘신발연구소’가 협업해 만든 스니커즈 브랜드입니다. 이 신발이 당신의 발걸음을 응원하면 좋겠다는 생각,
										당신이 구입한 신발 하나가 누군가의 발걸음과 함께하면 좋겠다는 마음으로 시작했습니다. 화이트 색상의 군더더기
										없는 디자인, 친환경적인 마이크로 화이버 소재와 쿠션감 뛰어난 인솔 등 좋은 소재를 사용했습니다. 신발이
										가져야할 패션과 기능 외에 ‘함께 걷는 사회’라는 우리의 꿈을 담은 특별한 스니커즈 '점프1'을 만나보세요.</p>
									<div class="FundingDetailEditorSingleImage_wrap__1YfX0">
										<img
											src=""
											alt="" width="" height=""
											class="FundingDetailEditorSingleImage_image__3mvFD">
									</div>
									<div
										class="FundingDetailEditorTitle_wrap__3316t FundingDetailEditorTitle_type_b__3scOh">
										<strong class="FundingDetailEditorTitle_text__3YaGM">펀딩
											후원금 사용계획</strong>
									</div>
									<p class="FundingDetailEditorParagraph_content__3l1rd">점프
										1은 다양한 배경의 아이들과 함께 뜁니다. 더 밝고, 자신감 있게 사회와 통합되고 성장할 수 있도록,
										판매수익금은 &lt;점프 1 스포츠 클럽&gt; 운영에 사용됩니다. 스포츠클럽은 ‘세상 아이들을 가장 많이 뛰어
										놀게 하자’는 목표를 가진 점프의 휴브 사업팀을 주축으로 운영되어, 1개의 클럽에 지역아동센터 아동 20여명이
										참여하여 양성된 대학생 코치들과 함께 다양한 놀이와 팀플레이를 경험할 수 있습니다. 체육활동을 통해 육체적,
										정신적 건강을 지켜 나갈 수 있도록, 다양한 팀스포츠를 통해 경쟁보다는 협력을 이루어 “경쟁력”을 갖춘 아이로
										성장 할 수 있도록 지원할 예정입니다. 점프 1 운동화 400켤레의 판매 수익금이 모여 6개월 동안 지역아동센터
										아동·청소년 20명으로 구성된 1개의 스포츠클럽을 운영할 수 있습니다. 400켤레 이상 판매가 이루어질 경우
										스포츠 클럽을 더욱 장기적으로 운영할 수 있습니다.</p>
								</div>
							</article>
							<section class="FundingDetailStoryContent_guide__3gXKm">
								<h4 class="FundingDetailStoryContent_title__1UlR1">결제방법 및
									배송 안내</h4>
								<div class="FundingDetailStoryContent_content__2tZOu">
									<ul class="FundingDetailStoryContent_list_guide__1yv-2">
										<li class="FundingDetailStoryContent_item__3K7vK">리워드는 해당
											프로젝트 개설자가 제공합니다.</li>
										<li class="FundingDetailStoryContent_item__3K7vK">100% 달성
											시에만 아래 지정일에 결제됩니다.</li>
									</ul>
									<strong class="FundingDetailStoryContent_subtitle__mm0mM">
									결제 및 발송 예정일</strong>
									<ul class="FundingDetailStoryContent_list_date__1xfUX">
										<li class="FundingDetailStoryContent_item__3K7vK"><span
											class="FundingDetailStoryContent_text__NGuaA FundingDetailStoryContent_highlight__i7m7x">1차
												결제 : 2021년 6월 28일, 예상 발송일 : 2021년 7월 5일</span></li>
										<li class="FundingDetailStoryContent_item__3K7vK"><span
											class="FundingDetailStoryContent_text__NGuaA">2차 결제 :
												2021년 7월 16일, 예상 발송일 : 2021년 7월 23일</span></li>
									</ul>
								</div>
							</section>
							<section
								class="FundingDetailStoryParticipationTabPanel_wrap__2aZcW">
								<h4 class="FundingDetailStoryParticipationTabPanel_title__2B9Vb">참여내역</h4>
								<p class="FundingDetailStoryParticipationList_summary__1sECw">
									<strong
										class="FundingDetailStoryParticipationList_number__1gyBm">총
										11명</strong>이 참여하였습니다.
								</p>
								<ul class="FundingDetailStoryParticipationList_wrap__A1rLZ">
									<li class="FundingDetailStoryParticipationList_item__1iJaL"><div
											class="FundingDetailStoryParticipationList_thumbnail__CeNP6"
											style="background-image: url(&quot;https://ssl.pstatic.net/happyimg2/img3/social/comment/img/default_profile.jpg&quot;);"></div>
										<div class="FundingDetailStoryParticipationList_date__1r9Xl">2021.06.15
											09:08:14</div>
										<div class="FundingDetailStoryParticipationList_user__3vIKG">
											<span class="FundingDetailStoryParticipationList_name__1sXki">kal53님</span><span
												class="FundingDetailStoryParticipationList_amount__gAlLq"><strong
												class="FundingDetailStoryParticipationList_number__1gyBm">200,100</strong>원
												참여</span>
										</div></li>
								</ul>
								<nav class="Pagination_wrap__882H9" role="navigation"
									aria-label="페이지 네비게이션">
									<button type="button" class="Pagination_previous__3ZVHx"
										aria-label="이전" disabled=""></button>
									<button class="Pagination_link__2lLK1" aria-current="true"
										aria-label="1페이지로 이동">1</button>
									<button class="Pagination_link__2lLK1" aria-current="false"
										aria-label="2페이지로 이동">2</button>
									<button type="button" class="Pagination_next__1OXio"
										aria-label="다음"></button>
								</nav>
							</section>
						</div>
						<section class="FundingDetailStoryContent_wrap_reward__3HEdK">
							<div class="FundingDetailRewardList_wrap__1v0li">
								<h4 class="FundingDetailRewardList_title__dRZyj">리워드 안내</h4>
								<ul class="FundingDetailRewardList_list__b9RmD">
									<li class="FundingDetailRewardList_item__b87gY">
									<strong class="FundingDetailRewardList_amount__2MFRL">
										<span class="FundingDetailRewardList_number__36CIR">69,000원</span>펀딩참여</strong>
									<div class="FundingDetailRewardList_text__27Yme">
											<strong class="FundingDetailRewardList_name__UVKT2">점프1
												(스니커즈 1EA+사은품 핸드폰 스트랩1+추가끈1) </strong>
											<div class="FundingDetailRewardList_count__2qzY_">
												<strong>89</strong>개 남음
											</div>
											<ul class="FundingDetailRewardList_information__3xvMk">
												<li class="FundingDetailRewardList_item_information__1lV1C">현재
													11명 펀딩 참여</li>
												<li class="FundingDetailRewardList_item_information__1lV1C"><strong
													class="FundingDetailRewardList_highlight__3rANs"><span
														class="FundingDetailRewardList_date__2eIhm">발송예상일</span>2021.7.5</strong></li>
											</ul>
										</div></li>
									<li class="FundingDetailRewardList_item__b87gY"><strong
										class="FundingDetailRewardList_amount__2MFRL"><span
											class="FundingDetailRewardList_number__36CIR">원</span>펀딩
											참여</strong>
									<div class="FundingDetailRewardList_text__27Yme">
											<strong class="FundingDetailRewardList_name__UVKT2">점프1
												커플백(스니커즈 2EA+사은품 핸드폰 스트랩2+추가끈2) </strong>
											<div class="FundingDetailRewardList_count__2qzY_">
												<strong>99</strong>개 남음
											</div>
											<ul class="FundingDetailRewardList_information__3xvMk">
												<li class="FundingDetailRewardList_item_information__1lV1C">현재
													1명 펀딩 참여</li>
												<li class="FundingDetailRewardList_item_information__1lV1C"><strong
													class="FundingDetailRewardList_highlight__3rANs"><span
														class="FundingDetailRewardList_date__2eIhm">발송예상일</span>2021.7.5</strong></li>
											</ul>
										</div></li>
								</ul>
								<a class="FundingDetailRewardList_link__3d3kh"
									href="/fundings/detail/F148/rewards">자세히 보기<span
									class="FundingDetailRewardList_icon__63Rne"></span></a>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>