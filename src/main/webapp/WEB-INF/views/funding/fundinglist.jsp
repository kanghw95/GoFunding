<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>SPROUT! 새싹나눔</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/funding/fundinglist.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="wrapper">
	<div role="main" id="content" class="content">
		<!-- 메인 슬라이드 -->
		<div class="slideshow-container" style="width: 1140px; 	height: 250px; position: static; margin: auto; margin-top: 50px; text-align: center;" >
			 <div id="myCarousel" class="carousel slide" data-ride="carousel">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			      <li data-target="#myCarousel" data-slide-to="2"></li>
			      <li data-target="#myCarousel" data-slide-to="3"></li>
			      <li data-target="#myCarousel" data-slide-to="4"></li>
			    </ol>
	
			    <!-- Wrapper for slides -->
			    <div class="carousel-inner" >
			      <div class="item active">
			        <img src="resources/bannerimg/1.jpg" alt="Los Angeles" style="width:100%;">
			     </div>
			
			      <div class="item">
			        <img src="resources/bannerimg/2.png" alt="Chicago" style="width:100%;">
			      </div>
			    
			      <div class="item">
			        <img src="resources/bannerimg/3.jpg" alt="New york" style="width:100%;">
			      </div>
			      
			            <div class="item">
			        <img src="resources/bannerimg/4.jpg" alt="New york" style="width:100%;">
			      </div>
			      
			            <div class="item">
			        <img src="resources/bannerimg/5.png" alt="New york" style="width:100%;">
			      </div>
			    </div>
			
			    <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel" data-slide="prev" style="width: 5%; background-image: none;">
			      <span class="glyphicon glyphicon-chevron-left"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel" data-slide="next" style="width: 5%; background-image: none;">
			      <span class="glyphicon glyphicon-chevron-right"></span>
			      <span class="sr-only">Next</span>
			    </a>
		  </div>
		</div>

	
		<ul class="fundingcategory">
			<li class="fundingcategory_item">
			<input type="radio" id="funding_home_tab_all" name="funding" role="tab" aria-controls="funding_tab_panel" class="fundingcategory_input">
			<label for="funding_home_tab_all" class="fundingcategory_label">전체</label>
			</li>
	
			<li class="fundingcategory_item">
			<input type="radio" id="funding_home_tab_1" name="funding" role="tab" aria-controls="funding_tab_panel" class="fundingcategory_input">
			<label for="funding_home_tab_1" class="fundingcategory_label">일자리 창출</label>
			</li>
			
			<li class="fundingcategory_item">
			<input type="radio" id="funding_home_tab_2" name="funding" role="tab" aria-controls="funding_tab_panel" class="fundingcategory_input">
			<label for="funding_home_tab_2" class="fundingcategory_label">공정 무역</label>
			</li>
			
			<li class="fundingcategory_item">
			<input type="radio" id="funding_home_tab_3" name="funding" role="tab" aria-controls="funding_tab_panel" class="fundingcategory_input">
			<label for="funding_home_tab_3" class="fundingcategory_label">친환경</label>
			</li>
			
			<li class="fundingcategory_item">
			<input type="radio" id="funding_home_tab_4" name="funding" role="tab" aria-controls="funding_tab_panel" class="fundingcategory_input">
			<label for="funding_home_tab_4" class="fundingcategory_label">기부</label>
			</li>
			
			<li class="fundingcategory_item">
			<input type="radio" id="funding_home_tab_5" name="funding" role="tab" aria-controls="funding_tab_panel" class="fundingcategory_input">
			<label for="funding_home_tab_5" class="fundingcategory_label">작은 가게</label>
			</li>
			
			<li class="fundingcategory_item">
			<input type="radio" id="funding_home_tab_6" name="funding" role="tab" aria-controls="funding_tab_panel" class="fundingcategory_input">
			<label for="funding_home_tab_6" class="fundingcategory_label">미디어</label>
			</li>
			
			<li class="fundingcategory_item">
			<input type="radio" id="funding_home_tab_7" name="funding" role="tab" aria-controls="funding_tab_panel" class="fundingcategory_input">
			<label for="funding_home_tab_7" class="fundingcategory_label">창작자</label>
			</li>
		</ul>
	
	<section id="funding_tab_panel" class="fundingcontent_content" role="tabpanel" aria-labelledby="">
	
	<div class="fundingcontent_filter">
		<div class="fundingcontent_checkbox">
			<input type="checkbox" id="showendfunding" class="fundingcontent_input">
			<label for="showendfunding" class="fundingcontent_label">
				<span class="fundingcontent_icon"></span>종료펀딩만 보기
			</label>
			
			<div class="fundingContent_select">
				<div class="SelectArea_select" style="visibility: visible;">
					<button  class="SelectArea_button" id="SelectArea_button" aria-haspopup="listbox" aria-expanded="false">최신 순</button>
						<ul style="font-size: 14px;" class="SelectArea_select_list" id="SelectArea_select_list" role="listbox" aria-hidden="true">
						
							<li role="option" class="SelectArea_select_item" id="LATEST" tabindex="0" data-value="LATEST" aria-selected="true">
								<span class="SelectArea_text__1tG5r">최신 순</span>
							</li>
							
							<li role="option" class="SelectArea_select_item" id="PARTICIPATION_AMOUNT" tabindex="0" data-value="PARTICIPATION_AMOUNT" aria-selected="false">
								<span class="SelectArea_text__1tG5r">참여금액 순</span>
							</li>
							
							<li role="option" class="SelectArea_select_item" id="END_APPROACH" tabindex="0" data-value="END_APPROACH" aria-selected="false">
								<span class="SelectArea_text__1tG5r">종료임박 순</span>
							</li>
							
						</ul>
				</div>
			</div>
		</div>
		
		<ul id="tab_all" class="fundingContent_list">
			<c:if test="${fundinglist eq null}">
				<tr>
					<td colspan="6" align="center"><br><br>펀딩이 존재하지않습니다.<br><br></td>
				</tr>
			</c:if>

			<c:if test="${fundinglist ne null}">
				<c:forEach var="vo" items="${fundinglist}" varStatus="status">
					<li class="fundingContent_item">
							<a href="funding/detail?no=${vo.fundingno}" class="fundingCard_wrap">
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">
										<jsp:useBean id="currTime" class="java.util.Date" />

										<jsp:useBean id="now" class="java.util.Date" />
										<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
										<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
										<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
										<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
										
										<c:choose>
											<c:when test="${(endDate-strDate) gt 0 }">
												<span class="fundingCard_date">${endDate - strDate } 일 남음</span>
											</c:when>
											<c:otherwise>
											<span class="fundingCard_date">종료</span>
											</c:otherwise>
										</c:choose>
											<span class="fundingCard_amount"><strong class="FundingCard_number__n_hbd"> <fmt:formatNumber value="${vo.currentprice}" pattern="#,###,###"/></strong> 원</span>
										</div>
									</div>
							</a>
					</li>
					
				</c:forEach>
			</c:if>
			

		</ul>
		
		<ul id="tab_1" class="fundingContent_list" style="display: none;">
			<c:if test="${fundinglist eq null}">
				<tr>
					<td colspan="6" align="center"><br><br>펀딩이 존재하지않습니다.<br><br></td>
				</tr>
			</c:if>
			<c:if test="${fundinglist ne null}">
				<c:forEach var="vo" items="${fundinglist}" varStatus="status">
					<c:if test="${vo.fundingcategory eq '일자리 창출'}">
						<li class="fundingContent_item" >
							<a href="funding/detail?no=${vo.fundingno}" class="fundingCard_wrap">
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">
										<jsp:useBean id="currTime1" class="java.util.Date" />

										<jsp:useBean id="now1" class="java.util.Date" />
										<fmt:formatDate value="${now1}" pattern="yyyy-MM-dd" var="today" />
										<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
										<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
										<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
										
										<c:choose>
											<c:when test="${(endDate-strDate) gt 0 }">
												<span class="fundingCard_date">${endDate - strDate } 일 남음</span>
											</c:when>
											<c:otherwise>
											<span class="fundingCard_date">종료</span>
											</c:otherwise>
										</c:choose>
											<span class="fundingCard_amount"><strong class="FundingCard_number__n_hbd"> <fmt:formatNumber value="${vo.currentprice}" pattern="#,###,###"/></strong> 원</span>
										</div>
									</div>
							</a>
						</li>
					</c:if>
				</c:forEach>
			</c:if>
			

		</ul>
		
		<ul id="tab_2" class="fundingContent_list" style="display: none;">
			<c:if test="${fundinglist eq null}">
				<tr>
					<td colspan="6" align="center"><br><br>펀딩이 존재하지않습니다.<br><br></td>
				</tr>
			</c:if>
			<c:if test="${fundinglist ne null}">
				<c:forEach var="vo" items="${fundinglist}" varStatus="status">
					<c:if test="${vo.fundingcategory eq '공정 무역'}">
						<li class="fundingContent_item" >
							<a href="funding/detail?no=${vo.fundingno}" class="fundingCard_wrap">
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">
										<jsp:useBean id="currTime2" class="java.util.Date" />

										<jsp:useBean id="now2" class="java.util.Date" />
										<fmt:formatDate value="${now2}" pattern="yyyy-MM-dd" var="today" />
										<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
										<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
										<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
										
										<c:choose>
											<c:when test="${(endDate-strDate) gt 0 }">
												<span class="fundingCard_date">${endDate - strDate } 일 남음</span>
											</c:when>
											<c:otherwise>
											<span class="fundingCard_date">종료</span>
											</c:otherwise>
										</c:choose>
											<span class="fundingCard_amount"><strong class="FundingCard_number__n_hbd"> <fmt:formatNumber value="${vo.currentprice}" pattern="#,###,###"/></strong> 원</span>
										</div>
									</div>
							</a>
						</li>
					</c:if>
				</c:forEach>
			</c:if>
			

		</ul>
		
		
		<ul id="tab_3" class="fundingContent_list" style="display: none;">
			<c:if test="${fundinglist eq null}">
				<tr>
					<td colspan="6" align="center"><br><br>펀딩이 존재하지않습니다.<br><br></td>
				</tr>
			</c:if>
			<c:if test="${fundinglist ne null}">
				<c:forEach var="vo" items="${fundinglist}" varStatus="status">
					<c:if test="${vo.fundingcategory eq '친환경'}">
						<li class="fundingContent_item" >
							<a href="funding/detail?no=${vo.fundingno}" class="fundingCard_wrap">
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">
										<jsp:useBean id="currTime3" class="java.util.Date" />

										<jsp:useBean id="now3" class="java.util.Date" />
										<fmt:formatDate value="${now2}" pattern="yyyy-MM-dd" var="today" />
										<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
										<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
										<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
										
										<c:choose>
											<c:when test="${(endDate-strDate) gt 0 }">
												<span class="fundingCard_date">${endDate - strDate } 일 남음</span>
											</c:when>
											<c:otherwise>
											<span class="fundingCard_date">종료</span>
											</c:otherwise>
										</c:choose>
											<span class="fundingCard_amount"><strong class="FundingCard_number__n_hbd"> <fmt:formatNumber value="${vo.currentprice}" pattern="#,###,###"/></strong> 원</span>
										</div>
									</div>
							</a>
						</li>
					</c:if>
				</c:forEach>
			</c:if>
			

		</ul>
		
		
				<ul id="tab_4" class="fundingContent_list" style="display: none;">
			<c:if test="${fundinglist eq null}">
				<tr>
					<td colspan="6" align="center"><br><br>펀딩이 존재하지않습니다.<br><br></td>
				</tr>
			</c:if>
			<c:if test="${fundinglist ne null}">
				<c:forEach var="vo" items="${fundinglist}" varStatus="status">
					<c:if test="${vo.fundingcategory eq '기부'}">
						<li class="fundingContent_item" >
							<a href="funding/detail?no=${vo.fundingno}" class="fundingCard_wrap">
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">
										<jsp:useBean id="currTime4" class="java.util.Date" />

										<jsp:useBean id="now4" class="java.util.Date" />
										<fmt:formatDate value="${now4}" pattern="yyyy-MM-dd" var="today" />
										<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
										<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
										<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
										
										<c:choose>
											<c:when test="${(endDate-strDate) gt 0 }">
												<span class="fundingCard_date">${endDate - strDate } 일 남음</span>
											</c:when>
											<c:otherwise>
											<span class="fundingCard_date">종료</span>
											</c:otherwise>
										</c:choose>
											<span class="fundingCard_amount"><strong class="FundingCard_number__n_hbd"> <fmt:formatNumber value="${vo.currentprice}" pattern="#,###,###"/></strong> 원</span>
										</div>
									</div>
							</a>
						</li>
					</c:if>
				</c:forEach>
			</c:if>
			

		</ul>
		
		
				<ul id="tab_5" class="fundingContent_list" style="display: none;">
			<c:if test="${fundinglist eq null}">
				<tr>
					<td colspan="6" align="center"><br><br>펀딩이 존재하지않습니다.<br><br></td>
				</tr>
			</c:if>
			<c:if test="${fundinglist ne null}">
				<c:forEach var="vo" items="${fundinglist}" varStatus="status">
					<c:if test="${vo.fundingcategory eq '작은 가게'}">
						<li class="fundingContent_item" >
							<a href="funding/detail?no=${vo.fundingno}" class="fundingCard_wrap">
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">
										<jsp:useBean id="currTime5" class="java.util.Date" />

										<jsp:useBean id="now5" class="java.util.Date" />
										<fmt:formatDate value="${now2}" pattern="yyyy-MM-dd" var="today" />
										<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
										<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
										<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
										
										<c:choose>
											<c:when test="${(endDate-strDate) gt 0 }">
												<span class="fundingCard_date">${endDate - strDate } 일 남음</span>
											</c:when>
											<c:otherwise>
											<span class="fundingCard_date">종료</span>
											</c:otherwise>
										</c:choose>
											<span class="fundingCard_amount"><strong class="FundingCard_number__n_hbd"> <fmt:formatNumber value="${vo.currentprice}" pattern="#,###,###"/></strong> 원</span>
										</div>
									</div>
							</a>
						</li>
					</c:if>
				</c:forEach>
			</c:if>
			

		</ul>
		
		
				<ul id="tab_6" class="fundingContent_list" style="display: none;">
			<c:if test="${fundinglist eq null}">
				<tr>
					<td colspan="6" align="center"><br><br>펀딩이 존재하지않습니다.<br><br></td>
				</tr>
			</c:if>
			<c:if test="${fundinglist ne null}">
				<c:forEach var="vo" items="${fundinglist}" varStatus="status">
					<c:if test="${vo.fundingcategory eq '미디어'}">
						<li class="fundingContent_item" >
							<a href="funding/detail?no=${vo.fundingno}" class="fundingCard_wrap">
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">
										<jsp:useBean id="currTime6" class="java.util.Date" />

										<jsp:useBean id="now6" class="java.util.Date" />
										<fmt:formatDate value="${now6}" pattern="yyyy-MM-dd" var="today" />
										<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
										<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
										<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
										
										<c:choose>
											<c:when test="${(endDate-strDate) gt 0 }">
												<span class="fundingCard_date">${endDate - strDate } 일 남음</span>
											</c:when>
											<c:otherwise>
											<span class="fundingCard_date">종료</span>
											</c:otherwise>
										</c:choose>
											<span class="fundingCard_amount"><strong class="FundingCard_number__n_hbd"> <fmt:formatNumber value="${vo.currentprice}" pattern="#,###,###"/></strong> 원</span>
										</div>
									</div>
							</a>
						</li>
					</c:if>
				</c:forEach>
			</c:if>
			

		</ul>
		
				<ul id="tab_7" class="fundingContent_list" style="display: none;">
			<c:if test="${fundinglist eq null}">
				<tr>
					<td colspan="6" align="center"><br><br>펀딩이 존재하지않습니다.<br><br></td>
				</tr>
			</c:if>
			<c:if test="${fundinglist ne null}">
				<c:forEach var="vo" items="${fundinglist}" varStatus="status">
					<c:if test="${vo.fundingcategory eq '창작자'}">
						<li class="fundingContent_item" >
							<a href="funding/detail?no=${vo.fundingno}" class="fundingCard_wrap">
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">
										<jsp:useBean id="currTime7" class="java.util.Date" />

										<jsp:useBean id="now7" class="java.util.Date" />
										<fmt:formatDate value="${now7}" pattern="yyyy-MM-dd" var="today" />
										<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
										<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
										<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
										
										<c:choose>
											<c:when test="${(endDate-strDate) gt 0 }">
												<span class="fundingCard_date">${endDate - strDate } 일 남음</span>
											</c:when>
											<c:otherwise>
											<span class="fundingCard_date">종료</span>
											</c:otherwise>
										</c:choose>
											<span class="fundingCard_amount"><strong class="FundingCard_number__n_hbd"> <fmt:formatNumber value="${vo.currentprice}" pattern="#,###,###"/></strong> 원</span>
										</div>
									</div>
							</a>
						</li>
					</c:if>
				</c:forEach>
			</c:if>
			

		</ul>
		
		
		<button type="button" class="fundingContent_button_more">더보기<span class="fundingcontent_icon"></span></button>
		
		</div>
		</section>
	</div>






