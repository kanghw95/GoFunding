<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resource	s/css/admin/qnaReply.css?ver=1.0" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/admin/qnaReply.js"></script>
<style>
.space {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 80px;
}

.wrapper {
	display: table;
	margin-bottom: 80px;
}

.list {
	width: 35px;
	line-height: 40px;
}

.qnaList {
	display: table-cell;
	vertical-align: middle;
	font-size: 20px;
}

.info {
	width: 900px;
	border-color: #ccc;
	border-collapse: collapse;
	border-spacing: 0;
	margin-left: auto;
	margin-right: auto;
}

.replyArea {
	display: inline-block;
	width: 900px;
}

.centerPosi {
	text-align: center;
}

.t {
	float: left;
	border-color: #ccc;
	border-collapse: collapse;
	border-spacing: 0;
}

.title {
	width: 630px;
	height: 50px;
	text-align: center;
}

.noId {
	text-align: center;
	width: 130px;
}

.qnaCon {
	text-align: center;
}

.content {
	height: 250px;
}

.reply {
	width: 600px;
	height: 148px;
	border: none;
	outline: none;
}

.input {
	float: left;
	margin-left: 10px;
	width: 136px;
	height: 156px;
}

.scroll {
	overflow: scroll;
	overflow-x: hidden;
	height: 148px;
	width: 750px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<div class="space">
		<div class="wrapper">
			<img src="resources/img/admin/list.png" class="list">&nbsp;
			<p class="qnaList">문의내역</p>
		</div>
	</div> 
	    <table border="1" class="info">
	        <tr>
	            <td class="noId">번호</td>
	            <td class="title">제목</td>
	            <td class="noId">작성자</td>
	        </tr>
	        <tr>
	        	<td class="qnaCon">내용</td>
	            <td colspan="2" class="content">내용~내용</td>
	        </tr>
	    </table><br>
	<div class="centerPosi">
		<div class="replyArea">
		    <table border="1" class="t">
		        <tr>
		            <td>
		                <div class="scroll">
		                    <textarea class="reply"></textarea>
		                </div>
		            </td>
		        </tr>
		    </table>
		    <button class="input">입력</button> 
	    </div>
    </div>
</body>
</html>