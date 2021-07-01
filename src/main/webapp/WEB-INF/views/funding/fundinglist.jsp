<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/funding/fundinglist.css" rel="stylesheet" type="text/css" />

<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="wrapper">
<div style="text-align: center; padding-top: 50px;">
	<form method="get" name="funsearchform" action="funsearch">
		<select name="serchOption" style=" border: 1px solid black;">
			<option value="제목" selected="selected">제목</option>
			<option value="내용">내용</option>
			<option value="제목내용">제목&내용</option>
		</select>
		<input type="text" name="keyword" style="border: 1px solid black;"> 
		<input type="submit" value="검색" style="border: 1px solid black;" >
	</form>
</div>
<input type="text" >
<div id="wrap" class="wrap" style="">
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
	
	<section id="funding_tab_panel" class="fundingcontent_content" role="tabpanel" aria-labelledby="funding_tab_all">
	
	<div class="fundingcontent_filter">
		<div class="fundingcontent_checkbox">
			<input type="checkbox" id="showendfunding" class="fundingcontent_input">
			<label for="showendfunding" class="fundingcontent_label">
				<span class="fundingcontent_icon"></span>종료펀딩만 보기
			</label>
			
			<div class="fundingContent_select">
				<div class="SelectArea_select" style="visibility: visible;">
					<button class="SelectArea_button" id="SelectArea_button" aria-haspopup="listbox" aria-expanded="false">최신 순</button>
						<ul class="SelectArea_select_list" id="SelectArea_select_list" role="listbox" aria-hidden="true">
							<li role="option" class="SelectArea_select_item" tabindex="0" data-value="LATEST" aria-selected="true"><span class="SelectArea_text__1tG5r">최신 순</span></li>
							<li role="option" class="SelectArea_select_item" tabindex="0" data-value="PARTICIPATION_AMOUNT" aria-selected="false"><span class="SelectArea_text__1tG5r">참여금액 순</span></li>
							<li role="option" class="SelectArea_select_item" tabindex="0" data-value="PARTICIPATION_RATE" aria-selected="false"><span class="SelectArea_text__1tG5r">참여율 순</span></li>
							<li role="option" class="SelectArea_select_item" tabindex="0" data-value="END_APPROACH" aria-selected="false"><span class="SelectArea_text__1tG5r">종료 임박 순</span></li>
						</ul>
				</div>
			</div>
		</div>
		
		<ul class="fundingContent_list">
			<c:if test="${fundinglist eq null}">
				<tr>
					<td colspan="6" align="center"><br><br>펀딩이 존재하지않습니다.<br><br></td>
				</tr>
			</c:if>


			<c:if test="${fundinglist ne null}">
				<c:forEach var="vo" items="${fundinglist}">
					<li class="fundingContent_item">
							<a href="funding/detail?no=${vo.fundingno}" class="fundingCard_wrap">
								<div class="FundingCard_img_wrap">
									<img loading="lazy" src="resources/fundingimg/${vo.fundingtitle}.jpg" alt="${vo.fundingtitle}" width="267" height="200" class="fundingCard_img">
								</div>
									<div class="fundingCard_content">
										<strong class="fundingCard_percent">
											<span class="blind">달성률</span><span class="FundingCard_number__n_hbd">3</span>%</strong>
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
											<span class="fundingCard_amount"><strong class="FundingCard_number__n_hbd">37,000</strong>원</span>
										</div>
									</div>
							</a>
					</li>
				</c:forEach>
			</c:if>
			

		</ul>
		<button type="button" class="fundingContent_button_more">더보기<span class="fundingcontent_icon"></span></button>
		</div>
		</section>
	</div>
</div>

	<hr>
	올라온 펀딩 수 :<input type="text" value="${listcount}" readonly="readonly">

<script>

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
		
		
		
</script>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>