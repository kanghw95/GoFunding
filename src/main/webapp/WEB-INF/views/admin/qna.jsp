<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resource	s/css/admin/qna.css?ver=1.7" rel="stylesheet" type="text/css" />
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
	
	td, th, tr {
    	border: 1px solid #ccc;
	}
	
	td {
		border: none;
		color: #757575;
    	height: 45px;
	}
	
	th {
		border: none;
		height: 45px;
	}
	
	.boardNo {
		color: #757575;
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
	
	var cv = "";
	
	function searchQna() {
		console.log("검색 시작");
		var target = document.getElementById("select");
		var sValue = target.options[target.selectedIndex].value;

		console.log("셀렉트 values는 " + sValue);

		if (sValue == 0) { // 선택된 option이 없는 경우
			console.log("선택 해야된다.");
			alert("검색 항목을 선택해주세요.");
		} else if (sValue == 1) { // 제목 검색
			console.log("펀딩문의 입니다.");
			$.ajax({
				url : "qnaSelect",
				type : "POST",
				data : {
					funding : sValue
				},
				dataType : "JSON",
				success : selectQna,
				error : function(error) {
					console.log("Qna 펀딩문의 검색 error 발생");
				}
			});
		} else if (sValue == 2) { // 이름 검색
			console.log("결제문의 입니다.");
			$.ajax({
				url : "qnaSelect",
				type : "POST",
				data : { 
					payment : sValue
				},
				dataType : "JSON",
				success : selectQna,
				error : function(error) {
					console.log("Qna 결제문의 검색 error 발생");
				}
			});
		} else if (sValue == 3) {
			console.log("계정문의 입니다.");
			$.ajax({
				url : "qnaSelect",
				type : "POST",
				data : { 
					account : sValue
				},
				dataType : "JSON",
				success : selectQna,
				error : function(error) {
					console.log("Qna 계정문의 검색 error 발생");
				}
			});
		} else if (sValue == 4) {
			console.log("기타 입니다.");
			$.ajax({
				url : "qnaSelect",
				type : "POST",
				data : { 
					etc : sValue
				},
				dataType : "JSON",
				success : selectQna,
				error : function(error) {
					console.log("Qna 기타 검색 error 발생");
				}
			});
		}
	}
	
	function selectQna(data) {
		cv = "",
		$(".search").remove();
		var elements = document.getElementsByName("boardList");
		for (var k = 0; k < elements.length; k++) {
			elements[k].style.display = "none";
		}
		console.log("Qna 유형 조회 함수 진입");
		console.log(data);
		$.each(data, function(i, list) {
			cv += "<tr class='search'>"
			cv += "<td class='noBox'><input type='text' name='boardNo' class='boardNo' value='"+data[i].qnaNo+"' readonly></td>"
			cv += "<td><input type='checkbox' name='check' onclick='checkOne()'></td>"
			cv += "<td>" + data[i].qnaType + "</td>"
			cv += "<td>" + data[i].qnaTitle + "</td>"
			cv += "<td>n</td>"
			cv += "<td>" + data[i].qnaId + "</td>"
			cv += "<td>" + data[i].qnaDate + "</td>"
			if (data[i].replyCnt != 0) {
				cv += "<td>"
				cv += "<span class='cmt'>답변완료 :</span>"
				cv += "<span class=cnt>" + data[i].replyCnt + "</span><br>"
				cv += "<input type='button' value='답변추가' class='reply' id = " + data[i].qnaNo + " onclick='reply(this.id)'>"
				cv += "</td>"
			} else {
				cv += "<td>"
				cv += "<span class='wait'>답변대기</span><br>"
				cv += "<input type='button' value='답변하기' class='reply' id = " + data[i].qnaNo + " onclick='reply(this.id)'>"
				cv += "</td>"
			}
			cv += "<td>" + data[i].qnaMId + "</td>"
			cv += "<td>" + data[i].qnaADate + "</td>"
			cv += "<td>" + data[i].qnaCnt + "</td>"
			cv += "</tr>"
		});
		$("#tr").append(cv);
	}
	
	function deleteQna() { // 공지사항 글 삭제
		console.log("공지사항 글 삭제 입니다.");
		var checked = document.getElementsByName("check");
		var boardNo = document.getElementsByName("boardNo"); 
		var deleteList = new Array();
		for (var i = 0; i < checked.length; i++) {
			if (checked[i].checked == false) {
				console.log("체크된게 없습니다.")
				console.log(checked[i].checked);
			} else {
				console.log("체크된게 있습니다.");
				console.log("체크된 Qna 글 번호 : " + boardNo[i].value);
				deleteList.push(boardNo[i].value);
				console.log("체크된 Qna 글 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 글을 체크해주세요.");
			} else {
				alert("Qna 글을 삭제하시겠습니까?");
				$.ajax({
					url : "deleteQna",
					type : "POST",
					traditional : true,
					data : {
						qnaNo : deleteList
					},
					success : function(data) {
						console.log("success 진입");
						console.log(data);
						location.replace("qna");
					},
					error : function(error) {
						console.log("error 발생");
					}
				});
			}
			
	}	

	function checkAll() { // 체크박스 전체 체크, 해제
		console.log("체크박스 함수 진입");
		var checked = document.getElementsByName("check");
		var check = document.getElementById("check");
		if (check.checked == false) {
			for (var i = 0; i < checked.length; i++) {
				checked[i].checked = false;
				console.log("전체 선택 취소");
			}
		} else {
			for (var i = 0; i < checked.length; i++) {
				checked[i].checked = true;
				console.log("전체 선택");
			}
		}
	}

	function checkOne() { // 체크박스 개별 체크, 해제
		console.log("체크박스 개별 함수 진입");
		var allBox = document.querySelectorAll("input[name='check']");
		var checkedBox = document
				.querySelectorAll("input[name='check']:checked");
		var check = document.getElementById("check");
		console.log(allBox);
		console.log(checkedBox);
		if (allBox.length == checkedBox.length) {
			check.checked = true;
		} else {
			check.checked = false;
		}
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
