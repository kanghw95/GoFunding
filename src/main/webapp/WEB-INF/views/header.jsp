<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<%=request.getContextPath() %>/resources/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/header.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#show").val("SHOW");
	$("#show").click(function(){
	    if ($(this).val() == "SHOW") {
	        $(this).val("HIDE");
	        $("#dropdown-content").css("display", "block");
	        $("#show").attr("src", "<%=request.getContextPath()%>/resources/img/userhover.png");
	        $("#picBtn").css("border", "1px solid #1abc9c");
	    } else {
	    	$(this).val("SHOW");
	        $("#dropdown-content").css("display", "none");
	        $("#show").attr("src", "<%=request.getContextPath()%>/resources/img/user64.png");
	        $("#picBtn").css("border", "1px solid white");
	    }
	})
});
</script>
<header>
<div class="header">
	<div class="header_content">	
		<a href="<%=request.getContextPath() %>/funselect"> 
		<img alt="logo" src="<%=request.getContextPath() %>/resources/bannerimg/logoG80.png" class="logo">
		</a>	
		<div class="navbox">
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
								<li><a href="<%=request.getContextPath()%>board/boardList">자유게시판</a></li>
								<li><a href="#">후기</a></li>
								<li><a href="#">QnA</a></li>
								<li><a href="#">기부</a></li>
								<li><a href="#">정보 공유</a></li>
							</ul>
						</div>
						<div class="nav-column">
							<h3 class="column-title">공지사항</h3>
							<ul style="width: 150px;">
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
							<li><a href="<%=request.getContextPath()%>board/boardList">자유게시판</a></li>
							<li><a href="#">후기</a></li>
							<li><a href="#">QnA</a></li>
							<li><a href="#">기부</a></li>
							<li><a href="#">정보 공유</a></li>
						</ul>
					</div>
				
				</li>			
				<li>
					<a href="#" class="subTitle">공지사항</a>
					<div class="subMenu3" style="width: 180px;">
						<ul>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">자주 물어보는 질문</a></li>
							<li><a href="#">문의하기</a></li>
						</ul>
					</div>
				</li>	
				
				<li class="nav-search" style="width: 250px; padding-left: 30px;">
					<form method="get" name="funsearchform" action="funsearch">
						<select name="serchOption">
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
		<c:choose>
			<c:when test="${user == null }">
				<div class="beforeLogin">
					<button type="button" id="btnLogin" onclick="location.href='<%=request.getContextPath() %>/user/login'">로그인</button>
					<button type="button" id="btnSignin" onclick="location.href='<%=request.getContextPath() %>/user/join'">회원가입</button>
				</div>
		 	</c:when>
			<c:when test="${user.userId eq 'admin' }">
				<div class="afterLogin">
					<div class="dropdown">
						<div class="picBtn" id="picBtn">
							<input type="image" src="<%=request.getContextPath() %>/images/user64.png" class="pic" width="50" height="50" style="background-color: white" id="show">
						</div>
						<div class="dropdown-content" style="border: 1px solid #1abc9c; display:none" id="dropdown-content">
							<a href="#">관리자 페이지</a>
							<a href="<%=request.getContextPath()%>/user/logout">로그아웃</a> 
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="afterLogin">
					<div class="dropdown">
						<div class="picBtn" id="picBtn">
								<input type="image" src="<%=request.getContextPath() %>/resources/img/user64.png" class="pic" width="50" height="50" style="background-color: white" id="show">
							</div>
						<div class="dropdown-content" style="border: 1px solid #1abc9c; display:none" id="dropdown-content">
							<a href="<%=request.getContextPath()%>/myPage">마이페이지</a>
							<a href="<%=request.getContextPath()%>/user/logout">로그아웃</a> 
						</div>
					</div>
				</div>
				</c:otherwise>
		</c:choose> 
		<div class="hold">
			<button type="button" id="createFunding" onclick="location.href='#'">펀딩 등록</button>		
			
		</div>
	</div>	
</div>
</header>





