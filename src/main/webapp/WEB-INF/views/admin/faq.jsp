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
<link href="<%=request.getContextPath() %>/resource	s/css/admin/faq.css?ver=1.0" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/admin/faq.js"></script>
<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>
<style>
body {
    font-family: 'NanumSquare', sans-serif !important;
}

.space {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 80px;
}

#wrapper {
	display: table;
	margin-bottom: 80px;
	position: relative;
	padding-top: 110px;
	color: #202020;
}

th {
	font-size: 15px;
}

td {
	font-size: 16px;
}

.list {
	width: 35px;
	line-height: 40px;
}

.userManage {
	display: table-cell;
	vertical-align: middle;
	font-size: 20px;
}

.userInfo {
	text-align: center;
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.under {
	width: 900px;
	height: 30px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
}

.no {
	width: 40px;
}

.box {
	withd: 40px;
}

.title {
 	width: 500px;
}

.id {
	width: 90px;
}

.cnt {
	width: 65px;
}

#select {
	height: 30px;
	float: left;
}

#text {
	height: 30px;
	width: 150px;
	margin-left: 5px;
	float: left;
}

.paging {
	float: right;
	width: 900px;
	height: 30px;
	text-align: center;
}

.searchBtn {
	margin-left: 90px;
	box-shadow: none;
	border-radius: 10px;
	height: 30px;
	border: 1px;
}

.deleteBtn {
	margin-left: 65px;
	background-color: rgb(255, 72, 0);
	color: white;
	box-shadow: none;
	border-radius: 10px;
	height: 30px;
	border: 1px;
}

.input {
	float: right;
    margin-left: 763px;
    box-shadow: none;
    border-radius: 10px;
    height: 30px;
    border: 1px;
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

a {
	text-decoration-line: none;
	color: black;
}

a:hover {color:#00BFFF;}
a:active {color:#00BFFF;}
</style>
<script>
	var cv = "";
	
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
	
	function input() {
		location.href="faqWrt"
	}
	
	function searchFaq() {
		console.log("검색");
		var target = document.getElementById("select");
		var sValue = target.options[target.selectedIndex].value;
		var search = "%" + document.getElementById("text").value + "%";
		
		console.log("value : " + sValue);
		console.log("컨트롤러로 : " + search);
		
		if (search == "%%") {
			alert("검색할 정보를 입력해주세요.");
		} else {
			if (sValue == 0) {
				console.log("선택 해야된다.");
				alert("검색 항목을 선택해주세요.");
			} else if (sValue == 1) {
				console.log("제목 검색");
				$.ajax({
					url : "selectFaq",
					type : "POST",
					data : {
						title : search
					},
					dataType : "JSON",
					success : select,
					error : function(request,status,error) {
						console.log("자유 게시판 제목 error 발생");
						console.log(error);
						console.log(request);
						console.log(status);
					}
				});
			}
		}
	}
	
	function select(data) {
		cv = "";
		$(".search").remove();
		console.log("검색 성공");
		console.log(data);
		$.each(data, function(i, list) {
			cv += "<tr class='search'>"
			cv += "<td><input type='text' name='boardNo' class='boardNo' value='"+data[i].faqNo+"' readonly/></td>"
			cv += "<td><input type='checkbox' name='check' onclick='checkOne()'></td>"
			cv += "<td>" + data[i].faqTitle + "</td>"
			cv += "<td>" + data[i].id + "</td>"
			cv += "<td>" + data[i].faqCnt + "</td>"
			cv += "<td>" + data[i].faqDate + "</td>"
			cv += "</tr>"
		});
		$("#tr").append(cv);
		$("#page").remove();
	} 

	function deleteFaq() { // 자유게시판 글 삭제
		console.log("FAQ 글 삭제 입니다.");
		var checked = document.getElementsByName("check");
		var boardNo = document.getElementsByName("boardNo"); 
		var deleteList = new Array();
		for (var i = 0; i < checked.length; i++) {
			if (checked[i].checked == false) {
				console.log("체크된게 없습니다.")
				console.log(checked[i].checked);
			} else {
				console.log("체크된게 있습니다.");
				console.log("체크된 FAQ 글 번호 : " + boardNo[i].value);
				deleteList.push(boardNo[i].value);
				console.log("체크된 FAQ 글 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 글을 체크해주세요.");
			} else {
				swal({
				    title: "FAQ 게시글 삭제",
				    text: "FAQ 게시글을 삭제하시겠습니까?",
				    icon: "warning",
				    buttons: ["아니오", "예"]
				}).then((예) => {
					if (예) {
						console.log("예");
						$.ajax({
							url : "deleteFaq",
							type : "POST",
							traditional : true,
							data : {
								no : deleteList
							},
							success : function(data) {
								console.log("success 진입");
								console.log(data);
								location.replace("faq");
							},
							error : function(error) {
								console.log("error 발생");
							}
						});
					} else {
						console.log("취소");
					}
				})
			}
			
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
	
	function alert() {
		console.log("안녕");
		swal({
		    title: "회원 삭제",
		    text: "회원을 삭제하시겠습니까?",
		    icon: "warning",
		    buttons: ["아니오", "예"]
		}).then((예) => {
			if (예) {
				console.log("예");
			} else {
				console.log("아니오");
			}
		})
	}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<div class="space">
		<div id="wrapper">
			<img src="resources/img/admin/list.png" class="list">&nbsp;
			<p class="userManage">FAQ</p>
			<button class="input" onclick="input()">글쓰기</button>
		</div>
	</div> 
	<div class="userInfo">
		<table class="tg" border="1" id="tr">
			<tr>
				<th class="no">NO</th>
				<th class="box"><input type="checkbox" id="checkAll" onclick="checkAll()"></th>
				<th class="title">제목</th>
				<th class="id">작성자</th>	
				<th class="cnt">조회</th>
				<th class="date">작성일</th>
			</tr>
			<c:forEach var="faq" items="${faq }" varStatus="status">
				<tr name="boardList" id="boardList" class="search">
					<td class="noBox"><input type="text" name="boardNo" class="boardNo" value=${faq.faqNo } readonly></td>
					<td><input type="checkbox" name="check" onclick='checkOne()'></td>
					<td><a href="faqDetail?no=${faq.faqNo }">${faq.faqTitle }</a></td>
					<td>${faq.id }</td>
					<td>${faq.faqCnt }</td>
					<td>${faq.faqDate }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="under">
		<select id="select">
			<option value="0">--선택--</option>
			<option value="1">제목</option>
		</select> <input type="text" id="text" name="userId">
		<div id="paging">
			<ul id="page">
				<c:if test="${pageMaker.prev}">
					<li><a href="faq${pageMaker.makeQuery(pageMaker.startPage - 1)}" id="num"><</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li><a href="faq${pageMaker.makeQuery(idx)}" id="num">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="faq${pageMaker.makeQuery(pageMaker.endPage + 1)}" id="num">></a></li>
				</c:if>
			</ul>
		</div>
		<br>
		<button class="searchBtn" onclick="searchFaq()">검색</button>
		<button class="deleteBtn" onclick="deleteFaq()">삭제</button>
		<button onclick="alert()">안녕</button>
	</div>
</body>
</html>
