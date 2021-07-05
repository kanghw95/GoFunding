<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/userdetail_join/myPage.css" rel="stylesheet" type="text/css" />
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
				<button type="button" onclick="location.href='<%=request.getContextPath() %>/user/logout'">로그아웃</button>
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
						메이커
					</div>
					<!-- 사용자 -->
					<div class="cont">
						 사용자
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>