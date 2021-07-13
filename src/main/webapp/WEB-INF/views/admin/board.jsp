<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/admin/adminBoard.css?ver=1.2" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/admin/adminBoard.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
body {
    font-family: 'NanumSquare', sans-serif !important;
}

a {
	text-decoration-line: none;
	color: black;
}

a:hover {color:#00BFFF;}
a:active {color:#00BFFF;}

.no {
	width: 40px;
}

.box {
	width: 40px;
}

.title {
	width: 500px;
}

.id {
	width: 75px;
}

.cnt {
	width: 55px;
}

.like {
	width: 55px;
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
<script>
jQuery(function($) {
    $("body").css("display", "none");
    $("body").fadeIn(800);
    $("a.transition").click(function(event){
        event.preventDefault();
        linkLocation = this.href;
        $("body").fadeOut(1000, redirectPage);
    });
    function redirectPage() {
    window.location = linkLocation;
    }
});

function selectRadio(data) {
	cv = "",
	$(".search").remove();
	var elements = document.getElementsByName("boardList");
	for (var k = 0; k < elements.length; k++) {
		elements[k].style.display = "none";
	}
	console.log("게시판 검색 함수 진입");
	console.log(data);
	
	$.each(data, function(i, list) {
		cv += "<tr class='search'>"
		cv += "<td><input type='text' name='boardNo' class='boardNo' value='"+data[i].boardNo+"' readonly/></td>"
		cv += "<td><input type='checkbox' name='check' onclick='checkOne()'></td>"
		cv += "<td>" + data[i].boardTitle + "</td>"
		cv += "<td>" + data[i].boardId + "</td>"
		cv += "<td>" + data[i].boardCnt + "</td>"
		cv += "<td>0</td>"
		cv += "<td id='date'>" + data[i].boardDate + "</td>"
		cv += "</tr>"
	});
	$("#tr").append(cv);
	$("#page").remove();
}

function searchBoard(data) { // 모든 게시판 검색 sucess
	cv = "",
	$(".search").remove();
	var elements = document.getElementsByName("boardList");
	for (var k = 0; k < elements.length; k++) {
		elements[k].style.display = "none";
	}
	console.log("게시판 검색 함수 진입");
	console.log(data);
	$.each(data, function(i, list) {
		cv += "<tr class='search'>"
		cv += "<td><input type='text' name='boardNo' class='boardNo' value='"+data[i].boardNo+"' readonly/></td>"
		cv += "<td><input type='checkbox' name='check' onclick='checkOne()'></td>"
		cv += "<td>" + data[i].boardTitle + "</td>"
		cv += "<td>" + data[i].boardId + "</td>"
		cv += "<td>" + data[i].boardCnt + "</td>"
		cv += "<td>0</td>"
		cv += "<td>" + data[i].boardDate + "</td>"
		cv += "</tr>"
	});
	$("#tr").append(cv);
	$("#page").remove();
}

function searchFreeBoard() { // 자유 게시판 검색
	console.log("검색 시작");
	var target = document.getElementById("select");
	var sValue = target.options[target.selectedIndex].value;
	var search = "%" + document.getElementById("text").value + "%";
	
	console.log("컨트롤러로 넘길 값은 : " + search);
	console.log("셀렉트 values는 " + sValue);
	
	if (search == "%%") {
		alert("검색할 정보를 입력해주세요.");
	} else {
		if (sValue == 0) { // 선택된 option이 없는 경우
			console.log("선택 해야된다.");
			alert("검색 항목을 선택해주세요.");
		} else if (sValue == 1) { // 제목 검색
			console.log("제목 입니다.");
			$.ajax({
				url : "fboardselect",
				type : "POST",
				data : {
					boardTitle : search
				},
				dataType : "JSON",
				success : searchBoard,
				error : function(error) {
					console.log("자유 게시판 제목 error 발생");
				}
			});
		} else if (sValue == 2) { // 이름 검색
			console.log("작성자 입니다.");
			$.ajax({
				url : "fboardselect",
				type : "POST",
				data : {
					boardId : search
				},
				dataType : "JSON",
				success : searchBoard,
				error : function(error) {
					console.log("자유 게시판 작성자 error 발생");
				}
			});
		}
	}
}

function searchReviewBoard() { // 후기 게시판 검색
	console.log("검색 시작");
	var target = document.getElementById("select");
	var sValue = target.options[target.selectedIndex].value;
	var search = "%" + document.getElementById("text").value + "%";
	
	console.log("컨트롤러로 넘길 값은 : " + search);
	console.log("셀렉트 values는 " + sValue);

	if (search == "%%") {
		alert("검색할 정보를 입력해주세요.");
	} else {
		if (sValue == 0) { // 선택된 option이 없는 경우
			console.log("선택 해야된다.");
			alert("검색 항목을 선택해주세요.");
		} else if (sValue == 1) { // 제목 검색
			console.log("제목 입니다.");
			$.ajax({
				url : "rboardselect",
				type : "POST",
				data : {
					boardTitle : search
				},
				dataType : "JSON",
				success : searchBoard,
				error : function(error) {
					console.log("자유 게시판 제목 error 발생");
				}
			});
		} else if (sValue == 2) { // 이름 검색
			console.log("작성자 입니다.");
			$.ajax({
				url : "rboardselect",
				type : "POST",
				data : {
					boardId : search
				},
				dataType : "JSON",
				success : searchBoard,
				error : function(error) {
					console.log("자유 게시판 작성자 error 발생");
				}
			});
		}
	}
}

function searchQuestionBoard() { // 질의응답 게시판 검색
	console.log("검색 시작");
	var target = document.getElementById("select");
	var sValue = target.options[target.selectedIndex].value;
	var search = "%" + document.getElementById("text").value + "%";
	
	console.log("컨트롤러로 넘길 값은 : " + search);
	console.log("셀렉트 values는 " + sValue);

	if (search == "%%") {
		alert("검색할 정보를 입력해주세요.");
	} else {
		if (sValue == 0) { // 선택된 option이 없는 경우
			console.log("선택 해야된다.");
			alert("검색 항목을 선택해주세요.");
		} else if (sValue == 1) { // 제목 검색
			console.log("제목 입니다.");
			$.ajax({
				url : "qboardselect",
				type : "POST",
				data : {
					boardTitle : search
				},
				dataType : "JSON",
				success : searchBoard,
				error : function(error) {
					console.log("자유 게시판 제목 error 발생");
				}
			});
		} else if (sValue == 2) { // 이름 검색
			console.log("작성자 입니다.");
			$.ajax({
				url : "qboardselect",
				type : "POST",
				data : {
					boardId : search
				},
				dataType : "JSON",
				success : searchBoard,
				error : function(error) {
					console.log("자유 게시판 작성자 error 발생");
				}
			});
		}
	}
}

function searchShareBoard() { // 정보공유 게시판 검색
	console.log("검색 시작");
	var target = document.getElementById("select");
	var sValue = target.options[target.selectedIndex].value;
	var search = "%" + document.getElementById("text").value + "%";
	
	console.log("컨트롤러로 넘길 값은 : " + search);
	console.log("셀렉트 values는 " + sValue);

	if (search == "%%") {
		alert("검색할 정보를 입력해주세요.");
	} else {
		if (sValue == 0) { // 선택된 option이 없는 경우
			console.log("선택 해야된다.");
			alert("검색 항목을 선택해주세요.");
		} else if (sValue == 1) { // 제목 검색
			console.log("제목 입니다.");
			$.ajax({
				url : "sboardselect",
				type : "POST",
				data : {
					boardTitle : search
				},
				dataType : "JSON",
				success : searchBoard,
				error : function(error) {
					console.log("자유 게시판 제목 error 발생");
				}
			});
		} else if (sValue == 2) { // 이름 검색
			console.log("작성자 입니다.");
			$.ajax({
				url : "sboardselect",
				type : "POST",
				data : {
					boardId : search
				},
				dataType : "JSON",
				success : searchBoard,
				error : function(error) {
					console.log("자유 게시판 작성자 error 발생");
				}
			});
		}
	}
}

function searchEventBoard() { // 이벤트 게시판 검색
	console.log("검색 시작");
	var target = document.getElementById("select");
	var sValue = target.options[target.selectedIndex].value;
	var search = "%" + document.getElementById("text").value + "%";
	
	console.log("컨트롤러로 넘길 값은 : " + search);
	console.log("셀렉트 values는 " + sValue);

	if (search == "%%") {
		alert("검색할 정보를 입력해주세요.");
	} else {
		if (sValue == 0) { // 선택된 option이 없는 경우
			console.log("선택 해야된다.");
			alert("검색 항목을 선택해주세요.");
		} else if (sValue == 1) { // 제목 검색
			console.log("제목 입니다.");
			$.ajax({
				url : "eboardselect",
				type : "POST",
				data : {
					boardTitle : search
				},
				dataType : "JSON",
				success : searchBoard,
				error : function(error) {
					console.log("자유 게시판 제목 error 발생");
				}
			});
		} else if (sValue == 2) { // 이름 검색
			console.log("작성자 입니다.");
			$.ajax({
				url : "eboardselect",
				type : "POST",
				data : {
					boardId : search
				},
				dataType : "JSON",
				success : searchBoard,
				error : function(error) {
					console.log("자유 게시판 작성자 error 발생");
				}
			});
		}
	}
}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<div id="space">
		<div id="wrapper">
			<img src="resources/img/admin/list.png" id="list">&nbsp;
			<c:if test="${!empty freeboard }">
				<p id="userManage">자유게시판</p>
			</c:if>
			<c:if test="${!empty reviewboard }">
				<p id="userManage">후기게시판</p>
			</c:if>
			<c:if test="${!empty questionboard }">
				<p id="userManage">질의응답게시판</p>
			</c:if>
			<c:if test="${!empty shareboard }">
				<p id="userManage">정보공유게시판</p>
			</c:if>
			<c:if test="${!empty eventboard }">
				<p id="userManage">이벤트게시판</p>
			</c:if>
		</div>
		<c:if test="${!empty freeboard }">
			<input type="radio" name="radio" id="free" value="new" onclick="boardRadio()">최신순
			<input type="radio" name="radio" id="free" value="cnt" onclick="boardRadio()">조회순
		</c:if>
		<c:if test="${!empty reviewboard }">
			<input type="radio" name="radio" id="free" value="new" onclick="boardRadio()">최신순
			<input type="radio" name="radio" id="free" value="cnt" onclick="boardRadio()">조회순
		</c:if>
		<c:if test="${!empty questionboard }">
			<input type="radio" name="radio" id="free" value="new" onclick="boardRadio()">최신순
			<input type="radio" name="radio" id="free" value="cnt" onclick="boardRadio()">조회순
		</c:if>
		<c:if test="${!empty shareboard }">
			<input type="radio" name="radio" id="free" value="new" onclick="boardRadio()">최신순
			<input type="radio" name="radio" id="free" value="cnt" onclick="boardRadio()">조회순
		</c:if>
		<c:if test="${!empty eventboard }">
			<input type="radio" name="radio" id="free" value="new" onclick="boardRadio()">최신순
			<input type="radio" name="radio" id="free" value="cnt" onclick="boardRadio()">조회순
		</c:if>
	</div>
	<div id="userInfo">
		<table class="tg" border="1" id="tr">
			<tr>
				<th class="no">NO</th>
				<th class="box"><input type="checkbox" id="checkAll" onclick="checkAll()"></th>
				<th class="title">제목</th>
				<th class="id">작성자</th>
				<th class="cnt">조회</th>
				<th class="like">추천</th>
				<th>작성일</th>
			</tr>
			<c:if test="${!empty freeboard }">
				<c:forEach var="free" items="${freeboard }" varStatus="status">
					<tr name="boardList" id="boardList" class="search">
						<td class="noBox"><input type="text" name="boardNo" class="boardNo" value=${free.boardNo } readonly></td>
						<td><input type="checkbox" name="check" onclick='checkOne()'></td>
						<td><a href="freeDetail?no=${free.boardNo }">${free.boardTitle}</a></td>
						<td>${free.boardId}</td>
						<td>${free.boardCnt}</td>
						<td>0</td>
						<td>${free.boardDate}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${!empty reviewboard}">
				<c:forEach var="review" items="${reviewboard }" varStatus="status">
					<tr name="boardList" id="boardList" class="search">
						<td class="noBox"><input type="text" name="boardNo" class="boardNo" value=${review.boardNo } readonly></td>
						<td><input type="checkbox" name="check" onclick='checkOne()'></td>
						<td><a href="reviewDetail?no=${review.boardNo }">${review.boardTitle}</a></td>
						<td>${review.boardId}</td>
						<td>${review.boardCnt}</td>
						<td>0</td>
						<td>${review.boardDate}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${!empty questionboard}">
				<c:forEach var="question" items="${questionboard }" varStatus="status">
					<tr name="boardList" id="boardList" class="search">
						<td class="noBox"><input type="text" name="boardNo" class="boardNo" value=${question.boardNo } readonly></td>
						<td><input type="checkbox" name="check" onclick='checkOne()'></td>
						<td><a href="questionDetail?no=${question.boardNo }">${question.boardTitle}</a></td>
						<td>${question.boardId}</td>
						<td>${question.boardCnt}</td>
						<td>0</td>
						<td>${question.boardDate}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${!empty shareboard}">
				<c:forEach var="share" items="${shareboard }" varStatus="status">
					<tr name="boardList" id="boardList" class="search">
						<td class="noBox"><input type="text" name="boardNo" class="boardNo" value=${share.boardNo } readonly></td>
						<td><input type="checkbox" name="check" onclick='checkOne()'></td>
						<td><a href="shareDetail?no=${share.boardNo }">${share.boardTitle}</a></td>
						<td>${share.boardId}</td>
						<td>${share.boardCnt}</td>
						<td>0</td>
						<td>${share.boardDate}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${!empty eventboard}">
				<c:forEach var="event" items="${eventboard }" varStatus="status">
					<tr name="boardList" id="boardList" class="search">
						<td class="noBox"><input type="text" name="boardNo" class="boardNo" value=${event.boardNo } readonly></td>
						<td><input type="checkbox" name="check" onclick='checkOne()'></td>
						<td><a href="eventDetail?no=${event.boardNo }">${event.boardTitle}</a></td>
						<td>${event.boardId}</td>
						<td>${event.boardCnt}</td>
						<td>0</td>
						<td>${event.boardDate}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<div id="under">
		<select id="select">
			<option value="0">--선택--</option>
			<option value="1">제목</option>
			<option value="2">작성자</option>
		</select> <input type="text" id="text" name="userId">
		<div id="paging">
			<ul id="page">
				<c:if test="${!empty freeboard }">
					<c:if test="${pageMaker.prev}">
						<li><a href="freeboardlist${pageMaker.makeQuery(pageMaker.startPage - 1)}" id="num"><</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
						var="idx">
						<li><a href="freeboardlist${pageMaker.makeQuery(idx)}" id="num">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="freeboardlist${pageMaker.makeQuery(pageMaker.endPage + 1)}" id="num">></a></li>
					</c:if>
				</c:if>
				<c:if test="${!empty reviewboard }">
					<c:if test="${pageMaker.prev}">
						<li><a href="reviewboardlist${pageMaker.makeQuery(pageMaker.startPage - 1)}" id="num"><</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
						var="idx">
						<li><a href="reviewboardlist${pageMaker.makeQuery(idx)}" id="num">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="reviewboardlist${pageMaker.makeQuery(pageMaker.endPage + 1)}" id="num">></a></li>
					</c:if>
				</c:if>
				<c:if test="${!empty questionboard }">
					<c:if test="${pageMaker.prev}">
						<li><a href="questionboardlist${pageMaker.makeQuery(pageMaker.startPage - 1)}" id="num"><</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
						var="idx">
						<li><a href="questionboardlist${pageMaker.makeQuery(idx)}" id="num">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="questionboardlist${pageMaker.makeQuery(pageMaker.endPage + 1)}" id="num">></a></li>
					</c:if>
				</c:if>
				<c:if test="${!empty shareboard }">
					<c:if test="${pageMaker.prev}">
						<li><a href="shareboardlist${pageMaker.makeQuery(pageMaker.startPage - 1)}" id="num"><</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
						var="idx">
						<li><a href="shareboardlist${pageMaker.makeQuery(idx)}" id="num">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="shareboardlist${pageMaker.makeQuery(pageMaker.endPage + 1)}" id="num">></a></li>
					</c:if>
				</c:if>
				<c:if test="${!empty eventboard }">
					<c:if test="${pageMaker.prev}">
						<li><a href="eventboardlist${pageMaker.makeQuery(pageMaker.startPage - 1)}" id="num"><</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
						var="idx">
						<li><a href="eventboardlist${pageMaker.makeQuery(idx)}" id="num">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="eventboardlist${pageMaker.makeQuery(pageMaker.endPage + 1)}" id="num">></a></li>
					</c:if>
				</c:if>
			</ul>
		</div>
		<br>
		<c:if test="${!empty freeboard }">
			<button id="searchBtn" onclick="searchFreeBoard()">검색</button>
			<button id="deleteBtn" onclick="deleteFreeBoard()">삭제</button>
		</c:if>
		<c:if test="${!empty reviewboard }">
			<button id="searchBtn" onclick="searchReviewBoard()">검색</button>
			<button id="deleteBtn" onclick="deleteReviewBoard()">삭제</button>
		</c:if>
		<c:if test="${!empty questionboard }">
			<button id="searchBtn" onclick="searchQuestionBoard()">검색</button>
			<button id="deleteBtn" onclick="deleteQuestionBoard()">삭제</button>
		</c:if>
		<c:if test="${!empty shareboard }">
			<button id="searchBtn" onclick="searchShareBoard()">검색</button>
			<button id="deleteBtn" onclick="deleteShareBoard()">삭제</button>
		</c:if>
		<c:if test="${!empty eventboard }">
			<button id="searchBtn" onclick="searchEventBoard()">검색</button>
			<button id="deleteBtn" onclick="deleteEventBoard()">삭제</button>
		</c:if>
	</div>
</body>
</html>
