<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<%=request.getContextPath() %>/resources/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/header.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<header>
<div class="header">
	<div class="header_content">	
		<a href="#"> 
		<img alt="logo" src="<%=request.getContextPath() %>/resources/bannerimg/logoG80.png" class="logo">
		</a>	
		<div class="navbar">
			<ul class="nav-content">
				<li class="megaTitle">
					<a href="#">
						<img alt="menu" class="menuImg" src="<%=request.getContextPath() %>/resources/img/hamburger.png">
					</a>
					<div class="megaMenu">
						<div class="nav-column">
							<h3 class="column-title">펀딩</h3>
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
						<div class="nav-column">
							<h3 class="column-title">커뮤니티</h3>
							<ul>
								<li><a href="#">자유게시판</a></li>
								<li><a href="#">후기</a></li>
								<li><a href="#">QnA</a></li>
								<li><a href="#">기부</a></li>
								<li><a href="#">정보 공유</a></li>
							</ul>
						</div>
						<div class="nav-column">
							<h3 class="column-title">공지사항</h3>
							<ul>
								<li><a href="#">공지사항</a></li>
								<li><a href="#">자주 물어보는 질문</a></li>
								<li><a href="#">문의하기</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<a href="#" class="subTitle">펀딩</a>
					<div class="subMenu1">
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
				</li>
						
				<li>
					<a href="#" class="subTitle">커뮤니티</a>
					<div class="subMenu2">
						<ul>
							<li><a href="#">자유게시판</a></li>
							<li><a href="#">후기</a></li>
							<li><a href="#">QnA</a></li>
							<li><a href="#">기부</a></li>
							<li><a href="#">정보 공유</a></li>
						</ul>
					</div>
				
				</li>			
				<li>
					<a href="#" class="subTitle">공지사항</a>
					<div class="subMenu3">
						<ul>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">자주 물어보는 질문</a></li>
							<li><a href="#">문의하기</a></li>
						</ul>
					</div>
				</li>	
				
				<li class="nav-search">
					<form method="get" name="funsearchform" action="funsearch">
						<select name="serchOption" style=" border: 1px solid black;">
							<option value="제목" selected="selected">제목</option>
							<option value="내용">내용</option>
							<option value="제목내용">제목&내용</option>
						</select>
						<input type="text" name="keyword"> 
						<input type="image" src="<%=request.getContextPath() %>/resources/img/search.png"/>
					</form>
				</li>		
			</ul>
		</div>
		<%-- <c:choose> --%>
			<%-- <c:when test="${user == null }"> --%>
				<div class="beforeLogin">
					<button type="button" id="btnLogin" onclick="location.href='#'">로그인</button>
					<button type="button" id="btnSignin" onclick="location.href='#'">회원가입</button>
				</div>
		<%-- 	</c:when>
			<c:when test="${user.autority == '9'}">
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
			
		</div>
	</div>	
</div>
</header>





