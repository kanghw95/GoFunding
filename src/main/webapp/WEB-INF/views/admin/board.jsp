<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
table {
	text-align: center;
	width: 900px;
	margin-left: auto;
	margin-right: auto;
	border-color: #ccc;
}

#userInfo {
	text-align: center;
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

th {
	background-color: #e6e6e6;
	border-color: #ccc;
}

td {
	border-color: #ccc;
}

#list {
	width: 35px;
	line-height: 40px;
}

#space {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 80px;
}

#wrapper {
	display: table;
	margin-bottom: 80px;
}

#userManage {
	display: table-cell;
	vertical-align: middle;
	font-size: 20px;
}

#userCount {
	margin-bottom: 10px;
}

#select {
	height: 30px;
	float: left;
}

#text {
	height: 24px;
	width: 150px;
	margin-left: 5px;
	float: left;
}

#searchBtn {
	margin-left: 75px;
	box-shadow: none;
	border-radius: 10px;
}

#deleteBtn {
	margin-left: 65px;
	background-color: rgb(255, 72, 0);
	color: white;
	box-shadow: none;
	border-radius: 10px;
}

#under {
	width: 900px;
	height: 30px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
}

#paging {
	float: right;
	width: 900px;
	height: 30px;
	text-align: center;
}

ul {
	display: inline-block;
	margin: 0;
	padding: 0;
}

li {
	display: inline-block;
	list-style: none;
	float: left;
	padding: 6px;
}

#num {
	float: none;
	text-decoration: none;
	font: menu;
	padding: 2px 8px;
	background: ButtonFace;
	color: ButtonText;
	border-width: 2px;
	border-color: ButtonHighlight ButtonShadow ButtonShadow ButtonHighlight;
}

.boardNo {
	border: none;
	text-align: center;
	outline: none;
	width: 30px;
}