<script>
		var fin = 0; // 종료 펀딩만 보기

		// 뒤로가기 버튼시 작동
		window.onpageshow = function(event) {
		if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
		// Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
				$("input:radio[id='funding_home_tab_all']").prop("checked", true);  // 전체 선택하기
						
		        }
		}

		//종류별 보기 탭
		var listbtn = document.getElementById("SelectArea_button");
		var list = document.getElementById("SelectArea_select_list");
		
		listbtn.addEventListener("click",function(){
			
			if(listbtn.getAttribute("aria-expanded") == "false"){
			listbtn.setAttribute("aria-expanded","true");
			list.setAttribute("aria-hidden","false");
			}else{
				listbtn.setAttribute("aria-expanded","false");
				list.setAttribute("aria-hidden","true");
			}
		});

		// 종류별 보기 탭 기능
			var LATEST = $("#LATEST").children('.SelectArea_text__1tG5r').html();
			var PARTICIPATION_AMOUNT = $("#PARTICIPATION_AMOUNT").children('.SelectArea_text__1tG5r').html();
			var END_APPROACH = $("#END_APPROACH").children('.SelectArea_text__1tG5r').html();

			
			 function checkList1(){
					var cat = null;
					console.log(LATEST);
						cat = $("#LATEST").children('.SelectArea_text__1tG5r').html();
						$.ajax({
							url: "funselectCat",
							type: "POST",
							dataType : "text",
							data: {"fin" : fin, "cat" : cat},

							success : function(data){
									console.log(data);
									$("#SelectArea_button").text(cat);
									listbtn.setAttribute("aria-expanded","false");
									list.setAttribute("aria-hidden","true");
									$("#tab_all").html(data);

							},
							error : function(data){
								console.log("ajax는 일단 들어옴 but 실패");
								console.log("error data : " + data)
							}
							})
						}
			 
			 
			 function checkList2(){
				var formData = new FormData();
				var cat = null;
				cat = $("#PARTICIPATION_AMOUNT").children('.SelectArea_text__1tG5r').html();
				console.log(PARTICIPATION_AMOUNT);
				
					$.ajax({
						url: "funselectCat",
						type: "POST",
						dataType : "text",
						data: {"fin" : fin, "cat" : cat},

						success : function(data){
								console.log(data);
								$("#SelectArea_button").text(cat);
								listbtn.setAttribute("aria-expanded","false");
								list.setAttribute("aria-hidden","true");
								$("#tab_all").html(data);

						},
						error : function(data){
							console.log("ajax는 일단 들어옴 but 실패");
							console.log("error data : " + data)
						}
						})
					}
					
					
					
					
			 function checkList3(){
					var cat = null;
					console.log(END_APPROACH);
						cat = $("#END_APPROACH").children('.SelectArea_text__1tG5r').html();
						$.ajax({
							url: "funselectCat",
							type: "POST",
							dataType : "text",
							data: {"fin" : fin, "cat" : cat},

							success : function(data){
									console.log(data);
									$("#SelectArea_button").text(cat);
									listbtn.setAttribute("aria-expanded","false");
									list.setAttribute("aria-hidden","true");
									$("#tab_all").html(data);
							},
							error : function(data){
								console.log("ajax는 일단 들어옴 but 실패");
								console.log("error data : " + data)
							}
							})
						}

			$("#LATEST").on("click", checkList1);
			$("#PARTICIPATION_AMOUNT").on("click", checkList2);
			$("#END_APPROACH").on("click", checkList3);
	

		
		$("#showendfunding").on("click", checkfin);
		
		 function checkfin(){
				var cat = null;
					if(fin == 0){
						fin = 1;
					}else{
						fin = 0;
					}
					$.ajax({
						url: "funselectCat",
						type: "POST",
						dataType : "text",
						data: {"fin" : fin, "cat" : cat},

						success : function(data){
								console.log(data);
								$("#tab_all").html(data);
						},
						error : function(data){
							console.log("ajax는 일단 들어옴 but 실패");
							console.log("error data : " + data)
						}
						})
					}
		
		// 카테고리 이동 버튼
		$("input:radio[id='funding_home_tab_all']").prop("checked", true);  // 전체 선택하기
		let funding_home_tab_all = document.getElementById("funding_home_tab_all");

		<c:forEach var = "i" begin = "1" end = "7">
		let funding_home_tab_${i} = document.getElementById("funding_home_tab_${i}");
		</c:forEach>
		
		let tab_all = document.getElementById("tab_all");
		
		<c:forEach var = "i" begin = "1" end = "7">
		let tab_${i} = document.getElementById("tab_${i}");
		</c:forEach>
		
		//카테고리 이동 버튼
		var funding_tab_panel = document.getElementById("funding_tab_panel");
		
		funding_home_tab_all.addEventListener("click",function(){
					
				funding_tab_panel.setAttribute("aria-labelledby","funding_home_tab_all");
				tab_all.style.display = 'block';	
				<c:forEach var = "i" begin = "1" end = "7">
				tab_${i}.style.display = 'none';
				</c:forEach>
		});
		
		funding_home_tab_1.addEventListener("click",function(){
			
			funding_tab_panel.setAttribute("aria-labelledby","funding_home_tab_1");
			tab_1.style.display = 'block';	
			<c:forEach var = "i" begin = "2" end = "7">
			tab_${i}.style.display = 'none';
			</c:forEach>
			
			tab_all.style.display = 'none';
	});
		
		funding_home_tab_2.addEventListener("click",function(){
			
			funding_tab_panel.setAttribute("aria-labelledby","funding_home_tab_2");
			tab_1.style.display = 'none';	
			tab_2.style.display = 'block';
			<c:forEach var = "i" begin = "3" end = "7">
			tab_${i}.style.display = 'none';
			</c:forEach>
			
			tab_all.style.display = 'none';
	});
		
		funding_home_tab_3.addEventListener("click",function(){
			
			funding_tab_panel.setAttribute("aria-labelledby","funding_home_tab_3");
			tab_1.style.display = 'none';	
			tab_2.style.display = 'none';
			tab_3.style.display = 'block';
			<c:forEach var = "i" begin = "4" end = "7">
			tab_${i}.style.display = 'none';
			</c:forEach>
			
			tab_all.style.display = 'none';
	});
		
		funding_home_tab_4.addEventListener("click",function(){
			
			funding_tab_panel.setAttribute("aria-labelledby","funding_home_tab_4");
			tab_1.style.display = 'none';	
			tab_2.style.display = 'none';
			tab_3.style.display = 'none';
			tab_4.style.display = 'block';
			<c:forEach var = "i" begin = "5" end = "7">
			tab_${i}.style.display = 'none';
			</c:forEach>
			
			tab_all.style.display = 'none';
	});
		
		funding_home_tab_5.addEventListener("click",function(){
			
			funding_tab_panel.setAttribute("aria-labelledby","funding_home_tab_5");
			tab_1.style.display = 'none';	
			tab_2.style.display = 'none';
			tab_3.style.display = 'none';
			tab_4.style.display = 'none';
			tab_5.style.display = 'block';
			tab_6.style.display = 'none';
			tab_7.style.display = 'none';

			tab_all.style.display = 'none';
	});
		
		funding_home_tab_6.addEventListener("click",function(){
			
			funding_tab_panel.setAttribute("aria-labelledby","funding_home_tab_6");
			tab_1.style.display = 'none';	
			tab_2.style.display = 'none';
			tab_3.style.display = 'none';
			tab_4.style.display = 'none';
			tab_5.style.display = 'none';
			tab_6.style.display = 'block';
			tab_7.style.display = 'none';

			tab_all.style.display = 'none';
	});
		
		funding_home_tab_7.addEventListener("click",function(){
			
			funding_tab_panel.setAttribute("aria-labelledby","funding_home_tab_7");
			tab_1.style.display = 'none';	
			tab_2.style.display = 'none';
			tab_3.style.display = 'none';
			tab_4.style.display = 'none';
			tab_5.style.display = 'none';
			tab_6.style.display = 'none';
			tab_7.style.display = 'block';
			
			tab_all.style.display = 'none';
	});
		
		
		

		
</script>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>