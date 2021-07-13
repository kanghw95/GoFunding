<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPROUT! 새싹나눔</title>
<link href="<%=request.getContextPath() %>/resources/css/user/myPage.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/common.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 사용자 / 메이커 탭 기능 -->
<script>
$(document).ready(
		function() {
			//탭(ul) onoff
			$('.onoff>.tab-cont').children().css('display', 'none');
			$('.onoff>.tab-cont div:nth-child(2)').css('display','block');
			$('.onoff>.tab li:nth-child(2)').addClass('on');
			$('.onoff')
					.delegate(
							'.tab>li',
							'click',
							function() {
								var index = $(this).parent().children().index(this);
								$(this).siblings().removeClass();
								$(this).addClass('on');
								$(this).parent().next('.tab-cont')
										.children().hide()
										.eq(index).show();
							});
		});
</script>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp"%>
<div class="wrapper">
	<div class="myPageContainer">
		<div class="profileContainer">
			<div class="profileImg">
				<img class="imgProfile" alt="profile" src="<%=request.getContextPath() %>/resources/img/user_2.png"/>
			</div>
			<div class="profileUser">
				<span><strong>${user.userName }</strong>님 </span>
				
			</div>
			<div class="profileInfo">
				<a href="<%=request.getContextPath() %>/user/modifyUser" class="ModifyProfile button--secondary">
					<span class="text">회원정보 수정</span>
	  				<span class="icon-arrow"></span>
				</a>
				<br>
				<a href="<%=request.getContextPath() %>/user/logout" class="profileLogout">로그아웃</a>
			</div>
		</div>
	    <div class="contentsBox">
			<div class="onoff tab-main">
				<ul class="tab">
					<li><a href="#" class="title">메이커</a></li>
					<li><a href="#" class="title">사용자</a></li>
				</ul>
				<div class="tab-cont">
					<!-- 메이커 -->
					<div class="cont" style="display:none">
						<div class="cont">
						<div class="projectInfo">
							<ul class="infoBox">
								<li>
									<a href="#"><span>펀딩 개설 횟수<b>0회</b></span></a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/message/msgList3"><span>메세지<b>${makerCnt}건</b></span></a>
								</li>
								<li>
									<a href="#"><span>포인트<b>${user.point }점</b></span></a>
								</li>
							</ul>
						</div>
						<br>
						<br>
						<br>
						<br>
						<div class="actLogInfo">
							<h2 class="logTitle">나의 활동</h2>
							<div class="logBox">
								<ul>
									<li><a href="#"><span><i class="fas fa-archive"></i>&nbsp; 내가 개설한 펀딩</span></a></li>
									<li><a href="<%=request.getContextPath()%>/user/applicationForm"><span><i class="fas fa-folder-plus"></i>&nbsp; 내 펀딩 개설하기</span></a></li>
								</ul>
								<ul>
									<li style="padding-top: 20px;"><a href="<%=request.getContextPath() %>/myboardlist"><span><i class="fas fa-pencil-alt"></i>&nbsp; 내가 쓴 글 목록</span></a></li>
									<li style="padding-top: 20px;"><a href="<%=request.getContextPath() %>/mycmtlist"><span><i class="fas fa-reply"></i>&nbsp; 내가 쓴 댓글 목록</span></a></li>
								</ul>
							</div>
						</div>
					</div>
					</div>
					<!-- 사용자 -->
					<div class="cont">
						<div class="projectInfo">
							<ul class="infoBox">
								<li>
									<a href="#"><span>펀딩횟수<b>${fundingCount }회</b></span></a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/message/msgList2"><span>메세지<b>${userCnt}건</b></span></a>
								</li>
								<li>
									<a href="#"><span>포인트<b>${user.point }점</b></span></a>
								</li>
							</ul>
						</div>
						<br>
						<br>
						<br>
						<br>
						<div class="actLogInfo">
							<h2 class="logTitle">나의 활동</h2>
							<div class="logBox">
								<ul>
									<li><a href="<%=request.getContextPath() %>/myprefer"><span><i class="far fa-heart"></i>&nbsp; 관심 펀딩</span></a></li>
									<li><a href="<%=request.getContextPath() %>/myfundinglist"><span><i class="fas fa-clipboard-check"></i>&nbsp; 내가 참여한 펀딩</span></a></li>
								</ul>
								<ul>
									<li style="padding-top: 20px;"><a href="<%=request.getContextPath() %>/myboardlist"><span><i class="fas fa-pencil-alt"></i>&nbsp; 내가 쓴 글 목록</span></a></li>
									<li style="padding-top: 20px;"><a href="<%=request.getContextPath() %>/mycmtlist"><span><i class="fas fa-reply"></i>&nbsp; 내가 쓴 댓글 목록</span></a></li>
								</ul>
							</div>
						</div>
						<br>
						<div class="withdraw">
							<c:if test="${user.userId ne null }">
							<button class="withdrawlBtn" onclick="location.href='<%= request.getContextPath()%>/user/withdrawl'"><i class="fas fa-user-times"></i>&nbsp; 회원탈퇴</button>
							</c:if>
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




