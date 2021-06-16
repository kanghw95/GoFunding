
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
								<strong class="FundingDetailSummary_number">62</strong>%
							</div>
							<div class="FundingDetailSummary_bar">
								<span class="FundingDetailSummary_current" style="width: 62%;"></span>
							</div>
							<span class="FundingDetailSummary_goal">
							<span class="FundingDetailSummary_number">${funding.fundingprice}</span>원 목표
							</span>
							<span class="FundingDetailSummary_amount">
							<strong class="FundingDetailSummary_number">624,000</strong>원
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
								<button type="button" class="FundingDetailSummary_button_select" aria-expanded="false">
									리워드 선택하기
									<span class="FundingDetailSummary_icon"></span>
								</button>
							</div>
							<div class="FundingDetailSummary_total">
								<div class="FundingDetailSummary_count">
									총 수량<span class="FundingDetailSummary_number">0</span>개
								</div>
								<div class="FundingDetailSummary_amount">
									<strong class="FundingDetailSummary_name">총 금액</strong>
									<strong class="FundingDetailSummary_description">
									<span class="FundingDetailSummary_number">0</span>원</strong>
								</div>
							</div>
							<div class="FundingDetailSummary_delivery">
								<span class="FundingDetailSummary_name">배송비</span>
								<span class="FundingDetailSummary_amount">무료</span>
							</div>
						</div>
						<div class="FundingDetailSummary_button_area">
							<button type="button"
								class="FundingDetailSummary_button_join"
								aria-expanded="false" aria-controls="wa_option"
								aria-hidden="false">펀딩 참여하기</button>
							<a href=":;0"
								class="naver-splugin Social_wrap FundingDetailSummary_button_share"
								role="button" aria-label="공유하기" aria-hidden="false"
								data-style="unity-v2" data-blog-source-form="2"
								splugin-id="9881009287"><svg width="25" height="22"
									viewBox="0 0 25 22">
								</svg></a>
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
									<strong class="FundingDetailEditorParagraph_title">일상의
										신발에 따뜻한 생각을 담은 발걸음 프로젝트</strong>
									<p class="FundingDetailEditorParagraph_content">'점프
										1'은 누구나 차별 없는 사회를 꿈꾸는 소셜벤처 ‘점프’와 세상의 모든 예쁜 신발을 생각하는 맞춤형 신발 플랫폼
										그룹 ‘신발연구소’가 협업해 만든 스니커즈 브랜드입니다. 이 신발이 당신의 발걸음을 응원하면 좋겠다는 생각,
										당신이 구입한 신발 하나가 누군가의 발걸음과 함께하면 좋겠다는 마음으로 시작했습니다. 화이트 색상의 군더더기
										없는 디자인, 친환경적인 마이크로 화이버 소재와 쿠션감 뛰어난 인솔 등 좋은 소재를 사용했습니다. 신발이
										가져야할 패션과 기능 외에 ‘함께 걷는 사회’라는 우리의 꿈을 담은 특별한 스니커즈 '점프1'을 만나보세요.</p>
									<div class="FundingDetailEditorSingleImage_wrap">
										<img
											src=""
											alt="" width="" height=""
											class="FundingDetailEditorSingleImage_image">
									</div>
									<div
										class="FundingDetailEditorTitle_wrap FundingDetailEditorTitle_type_b">
										<strong class="FundingDetailEditorTitle_text">펀딩
											후원금 사용계획</strong>
									</div>
									<p class="FundingDetailEditorParagraph_content">점프
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
							<section class="FundingDetailStoryContent_guide">
								<h4 class="FundingDetailStoryContent_title">결제방법 및 배송 안내</h4>
								<div class="FundingDetailStoryContent_content">
									<ul class="FundingDetailStoryContent_list_guide">
										<li class="FundingDetailStoryContent_item">리워드는 해당 프로젝트 개설자가 제공합니다.</li>
										<li class="FundingDetailStoryContent_item">100% 달성 시에만 아래 지정일에 결제됩니다.</li>
									</ul>
									<strong class="FundingDetailStoryContent_subtitle__mm0mM">
									결제 및 발송 예정일</strong>
									<ul class="FundingDetailStoryContent_list_date__1xfUX">
										<li class="FundingDetailStoryContent_item">
											<span class="FundingDetailStoryContent_text FundingDetailStoryContent_highlight">
											1차 결제 : 2021년 6월 28일, 예상 발송일 : 2021년 7월 5일
											</span>
										</li>
										<li class="FundingDetailStoryContent_item">
											<span class="FundingDetailStoryContent_text">
											2차 결제 : 2021년 7월 16일, 예상 발송일 : 2021년 7월 23일
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
									<li class="FundingDetailRewardList_item">
									<strong class="FundingDetailRewardList_amount_">
										<span class="FundingDetailRewardList_number">원</span>펀딩참여
									</strong>
									<div class="FundingDetailRewardList_text_">
											<strong class="FundingDetailRewardList_name">
											점프1 (스니커즈 1EA+사은품 핸드폰 스트랩1+추가끈1)
											</strong>
											<div class="FundingDetailRewardList_count">
												<strong>89</strong>개 남음
											</div>
											<ul class="FundingDetailRewardList_information">
												<li class="FundingDetailRewardList_item_information">현재명 펀딩 참여</li>
												<li class="FundingDetailRewardList_item_information">
													<strong class="FundingDetailRewardList_highlight">
													<span class="FundingDetailRewardList_date">발송예상일</span>2021.7.5
													</strong>
												</li>
											</ul>
										</div></li>
									<li class="FundingDetailRewardList_item">
										<strong class="FundingDetailRewardList_amount_">
											<span class="FundingDetailRewardList_number">원</span>펀딩 참여
										</strong>
									<div class="FundingDetailRewardList_text_">
											<strong class="FundingDetailRewardList_name">
												점프1 커플백(스니커즈 2EA+사은품 핸드폰 스트랩2+추가끈2)
											</strong>
											<div class="FundingDetailRewardList_count">
												<strong>99</strong>개 남음
											</div>
											<ul class="FundingDetailRewardList_information">
												<li class="FundingDetailRewardList_item_information">
												현재 1명 펀딩 참여
												</li>
												<li class="FundingDetailRewardList_item_information">
													<strong class="FundingDetailRewardList_highlight">
														<span class="FundingDetailRewardList_date">발송예상일</span>2021.7.5
													</strong>
												</li>
											</ul>
										</div></li>
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
</body>
</html>