<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

		<ul id="tab_all" class="fundingContent_list">
			<c:if test="${fundinglist eq null}">
				<tr>
					<td colspan="6" align="center"><br><br>펀딩이 존재하지않습니다.<br><br></td>
				</tr>
			</c:if>

			<c:if test="${fundinglist ne null}">
				<c:forEach var="vo" items="${fundinglist}" varStatus="status">
							<jsp:useBean id="currTime" class="java.util.Date" />
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
							<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
							<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
							<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
							
							<li class="fundingContent_itemAll">
	
							<form action="funding/detail" id="detail${vo.fundingno}" method="get">
							<c:choose>
								<c:when test="${(endDate-strDate) gt 0 }">
									<a href="#" onclick="detail${vo.fundingno}.submit()" class="fundingCard_wrap">
								</c:when>
								<c:otherwise>
									<a href="#" onclick="detail${vo.fundingno}.submit()" class="fundingCard_wrap" style="background-color:rgba(0, 0,0, 0.1);">
								</c:otherwise>
							</c:choose>	
								<input type="hidden" name="no" value="${vo.fundingno}">
								<c:if test="${sessionScope.user.userId ne null}">
									<input type="hidden" name="Id" value="${sessionScope.user.userId}">
								</c:if>
								<c:if test="${sessionScope.user.userId eq null}">
									<input type="hidden" name="Id" value="">
								</c:if>
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">
										
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
							</form>
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
						<jsp:useBean id="currTime1" class="java.util.Date" />

						<jsp:useBean id="now1" class="java.util.Date" />
						<fmt:formatDate value="${now1}" pattern="yyyy-MM-dd" var="today" />
						<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
						<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
						<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
						<li class="fundingContent_item1">				
							<form action="funding/detail" id="detail1${vo.fundingno}" method="get">
							<c:choose>
								<c:when test="${(endDate-strDate) gt 0 }">
									<a href="#" onclick="detail1${vo.fundingno}.submit()" class="fundingCard_wrap">
								</c:when>
								<c:otherwise>
									<a href="#" onclick="detail1${vo.fundingno}.submit()" class="fundingCard_wrap" style="background-color:rgba(0, 0,0, 0.1);">
								</c:otherwise>
							</c:choose>	
								<input type="hidden" name="no" value="${vo.fundingno}">
								<c:if test="${sessionScope.user.userId ne null}">
									<input type="hidden" name="Id" value="${sessionScope.user.userId}">
								</c:if>
								<c:if test="${sessionScope.user.userId eq null}">
									<input type="hidden" name="Id" value="">
								</c:if>
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">
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
							</form>
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
						<jsp:useBean id="currTime2" class="java.util.Date" />

							<jsp:useBean id="now2" class="java.util.Date" />
							<fmt:formatDate value="${now2}" pattern="yyyy-MM-dd" var="today" />
							<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
							<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
							<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
							
						<li class="fundingContent_item2" >
							<form action="funding/detail" id="detail2${vo.fundingno}" method="get">
							<c:choose>
								<c:when test="${(endDate-strDate) gt 0 }">
									<a href="#" onclick="detail2${vo.fundingno}.submit()" class="fundingCard_wrap">
								</c:when>
								<c:otherwise>
									<a href="#" onclick="detail2${vo.fundingno}.submit()" class="fundingCard_wrap" style="background-color:rgba(0, 0,0, 0.1);">
								</c:otherwise>
							</c:choose>	
								<input type="hidden" name="no" value="${vo.fundingno}">
								<c:if test="${sessionScope.user.userId ne null}">
									<input type="hidden" name="Id" value="${sessionScope.user.userId}">
								</c:if>
								<c:if test="${sessionScope.user.userId eq null}">
									<input type="hidden" name="Id" value="">
								</c:if>
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">

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
							</form>
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
							<jsp:useBean id="currTime3" class="java.util.Date" />

							<jsp:useBean id="now3" class="java.util.Date" />
							<fmt:formatDate value="${now3}" pattern="yyyy-MM-dd" var="today" />
							<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
							<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
							<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
							
						<li class="fundingContent_item3" >
							<form action="funding/detail" id="detail3${vo.fundingno}" method="get">
							<c:choose>
								<c:when test="${(endDate-strDate) gt 0 }">
									<a href="#" onclick="detail3${vo.fundingno}.submit()" class="fundingCard_wrap">
								</c:when>
								<c:otherwise>
									<a href="#" onclick="detail3${vo.fundingno}.submit()" class="fundingCard_wrap" style="background-color:rgba(0, 0,0, 0.1);">
								</c:otherwise>
							</c:choose>	
								<input type="hidden" name="no" value="${vo.fundingno}">
								<c:if test="${sessionScope.user.userId ne null}">
									<input type="hidden" name="Id" value="${sessionScope.user.userId}">
								</c:if>
								<c:if test="${sessionScope.user.userId eq null}">
									<input type="hidden" name="Id" value="">
								</c:if>
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">

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
							</form>
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
							<jsp:useBean id="currTime4" class="java.util.Date" />

							<jsp:useBean id="now4" class="java.util.Date" />
							<fmt:formatDate value="${now4}" pattern="yyyy-MM-dd" var="today" />
							<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
							<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
							<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
							
						<li class="fundingContent_item4" >
							<form action="funding/detail" id="detail4${vo.fundingno}" method="get">
							<c:choose>
								<c:when test="${(endDate-strDate) gt 0 }">
									<a href="#" onclick="detail4${vo.fundingno}.submit()" class="fundingCard_wrap">
								</c:when>
								<c:otherwise>
									<a href="#" onclick="detail4${vo.fundingno}.submit()" class="fundingCard_wrap" style="background-color:rgba(0, 0,0, 0.1);">
								</c:otherwise>
							</c:choose>	
								<input type="hidden" name="no" value="${vo.fundingno}">
								<c:if test="${sessionScope.user.userId ne null}">
									<input type="hidden" name="Id" value="${sessionScope.user.userId}">
								</c:if>
								<c:if test="${sessionScope.user.userId eq null}">
									<input type="hidden" name="Id" value="">
								</c:if>
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">

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
							</form>
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
							<jsp:useBean id="currTime5" class="java.util.Date" />

							<jsp:useBean id="now5" class="java.util.Date" />
							<fmt:formatDate value="${now5}" pattern="yyyy-MM-dd" var="today" />
							<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
							<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
							<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
							
						<li class="fundingContent_item5" >
							<form action="funding/detail" id="detail5${vo.fundingno}" method="get">
							<c:choose>
								<c:when test="${(endDate-strDate) gt 0 }">
									<a href="#" onclick="detail5${vo.fundingno}.submit()" class="fundingCard_wrap">
								</c:when>
								<c:otherwise>
									<a href="#" onclick="detail5${vo.fundingno}.submit()" class="fundingCard_wrap" style="background-color:rgba(0, 0,0, 0.1);">
								</c:otherwise>
							</c:choose>	
								<input type="hidden" name="no" value="${vo.fundingno}">
								<c:if test="${sessionScope.user.userId ne null}">
									<input type="hidden" name="Id" value="${sessionScope.user.userId}">
								</c:if>
								<c:if test="${sessionScope.user.userId eq null}">
									<input type="hidden" name="Id" value="">
								</c:if>
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">

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
							</form>
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
							<jsp:useBean id="currTime6" class="java.util.Date" />

							<jsp:useBean id="now6" class="java.util.Date" />
							<fmt:formatDate value="${now6}" pattern="yyyy-MM-dd" var="today" />
							<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
							<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
							<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
							
						<li class="fundingContent_item6" >
							<form action="funding/detail" id="detail6${vo.fundingno}" method="get">
							<c:choose>
								<c:when test="${(endDate-strDate) gt 0 }">
									<a href="#" onclick="detail6${vo.fundingno}.submit()" class="fundingCard_wrap">
								</c:when>
								<c:otherwise>
									<a href="#" onclick="detail6${vo.fundingno}.submit()" class="fundingCard_wrap" style="background-color:rgba(0, 0,0, 0.1);">
								</c:otherwise>
							</c:choose>	
								<input type="hidden" name="no" value="${vo.fundingno}">
								<c:if test="${sessionScope.user.userId ne null}">
									<input type="hidden" name="Id" value="${sessionScope.user.userId}">
								</c:if>
								<c:if test="${sessionScope.user.userId eq null}">
									<input type="hidden" name="Id" value="">
								</c:if>
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">

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
							</form>
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
							<jsp:useBean id="currTime7" class="java.util.Date" />

							<jsp:useBean id="now7" class="java.util.Date" />
							<fmt:formatDate value="${now7}" pattern="yyyy-MM-dd" var="today" />
							<fmt:parseDate value="${today}" var="strPlanDate" pattern="yyyy-MM-dd"/>		
							<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
							<fmt:parseDate value="${vo.fundingfin }" var="endPlanDate" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
							
						<li class="fundingContent_item7" >
							<form action="funding/detail" id="detail7${vo.fundingno}" method="get">
							<c:choose>
								<c:when test="${(endDate-strDate) gt 0 }">
									<a href="#" onclick="detail7${vo.fundingno}.submit()" class="fundingCard_wrap">
								</c:when>
								<c:otherwise>
									<a href="#" onclick="detail7${vo.fundingno}.submit()" class="fundingCard_wrap" style="background-color:rgba(0, 0,0, 0.1);">
								</c:otherwise>
							</c:choose>	
								<input type="hidden" name="no" value="${vo.fundingno}">
								<c:if test="${sessionScope.user.userId ne null}">
									<input type="hidden" name="Id" value="${sessionScope.user.userId}">
								</c:if>
								<c:if test="${sessionScope.user.userId eq null}">
									<input type="hidden" name="Id" value="">
								</c:if>
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd"><fmt:parseNumber var="percent" value="${(vo.currentprice/vo.fundingprice)*100 }" integerOnly="true" />${percent}</span>%</strong>
											<strong class="fundingCard_title">${vo.fundingtitle}</strong>
										<div class="fundingCard_organization">${vo.maker}</div>
										<div class="fundingCard_figure">

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
							</form>
						</li>
					</c:if>
				</c:forEach>
			</c:if>
			

		</ul>
<script>
// 더 보기 버튼
$(".fundingContent_itemAll").slice(0, 12).show(); 

<c:forEach var = "i" begin = "1" end = "7">
	$(".fundingContent_item${i}").slice(0, 12).show(); 
</c:forEach>

</script>
</html>