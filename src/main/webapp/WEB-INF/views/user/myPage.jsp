<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp"%>
<div class="wrapper">
	<div class="myPageWrapper">
		<div class="myPageInner">
			<div class="myPageHeader">
				<div class="makerSwitcher">
					<button type="button">사용자</button>
					<button type="button">메이커</button>
				</div>
			</div>
			<div class="myPageContentWrapper">
				<div class="myPage_nonMaker">
					<div class="profileBox">
						<div class="profileImg">
							<img alt="profile" src="<%=request.getContextPath() %>/resources/img/user_2.png"/>
						</div>
						<div class="profileUser">
							<span><strong>${user.userName }</strong>님 </span>
						</div>
						<div class="profileInfo">
							<p class="loginMode">sns / 와디즈 가입 </p>
							<button type="button">로그아웃</button>
						</div>
					</div>
					<div class="contentsBox">
						<div class="myPageSection">
							<h3>나의 프로젝트</h3>
							<div class="projectCotainer">
								<div class="projectInfo">
									<ul class="infoList" style="">
										<li>
											<a href="#"><span>펀딩횟수<br><b>0회</b></span></a>
										</li>
										<li>
											<a href="#"><span>메세지<br><b>0건</b></span></a>
										</li>
										<li>
											<a href="#"><span>포인트<br><b>0점</b></span></a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						
						<div class="myPageSection">
							<h3>나의 활동</h3>
							<div>
								<div class="log">
									<a href="#"><span>아이콘</span><strong>관심 펀딩</strong><span>아이콘</span></a>
								</div>
								<div class="log">
									<a href="#"><span>아이콘</span><strong>관심 펀딩</strong><span>아이콘</span></a>
								</div>
							</div>
							<div>
								<div class="log">
									<a href="#"><span>아이콘</span><strong>관심 펀딩</strong><span>아이콘</span></a>
								</div>
								<div class="log">
									<a href="#"><span>아이콘</span><strong>관심 펀딩</strong><span>아이콘</span></a>
								</div>
							</div>
						</div>
						
						<div class="myPageSection">
							<button type="button">회원탈퇴</button>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>