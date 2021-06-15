<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>SPROUT! 새싹나눔</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href=" resources/css/header.css" rel="stylesheet" type="text/css" />
<link href=" resources/css/common.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<header>
<div class="header">
	<div class="header-content">	
		<a href="#"> 
		<img alt="logo" src="resources/bannerimg/logo3.png" width="100" height="65" id="logo">
		</a>	
		<div class="navbar">
			<div class="navBox1">
			<div class="dropdown">
				<button class="dropbtn w3-xlarge"><i class="fa fa-bars" id="fulldropdown"></i></button>
				<div class="dropdown-content" id="wholeMenu">
					<div class="menu1">
					<br>
					<span class="menu2" style="padding-left: 20px;">펀딩</span>
					<ul>
						<li><a href="#">일자리 창출</a></li>
						<li><a href="#">공정 무역</a></li>
						<li><a href="#">친환경</a></li>
						<li><a href="#">기부</a></li>
						<li><a href="#">작은 가게</a></li>
						<li><a href="#">미디어</a></li>
						<li><a href="#">창작자</a></li>
					</ul>
					</div>
					<div class="menu1">
					<br>
					<span class="menu2"> 커뮤니티</span>
					<ul>
						<li><a href="#">자유게시판</a></li>
						<li><a href="#">후기</a></li>
						<li><a href="#">QnA</a></li>
						<li><a href="#">기부</a></li>
						<li><a href="#">정보 공유</a></li>
					</ul>
					</div>
					<div class="menu1">
					<br>
					<span class="menu2"> 공지사항</span>
					<ul>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">자주 물어보는 질문</a></li>
						<li><a href="#">문의하기</a></li>
					</ul>
					</div>
				</div>
			</div>
			</div>
			<div class="navBox2">
			<div class="dropdown">
				<button class="dropbtn"><a href="#">펀딩</a></button>
				<div class="miniDropdown-content">
					<a href="#">일자리 창출</a>
					<a href="#">공정 무역</a>
					<a href="#">친환경</a>
					<a href="#">기부</a>
					<a href="#">작은 가게</a>
					<a href="#">미디어</a>
					<a href="#">창작자</a>
				</div>
			</div>
			</div>
			<div class="navBox3">
			<div class="dropdown">
				<button class="dropbtn"><a href="#">커뮤니티</a>
				</button>
				<div class="miniDropdown-content">
					<a href="#">자유게시판</a>
					<a href="#">후기</a>
					<a href="#">QnA</a>
					<a href="#">기부</a>
					<a href="#">정보 공유</a>
				</div>
			</div>
			</div>
			<div class="navBox3">
			<div class="dropdown">
			<button class="dropbtn"><a href="#">공지사항</a>
			</button>
			<div class="miniDropdown-content">
					<a href="#">공지사항</a>
					<a href="#">자주 물어보는 질문</a>
					<a href="#">문의하기</a>
				</div>
			</div>
			</div>
		</div>
		<%-- <c:choose> --%>
			<%-- <c:when test="${user == null }"> --%>
				<div class="beforeLogin">
					<button type="button" id="btnLogin" onclick="location.href='#'">로그인</button>
					<button type="button" id="btnJoin" onclick="location.href='#'">회원가입</button>
				</div>
		<%-- 	</c:when>
			<c:when test="${user.autority == '8'}">
				<div class="afterLogin">
					<div class="loginDropdown">
						<div class="iconBtn" id="iconBtn">
							<input type="image" src="resources/images/user4.png" /> 
						</div>
						<div class="loginDropdown-content">
						<a href="#">관리자 페이지</a>
						<a href="#">로그아웃</a>
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${user != null }">
				<div class="afterLogin">
					<div class="loginDropdown">
						<div class="iconBtn" id="iconBtn">
							<input type="image" src="resources/images/user4.png" /> 
						</div>
						<div class="loginDropdown-content">
						<a href="#">마이 페이지</a>
						<a href="#">로그아웃</a>
						</div>
					</div>
				</div>
			</c:when>
		</c:choose> --%>
		<div class="hold">
			<button type="button" id="createFunding" onclick="location.href='#'">펀딩 등록</button>		
			<span class="HeaderUserProfile_bar__1OPU2"></span>
			<a href="#"><img class="image" src="resources/images/searching.png">
			</a>
		</div>
		
		
	</div>
</div>
</header>

<script>

	
	
</script>