.noBox {
	width: 30px;
}
</style>
<script>
	var cv = "";

	function searchFreeBoard() { // 자유 게시판 검색
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
	
	function searchReviewBoard() { // 후기 게시판 검색
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
	
	function searchQuestionBoard() { // 질의응답 게시판 검색
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
	
	function searchShareBoard() { // 정보공유 게시판 검색
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
	
	function searchEventBoard() { // 이벤트 게시판 검색
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
	
	function deleteFreeBoard() { // 자유게시판 글 삭제
		console.log("자유 게시판 글 삭제 입니다.");
		var checked = document.getElementsByName("check");
		var boardNo = document.getElementsByName("boardNo"); 
		var deleteList = new Array();
		for (var i = 0; i < checked.length; i++) {
			if (checked[i].checked == false) {
				console.log("체크된게 없습니다.")
				console.log(checked[i].checked);
			} else {
				console.log("체크된게 있습니다.");
				console.log("체크된 자유 게시판 글 번호 : " + boardNo[i].value);
				deleteList.push(boardNo[i].value);
				console.log("체크된 자유 게시판 글 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 글을 체크해주세요.");
			} else {
				alert("자유 게시판 글을 삭제하시겠습니까?");
				$.ajax({
					url : "deletefboardlist",
					type : "POST",
					traditional : true,
					data : {
						boardNo : deleteList
					},
					success : function(data) {
						console.log("success 진입");
						console.log(data);
						location.replace("freeboardlist");
					},
					error : function(error) {
						console.log("error 발생");
					}
				});
			}
			
	}
	
	function deleteReviewBoard() { // 후기 게시판 글 삭제
		console.log("후기 게시판 글 삭제 입니다.");
		var checked = document.getElementsByName("check");
		var boardNo = document.getElementsByName("boardNo");
		var deleteList = new Array();
		for (var i = 0; i < checked.length; i++) {
			if (checked[i].checked == false) {
				console.log("체크된게 없습니다.")
				console.log(checked[i].checked);
			} else {
				console.log("체크된게 있습니다.");
				console.log("체크된 후기 게시판 글 번호 : " + boardNo[i].value);
				deleteList.push(boardNo[i].value);
				console.log("체크된 후기 게시판 글 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 글을 체크해주세요.");
			} else {
				alert("후기 게시판 글을 삭제하시겠습니까?");
				$.ajax({
					url : "deleterboardlist",
					type : "POST",
					traditional : true,
					data : {
						boardNo : deleteList
					},
					success : function(data) {
						console.log("success 진입");
						console.log(data);
						location.replace("reviewboardlist");
					},
					error : function(error) {
						console.log("error 발생");
					}
				});
			}
			
	}
	
	function deleteQuestionBoard() { // 질의응답 게시판 글 삭제
		console.log("질의응답 게시판 글 삭제 입니다.");
		var checked = document.getElementsByName("check");
		var boardNo = document.getElementsByName("boardNo");
		var deleteList = new Array();
		for (var i = 0; i < checked.length; i++) {
			if (checked[i].checked == false) {
				console.log("체크된게 없습니다.")
				console.log(checked[i].checked);
			} else {
				console.log("체크된게 있습니다.");
				console.log("체크된 질의응답 게시판 글 번호 : " + boardNo[i].value);
				deleteList.push(boardNo[i].value);
				console.log("체크된 질의응답 게시판 글 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 글을 체크해주세요.");
			} else {
				alert("질의응답 게시판 글을 삭제하시겠습니까?");
				$.ajax({
					url : "deleteqboardlist",
					type : "POST",
					traditional : true,
					data : {
						boardNo : deleteList
					},
					success : function(data) {
						console.log("success 진입");
						console.log(data);
						location.replace("questionboardlist");
					},
					error : function(error) {
						console.log("error 발생");
					}
				});
			}
			
	}
	
	function deleteShareBoard() { // 정보공유 게시판 글 삭제
		console.log("정보공유 게시판 글 삭제 입니다.");
		var checked = document.getElementsByName("check");
		var boardNo = document.getElementsByName("boardNo");
		var deleteList = new Array();
		for (var i = 0; i < checked.length; i++) {
			if (checked[i].checked == false) {
				console.log("체크된게 없습니다.")
				console.log(checked[i].checked);
			} else {
				console.log("체크된게 있습니다.");
				console.log("체크된 정보공유 게시판 글 번호 : " + boardNo[i].value);
				deleteList.push(boardNo[i].value);
				console.log("체크된 정보공유 게시판 글 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 글을 체크해주세요.");
			} else {
				alert("정보공유 게시판 글을 삭제하시겠습니까?");
				$.ajax({
					url : "deletesboardlist",
					type : "POST",
					traditional : true,
					data : {
						boardNo : deleteList
					},
					success : function(data) {
						console.log("success 진입");
						console.log(data);
						location.replace("shareboardlist");
					},
					error : function(error) {
						console.log("error 발생");
					}
				});
			}
			
	}
	
	function deleteEventBoard() { // 이벤트 게시판 글 삭제
		console.log("이벤트 게시판 글 삭제 입니다.");
		var checked = document.getElementsByName("check");
		var boardNo = document.getElementsByName("boardNo");
		var deleteList = new Array();
		for (var i = 0; i < checked.length; i++) {
			if (checked[i].checked == false) {
				console.log("체크된게 없습니다.")
				console.log(checked[i].checked);
			} else {
				console.log("체크된게 있습니다.");
				console.log("체크된 이벤트 게시판 글 번호 : " + boardNo[i].value);
				deleteList.push(boardNo[i].value);
				console.log("체크된 이벤트 게시판 글 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 글을 체크해주세요.");
			} else {
				alert("이벤트 게시판 글을 삭제하시겠습니까?");
				$.ajax({
					url : "deleteeboardlist",
					type : "POST",
					traditional : true,
					data : {
						boardNo : deleteList
					},
					success : function(data) {
						console.log("success 진입");
						console.log(data);
						location.replace("eventboardlist");
					},
					error : function(error) {
						console.log("error 발생");
					}
				});
			}
			
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
	}
	
	function BoardRadio() { // 라디보 박스 체크 시 자유 게시판 조회
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
			url : "boardradio",
			type : "POST",
			traditional : true,
			data : {
				id : id,
				value : value
			},
			success : function(data) {
				console.log("success 진입");
			},
			error : function(error) {
				console.log("error 발생");
			}
		});
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
			<input type="radio" name="radio" id="free" value="new" onclick="BoardRadio()">최신순
			<input type="radio" name="radio" id="free" value="like" onclick="BoardRadio()">추천순
			<input type="radio" name="radio" id="free" value="cnt" onclick="BoardRadio()">조회순
			<input type="radio" name="radio" id="free" value="cmt" onclick="BoardRadio()">댓글순
		</c:if>
		<c:if test="${!empty reviewboard }">
			<input type="radio" name="radio" id="review" value="new" onclick="BoardRadio()">최신순
			<input type="radio" name="radio" id="review" value="like" onclick="BoardRadio()">추천순
			<input type="radio" name="radio" id="review" value="cnt" onclick="BoardRadio()">조회순
			<input type="radio" name="radio" id="review" value="cmt" onclick="BoardRadio()">댓글순
		</c:if>
		<c:if test="${!empty questionboard }">
			<input type="radio" name="radio" id="question" value="new" onclick="BoardRadio()">최신순
			<input type="radio" name="radio" id="question" value="like" onclick="BoardRadio()">추천순
			<input type="radio" name="radio" id="question" value="cnt" onclick="BoardRadio()">조회순
			<input type="radio" name="radio" id="question" value="cmt" onclick="BoardRadio()">댓글순
		</c:if>
		<c:if test="${!empty shareboard }">
			<input type="radio" name="radio" id="share" value="new" onclick="BoardRadio()">최신순
			<input type="radio" name="radio" id="share" value="like" onclick="BoardRadio()">추천순
			<input type="radio" name="radio" id="share" value="cnt" onclick="BoardRadio()">조회순
			<input type="radio" name="radio" id="share" value="cmt" onclick="BoardRadio()">댓글순
		</c:if>
		<c:if test="${!empty eventboard }">
			<input type="radio" name="radio" id="event" value="new" onclick="BoardRadio()">최신순
			<input type="radio" name="radio" id="event" value="like" onclick="BoardRadio()">추천순
			<input type="radio" name="radio" id="event" value="cnt" onclick="BoardRadio()">조회순
			<input type="radio" name="radio" id="event" value="cmt" onclick="BoardRadio()">댓글순
		</c:if>
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
			<c:if test="${!empty freeboard }">
				<c:forEach var="free" items="${freeboard }" varStatus="status">
					<tr name="boardList" id="boardList" class="search">
						<td class="noBox"><input type="text" name="boardNo" class="boardNo" value=${free.boardNo } readonly></td>
						<td><input type="checkbox" name="check" onclick='checkOne()'></td>
						<td>${free.boardTitle}</td>
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
						<td>${review.boardTitle}</td>
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
						<td>${question.boardTitle}</td>
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
						<td>${share.boardTitle}</td>
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
						<td>${event.boardTitle}</td>
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
			<ul>
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
