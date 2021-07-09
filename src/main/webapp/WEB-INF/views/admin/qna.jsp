<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resource	s/css/admin/qna.css?ver=1.6" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
	.cmt {
		font-size: 10px;
		color: springgreen;
	}
	
	.cnt {
		font-size: 10px;
	}
	
	.wait {
		font-size: 10px;
		color: red;
	}
	
	body {
	    font-family: 'NanumSquare', sans-serif !important;
	}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/admin/qna.js"></script>
<script>
	
	function reply(replyInfo) {
		var rep = replyInfo;
		console.log(rep);
		var qNo = document.getElementById("qNo");
		qNo.value = rep;
		qnaform.submit();
	}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<div id="space">
		<div id="wrapper">
			<img src="resources/img/admin/list.png" id="list">&nbsp;
			<p id="userManage">문의내역</p>
		</div> 
	</div>
	<div id="userInfo">
		<form method="post" id="qnaform" name="qnaform" action="qnaReply">
			<table class="tg" border="1" id="tr">
				<tr>
					<th>No</th>
					<th><input type="checkbox" id="check" onclick="checkAll()"></th>
					<th>질문유형</th>
					<th class="title">제목</th>
					<th>펀딩번호</th>
					<th class="uId">작성자</th>
					<th>작성일</th>
					<th>처리여부</th>
					<th class="mId">답변자</th>
					<th>답변일</th>
					<th>조회</th>
				</tr>
				<c:forEach var="qna" items="${qnaList }" varStatus="status">
					<tr name="boardList" id="boardList" class="search">
						<td class="noBox"><input type="text" name="boardNo" class="boardNo" id="qnaNo" value=${qna.qnaNo } readonly></td>
						<td><input type="checkbox" name="check" onclick="checkOne()"></td>
						<td>${qna.qnaType}</td>
						<td>${qna.qnaTitle}</td>
						<td>n</td>
						<td>${qna.qnaId }</td>
						<td>${qna.qnaDate}</td>
						<c:if test="${qna.replyCnt != 0 }">
							<td>
								<span class="cmt">답변완료 :</span>
								<span class="cnt">${qna.replyCnt }</span><br>
								<input type="button" value="답변추가" class="reply"  id=${qna.qnaNo } onclick="reply(this.id)">
							</td>
						</c:if>
						<c:if test="${qna.replyCnt == 0 }">
							<td>
								<span class="wait">답변대기</span><br>
								<input type="button" value="답변하기" class="reply"  id=${qna.qnaNo } onclick="reply(this.id)">
							</td>
						</c:if>
						<td>${qna.qnaMId }</td>
						<td>${qna.qnaADate }</td>
						<td>${qna.qnaCnt }</td>
					</tr>
					<input type="hidden" id="qNo" name="qna">
				</c:forEach>
			</table>
		</form>
	</div>
	<div id="under">
		<select id="select">
			<option value="0">--선택--</option>
			<option value="1">펀딩문의</option>
			<option value="2">결제문의</option>
			<option value="3">계정문의</option>
			<option value="4">기타</option>
		</select>
		<button id="searchBtn" onclick="searchQna()">검색</button>
		<div id="paging">
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a href="qna${pageMaker.makeQuery(pageMaker.startPage - 1)}" id="num"><</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li><a href="qna${pageMaker.makeQuery(idx)}" id="num">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="qna${pageMaker.makeQuery(pageMaker.endPage + 1)}" id="num">></a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>
