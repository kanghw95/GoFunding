<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
#header {
	min-height: 100%;
	margin: 0 auto;
	padding-top: 50px;
	text-align: center;
}

#nav {
	height: 120px;
	background-color: #ccc;
	width: 1140px;
	display: inline-block;
}



#logomenu {
	height: 20px;
	width: 26px;
	padding: 50px 20px 50px 20px;
	background-color: #ccc;
	float: left;
}

#logo {
	height: 120px;
	line-height: 120px;
	float: left;
}

#menulogo {
	height: 80px;
	width: 80px;
	padding: 20px;
	float: left;
}

#btn {
	display: inline-block;
	line-height: 120px;
}

#menuBtn {
	border-radius: 5px;
	background-color: dimgrey;
	color: white;
	border: 0;
	height: 40px;
	margin-left: 20px;
}

#search {
	width: 30px;
	height: 30px;
	float: right;
	padding-top: 45px;
	padding-right: 20px;
}

</style>
<header id="header">
	<div id="nav">
		<div id="logo">
			<img src="resources/img/admin/logo.png" id="menulogo">
			<img src="resources/img/admin/menu.png" id="logomenu"> 
			<button id="menuBtn" onclick="modalBlock();">펀딩신청관리</button>
			<button id="menuBtn" onclick="modalBlock();">커뮤니티관리</button>
			<button id="menuBtn" onclick="modalBlock();">공지/문의사항관리</button>
			<button id="menuBtn" onclick="modalBlock();">회원관리</button>
		</div>
		<img src="resources/img/admin/user.png" id="search"> 
		<img src="resources/img/admin/glass.svg" id="search">
	</div>
</header>