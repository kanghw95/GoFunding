<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/admin/notice.css?ver=1.0" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/admin/notice.js"></script>
<script>
	var cv = "";
	
	function searchNotice() {
		console.log("검색 시작");
		var target = document.getElementById("select");
		var sValue = target.options[target.selectedIndex].value;
		var search = "%" + document.getElementById("text").value + "%";
		
		console.log("컨트롤러로 넘길 값은 : " + search);
		console.log("셀렉트 values는 " + sValue);

		if (sValue == 0) { // 선택된 option이 없는 경우
			console.log("선택 해야된다.");
			alert("검색 항목을 선택해주세요.");
		} else if (sValue == 1) { // 제목 검색
			console.log("제목 입니다.");
			$.ajax({
				url : "noticeselect",
				type : "POST",
				data : {
					boardTitle : search
				},
				dataType : "JSON",
				success : searchN,
				error : function(error) {
					console.log("자유 게시판 제목 error 발생");
				}
			});
		} else if (sValue == 2) { // 이름 검색
			console.log("작성자 입니다.");
			$.ajax({
				url : "noticeselect",
				type : "POST",
				data : {
					boardId : search
				},
				dataType : "JSON",
				success : searchN,
				error : function(error) {
					console.log("자유 게시판 작성자 error 발생");
				}
			});
		}
	}
	
	function searchN(data) {
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
	}
	
	function deleteNotice() { // 공지사항 글 삭제
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
				console.log("체크된 공지사항 글 번호 : " + boardNo[i].value);
				deleteList.push(boardNo[i].value);
				console.log("체크된 공지사항 글 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 글을 체크해주세요.");
			} else {
				alert("공지사항 글을 삭제하시겠습니까?");
				$.ajax({
					url : "deletenoticelist",
					type : "POST",
					traditional : true,
					data : {
						boardNo : deleteList
					},
					success : function(data) {
						console.log("success 진입");
						console.log(data);
						location.replace("notice");
					},
					error : function(error) {
						console.log("error 발생");
					}
				});
			}
			
	}

	function noticeRadio() { // 공지사항 라디오박스 조회
		var name = document.getElementsByName("radio");
		for (var i = 0; i < name.length; i++) {
			if (name[i].checked == false) {
				console.log("체크된 값이 없습니다.")
			} else {
				var id = name[i].id;
				var value = name[i].value;
			}
		}
		console.log("id 값은 : " + id);
		console.log("value 값은 : " + value);
		$.ajax({
			url : "noticeradio",
			type : "POST",
			traditional : true,
			data : {
				id : id,
				value : value
			},
			dataType : "JSON",
			success : selectRadio,
			error : function(error) {
				console.log("error 발생");
			}
		});
	}
	
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
			cv += "<td>" + data[i].boardDate + "</td>"
			cv += "</tr>"
		});
		$("#tr").append(cv);
	}
	
	function checkAll() { // 체크박스 전체 체크, 해제
		console.log("체크박스 함수 진입");
		var checked = document.getElementsByName("check");
		var checkAll = document.getElementById("checkAll");
		if (checkAll.checked == false) {
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
		var checkAll = document.getElementById("checkAll");
		console.log(allBox);
		console.log(checkedBox);
		if (allBox.length == checkedBox.length) {
			checkAll.checked = true;
		} else {
			checkAll.checked = false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<div id="space">
		<div id="wrapper">
			<img src="resources/img/admin/list.png" id="list">&nbsp;
			<p id="userManage">공지사항</p>
		</div>
		<input type="radio" name="radio" id="event" value="new" onclick="noticeRadio()">최신순
		<input type="radio" name="radio" id="event" value="like" onclick="noticeRadio()">추천순
		<input type="radio" name="radio" id="event" value="cnt" onclick="noticeRadio()">조회순
		<input type="radio" name="radio" id="event" value="cmt" onclick="noticeRadio()">댓글순
	</div> 
	<div id="userInfo">
		<table class="tg" border="1" id="tr">
			<tr>
				<th>NO</th>
				<th><input type="checkbox" id="checkAll" onclick="checkAll()"></th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회</th>
				<th>추천</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="notice" items="${notice }" varStatus="status">
				<tr name="boardList" id="boardList" class="search">
					<td class="noBox"><input type="text" name="boardNo" class="boardNo" value=${notice.boardNo } readonly></td>
					<td><input type="checkbox" name="check" onclick='checkOne()'></td>
					<td>${notice.boardTitle}</td>
					<td>${notice.boardId}</td>
					<td>${notice.boardCnt}</td>
					<td>0</td>
					<td>${notice.boardDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="under">
		<select id="select">
			<option value="0">--선택--</option>
			<option value="1">제목</option>
			<option value="2">작성자</option>
		</select> <input type="text" id="text" name="userId">
		<div id="paging">
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a href="notice${pageMaker.makeQuery(pageMaker.startPage - 1)}" id="num"><</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li><a href="notice${pageMaker.makeQuery(idx)}" id="num">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="notice${pageMaker.makeQuery(pageMaker.endPage + 1)}" id="num">></a></li>
				</c:if>
			</ul>
		</div>
		<br>
		<button id="searchBtn" onclick="searchNotice()">검색</button>
		<button id="deleteBtn" onclick="deleteNotice()">삭제</button>
	</div>
</body>
</html>
