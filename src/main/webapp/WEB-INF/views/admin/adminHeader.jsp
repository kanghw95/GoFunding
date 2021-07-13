<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<%=request.getContextPath() %>/resources/css/admin/common.css?ver=1.0" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/admin/adminHeader.css?ver=1.1" rel="stylesheet" type="text/css" />
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
<style>
.header {
	background-color: #ccc;
}

</style>
<header>
<div class="header">
	<div class="header_content">	
		<a href="<%=request.getContextPath() %>/adminMain"> 
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
							<h3 class="column-title">펀딩 관리</h3>
							<ul>
								<li><a href="<%=request.getContextPath()%>/formList">펀딩신청내역</a></li>
								<li><a href="<%=request.getContextPath()%>/formReject">펀딩반려내역</a></li>
								<li><a href="<%=request.getContextPath()%>/fundingList">펀딩내역</a></li>
							</ul>
						</div>
						<div class="nav-column">
							<h3 class="column-title">커뮤니티 관리</h3>
							<ul>
								<li><a href="<%=request.getContextPath()%>/freeboardlist">자유게시판</a></li>
								<li><a href="<%=request.getContextPath()%>/reviewboardlist">후기게시판</a></li>
								<li><a href="<%=request.getContextPath()%>/questionboardlist">QnA게시판</a></li>
								<li><a href="<%=request.getContextPath()%>/shareboardlist">정보공유게시판</a></li>
								<li><a href="<%=request.getContextPath()%>/eventboardlist">이벤트게시판</a></li>
							</ul>
						</div>
						<div class="nav-column">
							<h3 class="column-title">공지사항 관리</h3>
							<ul style="width: 150px;">
								<li><a href="<%=request.getContextPath()%>/notice">공지사항</a></li>
								<li><a href="<%=request.getContextPath()%>/faq">자주 물어보는 질문</a></li>
								<li><a href="<%=request.getContextPath()%>/qna">문의하기</a></li>
							</ul>
						</div>
						<div class="nav-column">
							<h3 class="column-title">회원 관리</h3>
							<ul style="width: 150px;">
								<li><a href="<%=request.getContextPath()%>/userlist">회원조회</a></li>
								<li><a href="<%=request.getContextPath()%>/report">회원신고내역</a></li>
								<li><a href="<%=request.getContextPath()%>/message/msgUserList">회원메시지</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<a href="#" class="subTitle">펀딩 관리</a>
					<div class="subMenu1">
						<ul>
							<li><a href="<%=request.getContextPath()%>/formList">펀딩신청내역</a></li>
							<li><a href="<%=request.getContextPath()%>/formReject">펀딩반려내역</a></li>
							<li><a href="<%=request.getContextPath()%>/fundingList">펀딩내역</a></li>
						</ul>
					</div>	
				</li>
						
				<li>
					<a href="#" class="subTitle">커뮤니티 관리</a>
					<div class="subMenu2">
						<ul>
							<li><a href="<%=request.getContextPath()%>/freeboardlist">자유게시판</a></li>
							<li><a href="<%=request.getContextPath()%>/reviewboardlist">후기게시판</a></li>
							<li><a href="<%=request.getContextPath()%>/questionboardlist">QnA게시판</a></li>
							<li><a href="<%=request.getContextPath()%>/shareboardlist">정보공유게시판</a></li>
							<li><a href="<%=request.getContextPath()%>/eventboardlist">이벤트게시판</a></li>
						</ul>
					</div>
				
				</li>			
				<li>
					<a href="#" class="subTitle">공지사항 관리</a>
					<div class="subMenu3" style="width: 180px;">
						<ul>
							<li><a href="<%=request.getContextPath()%>/notice">공지사항</a></li>
							<li><a href="<%=request.getContextPath()%>/faq">자주 물어보는 질문</a></li>
							<li><a href="<%=request.getContextPath()%>/qna">문의하기</a></li>
						</ul>
					</div>
				</li>	
				<li>
					<a href="#" class="subTitle">회원 관리</a>
					<div class="subMenu4" style="width: 180px;">
						<ul>
							<li><a href="<%=request.getContextPath()%>/userlist">회원조회</a></li>
							<li><a href="<%=request.getContextPath()%>/report">회원신고내역</a></li>
							<li><a href="<%=request.getContextPath()%>/message/msgUserList">회원메시지</a></li>
						</ul>
					</div>
				</li>	
			<!-- <li class="nav-search" style="width: 250px; padding-left: 30px;">
					<form method="get" name="funsearchform" action="funsearch">
						<select name="serchOption">
							<option value="제목" selected="selected">제목</option>
							<option value="내용">내용</option>
							<option value="제목내용">제목&내용</option>
						</select>
						<input type="text" name="keyword"> 
						<input type="image" src="<%=request.getContextPath() %>/resources/img/search.png"/>
					</form>
				</li> -->				
		
			</ul>
		</div>
				<div class="afterLogin">
					<div class="dropdown">
						<div class="picBtn" id="picBtn">
							<input type="image" src="<%=request.getContextPath() %>/resources/img/user64.png" class="pic" width="50" height="50" style="background-color: white" id="show">
						</div>
						<div class="dropdown-content" style="border: 1px solid #1abc9c; display:none" id="dropdown-content">
							<a href="<%=request.getContextPath()%>/">메인 페이지</a>
							<a href="<%=request.getContextPath()%>/user/logout">로그아웃</a> 
						</div>
					</div>
				</div>
	</div>	
</div>
<script>
$("#createFunding").click(function(){
	var userIdChk="${user.userId}";
	if(userIdChk=='null'||userIdChk==''){
		alert('로그인 해주세요.');
	} else if(userIdChk!='null'||userIdChk!='') {
		location.href='<%=request.getContextPath()%>/user/applicationForm';
	}
});
</script>
</header>





